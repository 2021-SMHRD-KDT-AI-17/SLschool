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
    <meta name="naver-site-verification" content=""/><!-- 네이버 소유확인 -->
    <meta name="description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:type" content="website">
    <meta property="og:title" content="강의듣기">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>강의듣기</title>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css"> 
    <link rel="stylesheet" href="resources/css/aos.css">
    <script src="resources/js/aos.js"></script>       
    <style>
    #greeting .cont {
    padding: 5px 0 0 15% !important;
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
					<i class="fa fa-angle-right"></i> 강의 듣기 <!--<i class="fa fa-angle-right"></i> A난이도</p>-->
				</div>
			</div>
            <!-- sub_main_banner [e] -->
            
			<!-- sh_aside [s] -->
            <div id="sh_aside">
    	        <div id="sh_snb">
                    <ul>
                                <li><a href="goStudyA">음식</a></li>
                                <li><a href="goStudyB">스포츠</a></li>
                                <li><a href="goStudyC">직업</a></li>
                                <li><a href="goStudyFamily">가족구성원</a></li>
                                <li><a href="goStudyColor">색깔</a></li>
                                <li><a href="goStudyEco">환경</a></li>
                    </ul>            
				</div>
            </div>
            <!-- sh_aside [e] -->
            
            <!-- sh_content [s] -->
            <div id="sh_content">

                <!-- 서브페이지 [s] -->
                <div id="greeting" class="pagecommon">
                    <div class="cont">
                        <section id="sh_section">
                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">음식</span>
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                
                                                <c:forEach items="${word_listA}" var="A" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${A.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${A.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${A.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyA">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">음식</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
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

                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">스포츠</span>
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                   <c:forEach items="${word_listB}" var="B" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${B.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${B.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${B.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyB">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">스포츠</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
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

                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">직업</span>
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                    <c:forEach items="${word_listC}" var="C" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${C.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${C.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${C.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyC">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">직업</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
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
                            
                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">가족구성원</span>
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                
                                                <c:forEach items="${word_listFamily}" var="F" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${F.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${F.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${F.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyFamily">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">가족구성원</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
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
                            
                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">색깔</span>
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                
                                                <c:forEach items="${word_listColor}" var="A" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${A.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${A.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${A.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyColor">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">색깔</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
                            <script>
                                var swiper1 = new Swiper("#atc05 .late_slide", {
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
                            
                            <article id="atc01">
                                <div class="inner">
                                    <div class="latest">
                                        <div class="tit_area">
                                            <a href="">
                                                <span class="tit">A난이도</span>
                                                어린아이 수준
                                            </a>
                                            <div class="control">
                                                <span class="prev"><i class="fa fa-solid fa-angle-left" aria-hidden="true"></i></span>
                                                <span class="next"><i class="fa fa-solid fa-angle-right" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class="late_wrap">
                                            <div class="swiper late_slide">
                                                <ul class="swiper-wrapper">	
                                                
                                                <c:forEach items="${word_listEco}" var="A" end="2" >
                                                <li class="swiper-slide">
                                                        <a href="goWordDetail?word_num=${A.word_num }">
                                                            <p class="subj">
                                                                <video controls style="width: 100%;">
                                                                <source src="${A.video_url }" type="video/mp4">
                                                                </video>
                                                                <br>
                                                                ${A.word_name }
                                                            </p>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                    <li class="swiper-slide">
                                                        <a href="goStudyEco">
                                                            <br>
                                                            <p class="subj" style="font-size: 25px;">환경</p>
                                                            <br>
                                                            <span>더보기</span>
                                                        </a>
                                                    </li>
                                                </ul>                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
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
                            
                        </section>
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
        $(document).ready(function() {
    AOS.init();
});
</script>
</body>
</html>

