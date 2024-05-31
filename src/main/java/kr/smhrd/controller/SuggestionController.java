package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.Mapper.SuggestionMapper;
import kr.smhrd.entity.A_Suggestion;
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
	
	// 관리자 전용 문의사항 리스트 확인페이지
	@RequestMapping("/goAdminHelp")
	public String goAdminHelp(Model model) {
		
		List<Suggestion> suggestionList = suggestionMapper.selectAllSuggestion();
		
		model.addAttribute("suggestionList",suggestionList);
		
		return "adminHelp";
	}
	
	
	// 내가 문의한 내용 확인 페이지 가기
	@RequestMapping("goSuggestionDetail")
	public String goSuggestionDetail(@RequestParam("sug_num") int sug_num, Model model) {
		
		Suggestion suggestion = suggestionMapper.selectSuggestionNum(sug_num);
		A_Suggestion aSuggestion = suggestionMapper.selectASuggestion(sug_num);
		
		model.addAttribute("suggestion", suggestion);
		model.addAttribute("aSuggestion", aSuggestion);
		
		return "help_list";
	}
	
	// 문의에 대한 답변 적으러 이동하기
	@RequestMapping("/goWriteA")
	public String goWriteA(@RequestParam("sug_num") int sug_num, Model model) {
		model.addAttribute("sug_num", sug_num);
		
		return "A_suggestion";
	}
	
	// 문의에 대한 답변 적는 기능
	@RequestMapping("/writeA") 
	public String writeA(HttpServletRequest request) {
		
		String a_title = request.getParameter("title");
		String a_content = request.getParameter("content");
		int sug_num = Integer.valueOf(request.getParameter("sug_num"));
		
		A_Suggestion a_Suggestion = new A_Suggestion(sug_num, a_title, a_content);
		
		int cnt = suggestionMapper.insertA_Suggestion(a_Suggestion);
		
		return "redirect:/goAdminHelp";
	}
	
}
