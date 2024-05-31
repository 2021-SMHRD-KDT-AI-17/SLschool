<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table>
		<tr>
			<td>아이디</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		
		<c:forEach items="${suggestionList}" var="sug" end="9" varStatus="s">
			<a href="goSuggestionDetail?sug_num=${sug.sug_num }">
			<tr>
			<td>${sug.sug_writer}</td>
			<td>${sug.sug_title}</td>
			<td>${sug.sug_time}</td>
			</tr>
			</a>
		</c:forEach>
	</table>


</body>
</html>