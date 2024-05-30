package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Suggestion;

public interface SuggestionMapper {

	public int insertSuggestion(Suggestion suggestion);

	public List<Suggestion> selectMySuggestion(String sug_writer);

}
