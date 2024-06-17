package kr.smhrd.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.Mapper.MemberMapper;
import kr.smhrd.Mapper.QuizMapper;
import kr.smhrd.Mapper.StudyMapper;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Member_point;
import kr.smhrd.entity.Quiz;
import kr.smhrd.entity.Word;
import kr.smhrd.entity.WordImage;
import kr.smhrd.entity.QuizRank;
import kr.smhrd.entity.Quiz_PR;
import kr.smhrd.entity.QuizPic;


@Controller
public class QuizController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private QuizMapper quizMapper;
	
	@Autowired
	private StudyMapper  studyMapper;
	
	// 퀴즈 선택창으로 이동
	@RequestMapping("/quiz")
	public String goQuiz() {
		return "quiz";
	}
	
	// 퀴즈 (단어) 에서 그림으로 맞추기
	@RequestMapping("goQuizPic")
	public String goQuizPic() {
		
		return "quiz_a_detail_pic";
	}
	
	// 퀴즈 (단어) 에서 그림 or 단어쓰기
	@RequestMapping("/quizWord")
	public String goQuizWord() {
		return "quiz_word";
	}
	
	// 퀴즈 문제 이동
	@RequestMapping("/quizDetail")
	public String goQuizDetail(Model model) {
		
		ArrayList<Quiz> quiz_list = new ArrayList<Quiz>();
		
		List<Integer> numbers = new ArrayList<>();
        for (int i = 1; i <= 65; i++) {
            numbers.add(i);
        }

        // 리스트를 랜덤하게 섞음
        Collections.shuffle(numbers);

        // 랜덤하게 섞인 리스트에서 10개의 숫자만 선택하여 출력
        List<Integer> selectedNumbers = numbers.subList(0, 10);
        for (int quiz_num : selectedNumbers) {
            quiz_list.add(quizMapper.selectQuizNum(quiz_num));
        }
		
        
        
		// List<Quiz> quiz_list = quizMapper.selectQuiz(); // DB를 연동하여 문제데이터를 Quiz형태로 되어있는 리스트에 저장
		model.addAttribute("quiz_list", quiz_list); // 저장한 리스트(quiz_list)를 quiz_a_detail에 전송 (1회용)
		
		
		return "quiz_a_detail";
	}
	
	// 그림퀴즈 문제 이동
	@RequestMapping("/quizDetailPic")
	public String quizDetailPic(Model model) {
	    
		// 문제를 위한 리스트
		List<Word> word_list = studyMapper.selectAllWord();
		// 보기를 위한 리스트
		List<Word> word_list2 = studyMapper.selectAllWord();
		Collections.shuffle(word_list);
		
		ArrayList<Quiz_PR> quiz_list = new ArrayList<Quiz_PR>();
		for (int i=0; i<10; i++) {
			// 보기 데이터를 담기위한 리스트
			ArrayList<Integer> word_see = new ArrayList<Integer>();
			// 보기데이터 믹스
			Collections.shuffle(word_list2);
			
			word_see.add(word_list.get(i).getWord_num());
			int j = 0;
			while(word_see.size()<4) {
				if(word_list2.get(j).getWord_num() != word_list.get(i).getWord_num()) {
					word_see.add(word_list2.get(j).getWord_num());
				}
				j++;
			}
			Collections.shuffle(word_see);
			
			int word_num = word_list.get(i).getWord_num();
			String video_url = word_list.get(i).getVideo_url();
			String word_name = word_list.get(i).getWord_name();
			String word_img_url1 = quizMapper.selectWordImage(word_see.get(0));
			String word_name1 = quizMapper.selectName(word_see.get(0));
			String word_img_url2 = quizMapper.selectWordImage(word_see.get(1));
			String word_name2 = quizMapper.selectName(word_see.get(1));
			String word_img_url3 = quizMapper.selectWordImage(word_see.get(2));
			String word_name3 = quizMapper.selectName(word_see.get(2));
			String word_img_url4 = quizMapper.selectWordImage(word_see.get(3));
			String word_name4 = quizMapper.selectName(word_see.get(3));
			
			Quiz_PR quiz = new Quiz_PR(word_num, video_url, word_name, word_img_url1, word_name1, word_img_url2, word_name2, word_img_url3, word_name3, word_img_url4, word_name4);
			
			quiz_list.add(quiz);
			
		}
		model.addAttribute("quiz_list", quiz_list);
		
	    return "quiz_a_detail_pic";
	}
	
	
	// 퀴즈 정답 제출 및 점수 확인
	@RequestMapping("/goQuizScore")
	public String goQuizScore(HttpServletRequest request, Model model, HttpSession session) {
		
		String[] answer = request.getParameterValues("answer");
		String[] quiz_numL = request.getParameterValues("quiz_num");
		String[] question_number = request.getParameterValues("question_number");
		
		ArrayList<Integer> wrong_num_list = new ArrayList<Integer>();  // AraayList를 사용하는 이유는 확실한 범위를 모를때 사용한다
		ArrayList<Integer> wrong_question_list = new ArrayList<Integer>();
		ArrayList<String> wrong_question_label_list = new ArrayList<String>();
		
		int score = 0;
		
		for (int i=0;i<10;i++) {
			int quiz_num = Integer.valueOf(quiz_numL[i]).intValue(); // 문제 번호를 가져오는 과정에서 String으로 변환이 되기 때문에 그 값을 다시 int 형태로 바꿔주는 작업
			String quiz_label = quizMapper.selectLabel(quiz_num);
			if(answer[i].equals(quiz_label)) {
				score = score + 10; // score+=20;
			}else {
				int question_num = Integer.valueOf(question_number[i]).intValue();
				wrong_question_list.add(question_num);    // 1~5 번 문제중 어떤 문제를 틀렸는지 저장하기 (짝수 번호 배열)
				int quiz_num2 = quizMapper.selectNum(quiz_label);
				wrong_num_list.add(quiz_num2);        // 틀린 문제에 대한 고유번호(나중에 랜덤으로 할 것) 을 홀수 번호에 저장
				String quiz_label2 = quizMapper.selectLabel(quiz_num);
				wrong_question_label_list.add(quiz_label2);
				
			}
		}
		
		int wrong_size = wrong_num_list.size();
		
		Member member = (Member) session.getAttribute("loginMember");
		if(member != null ) {
			
			String user_id = member.getId();
			
			if(score>=60) {
				int mypoint = memberMapper.selectMyPoint(user_id);
				int point = mypoint+500;
				Member_point member_point = new Member_point(user_id, point);
				memberMapper.updateMyPoint(member_point);
			}
			QuizRank quizRank = new QuizRank(user_id, score);
			
			int cnt = quizMapper.insertScore(quizRank);
		}
		
		model.addAttribute("wrong_question_label_list", wrong_question_label_list);
		model.addAttribute("score", score);
		model.addAttribute("wrong_num_list", wrong_num_list);
		model.addAttribute("wrong_question_list", wrong_question_list);
		model.addAttribute("wrong_size", wrong_size);
		
		return "quiz_score";
	}
	
	
	// 퀴즈 정답 제출 및 점수 확인
	@RequestMapping("/goQuizScorePic")
	public String goQuizScorePic(HttpServletRequest request, Model model, HttpSession session) {
	    String[] answer = new String[10];
	    String[] correctAnswer = new String[10];

	    for (int i = 0; i < 10; i++) {
	        answer[i] = request.getParameter("answer" + (i + 1));
	        correctAnswer[i] = request.getParameter("correctAnswer" + (i + 1));
	        System.out.println("Answer " + (i + 1) + ": " + answer[i]);
	        System.out.println("Correct Answer " + (i + 1) + ": " + correctAnswer[i]);
	    }
	    
	    ArrayList<Integer> wrong_num_list = new ArrayList<>();
	    ArrayList<Integer> wrong_question_list = new ArrayList<>();
	    ArrayList<String> wrong_question_label_list = new ArrayList<>();
	    
	    int score = 0;
	    
	    for (int i = 0; i < 10; i++) {
	        if (answer[i] != null && answer[i].equals(correctAnswer[i])) {
	            score += 10; // 정답인 경우 점수 증가
	        } else {
	            wrong_question_list.add(i + 1); // 틀린 문제 번호 추가
	            wrong_question_label_list.add(correctAnswer[i]);
	            int quiz_num2 = quizMapper.selectNum(correctAnswer[i]);
				wrong_num_list.add(quiz_num2); 
	        }
	    }
	    
	    int wrong_size = wrong_question_list.size();
	    System.out.println(wrong_size);
	    
	    Member member = (Member) session.getAttribute("loginMember");
	    if (member != null) {
	        String user_id = member.getId();
	        if(score>=60) {
				int mypoint = memberMapper.selectMyPoint(user_id);
				int point = mypoint+500;
				Member_point member_point = new Member_point(user_id, point);
				memberMapper.updateMyPoint(member_point);
			}
	        QuizRank quizRank = new QuizRank(user_id, score);
	        int cnt = quizMapper.insertScore(quizRank);
	    }
	    
	    model.addAttribute("wrong_question_label_list", wrong_question_label_list);
	    model.addAttribute("score", score);
	    model.addAttribute("wrong_num_list", wrong_num_list);
	    model.addAttribute("wrong_question_list", wrong_question_list);
	    model.addAttribute("wrong_size", wrong_size);
	    
	    return "quiz_score_pic";
	}
	
	
	
	
	@RequestMapping("/goWrongStudy")
	public String goWrongStudy(@RequestParam("word_num") int word_num, Model model) {
		
		// String quizURL = quizMapper.selectQuizURL(quiz_num);
		// String word_num = quizMapper.selectLabel(quiz_num);
		Word word = studyMapper.selectWord(word_num);
		String quizURL = word.getVideo_url();
		String word_name = word.getWord_name();
		
		int word_num2 = quizMapper.selectNum(word_name);
		// Word word = new Word(word_num);
		
		
		WordImage wordImage = studyMapper.selectWordImage(word_num2);
		
		model.addAttribute("word", word);
		model.addAttribute("quizURL", quizURL);
		 model.addAttribute("wordImage", wordImage);
		
		return "study_detail";
	}
	


    @RequestMapping("/quiz2")
    public String getQuiz(Model model) {
        Word randomWord = quizMapper.selectRandomWord();
        String videoUrl = randomWord.getVideo_url();
        String correctWord = randomWord.getWord_name();

        List<String> options = quizMapper.selectRandomWordOptions();

        if (!options.contains(correctWord)) {
            options.remove(0);
            options.add(correctWord);
        }
        
        Collections.shuffle(options);

        model.addAttribute("question", "이 수화가 뜻하는 단어는 무엇일까요?");
        model.addAttribute("videoUrl", videoUrl);
        model.addAttribute("options", options);
        model.addAttribute("correctAnswer", correctWord);

        return "quiz_b_num";
    }
    
    @RequestMapping(value = "/getNewQuiz", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Map<String, Object> getNewQuiz() {
        Word randomWord = quizMapper.selectRandomWord();
        String videoUrl = randomWord.getVideo_url();
        String correctWord = randomWord.getWord_name();

        List<String> options = quizMapper.selectRandomWordOptions();
        if (!options.contains(correctWord)) {
            options.remove(0);
            options.add(correctWord);
        }
        
        Collections.shuffle(options);

        Map<String, Object> quizData = new HashMap<>();
        quizData.put("question", "이 수화가 뜻하는 단어는 무엇일까요?");
        quizData.put("videoUrl", videoUrl);
        quizData.put("options", options);
        quizData.put("correctAnswer", correctWord);

        return quizData;
    }
    
    
    @RequestMapping(value = "/api/words/random", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Map<String, Object> getRandomWord() {
        Word randomWord = quizMapper.selectRandomWord();
        String wordImgUrl = quizMapper.selectWordImage(randomWord.getWord_num());

        Map<String, Object> response = new HashMap<>();
        response.put("word", randomWord);
        response.put("wordImage", wordImgUrl);

        return response;
    }

    // 초기 10개의 단어와 이미지를 가져오는 API 엔드포인트 추가
    @RequestMapping(value = "/api/words/initial", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Map<String, Object>> getInitialWords() {
        List<Map<String, Object>> initialWords = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            Word randomWord = quizMapper.selectRandomWord();
            String wordImgUrl = quizMapper.selectWordImage(randomWord.getWord_num());

            Map<String, Object> wordData = new HashMap<>();
            wordData.put("word", randomWord);
            wordData.put("wordImage", wordImgUrl);

            initialWords.add(wordData);
            System.out.println(wordData);
        }

        return initialWords;
    }

    // quiz_b.jsp 페이지로 이동
    @RequestMapping("/quizB")
    public String goQuizB() {
        return "quiz_b";
    }
    
    @RequestMapping("/doSSL")
    public String doSSL(Model model, HttpServletRequest request) {
 	   
 	   try {
 		    // Python 스크립트 경로
 		    String pythonScriptPath = "C:\\Users\\smhrd\\git\\SLschool\\src\\main\\webapp\\resources\\python\\testpy.py";

 		    // ProcessBuilder 설정
 		    ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);
 		    processBuilder.redirectErrorStream(true); // 표준 에러 스트림을 표준 출력 스트림으로 리다이렉션

 		    // 프로세스 시작
 		    Process process = processBuilder.start();

 		    // 스크립트의 출력 읽기 (UTF-8 인코딩)
 		    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
 		    StringBuilder output = new StringBuilder();
 		    String line;
 		    while ((line = reader.readLine()) != null) {
 		        output.append(line).append("\n");  // 각 라인 뒤에 개행 문자 추가
 		    }

 		    // 프로세스 종료 대기
 		    int exitCode = process.waitFor();
 		    System.out.println("Exited with code: " + exitCode);

 		    // 결과 모델에 추가
 		    String result = output.toString();
 		    System.out.println("Result: " + result);

 		    // most_common_word 추출
 		    String word = null;
 		    String[] lines = result.split("\n");
 		    for (String resultLine : lines) {
 		        if (resultLine.startsWith("종료 후 결과:")) {
 		            word = resultLine.split(":")[1].trim();
 		            break;
 		        }
 		    }

 		    // 결과 출력
 		    if (word != null) {
 		        System.out.println("Most common word: " + word);
 		    } else {
 		        System.out.println("No word found in the result.");
 		    }

 		    // 결과 모델에 추가
 		    // model.addAttribute("result", word);
 		    
 		   String labelword = request.getParameter("labelword");
 		   System.out.println(labelword + "라벨단어");
 		   
 		   System.out.println(word + "단어");
 		   
 		   model.addAttribute("word",word);
 		   model.addAttribute("labelword", labelword);
 		   
 		   if(labelword.equals(word)) {
 			   return "quiz_success";
 		   }else {
 			   return "quiz_fail";
 		   }
 		    

 		} catch (Exception e) {
 		    e.printStackTrace();
 		}

 	   return "main";
    }
    
    @RequestMapping("/goSuccess")
    public String goSuccess() {
    	return "quiz_success";
    }
    
    @RequestMapping("/goFail")
    public String goFail() {
    	return "quiz_fail";
    }
}
