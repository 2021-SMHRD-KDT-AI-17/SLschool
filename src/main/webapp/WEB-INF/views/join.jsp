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
	<input type="text" placeholder="아이디를 입력하세요" name="id">
	<button type="button" onclick="checkE()">아이디 중복체크</button>
	<input type="password" placeholder="비밀번호를 입력하세요" name="pw">
	<input type="text" placeholder="이름을 입력하세요" name="name">
	<input type="date" name="birthday">
	<input type="submit" value="회원가입">
	</form>


</body>
</html>