package kr.smhrd.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Member;
import lombok.NonNull;

@Mapper
public interface MemberMapper {
	
	public Member loginMember(Member member);
	
	public int newMember(Member member);

	public String selectattendance(@NonNull String id);

	public Member emailCheck(String id);



}
