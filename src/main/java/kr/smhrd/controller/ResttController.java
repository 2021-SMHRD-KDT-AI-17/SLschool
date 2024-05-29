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
	
	@GetMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("inputID") String id) {
		
		System.out.println(id);
		Member member = memberMapper.emailCheck(id);
		
		
		if (member == null) {
			// 사용가능
			return 1;
		} else {
			// 사용불가능
			return 0;
		}
	}
	
	

}
