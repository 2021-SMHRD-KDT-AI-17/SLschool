<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.entity.Member"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <!-- 반응형 [s] -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="imagetoolbar" content="no">
    <!-- 반응형 [e] -->
    <meta name="naver-site-verification" content=""/><!-- 네이버 소유확인 -->
    <meta name="description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:type" content="website">
    <meta property="og:title" content="회원가입">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="resources/img/common/logo.png">
    <meta property="og:url" content="">
	<title>회원가입</title>
	<script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css"> 
    <link rel="stylesheet" type="text/css" href="resources/css/sh_main.css">
    <link rel="stylesheet" href="resources/css/login.css"> 
    <style>
        .topmenu_main {
            text-align: center;
        align-items: center;
        padding-bottom: 10px;
         display: flex;
        justify-content: center !important;
        }
        #topmenu_wrapper {
            transform: translateY(2px); /* 아래로 1px 이동 */
            box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1); /* 그림자 추가 */

}
#topmenu_wrapper::after {
  content: "";
  position: absolute;
  bottom: -1px; /* 아래로 1px 이동 */
  left: 0;
  right: 0;
  height: 1px;
  background-color: #e1e1e1; /* 회색 줄 */
}
        .topmenu_main img {
          display: inline-block;
        }
        </style>
</head>
<body>
<% Member loginMember = (Member)session.getAttribute("loginMember"); %>

<!-- sh_wrapper [s] -->
<div id="sh_wrapper">
    <!-- sh_hd [s] -->
    <div id="sh_hd">
    	<div id="sh_hd_wrapper">		
            <!-- topmenu_wrapper [s] -->
            <div id="topmenu_wrapper">
                <!-- topmenu_line_wrap [s] -->
                <div class="topmenu_line_wrap">
                    <div class="topmenu_line">
                        <!-- SNS 메뉴 [s] 
                        <ul class="left_menu">
                            <li><a href="main.html">Home</a></li>
                            <li><a href="">Blog</a></li>
                            <li><a href="">Youtube</a><img src="img/common/menu_youtube.png" alt="유튜브"></li>
                        </ul>
                         SNS 메뉴 [e] -->
                        
                        <!-- 로그인 메뉴 [s] 
                        <ul>
                            <li><a href=""><i data-feather="log-in"></i>Login</a></li>
                            <li><a href=""><i data-feather="user-plus"></i>Join us</a></li>
                        </ul>
                         로그인 메뉴 [e] -->
                    </div>
                </div>
                <!-- topmenu_line_wrap [e] -->

                <!-- 상단 메뉴 [s] -->
                <div class="topmenu_main">
                    <a href="goMain"><img src="resources/img/common/logo_2.png" alt="Sample" /></a>
<!--                    <div class="menu_icon">
                        <img src="img/common/menu_icon.png" alt="메뉴아이콘" />
                        <p>2023 신입생 모집<br><span>선착순 50명 수강료 할인</span></p> -->

