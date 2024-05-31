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
    <meta property="og:title" content="퀴즈-뜻 맞추기">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>퀴즈-뜻 맞추기</title>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css">  
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet"> 
    <script src="https://kit.fontawesome.com/85915fb54c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/aos.css">
    <script src="resources/js/aos.js"></script>
        <style>

::selection{
    color: #fff;
    background: #007bff;
}
.que_text span{
	font-size:24px;

}
.que_text{
margin-bottom:10px;
margin-left:40px;
}
.start_btn,
.info_box,
.quiz_box,
.result_box{
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top:200px;
    transform: translate(-50%, -50%);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
                0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
#service1014_1 {
    min-height: 900px;
}

.info_box.activeInfo,
.quiz_box.activeQuiz,
.result_box.activeResult{
    opacity: 1;
    z-index: 5;
    pointer-events: auto;
    transform: translate(-50%, -50%) scale(1);
}


.quiz_box {
margin-top:00px;
    background: #fff;
    border-radius: 5px;
    transform: translate(-50%, 0); /* translate 속성 변경 */
    opacity: 1; /* 초기 상태를 보이도록 설정 */
    pointer-events: auto;
    transition: all 0.3s ease;
}
.quiz_box header{
    position: relative;
    z-index: 2;
    height: 70px;
    padding: 0 30px;
    background: #fff;
    border-radius: 5px 5px 0 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0px 3px 5px 1px rgba(0,0,0,0.1);
}

.quiz_box header .title{
    font-size: 18px;
    font-weight: 600;
}


.quiz_box header .timer .time_left_txt{
    font-weight: 400;
    font-size: 17px;
    user-select: none;
}

.quiz_box header .timer .timer_sec{
    font-size: 18px;
    font-weight: 500;
    height: 30px;
    width: 45px;
    color: #fff;
    border-radius: 5px;
    line-height: 30px;
    text-align: center;
    background: #343a40;
    border: 1px solid #343a40;
    user-select: none;
}

.quiz_box header .time_line{
    position: absolute;
    bottom: 0px;
    left: 0px;
    height: 3px;
    background: #007bff;
}

section{
    padding: 25px 30px 20px 30px;
    background: #fff;
}

section .que_text{
    font-size: 23px;
    font-weight: 600;
}

section .option_list{
    padding: 20px 0px;
    display: block;   
}

