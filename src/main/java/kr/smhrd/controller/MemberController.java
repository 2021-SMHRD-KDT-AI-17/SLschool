package kr.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String goMyPage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member", member);
		
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
	
	// 회원정보 수정하러 가기
	@RequestMapping("/goUpdateMember")
	public String goUpdateMember(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member", member);
		
		return "update_member";
	}
	
	// 회원정보 수정기능
	@RequestMapping("/updateMember")
	public String updateMember(HttpSession session, HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		Member member = new Member(id, pw, name);
		int cnt = memberMapper.updateMember(member);
		Member member2 = memberMapper.emailCheck(id);
		
		// session 덮어쓰기
		session.setAttribute("loginMember", member2);
		model.addAttribute("member", member2);  // redirect:/goMyPage 오류 해결하면 사용 안해도 됨
		
		return "mypage";
	}
	
	// 문의사항 페이지 이동
	@RequestMapping("/goHelp")
	public String goHelp(HttpSession session, Model model) {
		
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member", member);
		return "help_page";
	}
	
	
}
