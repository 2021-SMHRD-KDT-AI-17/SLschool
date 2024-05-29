package kr.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.Mapper.MemberMapper;
import kr.smhrd.entity.Member;




@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/")
	public String Main() {
		return "main";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/loginMember")
	public String goLogin(Member member, HttpSession session, HttpServletRequest request) {
		
		Member loging = memberMapper.loginMember(member);
//		String attendance = memberMapper.selectattendance(member.getId()); 
		session.setAttribute("loging", loging);
		
		if(loging != null) {
			return "Main";
		}else {
			System.out.println("등록되지 않은 아이디 또는 비밀번호입니다.");
			return "login";
		}
		
		
		
	}
	
	
	@RequestMapping("/newLogin")
	public String newLogin(Member member) {
		
		int loginfo = memberMapper.newLogin(member);
		if(loginfo == 1) {
			return "login";	
		}else {
			System.out.println("정보를 입력해주세요");
			return "newLogin";
		}
		
	}
	
	@RequestMapping("/goMain")
	public String goMain() {
		return "main";
	}
	

}
