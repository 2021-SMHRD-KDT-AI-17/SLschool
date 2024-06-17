#!/usr/bin/env python
# coding: utf-8

import sys
import io

# stdout과 stderr를 UTF-8로 인코딩
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

import numpy as np
import cv2
import torch
import torch.nn as nn
from sklearn.preprocessing import LabelEncoder
import mediapipe as mp
import time  # 추가된 부분

# Mediapipe 초기화
mp_holistic = mp.solutions.holistic
holistic = mp_holistic.Holistic(static_image_mode=False, model_complexity=1, enable_segmentation=False, min_detection_confidence=0.5)

def create_binary_tensor(conf):
    return (conf >= 0.5).float()

class LSTMModel(nn.Module):
    def __init__(self, input_size, hidden_size, output_size, num_layers=2, dropout=0.2):
        super(LSTMModel, self).__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, num_layers, batch_first=True, dropout=dropout)
        self.dropout1 = nn.Dropout(dropout)
        self.fc1 = nn.Linear(hidden_size, hidden_size)
        self.dropout2 = nn.Dropout(dropout)
        self.fc2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        x, _ = self.lstm(x)
        x = self.dropout1(x)
        x = x[:, -1, :]  # 마지막 시퀀스 출력 사용
        x = self.fc1(x)
        x = self.dropout2(x)
        x = self.fc2(x)
        return x

input_size = 96  
hidden_size = 48
output_size = 66
num_layers = 2
dropout = 0.2
sequence_length = 30

# LSTM 모델 로드(state_dict)
lstm_model = LSTMModel(input_size, hidden_size, output_size, num_layers, dropout)
lstm_model.load_state_dict(torch.load('C:/Users/smhrd/Desktop/LSTM/lstm_model_rel48_sequence30_10.pth'))
lstm_model.eval()

# 라벨 로드 및 LabelEncoder 설정
labels = np.load('C:/Users/smhrd/Desktop/LSTM/labels.npy')
label_encoder = LabelEncoder()
label_encoder.fit(labels)

# 웹캠 열기
cap = cv2.VideoCapture(0)
if not cap.isOpened():
    print("Error: Could not open webcam.")
    exit()

# 해상도 설정
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

# 시퀀스 생성 함수
def create_sequences(data, sequence_length):
    sequences = []
    for i in range(len(data) - sequence_length + 1):
        sequences.append(data[i:i + sequence_length])
    return np.array(sequences)

# 비디오 프레임 처리 루프
video_keypoints = []
frame_count = 0
reference_keypoints = None

def extract_keypoints(results):
    keypoints = []
    # 특정 포즈 랜드마크 출력
    if results.pose_landmarks:
        for landmark in [mp_holistic.PoseLandmark.LEFT_SHOULDER, mp_holistic.PoseLandmark.LEFT_ELBOW, mp_holistic.PoseLandmark.LEFT_WRIST,
                         mp_holistic.PoseLandmark.RIGHT_SHOULDER, mp_holistic.PoseLandmark.RIGHT_ELBOW, mp_holistic.PoseLandmark.RIGHT_WRIST]:
            keypoints.append([results.pose_landmarks.landmark[landmark].x, results.pose_landmarks.landmark[landmark].y])
    
    # 왼손 랜드마크 출력
    if results.left_hand_landmarks:
        for landmark in results.left_hand_landmarks.landmark:
            keypoints.append([landmark.x, landmark.y])
    
    # 오른손 랜드마크 출력
    if results.right_hand_landmarks:
        for landmark in results.right_hand_landmarks.landmark:
            keypoints.append([landmark.x, landmark.y])
    
    return keypoints

def calculate_relative_keypoints(frame_keypoints, reference_keypoints):
    if reference_keypoints is None:
        return None

    relative_keypoints = []
    for i in range(len(frame_keypoints)):
        rel_x = frame_keypoints[i][0] - reference_keypoints[i][0]
        rel_y = frame_keypoints[i][1] - reference_keypoints[i][1]
        relative_keypoints.extend([rel_x, rel_y])
    return relative_keypoints

