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

public class Suggestion {

	
	private int sug_num;
	@NonNull
	private String sug_writer;
	@NonNull
	private String sug_title;
	@NonNull
	private String sug_content;
	private String sug_time;
	
	
}
