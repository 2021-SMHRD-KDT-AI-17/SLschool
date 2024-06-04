<%@page import="kr.smhrd.entity.Member"%>
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
	<% Member loginMember = (Member)session.getAttribute("loginMember"); %>
	
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<c:forEach items="${ann_list }" var="ann" varStatus="s">
			<tr>
				<td>${s.count }</td>
				<td><a href="goDetailAnnouncement?ann_num=${ann.ann_num }">${ann.ann_title }</a></td>
				<td>${ann.ann_time }</td>
			</tr>
		</c:forEach>
	</table>
	<% if (loginMember != null && loginMember.getId().equals("admin")) {%>
		<a href="goWriteAnnouncement">공지사항 작성하러가기</a>
	<% } %>

</body>
</html>