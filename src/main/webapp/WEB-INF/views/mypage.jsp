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
    <meta property="og:title" content="퀴즈">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
	<title>퀴즈</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script src="resources/js/topmenu_script.js"></script>
	<link rel="stylesheet" href="resources/css/sh_common.css"> 
    <link rel="stylesheet" href="resources/css/sh_sub.css">    
    <link rel="stylesheet" href="resources/css/aos.css">
    <script src="resources/js/aos.js"></script>
    <!-- Bibliothèque d'icones-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/mypage.css">  
    <link rel="stylesheet" href="resources/css/login.css">  
    <link rel="stylesheet" href="resources/css/bootstrap.css">  

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
                    <h1 id="top_logo"><a href="main.html"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
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
                            <a href="study.html">강의 듣기</a>
                            <ul>
                                <li><a href="study_a.html">A난이도</a></li>
                                <li><a href="">B난이도</a></li>
                                <li><a href="">C난이도</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="quiz.html">퀴즈</a>
                            <ul>
                                <li><a href="quiz_a_detail.html">A버전</a></li>
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
                        <li>
                            <a href="">마이페이지</a>
                            <ul>
                                <li><a href="">수업 현황</a></li>
                                <li><a href="">내 정보 수정</a></li>
                                <li><a href="">문의하기</a></li>
                            </ul>
                        </li> 
                    </ul>
                    <ul id="topmenu_line">
                      <% if(loginMember == null) {%>
                                <li><a href="goLogin"><i data-feather="log-in"></i>Login</a></li>
                                <li><a href="goJoin"><i data-feather="user-plus"></i>Join us</a></li>
                                <%} else{ %>
                                <li><span><%=loginMember.getName() %>님 환영합니다.</span></li>
                                <li><a href="goLogout"><i data-feather="user-plus"></i>Log-out</a></li>
                                <%} %>
                    </ul>
                </div>
                <!-- 상단 메뉴 [e] -->
            </div>
            <!-- topmenu_wrapper [e] -->
            <!-- 반응형메뉴 [s] -->
            <div id="topmenuM">
                <h1 id="m_logo"><a href="main.html"><img src="resources/img/common/logo_2.png" alt="Sample" /></a></h1>
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
                                    <li><a href="sub1.html">수어스쿨</a></li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">강의 듣기</button>
                                <ul class="m_smenu">
                                    <li><a href="study_a.html">A난이도</a></li>
                                    <li><a href="">B난이도</a></li>
                                    <li><a href="">C난이도</a></li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">퀴즈</button>
                                <ul class="m_smenu">
                                    <li><a href="quiz_a_detail.html">A버전</a></li>
                                    <li><a href="">B버전</a></li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">수어사전</button>
                                <ul class="m_smenu">
                                    <li><a href="dictionary.html">단어검색</a></li>
                                </ul>
                            </li>
                            <li>
                                <button class="m_bmenu" type="button">마이페이지</button>
                                <ul class="m_smenu">
                                    <li><a href="">강의 현황</a></li>
                                    <li><a href="">내 정보 수정</a></li>
                                    <li><a href="">문의하기</a></li>
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
                    <h3>내 정보</h3>
                    <p><a href="main.html"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a>
                        <i class="fa fa-angle-right"></i>마이페이지<i class="fa fa-angle-right"></i>내 정보</p>
                </div>
            </div>
            <!-- sub_main_banner [e] -->
            <!-- sh_aside [s] -->
            <!-- sh_aside [e] -->
            <!-- sh_content [s] -->
            <!-- sh_content [s] -->
            <div id="sh_content">

                <!-- 서브페이지 [s] -->
                <div id="" class="pagecommon1">
        
                    <div class="cont">
                        <!-- cont01 [s] -->
                        <div class="">
                                <!-- 여기에 추가할 코드를 삽입 -->
                                <div class="mypage" data-aos="fade-up">
                                    <section class="user-page section-padding">
                                        <div class="container">
                                            <div class="row align-items-stretch">
                                                <div class="col-lg-4 col-md-5 col-xs-12">
                                                    <div class="user-profile-box">
                                                        <div class="header clearfix d-flex flex-column align-items-center">
                                                            <h2>이모씨</h2>
                                                            <img id="g-profile-img"
                                                                class="img-fuid mb-3"
                                                                width="80" height="80"
                                                                alt="avatar"
                                                                src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMjdfMTA1%2FMDAxNzAzNjYyMjg4MDQz.sJvE_4lC7aSvn2qNjDFqck8-QvTYqEjjFQ4Wy-idGNQg.51a80329ezIx2HeuIMF2C44V5mkqzWj_vfntWtvzELcg.JPEG.animalandhuman%2FGettyImages-491143647.jpg&type=sc960_832">
                                                        </div>
                                                        <div class="mt-1 d-flex justify-content-center">
                                                            <button class="btn btn-primary btn-sm mt-3">내 정보 수정</button>
                                                        </div>
                                                        <div class="detail clearfix">
                                                            <ul class="list-group list-group-flush">
                                                                <a href="" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    첫 문의입니다
                                                                    <span class="badge badge-light badge-pill">N</span>
                                                                </a>
                                                                <a href="" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    두번째 문의입니다
                                                                    <span class="badge badge-light badge-pill">N</span>
                                                                </a>
                                                                <a href="" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    세번째 문의입니다
                                                                    <span class="badge badge-light badge-pill">N</span>
                                                                </a>
                                                            </ul>
                                                        </div><!-- Détail-->
                                                    </div><!-- User profile box-->
                                                </div>
                                                <div class="col-lg-8 col-md-7 col-xs-12">
                                                    <div class="dashborad-box">
                                                        <h4 class="title">내 강의 현황</h4>
                                                        <div class="section-body">
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="item">
                                                                        <div class="icon"><span class="g-atteint fa fa-check-circle"></span></div>
                                                                        <div class="info">
                                                                            <h6 class="number">가위</h6>
                                                                            <p class="type">최근 강의 영상</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="item">
                                                                        <div class="icon"><span class="g-alerte fa fa-check-circle"></span></div>
                                                                        <div class="info">
                                                                            <h6 class="number">60점</h6>
                                                                            <p class="type">최근 퀴즈 점수</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="item">
                                                                        <div class="icon"><span class="g-non-atteint fa fa-check-circle"></span></div>
                                                                        <div class="info">
                                                                            <h6 class="number">3개</h6>
                                                                            <p class="type">내 문의 현황</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- row -->
                                                        </div><!-- sbody -->
                                                    </div><!-- dashbox -->
                                                    <div class="dashborad-box">
                                                        <h4 class="title">내가 본 강의 영상</h4>
                                                        <div class="section-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <th class="title-col"><strong>강의 제목</strong></th>
                                                                        <th><strong>보러가기</strong></th>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>가위</td>
                                                                            <td>
                                                                                <a href=""><span class="g-action fa fa-eye"> 클릭</span></a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>바위</td>
                                                                            <td>
                                                                                <a href=""><span class="g-action fa fa-eye"> 클릭</span></a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>보</td>
                                                                            <td>
                                                                                <a href=""><span class="g-action fa fa-eye"> 클릭</span></a>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="dashborad-box">
                                                        <h4 class="title">퀴즈 점수</h4>
                                                        <div class="section-body">
                                                            <canvas id="myChart"></canvas>
                                                        </div>
                                                    </div><!-- Dbox -->
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                            </div>
                        </div>
                        <!-- cont01 [e] -->
                    </div>
                </div>
                <!-- 서브페이지 [e] -->
            </div>
            <!-- sh_content [e] -->
        </div>
        <!-- sh_container_wrapper [e] -->
    </div>
    <!-- sh_container [e] -->
    <!-- 반응형 하단 전화번호 [s] -->
    <div id="sh_ft_btns">
        <div class="btns">
            <a class="tel" href="tel:15446062"><i class="fa fa-phone"></i>1544-6062</a>
        </div>
    </div>
    <a id="fix_tel" href="tel:15446062"><i class="fa fa-phone"></i></a>
    <script>
        $(window).on("scroll", function () {
            if ($(window).scrollTop() > 100) {
                $('#fix_tel').addClass('active');
            } else {
                $('#fix_tel').removeClass('active');
            }
            return false;
        });
    </script>
    <!-- 반응형 하단 전화번호 [e] -->
    <!-- sh_ft [s] -->
    <div id="sh_ft">
        <div class="ft_txt">
            <img class="ft_logo" src="resources/img/common/logo_1.png" alt="Sample" />
            <div class="ft_text">
                <a onclick="">이용약관</a>
                <a onclick="">개인정보취급방침</a>
                <div>광주광역시 동구 예술길 31-15 광주아트센터 4층 인공지능 융합서비스<br /> 인간지능 팀원 이름</div>
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
    $(document).ready(function () {
        AOS.init();
    });
</script>
<script>
    $(document).ready(function () {
        $('#m_navBtn').on('click', function () {
            $('#navWrap').toggleClass('active');
        });
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script>
$(document).ready(function() {
    Chart.defaults.global.legend.display = false;
    Chart.defaults.global.elements.line.tension = 0.3;
    ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',
        // The data for our dataset
        data: {
            labels: ["최근 1회","최근 2회","최근 3회","최근 4회", "최근 5회"],
            datasets: [{
                label: "점수",
                backgroundColor: 'rgb(238, 247, 255)',
                borderColor: 'rgb(122, 178, 178)',
                data: [20,60,100,80,0]
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                      min:0,
                        max: 100,
                      stepSize: 20
                    }
                }]
            }
        }
    });
});
// Configuration options go here
</script>
</body>
</html>