section .option_list .option{
    background: aliceblue;
    border: 1px solid #84c5fe;
    border-radius: 5px;
    padding: 8px 15px;
    font-size: 17px;
    margin-bottom: 15px;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

section .option_list .option:last-child{
    margin-bottom: 0px;
}

section .option_list .option:hover{
    color: #004085;
    background: #cce5ff;
    border: 1px solid #b8daff;
}

section .option_list .option.correct{
    color: #FFFFFF;
    background: #7AB2B2;
    border: 1px solid #4D869C;
}

section .option_list .option.incorrect{
    color: #721c24;
    background: #f8d7da;
    border: 1px solid #f5c6cb;
}

section .option_list .option.disabled{
    pointer-events: none;
}

section .option_list .option .icon{
    height: 26px;
    width: 26px;
    border: 2px solid transparent;
    border-radius: 50%;
    text-align: center;
    font-size: 13px;
    pointer-events: none;
    transition: all 0.3s ease;
    line-height: 24px;
}
.option_list .option .icon.tick{
    color: #23903c;
    border-color: #23903c;
    background: #d4edda;
}

.option_list .option .icon.cross{
    color: #a42834;
    background: #f8d7da;
    border-color: #a42834;
}

footer{
    height: 60px;
    padding: 0 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-top: 1px solid lightgrey;
}

footer .total_que span{
    display: flex;
    user-select: none;
}

footer .total_que span p{
    font-weight: 500;
    padding: 0 5px;
}

footer .total_que span p:first-child{
    padding-left: 0px;
}

footer button{
    height: 40px;
    padding: 0 13px;
    font-size: 18px;
    font-weight: 400;
    cursor: pointer;
    border: none;
    outline: none;
    color: #fff;
    border-radius: 5px;
    background: #7AB2B2;
    line-height: 10px;
    opacity: 0;
    pointer-events: none;
    transform: scale(0.95);
    transition: all 0.3s ease;
}

footer button:hover{
    background: #4D869C;
}

footer button.show{
    opacity: 1;
    pointer-events: auto;
    transform: scale(1);
}

.result_box{
    background: #fff;
    border-radius: 5px;
    display: flex;
    padding: 25px 30px;
    width: 450px;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    transform: translate(-50%, -50%) scale(0.9);
    opacity: 0;
    pointer-events: none;
    transition: all 0.3s ease;
}

.result_box .icon{
    font-size: 100px;
    color: #007bff;
    margin-bottom: 10px;
}

.result_box .complete_text{
    font-size: 20px;
    font-weight: 500;
}

.result_box .score_text span{
    display: flex;
    margin: 10px 0;
    font-size: 18px;
    font-weight: 500;
}

.result_box .score_text span p{
    padding: 0 4px;
    font-weight: 600;
}

.result_box .buttons{
    display: flex;
    margin: 20px 0;
}

.result_box .buttons button{
    margin: 0 10px;
    height: 45px;
    padding: 0 20px;
    font-size: 18px;
    font-weight: 500;
    cursor: pointer;
    border: none;
    outline: none;
    border-radius: 5px;
    border: 1px solid #007bff;
    transition: all 0.3s ease;
}

.buttons button.restart{
    color: #fff;
    background: #007bff;
}

.buttons button.restart:hover{
    background: #0263ca;
}

.buttons button.quit{
    color: #007bff;
    background: #fff;
}

.buttons button.quit:hover{
    color: #fff;
    background: #007bff;
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
                    <h1 id="top_logo"><a href="goMain"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
                    <ul id="top_nav">
                        <li>
                            <a href="">사이트소개</a>
                            <!-- <ul>
                                <li><a href="sub1.html">수어스쿨</a></li>
                                <li><a href="">소분류</a></li>
                                <li><a href="">소분류</a></li> 
                            </ul>-->
                        </li>
                        <li>
                            <a href="goStudy">강의 듣기</a>
                            <ul>
                                <li><a href="goStudyA">A난이도</a></li>
                                <li><a href="goStudyB">B난이도</a></li>
                                <li><a href="goStudyC">C난이도</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="quiz">퀴즈</a>
                            <ul>
                                <li><a href="quizWord">A버전</a></li>
                                <li><a href="">B버전</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="dictionary.html">수어사전</a>
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
                            <li><a href="">수업 현황</a></li>
                            <li><a href="goUpdateMember">내 정보 수정</a></li>
                            <li><a href="">문의하기</a></li>
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
                                <li><span><strong><%=loginMember.getName() %></strong>님 환영합니다.</span></li>
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
                <h1 id="m_logo"><a href="goMain"><img src="img/common/logo_2.png" alt="Sample" /></a></h1>
                <!-- 메뉴 버튼 [s] -->
                <div id="m_navBtn"><span></span></div>
                <!-- 메뉴 버튼 [e] -->
                
                <!-- 오픈 메뉴 [s] -->
                <div id="navWrap">
                    <div class="inner">
                        <ul class="user_tip">
                            <li><a href="login" class="small_tip">회원가입</a></li>
                            <li><a href="goLogin" class="small_tip">로그인</a></li>
                        </ul>
                        <ul class="m_lnb">
                            <li>
                                <button class="m_bmenu" type="button">사이트소개</button>
                                <ul class="m_smenu">
                                    <li><a href="">수어스쿨</a> </li>
                                    <!-- <li><a href="">소분류</a> </li>
                                    <li><a href="">소분류</a> </li> -->
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">강의 듣기</button>
                                <ul class="m_smenu">
                                    <li><a href="goStudyA">A난이도</a> </li>
                                    <li><a href="goStudyB">B난이도</a> </li>
                                    <li><a href="goStudyC">C난이도</a> </li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">퀴즈</button>
                                <ul class="m_smenu">
                                    <li><a href="quizWord">A버전</a> </li>
                                    <li><a href="">B버전</a> </li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">수어사전</button>
                                 <ul class="m_smenu">
                                    <li><a href="dictionary.html">단어검색</a> </li>
                                    <!-- <li><a href="">소분류</a> </li>
                                    <li><a href="">소분류</a> </li> -->
                                </ul> 
                            </li>
                             <li>
                                <button class="m_bmenu" type="button">마이페이지</button>
                                <ul class="m_smenu">
                                    <li><a href="goMyPage">강의 현황</a> </li>
                                    <li><a href="">내 정보 수정</a> </li>
                                    <li><a href="">문의하기</a> </li>
                                </ul>
                            </li>
                        </ul>   
                        <p class="mo_hd_copy">ⓒ SSchool</p>         
                    </div>
                </div>
                <!-- 오픈 메뉴 [e] -->
            </div>
            <!-- 반응형메뉴 [e] -->
		</div>            
    </div>
    <!-- sh_hd [e] -->
    
    <!-- sh_container [s] -->
    <div id="sh_container">
        <!-- sh_container_wrapper [s] -->
        <div id="sh_container_wrapper">
            <!-- sub_main_banner [s] -->
            <div id="sub_main_banner">
				<div id="sh_content_tit">
					<h3>강의 듣기</h3>
					<p><a href="goMain"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a> 
					<i class="fa fa-angle-right"></i> 퀴즈 <i class="fa fa-angle-right"></i> 뜻 맞추기</p>
				</div>
			</div>
            <!-- sub_main_banner [e] -->
            
			<!-- sh_aside [s] -->
            <div id="sh_aside">
    	        <div id="sh_snb">
                    <ul>
                        <li><a href="quizWord" style="color: #4D869C;">뜻 맞추기</a></li>
                        <li><a href="">수어 하기</a></li>
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
                                
					
						<!-- Quiz Box -->
						<div class="quiz_box">
						    <header>
						        <div class="title">퀴즈</div>
						    </header>
						    <section>
						        <div class="que_text">
						            <span>${question}</span>
						        </div>
						        <div class="video_container">
						            <video width="450" controls>
						                <source src="${videoUrl}" type="video/mp4">
						            </video>
						        </div>
						        <div class="option_list">
						            <c:forEach var="option" items="${options}">
						                <div class="option"><span>${option}</span></div>
						            </c:forEach>
						        </div>
						    </section>
					
					        <!-- Footer of Quiz Box -->
					        <footer>
 								<button class="next_btn" onclick="loadNewQuestion()">새로운 문제</button>
					        </footer>
					    </div>
					
                               
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
            <img class="ft_logo" src="img/common/logo_1.png" alt="Sample" />
            <div class="ft_text">
                <a onclick="">이용약관</a>
                <a onclick="">개인정보취급방침</a>
                <div>광주광역시 동구 예술길 31-15 광주아트센터 4층 인공지능 융합서비스<br />
                인간지능 팀원 이름</div>
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
<script>
let correctAnswer = "${correctAnswer}"; // 초기 정답 값

function loadNewQuestion() {
    $.ajax({
        url: 'getNewQuiz',
        method: 'GET',
        success: function(response) {
            // response로부터 새로운 문제 데이터를 받아서 페이지를 업데이트합니다.
            console.log('New question data received:', response); // 데이터를 콘솔에 출력
            updateQuizBox(response);
        },
        error: function(error) {
            console.error('Error fetching new quiz:', error);
        }
    });
}

function updateQuizBox(data) {
    // 문제 텍스트 업데이트
    $('.que_text span').text(data.question);
    console.log('Question updated:', data.question); // 문제 텍스트가 업데이트되었는지 확인
    
    // 비디오 URL 업데이트
    $('.video_container video source').attr('src', data.videoUrl);
    $('.video_container video')[0].load();  // 비디오 재로드
    console.log('Video URL updated:', data.videoUrl); // 비디오 URL이 업데이트되었는지 확인
    
    // 선택지 업데이트
    $('.option_list').empty(); // 기존 옵션 제거
    data.options.forEach(option => {
        console.log('Option:', option); // 각 옵션을 콘솔에 출력
        let optionElement = $('<div class="option"><span></span></div>');
        optionElement.find('span').text(option);
        $('.option_list').append(optionElement);
    });

    
    // 정답 업데이트
    correctAnswer = data.correctAnswer.trim(); // 트림 추가
    console.log('Correct answer updated:', correctAnswer); // 정답이 업데이트되었는지 확인

    // 새로운 문제로 인해 기존 스타일을 초기화합니다.
    $('.option').removeClass('correct incorrect disabled');
    $(".next_btn").removeClass("show");

    // 선택지 클릭 이벤트 다시 바인딩
    bindOptionClickEvents();
}

function bindOptionClickEvents() {
    document.querySelectorAll('.option').forEach(option => {
        option.onclick = function() {
            const userAns = this.textContent.trim();
            const allOptions = document.querySelector('.option_list').children;

            if (userAns === correctAnswer) {
                this.classList.add("correct");
                this.insertAdjacentHTML("beforeend", '<div class="icon tick"><i class="fas fa-check"></i></div>');
            } else {
                this.classList.add("incorrect");
                this.insertAdjacentHTML("beforeend", '<div class="icon cross"><i class="fas fa-times"></i></div>');

                for (let i = 0; i < allOptions.length; i++) {
                    if (allOptions[i].textContent.trim() === correctAnswer) {
                        allOptions[i].classList.add("correct");
                        allOptions[i].insertAdjacentHTML("beforeend", '<div class="icon tick"><i class="fas fa-check"></i></div>');
                    }
                }
            }

            for (let i = 0; i < allOptions.length; i++) {
                allOptions[i].classList.add("disabled");
            }
            document.querySelector(".next_btn").classList.add("show");
        }
    });
}

// 문서가 준비되면 처음으로 이벤트 바인딩을 수행합니다.
$(document).ready(function() {
    AOS.init();
    bindOptionClickEvents();
});
</script> 
</body>
</html>
