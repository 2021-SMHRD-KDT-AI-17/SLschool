package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@RequiredArgsConstructor
@ToString

public class A_Suggestion {

	private int sugA_num;
	private int sug_num;
	
	@NonNull
	private String sugA_writer;
	@NonNull
	private String sugA_title;
	@NonNull
	private String sugA_content;
	private String sugA_time;
	
	
}
