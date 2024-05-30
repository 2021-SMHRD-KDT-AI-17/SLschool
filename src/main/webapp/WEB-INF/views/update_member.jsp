<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="updateMember" method="post">
	<input type="hidden" value="${member.id }" name="id">
	<h2>비밀번호</h2>
	<input type="password" name="pw"><br>
	<h2>이름</h2>
	<input type="text" value="${member.name }" name="name"><br>
	<input type="submit" value="회원정보 수정">
	</form>
	

</body>
</html>