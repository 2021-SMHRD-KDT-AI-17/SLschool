package kr.smhrd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.Mapper.StudyMapper;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Record;
import kr.smhrd.entity.Word;

@Controller
public class StudyController {
	
	@Autowired
	private StudyMapper studyMapper;

	@RequestMapping("/goStudy")
	public String goStudy(Model model) {
		
		List<Word> word_listA = studyMapper.selectWordAllA();
		List<Word> word_listB = studyMapper.selectWordAllB();
		List<Word> word_listC = studyMapper.selectWordAllC();
		
		model.addAttribute("word_listA", word_listA);
		model.addAttribute("word_listB", word_listB);
		model.addAttribute("word_listC", word_listC);
		
		return "study";
	}
	
	@RequestMapping("/goWordDetail")
	public String goWordDetail(@RequestParam("word_num") int word_num, Model model, HttpSession session) {
		
		
		Member member = (Member) session.getAttribute("loginMember");
		
		if(member != null) {
			String user_id = member.getId();
			Record record = new Record(user_id, word_num);
			int cnt = studyMapper.insertRecord(record);
		}
		
		Word word = studyMapper.selectWord(word_num);
		
		model.addAttribute("word", word);
		
		String word_url = word.getVideo_url(); // 임시조치
		model.addAttribute("quizURL", word_url); // 임시조치
		
		return "study_detail";
	}
	
	// A => 음식
	@RequestMapping("/goStudyA")
	public String goStudyA(Model model) {
		
		List<Word> word_listA = studyMapper.selectWordAllA();
		model.addAttribute("word_listA", word_listA);
		return "study_a";
	}
	
	// B => 스포츠
	@RequestMapping("/goStudyB")
	public String goStudyB(Model model) {
		
		List<Word> word_listB = studyMapper.selectWordAllB();
		model.addAttribute("word_listB", word_listB);
		return "study_b";
	}
	
	// C => 직업
	@RequestMapping("/goStudyC")
	public String goStudyC(Model model) {
		
		List<Word> word_listC = studyMapper.selectWordAllC();
		model.addAttribute("word_listC", word_listC);
		return "study_c";
	}
	

    @RequestMapping("/goDic")
    public String getDictionary(Model model) {
        String[] consonants = {"ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};
        Map<String, List<Word>> wordsByConsonant = new TreeMap<>();

        for (String consonant : consonants) {
            List<Word> words = studyMapper.getWordsByConsonant(consonant);
            wordsByConsonant.put(consonant, words);
        }

        model.addAttribute("wordsByConsonant", wordsByConsonant);
        return "dictionary";
    }
}
