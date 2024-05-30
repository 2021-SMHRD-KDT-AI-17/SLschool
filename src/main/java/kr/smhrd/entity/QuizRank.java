package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class QuizRank {
	
	private int rank_num;
	@NonNull
	private String user_id;
	@NonNull
	private int quiz_score;
	private String quiz_time;
	
	
	
	
	
}
