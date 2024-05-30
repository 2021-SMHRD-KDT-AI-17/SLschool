package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.Mapper.QuizMapper;
import kr.smhrd.entity.Quiz;
import kr.smhrd.entity.Word;

@Controller
public class QuizController {
	
	@Autowired
	private QuizMapper quizMapper;
	
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
		
		List<Quiz> quiz_list= quizMapper.selectQuiz(); // DB를 연동하여 문제데이터를 Quiz형태로 되어있는 리스트에 저장
		System.out.println(quiz_list.get(0).getQuiz_label());
		model.addAttribute("quiz_list", quiz_list); // 저장한 리스트(quiz_list)를 quiz_a_detail에 전송 (1회용)
		
		
		return "quiz_a_detail";
	}
	
	// 퀴즈 정답 제출 및 점수 확인
	@RequestMapping("/goQuizScore")
	public String goQuizScore(HttpServletRequest request, Model model) {
		
		String[] answer = request.getParameterValues("answer");
		String[] quiz_numL = request.getParameterValues("quiz_num");
		String[] question_number = request.getParameterValues("question_number");
		
		ArrayList<Integer> wrong_num_list = new ArrayList<Integer>();  // AraayList를 사용하는 이유는 확실한 범위를 모를때 사용한다
		ArrayList<Integer> wrong_question_list = new ArrayList<Integer>();
		
		int score = 0;
		
		for (int i=0;i<5;i++) {
			int quiz_num = Integer.valueOf(quiz_numL[i]).intValue(); // 문제 번호를 가져오는 과정에서 String으로 변환이 되기 때문에 그 값을 다시 int 형태로 바꿔주는 작업
			String quiz_label = quizMapper.selectLabel(quiz_num);
			if(answer[i].equals(quiz_label)) {
				score = score + 20; // score+=20;
			}else {
				int question_num = Integer.valueOf(question_number[i]).intValue();
				wrong_question_list.add(question_num);    // 1~5 번 문제중 어떤 문제를 틀렸는지 저장하기 (짝수 번호 배열)
				wrong_num_list.add(quiz_num);        // 틀린 문제에 대한 고유번호(나중에 랜덤으로 할 것) 을 홀수 번호에 저장
			}
		}
		
		int wrong_size = wrong_num_list.size();
		System.out.println(wrong_question_list.size()+"개");
		
		model.addAttribute("score", score);
		model.addAttribute("wrong_num_list", wrong_num_list);
		model.addAttribute("wrong_question_list", wrong_question_list);
		model.addAttribute("wrong_size", wrong_size);
		
		return "quiz_score";
	}
	
	@RequestMapping("/goWrongStudy")
	public String goWrongStudy(@RequestParam("quiz_num") int quiz_num, Model model) {
		
		String quizURL = quizMapper.selectQuizURL(quiz_num);
		model.addAttribute("quizURL", quizURL);
		
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
    


}
