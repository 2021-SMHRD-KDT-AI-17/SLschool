<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="text" value="${announcement.title }">
	<input type="text" value="${announcement.content }">
	<input type="text" value="${announcement.ann_time }">
	<button onclick="location.href='goAnnouncement'">뒤로가기</button>

</body>
</html>