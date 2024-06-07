package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.Mapper.MemberMapper;
import kr.smhrd.entity.Member;

@RestController
public class ResttController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("inputID") String inputID) {
		
		Member member = memberMapper.emailCheck(inputID);
		
		
		if (member == null) {
			// 사용가능
			return 1;
		} else {
			// 사용불가능
			return 0;
		}
	}
	
	@RequestMapping("/LoginCheck")
	public @ResponseBody int LoginCheck(@RequestParam("inputID") String inputID,  @RequestParam("inputPW") String inputPW) {
		
		System.out.println(inputID);
		Member member = memberMapper.emailCheck(inputID);
		
		if (member == null) {
			// 사용가능
			return 1;
		} else {
			if (member.getPw().equals(inputPW)) {
				return 2;
			}else {
				return 3;
			}
		}

	}
	

}
