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
		
		return "";
	}
	
	

}
