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
	   
	@RequestMapping("/goMain")
	public String goMain() {
		return "main";
	}
	
	@RequestMapping("/goMyPage")
	public String goMyPage() {
		return "mypage";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	@RequestMapping("/goJoin")
	public String goJoin() {
		
		return "join";
	}
	
	// 회원가입 
	@RequestMapping("/newMember")
	public String newMember(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
		Member member = new Member(id, pw, name, birthday);
		
		int cnt = memberMapper.newMember(member);
		return "main";
	}
	
	// 로그인 기능
	@RequestMapping("/Login")
	public String Login(HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member member = new Member(id, pw);
		
		Member member2 = memberMapper.SelectMember(member);
		
		if(member2 == null) {
			
		}else {
			session.setAttribute("loginMember", member2);
			return "main";
		}
		
		return "";
	}
	
	// 로그아웃 기능
	@RequestMapping("/goLogout")
	public String goLogout(HttpSession session) {
		
		// 세션 삭제 ( = 로그아웃)
		session.invalidate();
		
		return "main";
	}
	
	
	
}
