<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="JoinMember" method="post">
	<input type="text" placeholder="아이디를 입력하세요" name="id" id="inputID">
	<button type="button" onclick="checkE()">아이디 중복체크</button>
	<input type="password" placeholder="비밀번호를 입력하세요" name="pw">
	<input type="text" placeholder="이름을 입력하세요" name="name">
	<input type="date" name="birthday">
	<input type="submit" value="회원가입">
	</form>


</body>

<script type="text/javascript">
	function checkE() {
		var inputE = $('#inputID').val()

		$.ajax( /* JSON(JavaScript Object Notation) */
		{
			// 어디로 요청할건지
			url : 'emailCheck',
			// 요청데이터 형태 -> JSON
			data : {
				'inputID' : inputID
			},
			// 요청방식
			type : 'get',
			// 요청 응답 성공했을 때 / 실패했을 때 
			success : function(data) {
				if (data == 1) {
					$('#resultCheck').text('사용 가능한 아이디입니다.')
				} else {
					$('#resultCheck').text('사용 불가능한 아이디입니다.')
				}
			},
			error : function() {
				alert("통신실패!")
			}
		})
	}
</script>
</html>