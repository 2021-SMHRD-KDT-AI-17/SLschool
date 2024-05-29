package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.Mapper.MemberMapper;
import kr.smhrd.entity.Member;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/emailCheck")
	public @ResponseBody int emailCheck(@RequestParam("inputE") String id) {
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
