package kr.smhrd.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.Record;
import kr.smhrd.entity.Word;
import kr.smhrd.entity.WordImage;

public interface StudyMapper {

	public List<Word> selectWordAllA();

	public List<Word> selectWordAllB();

	public List<Word> selectWordAllC();

	public Word selectWord(int word_num);
	
	public List<Word> getWordsByConsonant(@Param("consonant") String consonant);

	public int insertRecord(Record record);

	public List<Word> selectRecordWord(String sug_writer);

	public WordImage selectWordImage(int word_num);

	public List<Word> selectWordAllFamily();
	
	public List<Word> selectWordAllColor();
	
	public List<Word> selectWordAllEco();




}