<!--                       <div class="topmenu_line">--> 

                            <!-- </div> -->
                </div>
                    
                </div>
                 <!-- 상단 메뉴 [e] -->
            </div>
            <!-- topmenu_wrapper [e] -->

            <!-- 반응형메뉴 [s] -->
            <!-- 반응형메뉴 [s] -->
            <div id="topmenuM">
                <h1 id="m_logo"><a href="goMain"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
                <!-- 메뉴 버튼 [s] -->
                <div id="m_navBtn"><span></span></div>
                <!-- 메뉴 버튼 [e] -->
                
                <!-- 오픈 메뉴 [s] -->
                <div id="navWrap">
                    <div class="inner">
                        <ul class="user_tip">
                            <% if(loginMember == null) {%>
                            	<li><a href="goJoin"class="small_tip"></i>회원가입</a></li>
                                <li><a href="goLogin"class="small_tip"></i>로그인</a></li>
                                <%} else{ %>
                                <li><span><%=loginMember.getName() %>님</span></li>
                                <li><a href="goLogout"><i data-feather="user-plus"></i>로그아웃</a></li>
                                <%} %>
                        </ul>
                        <ul class="m_lnb">
                            <li>
                                <button class="m_bmenu" type="button">강의 듣기</button>
                                <ul class="m_smenu">
	                                <li><a href="goStudyA">음식</a></li>
	                                <li><a href="goStudyB">스포츠</a></li>
	                                <li><a href="goStudyC">직업</a></li>
	                                <li><a href="goStudyFamily">가족구성원</a></li>
	                                <li><a href="goStudyColor">색깔</a></li>
	                                <li><a href="goStudyEco">환경</a></li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">퀴즈</button>
                                <ul class="m_smenu">
                                    <li><a href="quiz2">단어 맞추기</a> </li>
                                    <li><a href="quizB">수어 해보기</a> </li>
                                </ul>
                            </li>
                            
                            <li>
                                <button class="m_bmenu" type="button">모의고사</button>
                                <ul class="m_smenu">
                                    <li><a href="quizDetail">단어 맞추기</a> </li>
                                    <li><a href="quizDetailPic">그림 맞추기</a> </li>
                                </ul>
                            </li>
                            
                            <li>
                                <button class="m_bmenu" type="button">수어사전</button>
                                 <ul class="m_smenu">
                                    <li><a href="goDic">수어사전</a> </li>
                                    <!-- <li><a href="">소분류</a> </li>
                                    <li><a href="">소분류</a> </li> -->
                                </ul> 
                            </li>
                            
                            <%if(loginMember != null) {%>
                           <button class="m_bmenu" type="button">마이페이지</button>
                                <ul class="m_smenu">
                            <li><a href="goMyPage">수업 현황</a></li>
                            <li><a href="goUpdateMember">내 정보 수정</a></li>
                            <li><a href="goHelp">문의하기</a></li>
                            <%if(loginMember.getId().equals("admin")){ %>
                            <li><a href="goAdminHelp">관리자페이지</a></li>
                            <%} %>
                            </ul>
                            </li> 
                            <%}%>
                            
                            
                        </ul>   
                        <p class="mo_hd_copy">ⓒ SSchool</p>         
                    </div>
                </div>
                <!-- 오픈 메뉴 [e] -->
            </div>
            <!-- 반응형메뉴 [e] -->
		</div>            
    </div>
    <!-- sh_container [s] -->
    <div id="sh_container">
        <!-- sh_container_wrapper [s] 
        <div id="sh_container_wrapper">-->
            <!-- sub_main_banner [s] 
            <div id="sub_main_banner">
				<div id="sh_content_tit">
					<h3>강의 듣기</h3>
					<p><a href="main.html"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a> 
					<i class="fa fa-angle-right"></i> 강의 듣기 <i class="fa fa-angle-right"></i> A난이도</p>-->
				<!-- </div>
			</div>
             sub_main_banner [e] -->
            
			<!-- sh_aside [s] 
            <div id="sh_aside">
    	        <div id="sh_snb">
                    <ul>
                        <li><a href="study_a.html">A난이도</a></li>
                        <li><a href="">B난이도</a></li>
                        <li><a href="">C난이도</a></li>
                    </ul>            
				</div>
            </div>
             sh_aside [e] -->
            
            <!-- sh_content [s] -->
            <div id="sh_content">
                <div class="login-container">
                    <div class="login-form">
                      <div class="login-top">
                        <h1 class="login-header">회원가입</h1>
						<form action="newMember" method="post" class="input-container">

                            <div class="input-container">
                            
                              <input type="text" name="id" id="inputID" placeholder=" " />
                              <label for="user-name" class="input-prefix">아이디를 입력하세요</label>
                              <span id="resultCheck" style="margin-bottom: 10px; display: inline-block;"></span>
                              <button type="button" onclick="checkE()" style="margin-top: 10px;">아이디 중복체크</button>
                            </div>
                          
                            <div class="input-container">
                            
                              <input type="password" name="pw" id="inputPW"placeholder=" " />
                              <label for="password" class="input-prefix">비밀번호를 입력하세요</label>
                            </div>
                            
                            <div class="input-container">
                            
                              <input type="password" name="pwConfirm" id="inputPWConfirm"  placeholder=" " />
                              <label for="password" class="input-prefix">비밀번호를 확인하세요</label>
                            </div>
                            <span id="passwordMatchMsg" style="color: red; margin-botton: 10px"></span>
                            
                            <div class="input-container">
                            
                              <input type="text" name="name"  placeholder=" " />
                              <label for="password" class="input-prefix">이름을 입력하세요</label>
                            </div>
                            <input type="submit" id="sign-in" name="Sign-in" value="회원가입" />
                        </form>
                      </div>
                    </div>
                  </div>
                  
                  <style>
                  .login-container {
                    max-width: 400px;
                    margin: 0 auto;
                    padding: 20px;
                    border-radius: 10px;
                  }
                  .input-container{
                  margin-bottom:20px;
                  }
                  button{
                      width: 94%;
    margin-left: 10px;
    padding: 10px;
    background-color: #7AB2B2;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    }
                  .login-header {
                    text-align: center;
                    margin-bottom: 40px;
                  }
                  
                  .input-prefix {
                    display: block;
                    margin-bottom: 5px;
                  }
                  
                  .login-form input[type="text"],
                  .login-form input[type="password"] {
                    width: calc(100% - 20px);
                    padding: 10px;
                    margin-bottom: 20px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                  }
                  
                  #sign-in {
                    width: 94%;
                    margin-left: 10px;
                    padding: 10px;
                    background-color: #7AB2B2;
                    color: #fff;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                  }
                  
                  #sign-in:hover {
                    background-color: #4D869C;
                  }
                  
                  .forgot-password {
                    display: block;
                    text-align: center;
                    margin-top: 10px;
                    color: #7AB2B2;
                  }
                  
                  </style>
            </div>
            <!-- sh_content [s] -->            
        </div>
        <!-- sh_container_wrapper [e] -->
    </div>
    <!-- sh_container [e] -->
    
    <!-- 반응형 하단 전화번호 [s] 
    <div id="sh_ft_btns">
        <div class="btns">
            <a class="tel" href="tel:15446062"><i class="fa fa-phone"></i>1544-6062</a>
        </div>
    </div>
    <a id="fix_tel" href="tel:15446062"><i class="fa fa-phone"></i></a>
    <script>
        $(window).on("scroll",function(){
            if($(window).scrollTop() > 100) { 
                $('#fix_tel').addClass('active');}
            else{
                $('#fix_tel').removeClass('active');}
            return false;
        });
    </script>
     반응형 하단 전화번호 [e] -->
    
    <!-- sh_ft [s] -->
    <div id="sh_ft">
        <div class="ft_txt">
            <img class="ft_logo" src="resources/img/common/logo_1.png" alt="Sample" />
            <div class="ft_text">
                <a onclick="">이용약관</a>
                <a onclick="">개인정보취급방침</a>
                <div>광주광역시 동구 중앙로 196 광주빌딩 302 인공지능 융합서비스<br />
                인간지능 권승호 강민규 서동현 오현진 이봄</div>
            </div>
        </div>
        <div class="ft_info">
            <div class="inner">
                <div class="copy">
                    ⓒ 인간지능.
                </div>
            </div>
        </div>
    </div>
    <!-- sh_ft [e] -->
</div>
<!-- sh_wrapper [e] -->
<script type="text/javascript">

function checkE() {
	var inputID = document.getElementById("inputID").value;

	$.ajax({
		url : 'idCheck',
		data : {'inputID' : inputID},
		type : 'GET',
		success : function(data) {
			if (data == 1) {
				$('#resultCheck').text('사용 가능한 아이디입니다.');
			} else {
				$('#resultCheck').text('사용 불가능한 아이디입니다.');
			}
		},
		error: function() {
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


</script>
</body>
</html>


