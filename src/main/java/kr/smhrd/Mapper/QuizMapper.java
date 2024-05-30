package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Quiz;
import kr.smhrd.entity.QuizRank;

public interface QuizMapper {

	public List<Quiz> selectQuiz();
	
	public String selectLabel(int quiz_num);

	public String selectQuizURL(int quiz_num);

	public int insertScore(QuizRank quizRank);

	public List<QuizRank> selectQuizScore(String sug_writer);

}