def draw_selected_landmarks(image, landmarks, connections, landmark_indices):
    if not landmarks:
        return
    for idx in landmark_indices:
        landmark = landmarks.landmark[idx]
        x = int(landmark.x * image.shape[1])
        y = int(landmark.y * image.shape[0])
        cv2.circle(image, (x, y), 5, (0, 255, 0), -1)
    for connection in connections:
        start_idx = connection[0]
        end_idx = connection[1]
        if start_idx in landmark_indices and end_idx in landmark_indices:
            start = landmarks.landmark[start_idx]
            end = landmarks.landmark[end_idx]
            start_point = (int(start.x * image.shape[1]), int(start.y * image.shape[0]))
            end_point = (int(end.x * image.shape[1]), int(end.y * image.shape[0]))
            cv2.line(image, start_point, end_point, (0, 255, 0), 2)

start_time = time.time()  # 시작 시간 기록

while cap.isOpened():
    success, frame = cap.read()

    if success:
        # Mediapipe Holistic 추론 실행
        image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = holistic.process(image)
        
        if results.pose_landmarks and results.left_hand_landmarks and results.right_hand_landmarks:
            # 키포인트 추출
            frame_keypoints = extract_keypoints(results)
            
            if reference_keypoints is None:
                # 첫 번째 프레임의 키포인트 그대로 사용
                reference_keypoints = frame_keypoints
                video_keypoints.append([coord for point in frame_keypoints for coord in point])
            else:
                # 상대 좌표로 변환
                relative_keypoints = calculate_relative_keypoints(frame_keypoints, reference_keypoints)
                if relative_keypoints is not None:
                    video_keypoints.append(relative_keypoints)
        
        # 결과 시각화
        selected_pose_landmarks = [
            mp_holistic.PoseLandmark.LEFT_SHOULDER,
            mp_holistic.PoseLandmark.LEFT_ELBOW,
            mp_holistic.PoseLandmark.LEFT_WRIST,
            mp_holistic.PoseLandmark.RIGHT_SHOULDER,
            mp_holistic.PoseLandmark.RIGHT_ELBOW,
            mp_holistic.PoseLandmark.RIGHT_WRIST
        ]
        
        if results.pose_landmarks:
            draw_selected_landmarks(frame, results.pose_landmarks, mp_holistic.POSE_CONNECTIONS, selected_pose_landmarks)
        if results.left_hand_landmarks:
            mp.solutions.drawing_utils.draw_landmarks(frame, results.left_hand_landmarks, mp_holistic.HAND_CONNECTIONS)
        if results.right_hand_landmarks:
            mp.solutions.drawing_utils.draw_landmarks(frame, results.right_hand_landmarks, mp_holistic.HAND_CONNECTIONS)
        cv2.imshow("Mediapipe Holistic", frame)

        # 10초 경과 여부 확인
        if time.time() - start_time > 10:
            break

        # 'q' 키를 눌러 루프 종료
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

        frame_count += 1
    else:
        print("Error: Could not read frame.")
        break

# 예측 결과 저장 또는 추가 처리
if video_keypoints:
    video_sequences = create_sequences(video_keypoints, sequence_length)
    predictions = []
    
    for sequence in video_sequences:
        sequence_tensor = torch.tensor(sequence, dtype=torch.float32).unsqueeze(0)
        prediction = lstm_model(sequence_tensor)
        predicted_label = torch.argmax(prediction, dim=1).item()
        predicted_name = label_encoder.inverse_transform([predicted_label])
        predictions.append(predicted_name[0])

    # 가장 많이 나온 단어 계산
    most_common_word = max(set(predictions), key=predictions.count)
    print("종료 후 결과:", most_common_word)
else:
    print("No keypoints detected.")

# 비디오 캡처 객체 해제 및 창 닫기
cap.release()
cv2.destroyAllWindows()
