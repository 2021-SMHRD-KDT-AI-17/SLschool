<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <!-- 반응형 [s] -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="imagetoolbar" content="no">
    <!-- 반응형 [e] -->
    <meta name="naver-site-verification" content=""/>
    <meta name="description" content="">
    <meta property="og:type" content="website">
    <meta property="og:title" content="모의고사-그림 맞추기">
    <meta property="og:description" content="">
    <meta property="og:image" content="resources/img/common/logo.png">
    <meta property="og:url" content="">
    <title>모의고사-그림 맞추기</title>
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
        h1 {
            font-size: 1em;
            
        }
        .text-shadow {
    text-shadow: 
        -1px -1px 0 #FFF,  
         1px -1px 0 #FFF,
         -1px 1px 0 #FFF,
          1px 1px 0 #FFF,
          2px 2px 0 rgba(0, 0, 0, 0.04), /* Adjust as needed for the desired shadow effect */
          3px 3px 0 rgba(0, 0, 0, 0.04),
          4px 4px 0 rgba(0, 0, 0, 0.04);
}
        .back h2 {
            font-size: 2.3em;
            color: white;
            margin-left: -5px;
        }
        h2{
        margin-left:0px !important;
        }

        .flip {
            position: relative;
            display: inline-block;
            margin-right: 2px;
            margin-bottom: 1em;
            width: 150px;
            cursor: pointer; /* 클릭 가능하게 커서 추가 */
        }

        .flip > .front,
        .flip > .back {
            display: block;
            transition: transform 0.5s, opacity 0.5s;
            width: inherit;
            height: 100px;
            padding: 1em 2em;
            background: #313131;
            border-radius: 10px;
            background-size: cover !important;
            background-position: center !important;
        }

        .flip > .back {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transform: rotateY(-180deg);
        }

        .flip.clicked > .front {
            transform: rotateY(180deg);
        }

        .flip.clicked > .back {
            opacity: 1;
            transform: rotateY(0deg);
        }

        .flip input[type="radio"] {
            display: none;
        }

    #quiz{
width:230px;
height:280px;
z-index:999;
top:58%;
left:15%;
position:fixed;
}

    </style>
    <link rel="stylesheet" href="resources/css/side.css">
</head>
<body>

<% Member loginMember = (Member)session.getAttribute("loginMember"); %>

                        <%if(loginMember != null) {%>
<div class="quiz">
<a href="goMyPage"><img src="resources/img/common/point.png" id="quiz"></a>
</div>                            <%}%>

<div class="mobile-wrap">
	<div class="mobile clearfix">
		<div class="content">
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
        <!-- sh_hd [e] -->

        <!-- sh_container [s] -->
        <div id="sh_container">
            <!-- sh_container_wrapper [s] -->
            <div id="sh_container_wrapper">
                <!-- sub_main_banner [s] -->
                <div id="sub_main_banner">
                    <div id="sh_content_tit">
                        <h3>그림 맞추기</h3>
                        <p><a href="goMain"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a> 
                        <i class="fa fa-angle-right"></i> 모의고사 <i class="fa fa-angle-right"></i> 그림 맞추기</p>
                    </div>
                </div>
                <!-- sub_main_banner [e] -->

                <!-- sh_aside [s] -->
                <div id="sh_aside">
                    <div id="sh_snb">
                        <ul>
                            <li><a href="quizDetail">단어 맞추기</a></li>
                            <li><a href="quizDetailPic" style="color:#4D869C">그림 맞추기</a></li>
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
                                <div class="s_tit" data-aos="fade-up">
                                    <!-- multistep form -->
                                    <form id="msform" action="goQuizScorePic">
                                        <!-- progressbar -->
                                        <!-- fieldsets -->
<c:forEach items="${quiz_list}" var="quiz" varStatus="s">
    <fieldset>
        <h2 class="fs-title">${s.index + 1}번 문제</h2>
        <input type="hidden" name="question_number" value="${s.index + 1}">
        <input type="hidden" name="correctAnswer${s.index + 1}" value="${quiz.word_name}">

        <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
        <video controls style="width:100%;">
            <source src="${quiz.video_url}" type="video/mp4">
        </video>

            <div class="flip" onclick="selectChoice('${quiz.word_name1}')">
                <div class="front" style="background-image: url(${quiz.word_img_url1})">
                    <h1 class="text-shadow">${quiz.word_name1}</h1>
                </div>
                <div class="back">
                    <h2>${quiz.word_name1}</h2>
                    <input type="radio" name="answer${s.index + 1}" value="${quiz.word_name1}">
                </div>
            </div>
            
            <div class="flip" onclick="selectChoice('${quiz.word_name2}')">
                <div class="front" style="background-image: url(${quiz.word_img_url2})">
                    <h1 class="text-shadow">${quiz.word_name2}</h1>
                </div>
                <div class="back">
                    <h2>${quiz.word_name2}</h2>
                    <input type="radio" name="answer${s.index + 1}" value="${quiz.word_name2}">
                </div>
            </div>
            
            <div class="flip" onclick="selectChoice('${quiz.word_name3}')">
                <div class="front" style="background-image: url(${quiz.word_img_url3})">
                    <h1 class="text-shadow">${quiz.word_name3}</h1>
                </div>
                <div class="back">
                    <h2>${quiz.word_name3}</h2>
                    <input type="radio" name="answer${s.index + 1}" value="${quiz.word_name3}">
                </div>
            </div>
            
            <div class="flip" onclick="selectChoice('${choic.key}')">
                <div class="front" style="background-image: url(${quiz.word_img_url4})">
                    <h1 class="text-shadow">${quiz.word_name4}</h1>
                </div>
                <div class="back">
                    <h2>${quiz.word_name4}</h2>
                    <input type="radio" name="answer${s.index + 1}" value="${quiz.word_name4}">
                </div>
            </div>

        <br>
        <c:choose>
            <c:when test="${s.index < 9}">
                <input type="button" name="next" class="next action-button" value="다음문제"/>
            </c:when>
            <c:otherwise>
                <input type="submit" value="결과보기">
            </c:otherwise>
        </c:choose>
    </fieldset>
