package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Quiz_PR {
	
	private int word_num; // 문제로 뽑힌 단어의 고유번호
	private String video_url; // 문제로 뽑힌 단어의 영상
	private String word_name; // 문제로 뽑힌 단어에 대한 이름(정답)
	public String word_img_url1; // 보기 1번에 대한 이미지 주소
	public String word_name1; // 보기 1번에 대한 이름
	public String word_img_url2; 
	public String word_name2;
	public String word_img_url3;
	public String word_name3;
	public String word_img_url4;
	public String word_name4;

}
