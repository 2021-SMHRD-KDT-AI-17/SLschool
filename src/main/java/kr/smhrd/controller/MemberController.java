package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.Mapper.AnnouncementMapper;
import kr.smhrd.Mapper.MemberMapper;
import kr.smhrd.Mapper.QuizMapper;
import kr.smhrd.Mapper.StudyMapper;
import kr.smhrd.Mapper.SuggestionMapper;
import kr.smhrd.entity.Announcement;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.QuizRank;
import kr.smhrd.entity.Suggestion;
import kr.smhrd.entity.Word;




@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private SuggestionMapper suggestionMapper;
	
	@Autowired
	private StudyMapper studyMapper;
	
	@Autowired
	private QuizMapper quizMapper;
	
	@Autowired
	private AnnouncementMapper announceMapper;
	
	@Autowired
	private static PythonInterpreter intPre;
	
	
	 @RequestMapping("/")
	   public String Main(Model model) {
		 Announcement announcement = announceMapper.selectANNF();
		 
		 model.addAttribute("announcement", announcement);
		 
	      return "main";
	   }
	   
	@RequestMapping("/goMain")
	public String goMain(Model model) {
		
		Announcement announcement = announceMapper.selectANNF();
		 
		 model.addAttribute("announcement", announcement);
		
		return "main";
	}
	
	@RequestMapping("/goMyPage")
	public String goMyPage(HttpSession session, Model model, HttpServletRequest request) {
		Member member = (Member) session.getAttribute("loginMember");
		String sug_writer = member.getId();
		
		int point = memberMapper.selectMyPoint(sug_writer);
		// DB를 통해 정보를 가져오는 구문
		List<Word> wordList = studyMapper.selectRecordWord(sug_writer);
		List<Suggestion> suggestionList = suggestionMapper.selectMySuggestion(sug_writer);
		List<QuizRank> quizRankList = quizMapper.selectQuizScore(sug_writer);
		
		ArrayList<Integer> scorelist = new ArrayList<Integer>();
		
		for(int i=0; i<quizRankList.size();i++) {
			scorelist.add(quizRankList.get(i).getQuiz_score());
		}
		
		
		// size() 함수 : 리스트(배열)의 갯수를 세는 함수 
		int s_size = suggestionList.size();
		
		// 가져온 데이터를 mypage에 보내주는 기능
		model.addAttribute("point", point);
		model.addAttribute("s_size", s_size);
		model.addAttribute("suggestionList", suggestionList);
		model.addAttribute("member", member);
		model.addAttribute("wordList", wordList);
		model.addAttribute("quizRankList", quizRankList);
		request.setAttribute("scorelist", scorelist);
		
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
		memberMapper.newMemberPoint(id);
		return "main";
	}
	
	// 로그인 기능
	@RequestMapping("/Login")
	public String Login(HttpServletRequest request, HttpSession session, Model model) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member member = new Member(id, pw);
		
		Member member2 = memberMapper.SelectMember(member);

		session.setAttribute("loginMember", member2);
		Announcement announcement = announceMapper.selectANNF();
		 
		model.addAttribute("announcement", announcement);
	
		return "main";
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
		
		return "redirect:/goMyPage";
	}

	
	@RequestMapping("/helpPage")
	public String gohelp() {
		return "help_page";
	}
	
	

	
}