</c:forEach>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 서브페이지 [e] -->
                </div>
                <!-- sh_content [e] -->
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

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const flipCards = document.querySelectorAll(".flip");

        flipCards.forEach(card => {
            card.addEventListener("click", function () {
                flipCards.forEach(c => c.classList.remove("clicked"));
                this.classList.add("clicked");
                this.querySelector("input[type='radio']").checked = true;
            });
        });

        AOS.init();
    });

    function calculateScore() {
        let correctAnswers = 0;
        const totalQuestions = 5;
        for (let i = 1; i <= totalQuestions; i++) {
            const selectedAnswer = document.querySelector(`input[name="answer${i}"]:checked`);
            if (selectedAnswer && selectedAnswer.value === document.getElementById(`correctAnswer${i}`).value) {
                correctAnswers++;
            }
        }
        document.getElementById('score').innerText = `총 ${totalQuestions}문제 중 ${correctAnswers}문제를 맞췄습니다.`;
    }

        // 나머지 기존 스크립트 유지
        $(document).ready(function() {
            // 페이지 로드 시 가위(li 요소)에 on 클래스 추가
            $("#service1014 .tabs li.li1").addClass("on");

            $("#service1014 .tabs li").click(function() {
                $("#service1014 .tabs li").removeClass("on");
                $(this).addClass("on");

                // 각 li 요소에 따라 비디오 주소 변경
                if ($(this).hasClass("li1")) {
                    $("#service1014 video source").attr("src", "../img/main/abc.mp4");
                } else if ($(this).hasClass("li2")) {
                    $("#service1014 video source").attr("src", "../img/main/def.mp4");
                } else if ($(this).hasClass("li3")) {
                    $("#service1014 video source").attr("src", "../img/main/abc.mp4");
                } else if ($(this).hasClass("li4")) {
                    $("#service1014 video source").attr("src", "../img/main/def.mp4");
                } else if ($(this).hasClass("li5")) {
                    $("#service1014 video source").attr("src", "../img/main/abc.mp4");
                } else if ($(this).hasClass("li6")) {
                    $("#service1014 video source").attr("src", "../img/main/def.mp4");
                } else if ($(this).hasClass("li7")) {
                    $("#service1014 video source").attr("src", "../img/main/abc.mp4");
                }

                // 비디오 새로고침
                $("#service1014 video")[0].load();
            });

            let slidImg = document.querySelector(".slidImg"),
            bt = document.querySelectorAll(".slid i"),
            start = false,
            prevPageX, 
            prevScrollLeft,
            firstImg = document.images[0],
            imgWidth = firstImg.clientWidth + 10;

            bt.forEach(el => {
                el.addEventListener("click", () =>{
                    slidImg.scrollLeft += el.id == "left" ? -imgWidth : imgWidth;
                });
            });

            let swip = (ev)=> {
                if(!start) return;
                ev.preventDefault();
                let position = ev.pageX - prevPageX;
                slidImg.scrollLeft = prevScrollLeft - position;
            };

            let startSwip = (ev) => {
                start = true;
                prevPageX = ev.pageX;
                prevScrollLeft = slidImg.scrollLeft;
            };

            let stopSwip = () => {
                start = false;
            };

            var current_fs, next_fs, previous_fs; //fieldsets
            var left, opacity, scale; //fieldset properties which we will animate
            var animating; //flag to prevent quick multi-click glitches

            $(".next").click(function(){
                if(animating) return false;
                animating = true;

                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                //show the next fieldset
                next_fs.show();
                //hide the current fieldset with style
                current_fs.animate({opacity: 0}, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale current_fs down to 80%
                        scale = 1 - (1 - now) * 0.2;
                        //2. bring next_fs from the right(50%)
                        left = (now * 50)+"%";
                        //3. increase opacity of next_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({
                            'transform': 'scale('+scale+')',
                            'position': 'absolute'
                        });
                        next_fs.css({'left': left, 'opacity': opacity});
                    },
                    duration: 800,
                    complete: function(){
                        current_fs.hide();
                        animating = false;
                    },
                    easing: 'easeInOutBack'
                });
            });

            $(".previous").click(function(){
                if(animating) return false;
                animating = true;

                current_fs = $(this).parent();
                previous_fs = $(this).parent().prev();

                //de-activate current step on progressbar
                $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

                //show the previous fieldset
                previous_fs.show();
                //hide the current fieldset with style
                current_fs.animate({opacity: 0}, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale previous_fs from 80% to 100%
                        scale = 0.8 + (1 - now) * 0.2;
                        //2. take current_fs to the right(50%) - from 0%
                        left = ((1-now) * 50)+"%";
                        //3. increase opacity of previous_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({'left': left});
                        previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
                    },
                    duration: 800,
                    complete: function(){
                        current_fs.hide();
                        animating = false;
                    },
                    easing: 'easeInOutBack'
                });
            });
        });
    </script> 
</body>
</html>