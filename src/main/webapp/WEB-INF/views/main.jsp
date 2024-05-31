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
    <meta property="og:title" content="Sample">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>수어스쿨</title>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
    <script src="resources/js/swiper.min.js"></script>
    <link rel="stylesheet" href="resources/css/swiper.min.css">
    <link rel="stylesheet" href="resources/css/sh_common.css">
    <link rel="stylesheet" href="resources/css/sh_main.css">
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
<!--                <div class="topmenu_line_wrap">
                    <div class="topmenu_line">
                         SNS 메뉴 [s] -->
                        <!--<ul class="left_menu">
                            <li><a href="main.html">Home</a></li>
                            <li><a href="">Blog</a></li>
                            <li><a href="">Youtube</a><img src="img/common/menu_youtube.png" alt="유튜브"></li>
                        </ul>
                         SNS 메뉴 [e] -->
                        
                        <!-- 로그인 메뉴 [s] -->
                        <!--<ul>
                            <li><a href=""><i data-feather="log-in"></i>Login</a></li>
                            <li><a href=""><i data-feather="user-plus"></i>Join us</a></li>
                        </ul>
                         로그인 메뉴 [e] -->
                    <!--</div>
                </div> -->
            
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
                                <li><a href="">A버전</a></li>
                                <li><a href="quiz2">B버전</a></li>
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
                            <li><a href="goSuggestionDetail">수업 현황</a></li>
                            <li><a href="goUpdateMember">내 정보 수정</a></li>
                            <li><a href="goHelp">문의하기</a></li>
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
                            <li><a href="" class="small_tip">회원가입</a></li>
                            <li><a href="" class="small_tip">로그인</a></li>
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
                                    <li><a href="">A버전</a> </li>
                                    <li><a href="">B버전</a> </li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">수어사전</button>
                                 <ul class="m_smenu">
                                    <li><a href="">단어검색</a> </li>
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
            <!-- main_banner [s] -->
            <div id="main_banner">
                <div id="main_banner_wrap">
                    <div class="main_wrap">
                        <!-- 좌측 이미지 슬라이드 [s] -->
                        <div class="slide_wrap">
                            <div class="swiper main_slide">
                                <div class="main_slide_box swiper-wrapper">
                                    <div class="swiper-slide slide1">
                                        <video id="webcam" autoplay playsinline width="700" height="466"></video>
                                    </div>
                                    <div class="swiper-slide slide2">
                                        <video autoplay muted loop width="100%" height="100%">
                                            <source src="../img/main/def.mp4" type="video/mp4">
                                        </video>
                                    </div>
                                </div>                
                            </div>
                            <div class="main_control">
                                <div class="main_arrow">
                                    <span class="main_prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                    <span class="main_next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                </div>
                                <div class="main_pager"></div>
                            </div>
                        </div>
                        <!-- 좌측 이미지 슬라이드 [e] -->
                        
                        <!-- 우측 영역 [s] -->
                        <div class="main_cont">
                            <!-- 텍스트 [s] -->
                            <div class="cont_tit">
                                <p>어렵지 않아요,</p>
                                <span>쉽게 배우세요!</span>
                                <!-- <ul>
                                    <li>ㄱ</li>
                                    <li>ㄴ</li>
                                    <li>ㄷ</li>
                                </ul> -->
                            </div>
                            <!-- 텍스트 [e] -->
                            
                            <!-- 아이콘 배너 [s] -->
                            <div class="icon_links">
                                <a href="goStudy"><div class="icon"><img src="resources/img/main/main_icon_01.png" alt="학습시스템" /></div>학습시스템</a>
                                <a href="goStudy"><div class="icon"><img src="resources/img/main/main_icon_04.png" alt="강의보기" /></div>강의보기</a>
                                <a href="quiz"><div class="icon"><img src="resources/img/main/main_icon_03.png" alt="자료실" /></div>퀴즈</a>
                                <a href="goDic"><div class="icon"><img src="resources/img/main/main_icon_02.png" alt="교재안내" /></div>수어사전</a>
                            </div>
                            <!-- 아이콘 배너 [e] -->
                            
                            <!-- 바로가기 [s] -->
                            <a href="goStudyA" class="cont_txt">
                                <p>
                                    <span>수어 첫걸음 나서기</span>
                                    열심히 아자아자 화이팅!
                                </p>
                                <div class="go_btn"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i><span class="sound_only">강의보기</span></div>
                            </a>
                            <!-- 바로가기 [e] -->
                        </div>
                        <!-- 우측 영역 [e] -->
                    </div>  
                </div>

                <script>
                    var Mainswiper = new Swiper(".main_slide", {
                      spaceBetween: 20,
                      speed:1200,
                      centeredSlides: true,
                      loop : true,
                      autoplay: {
                        delay: 10000,
                        disableOnInteraction: false,
                      },
                      navigation: {
                        nextEl: '.main_control .main_next',
                        prevEl: '.main_control .main_prev',
                        },
                     pagination: {
                        el: '.main_pager',
                        type: 'fraction',
                     },
                    });
                </script>
            </div>
            <!-- main_banner [e] -->

            <!-- sh_section [s] -->
            <section id="sh_section">
                <!-- atc01 [s] -->
                <article id="atc01">
                   <div class="inner">
                       <!-- 좌측 영역 [s] -->
                       <div class="latest">
                            <!-- 타이틀 & 컨트롤러 [s] -->
                            <div class="tit_area">
                                <a href="goStudyA">
                                    <span class="tit">수준 맞춤 강의 듣기</span>
                                    수어는 동행입니다.
                                </a>
                                <div class="control">
                                    <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                    <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                </div>
                            </div>
                            <!-- 타이틀 & 컨트롤러 [e] -->
                           
                            <!-- 강사 슬라이드 [s] -->
                            <div class="late_wrap">
                                <div class="swiper late_slide">
                                    <ul class="swiper-wrapper">	
                                        <li class="swiper-slide">
                                            <a href="goStudyA">
                                                <p class="subj">A난이도</p>
                                                <div class="cont">어린아이 수준으로 쉽게</div>
                                                <span>#강의보기</span>
                                            </a>
                                        </li>
                                        <li class="swiper-slide">
                                            <a href="goStudyB">
                                                <p class="subj">B난이도</p>
                                                <div class="cont">초등학생 수준으로 쉽게</div>
                                                <span>#강의보기</span>
                                            </a>
                                        </li>
                                        <li class="swiper-slide">
                                            <a href="goStudyC">
                                                <p class="subj">C난이도</p>
                                                <div class="cont">중학생 수준으로 쉽게</div>
                                                <span>#강의보기</span>
                                            </a>
                                        </li>
                                    </ul>                    
                                </div>
                            </div>
                            <!-- 강사 슬라이드 [e] -->
                        </div>
                        <!-- 좌측 영역 [e] -->
                       
                        <!-- 우측 영역 [s] -->
                        <div class="report">
                            <!-- <div class="tit_sub"><span>문의</span>수어스쿨</div> -->
                            <p class="tit">고객센터</p>
                            <ul>
                                <li>
                                    <a href="">
                                        <span class="cate">공지사항</span>
                                        <p>공지 제목</p>
                                        <span class="date">공지 날짜</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="cate">문의하기</span>
                                        <p>1:1 문의</p>
                                         </a>
                                        <% if(loginMember == null) {%>
                                <span class="date">로그인 후 사용해주세요</span>
                                <%}%>
                                   
                                </li>
                            </ul>
                            <!-- <a href="" class="more_btn">MORE VIEW</a> -->
                        </div>
                        <!-- 우측 영역 [e] -->
                    </div>
                </article>

                <script>
                    var swiper1 = new Swiper("#atc01 .late_slide", {
                        slidesPerView: 1,
                        loop:true,
                        autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                        },
                        navigation: {
                        nextEl: '#atc01 .next',
                        prevEl: '#atc01 .prev',
                        },
                        breakpoints: {
                            531: {
                              slidesPerView: '2',
                            },
                            1025: {
                              slidesPerView: '3',
                            },
                        }
                    });
                </script>
                <!-- atc01 [e] -->
                
                <!-- atc02 [s] -->


                <!-- atc02 [e] -->
            </section>
            <!-- sh_section [e] -->
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

