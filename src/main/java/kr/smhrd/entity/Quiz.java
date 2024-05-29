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

public class Quiz {

	@NonNull
	private int quiz_num;
	private String quiz_catagory;
	private String quiz_question;
	private String quiz_label;
	@NonNull
	private String video_url;
	
	
	
}
