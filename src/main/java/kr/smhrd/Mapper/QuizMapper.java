package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Quiz;

import kr.smhrd.entity.Word;

import kr.smhrd.entity.QuizRank;
import kr.smhrd.entity.QuizPic;


public interface QuizMapper {

	public List<Quiz> selectQuiz();
	
	public String selectLabel(int quiz_num);

	public String selectQuizURL(int quiz_num);

	public Word selectRandomWord();

	public List<String> selectRandomWordOptions();

	public int insertScore(QuizRank quizRank);

	public List<QuizRank> selectQuizScore(String sug_writer);

	public List<QuizPic> selectQuizPic();

	public String selectLabelPic(int quiz_num);

	public Quiz selectQuizNum(int quiz_num);

	public String selectWordImage(int word_num);

	public Word selectWordByName(String choiceName);

	public List<Word> selectRandomWords(int i);

	public int selectNum(String word_name);

	public String selectName(Integer integer);

}
