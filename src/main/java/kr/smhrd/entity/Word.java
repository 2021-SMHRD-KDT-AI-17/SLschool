package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Word {
	
	private int word_num;
	private String word_category;
	private String word_name;
	private String word_info;
	private String video_url;
	private String consonant;

}
