<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="goLogin" method="post">
	<input type="text" name="id" placeholder="아이디를 입력하세요">
	<input type="password" name="pw" placeholder="비밀번호를 입력하세요">
	<input type="submit" value="로그인">
	</form>
	<button onclick="location.href='goJoin'">회원가입</button>

</body>
</html>