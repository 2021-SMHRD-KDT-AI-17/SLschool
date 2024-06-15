package kr.smhrd.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Member_point;
import lombok.NonNull;

@Mapper
public interface MemberMapper {
	
	public Member loginMember(Member member);
	
	public int newMember(Member member);

	public String selectattendance(@NonNull String id);

	public Member emailCheck(String id);

	public Member SelectMember(Member member);

	public int updateMember(Member member);

	public int selectMyPoint(String sug_writer);
	
	public int updateMyPoint(Member_point member_point);

	public int newMemberPoint(String id);




}
