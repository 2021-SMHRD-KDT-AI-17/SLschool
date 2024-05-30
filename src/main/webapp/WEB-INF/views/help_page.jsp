<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="">
		<h2>작성자</h2>
		<input type="text" value="${Member.id }" readonly name="id"><br>
		<h2>제목</h2>
		<input type="text" name="title"><br>
		<h2>내용</h2>
		<textarea rows="20" cols="20" style="width:100%; height: 100%; font-size:20px;"></textarea><br>
		<input type="submit" value="전송하기">
	</form>

</body>
</html>