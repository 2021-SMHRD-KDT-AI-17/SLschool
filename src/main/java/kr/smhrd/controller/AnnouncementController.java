package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.Mapper.AnnouncementMapper;
import kr.smhrd.entity.Announcement;

@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementMapper announcementMapper;
	
	// 공지사항 보러가기
	@RequestMapping("/goAnnouncement")
	public String goAnnouncement(Model model) {
		
		// List형태로 여러개의 공지사항 불러오기
		List<Announcement> ann_list = announcementMapper.selectAllAnn();
		
		// 불러온 List 보내주기
		model.addAttribute("ann_list", ann_list);
		return "announcement";
	}
	
	
	// 공지사항 내용보러가기
	@RequestMapping("/goDetailAnnouncement")
	public String goDetailAnnouncement(@RequestParam("ann_num") int ann_num, Model model) {
		
		// 해당 번호에 대한 공지사항 정보 불러오기(1개) → 고유 번호에 대한 공지사항
		Announcement announcement = announcementMapper.selectAnn(ann_num);
		
		// 불러온 공지사항 보내주기
		model.addAttribute("announcement", announcement);
		
		return "announcement_detail";
	}
	
	// 공지사항 작성하러 가기
	@RequestMapping("goWriteAnnouncement")
	public String goWriteAnnouncement() {
		return "announcement_write";
	}
	
	// 공지사항 작성기능
	@RequestMapping("/writeAnnouncement")
	public String writeAnnouncement(HttpServletRequest request) {
		
		// 적었던 제목 가져온 후 ann_title이라는 변수에 담아주기
		String ann_title = request.getParameter("title");
		// 적었던 내용 가져온 후 ann_content라는 변수에 담아주기
		String ann_content = request.getParameter("content");
		// 제목과 내용을 가지고 공지사항이라는 entity(객체)로 묶어주기 → DB에 쓸 매개변수로 보내주기 편하기 위함
		Announcement announcement = new Announcement(ann_title, ann_content);	
		
		// 적은 내용 DB에 저장
		int cnt = announcementMapper.insertAnn(announcement);
		
		// goAnnouncement 메소드 다시 실행하기
		return "redirect:/goAnnouncement";
	}
	
	
	

}
