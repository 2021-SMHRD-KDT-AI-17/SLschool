package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Quiz;

public interface QuizMapper {

	public List<Quiz> selectQuiz();
	
	public String selectLabel(int quiz_num);

	public String selectQuizURL(int quiz_num);

}
