<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>${announcement.ann_title }</p>
	<p>${announcement.ann_content }</p>
	<p>${announcement.ann_time }</p>
	<button onclick="location.href='goAnnouncement'">뒤로가기</button>

</body>
</html>