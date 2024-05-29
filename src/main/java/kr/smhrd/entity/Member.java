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
public class Member {
	
	
	@NonNull private String id;
	@NonNull private String pw;
	private String name;
	private String birth;
	private int pro;
	
	public Member(@NonNull String id, @NonNull String pw, String name, String birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
	}

	public Member(@NonNull String id, @NonNull String pw, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	
	

	
//	특정 컬럼만 사용하는 생성자가 2개 이상 필요할 때 따로 선언을 해줘야 한다!(앞 Nonnull 써놓은 생성자와 겹치지 않게.)
//   중복되지않게
	
//	public Member(@NonNull String id, @NonNull String pw, String name) {
//		super();
//		this.id = id;
//		this.pw = pw;
//		this.name = name;
//	}
	
	

}




