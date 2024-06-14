<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Quiz"%>
<%@page import="java.util.ArrayList"%>

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
    <meta property="og:title" content="퀴즈-수어 해보기">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>퀴즈-수어 해보기</title>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet"> 
    <script src="https://kit.fontawesome.com/85915fb54c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/aos.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="resources/js/aos.js"></script>
	<link rel="stylesheet" href="resources/css/ssl.css">
    <style>
*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

section {
  position: relative;
  display: flex;
  min-width:950px;
  justify-content: center;
  align-items: center;
  min-height: 600px;
  overflow: hidden;
  margin-top:-50px;
}

.info video {
  width: 100%;  /* 부모 요소의 너비에 맞게 비디오 크기 설정 */
  height: auto; /* 비디오의 원래 비율을 유지하면서 높이 자동 조절 */
  max-width: 450px;  /* 최대 너비를 info 요소의 최대 너비에 맞게 설정 */
}

.content {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  backdrop-filter: blur(30px);
  border-radius: 20px;
  width: min(900px, 100%);
  box-shadow: 0 0.5px 0 1px rgba(255, 255, 255, 0.23) inset,
    0 1px 0 0 rgba(255, 255, 255, 0.66) inset, 0 4px 16px rgba(0, 0, 0, 0.12);
  z-index: 10;
}

.info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  max-width: 450px;
  padding: 0 35px;
  text-align: justify;
}

.info p {
  color: #000;
  font-weight: 400;
  font-size: 1.1rem;
  margin-bottom: 20px;
  line-height: 1.5;
}

.movie-night {
  background: linear-gradient(225deg, #ff3cac 0%, #784ba0 50%, #2b86c5 100%);
  color:#fff;
}

.movie-night1 {
  background: linear-gradient(225deg, #4D869C 0%, #7AB2B2 50%, #CDE8E5 100%);
  color:#fff;
}

.btn {
  display: block;
  padding: 10px 40px;
  margin: 20px auto;
  font-size: 1.1rem;
  font-weight: 700;
  border-radius: 4px;
  outline: none;
  text-decoration: none;
  color: #7AB2B2;
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 6px 30px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.3);
  cursor: pointer;
}

.btn:hover,
.btn:focus,
.btn:active,
.btn:visited {
  transition-timing-function: cubic-bezier(0.6, 4, 0.3, 0.8);
  animation: gelatine 0.5s 1;
}

@keyframes gelatine {
  0%,
  100% {
    transform: scale(1, 1);
  }
  25% {
    transform: scale(0.9, 1.1);
  }
  50% {
    transform: scale(1.1, 0.9);
  }
  75% {
    transform: scale(0.95, 1.05);
  }
}

/* SWIPER */

.swiper {
  width: 250px;
  height: 450px;
  padding: 50px 0;
}

.swiper-slide {
  position: relative;
  box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  user-select: none;
}

.swiper-slide img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.img-position {
  object-position: 50% 0%;
}

.overlay {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to top, #0f2027, transparent, transparent);
  background-repeat: no-repeat;
  background-size: cover;
}

.overlay span {
  position: absolute;
  top: 0;
  right: 0;
  color: #fff;
  padding: 7px 18px;
  margin: 10px;
  border-radius: 20px;
  letter-spacing: 2px;
  font-size: 0.8rem;
  font-weight: 700;
  font-family: inherit;
  background: rgba(255, 255, 255, 0.095);
  box-shadow: inset 2px -2px 20px rgba(214, 214, 214, 0.2),
    inset -3px 3px 3px rgba(255, 255, 255, 0.4);
  backdrop-filter: blur(74px);
}

.overlay h2 {
  position: absolute;
  bottom: 0;
  left: 0;
  color: #fff;
  font-weight: 400;
  font-size: 1.1rem;
  line-height: 1.4;
  margin: 0 0 20px 20px;
}

/* ANIMATED BACKGROUND */

.circles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.circles li {
  position: absolute;
  display: block;
  list-style: none;
  width: 20px;
  height: 20px;
  background-color: #ff3cac;
  background-image: linear-gradient(
    225deg,
    #ff3cac 0%,
    #784ba0 50%,
    #2b86c5 100%
  );
  animation: animate 25s linear infinite;
  bottom: -150px;
}

.circles li:nth-child(1) {
  left: 25%;
  width: 80px;
  height: 80px;
  animation-delay: 0s;
}

.circles li:nth-child(2) {
  left: 10%;
  width: 20px;
  height: 20px;
  animation-delay: 2s;
  animation-duration: 12s;
}

.circles li:nth-child(3) {
  left: 70%;
  width: 20px;
  height: 20px;
  animation-delay: 4s;
}

.circles li:nth-child(4) {
  left: 40%;
  width: 60px;
  height: 60px;
  animation-delay: 0s;
  animation-duration: 18s;
}

.circles li:nth-child(5) {
  left: 65%;
  width: 20px;
  height: 20px;
  animation-delay: 0s;
}

.circles li:nth-child(6) {
  left: 75%;
  width: 110px;
  height: 110px;
  animation-delay: 3s;
}

.circles li:nth-child(7) {
  left: 35%;
  width: 150px;
  height: 150px;
  animation-delay: 7s;
}

.circles li:nth-child(8) {
  left: 50%;
  width: 25px;
  height: 25px;
  animation-delay: 15s;
  animation-duration: 45s;
}

.circles li:nth-child(9) {
  left: 20%;
  width: 15px;
  height: 15px;
  animation-delay: 2s;
  animation-duration: 35s;
}

.circles li:nth-child(10) {
  left: 85%;
  width: 150px;
  height: 150px;
  animation-delay: 0s;
  animation-duration: 11s;
}

@keyframes animate {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 1;
    border-radius: 0;
  }

  100% {
    transform: translateY(-1000px) rotate(720deg);
    opacity: 0;
    border-radius: 50%;
  }
}

    </style>
    <link rel="stylesheet" href="resources/css/side.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<% Member loginMember = (Member)session.getAttribute("loginMember"); %>


