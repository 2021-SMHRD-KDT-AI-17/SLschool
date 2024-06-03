<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <meta property="og:title" content="강의듣기">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>강의듣기</title>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css">  
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet"> 
    <script src="https://kit.fontawesome.com/85915fb54c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/aos.css">
    <script src="resources/js/aos.js"></script>
    <style>

    .s_tit .word-title {
        text-align: center;
        background: linear-gradient(to right top, #4D869C, #CDE8E5);
            background-clip: text; /* 텍스트에 그라데이션 적용 */
            color: transparent;
            font-weight: 900;
            font-size: 70px;
            letter-spacing: 0px;
            line-height: 110px;
    }
    .s_tit {

    flex-direction: column; /* 변경된 부분 */
    align-items: center;
    }
    .s_tit .slid {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
.video-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.video-container video {
    width: 450px; /* 원하는 크기로 설정 */
    height: 300px; /* 원하는 높이로 설정 */
    object-fit: cover; /* 비율을 무시하고 자르기 */
    max-width: 100%;
}

.l_cont, .r_cont {
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 위쪽 정렬로 변경 */
    margin: 20px;
}

.l_cont {
    margin-right: 10px;
    margin-top:1px; /* 비디오 사이의 간격을 좁게 설정 */
}

.r_cont {
    margin-left: 10px; /* 비디오 사이의 간격을 좁게 설정 */
}
.l_cont, .r_cont {
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 위쪽 정렬로 변경 */
    margin: 20px;
}

.l_cont {
    margin-right: 10px; /* 비디오 사이의 간격을 좁게 설정 */
}

.r_cont {
    margin-left: 10px; /* 비디오 사이의 간격을 좁게 설정 */

    
}
.l_cont .lv{
margin-top:10px;
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
                            <li><a href="helpPage">문의하기</a></li>
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
                <h1 id="m_logo"><a href="goMain"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
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
					<i class="fa fa-angle-right"></i> 강의 듣기 <i class="fa fa-angle-right"></i> A난이도</p>
				</div>
			</div>
            <!-- sub_main_banner [e] -->
            
			<!-- sh_aside [s] -->
            <div id="sh_aside">
    	        <div id="sh_snb">
                    <ul>
                        <li><a href="goStudyA">A난이도</a></li> <!--  style="color: #4D869C;" -->
                        <li><a href="goStudyB">B난이도</a></li>
                        <li><a href="goStudyC">C난이도</a></li>
                    </ul>            
				</div>
            </div>
            <!-- sh_aside [e] -->
            
            <!-- sh_content [s] -->
            <div id="sh_content">
                <!-- 서브페이지 [s] -->
                <div id="service1014" class="pagecommon">
    
                    <div class="cont">
                        
                        <!-- cont01 [s] -->
                        <div class="tab_cont cont01">
                            <div class="s_tit" data-aos="fade-up">
                                <div class="word-title">${word.word_name }</div>
                                <div class="slid">
                                    <i id='left' class="fa-solid fa-chevron-left"></i>
                                    <div class="slidImg">
                                        <img src="${wordImage.word_img_url1 }">
                                        <img src="${wordImage.word_img_url2 }">
                                        <img src="${wordImage.word_img_url3 }">
                                        <img src="${wordImage.word_img_url4 }">
                                    </div>
                                    <i id='right' class="fa-solid fa-chevron-right"></i>
                                </div>
                                <div class="video-container">
                                    <div class="l_cont">
                                        <span>
                                            <video class="lv" controls class="responsive-video">
                                                <source src="${quizURL }" type="video/mp4">
                                            </video>
                                        </span>
                                    </div>
								    <div class="r_cont">
								        <video id="webcam" autoplay playsinline></video>
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
            <img class="ft_logo" src="resources/img/common/logo_1.png" alt="Sample" />
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
	})
})


let swip = (ev)=> {
	if(!start) return;
	ev.preventDefault();
	let position = ev.pageX - prevPageX;
	slidImg.scrollLeft = prevScrollLeft - position;
};

let startSwip = (ev) => {
	start = true
	prevPageX = ev.pageX
	prevScrollLeft = slidImg.scrollLeft
};

let stopSwip = () => {
	start = false
};

slidImg.addEventListener("mousemove", swip);
slidImg.addEventListener("mousedown", startSwip);
slidImg.addEventListener("mouseup", stopSwip);

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
    }
}

window.addEventListener('load', startWebcam);
</script> 
</body>
</html>

