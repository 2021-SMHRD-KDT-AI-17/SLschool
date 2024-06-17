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
					<div class="date lightSpeedIn animated" id="sub1"><a href="https://sldict.korean.go.kr/front/main/main.do">
						<img src="resources/img/common/kkk.gif" style="width:200px;"><br>
						</a>
					</div>
					<div class="time lightSpeedIn animated" id="sub1"><a href="https://www.deafkorea.com/main/">
						<img src="resources/img/common/nnn.gif" style="width:200px;"><br></a></div>
						
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
        <canvas id="canvas"></canvas>
            <div class="info">
          
			  <div id="success-box">
			    <div class="dot"></div>
			    <div class="dot two"></div>
			    <div class="face">
			      <div class="eye"></div>
			      <div class="eye right"></div>
			      <div class="mouth happy"></div>
			    </div>
			    <div class="shadow scale"></div>
			    
			  </div>
            </div>
            <div class="swiper" id="right">
                <div class="message"><h1 class="alert">정답입니다</h1>
                하신 수어는 <strong>${word }</strong>이고<br> 정답은 <strong>${labelword }</strong>입니다<br>
                다시 도전하고 싶으시면<br>버튼을 눌러주세요.</p>              
                <button class="btn" type="submit" onclick="location.href='quizB'">돌아가기</button></div>
            </div>
        </div>
    </section>
    <script>
    (function () {
        var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
        window.requestAnimationFrame = requestAnimationFrame;
    })();


    var canvas = document.getElementById("canvas"),
        ctx = canvas.getContext("2d"),
        width = 0,
        height = 0,
        vanishPointY = 0,
        vanishPointX = 0,
        focalLength = 300,
        angleX = 180,
        angleY = 180,
        angleZ = 180,
        angle = 0,
        cycle = 0,
        colors = {r : 255, g : 0, b : 0},
        lastShot = new Date().getTime();

    canvas.width = width;
    canvas.height = height;

    /*
     *	Controls the emitter
     */
    function Emitter() {
        this.reset();
    }

    Emitter.prototype.reset = function () {
        var PART_NUM = 200,
            x = (Math.random() * 400) - 200,
            y = (Math.random() * 400) - 200,
            z = (Math.random() * 800) - 200;
        
        this.x = x || 0;
        this.y = y || 0;
        this.z = z || 0;
        
        var color = [~~(Math.random() * 150) + 10, ~~(Math.random() * 150) + 10, ~~(Math.random() * 150) + 10]
        this.particles = [];

        for (var i = 0; i < PART_NUM; i++) {
            this.particles.push(new Particle(this.x, this.y, this.z, {
                r: colors.r,
                g: colors.g,
                b: colors.b
            }));
        }
    }

    Emitter.prototype.update = function () {
        var partLen = this.particles.length;

        angleY = (angle - vanishPointX) * 0.0001;
        angleX = (angle - vanishPointX) * 0.0001;

        this.particles.sort(function (a, b) {
            return b.z - a.z;
        });

        for (var i = 0; i < partLen; i++) {
            this.particles[i].update();
        }
        
        if(this.particles.length <= 0){
          this.reset();   
        }

    };

    Emitter.prototype.render = function (imgData) {
        var data = imgData.data;

        for (i = 0; i < this.particles.length; i++) {
            var particle = this.particles[i],
                dist = Math.sqrt((particle.x - particle.ox) * (particle.x - particle.ox) + (particle.y - particle.oy) * (particle.y - particle.oy) + (particle.z - particle.oz) * (particle.z - particle.oz));

            if (dist > 255) {
                particle.render = false;
                this.particles.splice(i, 1);
                this.particles.length--;
            }

            if (particle.render && particle.xPos < width && particle.xPos > 0 && particle.yPos > 0 && particle.yPos < height) {
                for (w = 0; w < particle.size; w++) {
                    for (h = 0; h < particle.size; h++) {
                        if (particle.xPos + w < width && particle.xPos + w > 0 && particle.yPos + h > 0 && particle.yPos + h < height) {
                            pData = (~~ (particle.xPos + w) + (~~ (particle.yPos + h) * width)) * 4;
                            data[pData] = particle.color[0];
                            data[pData + 1] = particle.color[1];
                            data[pData + 2] = particle.color[2];
                            data[pData + 3] = 255 - dist;
                        }
                    }
                }
            }
        }
    };


    /*
     *	Controls the individual particles
     */
    function Particle(x, y, z, color) {
        this.x = x;
        this.y = y;
        this.z = z;

        this.startX = this.x;
        this.startY = this.y;
        this.startZ = this.z;

        this.ox = this.x;
        this.oy = this.y;
        this.oz = this.z;

        this.xPos = 0;
        this.yPos = 0;

        this.vx = (Math.random() * 10) - 5;
        this.vy = (Math.random() * 10) - 5;
        this.vz = (Math.random() * 10) - 5;

        this.color = [color.r, color.g, color.b];
        this.render = true;

        this.size = Math.round(1 + Math.random() * 1);
    }

    Particle.prototype.rotate = function () {
        var x = this.startX * Math.cos(angleZ) - this.startY * Math.sin(angleZ),
            y = this.startY * Math.cos(angleZ) + this.startX * Math.sin(angleZ);

         this.x = x;
         this.y = y;
    }

    Particle.prototype.update = function () {
        var cosY = Math.cos(angleX),
            sinY = Math.sin(angleX);

        this.x = (this.startX += this.vx);
        this.y = (this.startY += this.vy);
        this.z = (this.startZ -= this.vz);
        this.rotate();

        this.vy += 0.1;
        this.x += this.vx;
        this.y += this.vy;
        this.z -= this.vz;

        this.render = false;

        if (this.z > -focalLength) {
            var scale = focalLength / (focalLength + this.z);

            this.size = scale * 2;
            this.xPos = vanishPointX + this.x * scale;
            this.yPos = vanishPointY + this.y * scale;
            this.render = true;
        }
    };

    function render() {
        colorCycle();
        angleY = Math.sin(angle += 0.01);
        angleX = Math.sin(angle);
        angleZ = Math.sin(angle);

        var imgData = ctx.createImageData(width, height);

        for (var e = 0; e < 30; e++) {
            emitters[e].update();
            emitters[e].render(imgData);
        }
        ctx.putImageData(imgData, 0, 0);
        requestAnimationFrame(render);
    }

    function colorCycle() {
        cycle += .6;
        if (cycle > 100) {
            cycle = 0;
        }
        colors.r = ~~ (Math.sin(.3 * cycle + 0) * 127 + 128);
        colors.g = ~~ (Math.sin(.3 * cycle + 2) * 127 + 128);
        colors.b = ~~ (Math.sin(.3 * cycle + 4) * 127 + 128);
    }

    var emitters = [];
    for (var e = 0; e < 30; e++) {
        colorCycle();
        emitters.push(new Emitter());
    }
    //render();


    // smart trick from @TimoHausmann for full screen pens
    setTimeout(function () {
        width = canvas.width = window.innerWidth;
        height = canvas.height = document.body.offsetHeight;
        vanishPointY = height / 2;
        vanishPointX = width / 2;
        render();
    }, 500);
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