<div class="mobile-wrap">
	<div class="mobile clearfix">
		<div class="content1">
			<div class="html welcome visible">
				<div class="">
					<div class="day lightSpeedIn animated" id="go">
					<img src="resources/img/common/logo_2.png" alt="Sample" /><br>
					수어 관련 사이트 바로가기</div>
					<div class="date lightSpeedIn animated"><a href="https://sldict.korean.go.kr/front/main/main.do">
						<img src="data:image/png;base64,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" style="width:100px;"><br>
						바로가기</a>
					</div>
					<div class="time lightSpeedIn animated"><a href="https://www.deafkorea.com/main/">
						<img src="data:image/png;base64,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" style="width:130px;"><br>바로가기</a></div>
						
					<div class="time lightSpeedIn animated2">
					<a href="#top"><i class="fa-solid fa-chevron-circle-up  link-icon"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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
                    <h1 id="top_logo"><a href="goMain"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
                    <ul id="top_nav">
                        <li>
                            <a href="goStudy">강의 듣기</a>
                            <ul>
	                                <li><a href="goStudyA">음식</a></li>
	                                <li><a href="goStudyB">스포츠</a></li>
	                                <li><a href="goStudyC">직업</a></li>
	                                <li><a href="goStudyFamily">가족구성원</a></li>
	                                <li><a href="goStudyColor">색깔</a></li>
	                                <li><a href="goStudyEco">환경</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="quiz">퀴즈</a>
                            <ul>
                                <li><a href="quiz2">단어 맞추기</a></li>
                                <li><a href="quizB">수어 해보기</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="quizWord">모의고사</a>
                            <ul>
                                <li><a href="quizDetail">단어 맞추기</a></li>
                                <li><a href="quizDetailPic">그림 맞추기</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="goDic">수어사전</a>
                            <!-- <ul>
                                <li><a href="">소분류</a></li>
                                <li><a href="">소분류</a></li>
                                <li><a href="">소분류</a></li>
                            </ul> -->
                        </li>
                        <%if(loginMember != null) {%>
                            <li>
                            <a href="goMyPage">마이페이지</a>
                            <ul>
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
<!--                    <div class="menu_icon">
                        <img src="img/common/menu_icon.png" alt="메뉴아이콘" />
                        <p>2023 신입생 모집<br><span>선착순 50명 수강료 할인</span></p> -->

<!--                       <div class="topmenu_line">--> 
                            <ul id="topmenu_line">
                            <% if(loginMember == null) {%>
                                <li><a href="goLogin"><i data-feather="log-in"></i>Login</a></li>
                                <li><a href="goJoin"><i data-feather="user-plus"></i>Join us</a></li>
                                <%} else{ %>
                                <li><span><%=loginMember.getName() %>님 환영합니다.</span></li>
                                <li><a href="goLogout"><i data-feather="user-plus"></i>Log-out</a></li>
                                <%} %>
                            </ul>
                            <!-- </div> -->
                    </div>
                    
                </div>
                
                 <!-- 상단 메뉴 [e] -->
            </div>
            <!-- topmenu_wrapper [e] -->

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
        <!-- sh_container_wrapper [s] -->
        <div id="sh_container_wrapper">
            <!-- sub_main_banner [s] -->
            <div id="sub_main_banner">
				<div id="sh_content_tit">
					<h3>단어 맞추기</h3>
					<p><a href="goMain"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a> 
					<i class="fa fa-angle-right"></i> 퀴즈 <i class="fa fa-angle-right"></i> 수어 해보기</p>
				</div>
			</div>
            <!-- sub_main_banner [e] -->
            
			<!-- sh_aside [s] -->
            <div id="sh_aside">
    	        <div id="sh_snb">
                    <ul>
                        <li><a href="quiz2" >단어 맞추기</a></li>
                        <li><a href="quizB" style="color: #4D869C;">수어 해보기</a></li>
                    </ul>            
				</div>
            </div>
            <!-- sh_aside [e] -->
            
            <!-- sh_content [s] -->
            <div id="sh_content">
                <!-- 서브페이지 [s] -->
                <div id="service1014_1" class="pagecommon">
    
                    <div class="cont">
                        
                        <!-- cont01 [s] -->
                        <div class="tab_cont cont01">
                            <div>
                            </div>
                            <div class="s_tit"  data-aos="fade-up">
                   
    <section>
        <div class="content">

  <div class="rain front-row"></div>
  <div class="rain back-row"></div>

            <div class="info">
          
  <div id="error-box">
    <div class="dot"></div>
    <div class="dot two"></div>
    <div class="face2">
      <div class="eye"></div>
      <div class="eye right"></div>
      <div class="mouth sad"></div>
    </div>
    <div class="shadow move"></div>
  </div>
            </div>
            <div class="swiper" id="right">
                <div class="message"><h1 class="alert">오답입니다</h1><p>다시 도전하고 싶으시면<br>버튼을 눌러주세요.</p>                
                <button class="btn" type="submit">돌아가기</button></div>
            </div>
        </div>
    </section>
    <script>
    var makeItRain = function() {
    	  //clear out everything
    	  $('.rain').empty();

    	  var increment = 0;
    	  var drops = "";
    	  var backDrops = "";

    	  while (increment < 100) {
    	    //couple random numbers to use for various randomizations
    	    //random number between 98 and 1
    	    var randoHundo = (Math.floor(Math.random() * (98 - 1 + 1) + 1));
    	    //random number between 5 and 2
    	    var randoFiver = (Math.floor(Math.random() * (5 - 2 + 1) + 2));
    	    //increment
    	    increment += randoFiver;
    	    //add in a new raindrop with various randomizations to certain CSS properties
    	    drops += '<div class="drop" style="left: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
    	    backDrops += '<div class="drop" style="right: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
    	  }

    	  $('.rain.front-row').append(drops);
    	  $('.rain.back-row').append(backDrops);
    	}

    	$('.splat-toggle.toggle').on('click', function() {
    	  $('body').toggleClass('splat-toggle');
    	  $('.splat-toggle.toggle').toggleClass('active');
    	  makeItRain();
    	});

    	$('.back-row-toggle.toggle').on('click', function() {
    	  $('body').toggleClass('back-row-toggle');
    	  $('.back-row-toggle.toggle').toggleClass('active');
    	  makeItRain();
    	});

    	$('.single-toggle.toggle').on('click', function() {
    	  $('body').toggleClass('single-toggle');
    	  $('.single-toggle.toggle').toggleClass('active');
    	  makeItRain();
    	});

    	makeItRain();
    </script>
    
                                   
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 서브페이지 [e] -->
                
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

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
    $(document).ready(function() {
        AOS.init();

    });
    
    async function startWebcam() {
        const videoElement = document.getElementById('webcam');
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: true });
            videoElement.srcObject = stream;
        } catch (error) {
            console.error('Error accessing the webcam: ', error);
            const imgElement = document.createElement('img');
            imgElement.src = 'resources/img/common/webcamno.png';
            imgElement.alt = 'No webcam available';
            imgElement.style.width = '380px';  // 원하는 크기로 설정
            imgElement.style.height = '285px';  // 원하는 높이로 설정
            videoElement.parentNode.replaceChild(imgElement, videoElement);
        }
    }

    window.addEventListener('load', startWebcam);
 
        
    </script>
</body>
</html>