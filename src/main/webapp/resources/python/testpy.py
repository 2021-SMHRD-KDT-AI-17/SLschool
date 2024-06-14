import numpy as np
import cv2
import torch
import torch.nn as nn
from ultralytics import YOLO
from sklearn.preprocessing import LabelEncoder
import os
import logging

# YOLO 라이브러리의 로거 비활성화
logging.getLogger('ultralytics').setLevel(logging.INFO)

def create_binary_tensor(conf):
    return (conf >= 0.5).float()

class LSTMModel(nn.Module):
    def __init__(self, input_size, hidden_size, output_size, num_layers=2, dropout=0.2):
        super(LSTMModel, self).__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, num_layers, batch_first=True, dropout=dropout)
        self.batch_norm1 = nn.BatchNorm1d(sequence_length)
        self.dropout1 = nn.Dropout(dropout)
        self.fc1 = nn.Linear(hidden_size, hidden_size)
        self.batch_norm2 = nn.BatchNorm1d(hidden_size)
        self.dropout2 = nn.Dropout(dropout)
        self.fc2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        x, _ = self.lstm(x)
        x = self.batch_norm1(x)
        x = self.dropout1(x)
        x = x[:, -1, :]  # Use the output from the last time step
        x = self.fc1(x)
        x = self.batch_norm2(x)
        x = self.dropout2(x)
        x = self.fc2(x)
        return x

input_size = 162
hidden_size = 54
output_size = 65
num_layers = 2
dropout = 0.2
sequence_length = 10

# YOLOv8 모델 로드
yolo_model = YOLO('C:/Users/SMHRD/Desktop/alpha/Sbest.pt')  # verbose=False로 설정하여 로그 메시지를 숨김

# LSTM 모델 로드(state_dict)
lstm_model = LSTMModel(input_size, hidden_size, output_size, num_layers, dropout)
lstm_model.load_state_dict(torch.load('C:/Users/SMHRD/Desktop/alpha/lstm_model_54_alltrain_bn_do_10.pth'))
lstm_model.eval()

# 라벨 로드 및 LabelEncoder 설정
labels = np.load('C:/Users/SMHRD/Desktop/alpha/labels.npy')
label_encoder = LabelEncoder()
label_encoder.fit(labels)

# 비디오 파일 열기
video_path = "C:/Users/SMHRD/Desktop/alpha/NIA_SL_WORD0005_REAL01_F.mp4"
cap = cv2.VideoCapture(video_path)

# 시퀀스 생성 함수
def create_sequences(data, sequence_length):
    sequences = []
    for i in range(len(data) - sequence_length + 1):
        sequences.append(data[i:i + sequence_length])
    return np.array(sequences)

# 비디오 프레임 레이트 얻기
fps = cap.get(cv2.CAP_PROP_FPS)
frame_interval = int(fps / 10)  # 초당 10프레임 추출을 위한 간격 계산

# 비디오 프레임 처리 루프
video_keypoints = []
frame_count = 0

while cap.isOpened():
    success, frame = cap.read()

    if success:
        if frame_count % frame_interval == 0:
            # YOLOv8 추론 실행
            results = yolo_model(frame)
            
            if results:
                # 키포인트 추출
                for r in results:
                    if hasattr(r, 'keypoints') and r.keypoints is not None:
                        video_keypoints.extend(r.keypoints.xyn.tolist())
            
            # 결과 시각화
            annotated_frame = results[0].plot()
            cv2.imshow("YOLOv8 Inference", annotated_frame)

            # 'q' 키를 눌러 루프 종료
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break
        frame_count += 1
    else:
        break

# 예측 수행
if video_keypoints:

    video_sequences = create_sequences(video_keypoints, sequence_length=10)

    predictions = []
    
    for sequence in video_sequences:
        
        sequence_tensor = torch.tensor(sequence, dtype=torch.float32).unsqueeze(0)

        r_keypoints_conf = create_binary_tensor(r.keypoints.conf)
        conf = r_keypoints_conf.unsqueeze(-1).unsqueeze(1).repeat(1, 10, 1, 1)
        r_keypoints_xyn_3d = torch.cat((sequence_tensor, conf), dim=-1)

        sequence_tensor2 = r_keypoints_xyn_3d.view(sequence_tensor.size(0), sequence_tensor.size(1), -1)
        
        prediction = lstm_model(sequence_tensor2)
        predicted_label = torch.argmax(prediction, dim=1).item()
        predicted_name = label_encoder.inverse_transform([predicted_label])
        predictions.append(predicted_name[0])

    # 가장 많이 나온 단어 계산
    most_common_word = max(set(predictions), key=predictions.count)
    print("결과:", most_common_word)
else:
    print("No keypoints detected.")

# 비디오 캡처 객체 해제 및 창 닫기
cap.release()
cv2.destroyAllWindows()
