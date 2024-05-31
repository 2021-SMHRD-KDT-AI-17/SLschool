package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuizPic {
	
	private int quiz_num;
	private String quiz_catagory;
	private String quiz_question;
	private String quiz_label;
	private String video_url;
	private String quiz_image1;
	private String image1_name;
	private String quiz_image2;
	private String image2_name;
	private String quiz_image3;
	private String image3_name;
	private String quiz_image4;
	private String image4_name;

}
