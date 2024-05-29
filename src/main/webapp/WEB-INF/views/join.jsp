<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="" method="post">
	<input type="text" placeholder="아이디를 입력하세요" name="id" id="inputID">
	<button type="button" onclick="checkE()">아이디 중복체크</button>
	<div>
					<span id="resultCheck" style="color: red"></span>
				</div>
	<input type="password" placeholder="비밀번호를 입력하세요" name="pw" id="inputPW">
	<input type="password" placeholder="비밀번호를 입력하세요" name="pwConfirm" id="inputPWConfirm" />
	<div id="passwordMatchMsg" style="color: red;"></div>
	<input type="text" placeholder="이름을 입력하세요" name="name">
	<input type="date" name="birthday">
	<input type="submit" value="회원가입">
	</form>


</body>

<script type="text/javascript">
	function checkE() {
		var inputID = document.getElementByID("inputID").val(); // 변수명 오류 수정: inputE -> inputID

		$.ajax({
			url: 'idCheck', // 서버의 URL 또는 API 엔드포인트
			data: {
				'inputID': inputID // 변수명 수정, 문자열로 감싼 키 이름 정확히 사용
			},
			type: 'GET', // HTTP 요청 방식, 일반적으로 'GET'은 대문자를 사용
			success: function(data) {
				// 서버 응답 처리
				// 데이터 비교시 반드시 받은 데이터의 타입을 확인하고 사용해야 합니다.
				// 예를 들어, 문자열 "1"과 숫자 1은 다르므로, 서버에서 보내는 데이터 타입에 맞추어 조건문을 작성합니다.
				if (data == 1) {
					$('#resultCheck').text('사용 가능한 아이디입니다.');
				} else {
					$('#resultCheck').text('사용 불가능한 아이디입니다.');
				}
			},
			error: function() {
				// 에러 핸들링
				alert("통신실패!");
			}
		});
	}
</script>


<script>
    function checkPasswordMatch() {
        var password = document.getElementById("inputPW").value;
        var confirmPassword = document.getElementById("inputPWConfirm").value;

        if (password != confirmPassword) {
            document.getElementById("passwordMatchMsg").innerHTML = "비밀번호가 일치하지 않습니다.";
        } else {
            document.getElementById("passwordMatchMsg").innerHTML = "";
        }
    }

    // 비밀번호와 비밀번호 확인 값이 변경될 때마다 확인 함수 호출
    document.getElementById("inputPW").addEventListener("input", checkPasswordMatch);
    document.getElementById("inputPWConfirm").addEventListener("input", checkPasswordMatch);
</script>

</html>