package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.Mapper.SuggestionMapper;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Suggestion;

@Controller
public class SuggestionController {

	@Autowired
	private SuggestionMapper suggestionMapper;
	
	
	// 문의사항 페이지 이동
	@RequestMapping("/goHelp")
	public String goHelp(HttpSession session, Model model) {
		
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member", member);
		return "help_page";
	}
	
	// 건의사항 작성기능
	@RequestMapping("/writeSuggestion")
	public String writeSuggestion(HttpServletRequest request ) {
		String sug_writer = request.getParameter("id");
		String sug_title = request.getParameter("title");
		String sug_content = request.getParameter("content");
		
		// 위의 3개 값을 아래에 suggestion 이라는 이름으로 묶었다. 
		Suggestion suggestion = new Suggestion(sug_writer, sug_title, sug_content);
		
		int cnt = suggestionMapper.insertSuggestion(suggestion);
		
		return "redirect:/goMyPage";
	}
	
	@RequestMapping("/goAdminHelp")
	public String goAdminHelp(Model model) {
		
		List<Suggestion> suggestionList = suggestionMapper.selectAllSuggestion();
		
		model.addAttribute("suggestionList",suggestionList);
		
		return "adminHelp";
	}
	
	@RequestMapping("goSuggestionDetail")
	public String goSuggestionDetail() {
		
		return "help_list";
	}
	
	
}
