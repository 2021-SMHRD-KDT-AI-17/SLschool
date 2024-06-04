package kr.smhrd.controller;

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

import kr.smhrd.Mapper.QuizMapper;
import kr.smhrd.Mapper.StudyMapper;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Quiz;
import kr.smhrd.entity.Word;
import kr.smhrd.entity.WordImage;
import kr.smhrd.entity.QuizRank;
import kr.smhrd.entity.QuizPic;


@Controller
public class QuizController {
	
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
        for (int i = 7; i <= 70; i++) {
            numbers.add(i);
        }

        // 리스트를 랜덤하게 섞음
        Collections.shuffle(numbers);

        // 랜덤하게 섞인 리스트에서 5개의 숫자만 선택하여 출력
        List<Integer> selectedNumbers = numbers.subList(0, 5);
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
	    List<Map<String, Object>> questionList = new ArrayList<>();

	    for (int i = 0; i < 5; i++) {
	        Word correctWord = quizMapper.selectRandomWord();
	        Set<Word> randomWords = new HashSet<>(quizMapper.selectRandomWords(3));

	        // 보기가 3개 미만이면, 중복되지 않는 단어를 추가
	        while (randomWords.size() < 3) {
	            Word newWord = quizMapper.selectRandomWord();
	            if (!newWord.getWord_name().equals(correctWord.getWord_name())) {
	                randomWords.add(newWord);
	            }
	        }

	        // 정답 단어를 포함한 리스트로 섞기
	        List<Word> allWords = new ArrayList<>(randomWords);
	        allWords.add(correctWord);
	        
	        while (allWords.size()<4) {
	        	Word newWord = quizMapper.selectRandomWord();
	            if (!newWord.getWord_name().equals(correctWord.getWord_name())) {
	                allWords.add(newWord);
	            }
	        }
	        Collections.shuffle(allWords);

	        Map<String, String> choices = new HashMap<>();
	        for (Word word : allWords) {
	            String wordImage = quizMapper.selectWordImage(word.getWord_num());
	            choices.put(word.getWord_name(), wordImage);
	        }

	        String correctWordImage = quizMapper.selectWordImage(correctWord.getWord_num());
	        String correctWordName = correctWord.getWord_name();

	        Map<String, Object> question = new HashMap<>();
	        question.put("correctWord", correctWord);
	        question.put("choices", choices);
	        question.put("correctWordImage", correctWordImage);
	        question.put("correctWordName", correctWordName);

	        questionList.add(question);

	        // 콘솔에 출력
	        System.out.println("정답은 " + correctWordName);
	        System.out.println("보기는 " + choices);
	    }

	    model.addAttribute("questionList", questionList);
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
		
		for (int i=0;i<5;i++) {
			int quiz_num = Integer.valueOf(quiz_numL[i]).intValue(); // 문제 번호를 가져오는 과정에서 String으로 변환이 되기 때문에 그 값을 다시 int 형태로 바꿔주는 작업
			String quiz_label = quizMapper.selectLabel(quiz_num);
			if(answer[i].equals(quiz_label)) {
				score = score + 20; // score+=20;
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
	    String[] answer = new String[5];
	    String[] correctAnswer = new String[5];

	    for (int i = 0; i < 5; i++) {
	        answer[i] = request.getParameter("answer" + (i + 1));
	        correctAnswer[i] = request.getParameter("correctAnswer" + (i + 1));
	        System.out.println("Answer " + (i + 1) + ": " + answer[i]);
	        System.out.println("Correct Answer " + (i + 1) + ": " + correctAnswer[i]);
	    }
	    
	    ArrayList<Integer> wrong_num_list = new ArrayList<>();
	    ArrayList<Integer> wrong_question_list = new ArrayList<>();
	    ArrayList<String> wrong_question_label_list = new ArrayList<>();
	    
	    int score = 0;
	    
	    for (int i = 0; i < 5; i++) {
	        if (answer[i] != null && answer[i].equals(correctAnswer[i])) {
	            score += 20; // 정답인 경우 점수 증가
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

        Map<String, Object> quizData = new HashMap<>();
        quizData.put("question", "이 수화가 뜻하는 단어는 무엇일까요?");
        quizData.put("videoUrl", videoUrl);
        quizData.put("options", options);
        quizData.put("correctAnswer", correctWord);

        return quizData;
    }

}
