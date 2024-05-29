package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Word;

public interface StudyMapper {

	public List<Word> selectWordAllA();

	public List<Word> selectWordAllB();

	public List<Word> selectWordAllC();

	public Word selectWord(int word_num);

}
