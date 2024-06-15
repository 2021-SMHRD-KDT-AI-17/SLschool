<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <meta property="og:title" content="마이페이지">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="img/common/logo.png">
    <meta property="og:url" content="">
   <title>마이페이지</title>
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
    <style>
    .list {
    font-size: 1.2em; /* 원하는 크기로 조정 */
    font-weight: bold; /* 굵게 지정 */
    color:#4D869C;
    
}
   .list2{
      margin-left:30px;
      margin-bottom:10px;
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
                    <h3>수업 현황</h3>
                    <p><a href="goMain"><i class="fa fa-home"></i><span class="sound_only">홈으로</span></a>
                        <i class="fa fa-angle-right"></i>마이페이지<i class="fa fa-angle-right"></i>수업 현황</p>
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
                                                            <h2>${member.name }</h2>
                                                            <img id="g-profile-img"
                                                                class="img-fuid mb-3"
                                                                width="80" height="80"
                                                                alt="avatar"
                                                                src="resources/img/common/profile.jfif">
                                                        </div>
                                                        <div class="mt-1 d-flex justify-content-center">
                                                            <button class="btn btn-primary btn-sm mt-3" onclick="location.href='goUpdateMember'">내 정보 수정</button>
                                                        </div>
                                                        <div class="detail clearfix">
                                                           <div class="list2">
                                                           <span class="list">내 문의 현황 </span>
                                                           </div>
                                                            <ul class="list-group list-group-flush">
                                                            
                                                            <!-- 문의 현황 -->
                                                            <c:forEach items="${suggestionList }" var="SL" varStatus="s">
                                                               <a href="goSuggestionDetail?sug_num=${SL.sug_num }" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    ${SL.sug_title }
                                                                    <span class="badge badge-light badge-pill">+</span>
                                                                </a>
                                                            </c:forEach>
                                                            <a href="goHelp" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    <strong>문의 바로 가기</strong>
                                                                    <span class="badge badge-light badge-pill">></span>
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
                                                                            <h6 class="number">${wordList[0].word_name }</h6>
                                                                            <p class="type">최근 강의 영상</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="item">
                                                                        <div class="icon"><span class="g-alerte fa fa-check-circle"></span></div>
                                                                        <div class="info">
                                                                            <h6 class="number">${quizRankList[0].quiz_score}점</h6>
                                                                            <p class="type">최근 퀴즈 점수</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="item">
                                                                        <div class="icon"><span class="g-non-atteint fa fa-check-circle"></span></div>
                                                                        <div class="info">
                                                                            <h6 class="number">${point}점</h6>
                                                                            <p class="type">보유 포인트</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                 <c:if test="${point >= 10000 }">
                                                                	<button>수료증 발급</button>
                                                                 </c:if>
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
                                                                        <c:forEach items="${wordList }" var="WL" end="2" varStatus="s">
                                                                           <tr>
                                                                              <td>${WL.word_name }</td>
                                                                               <td>
                                                                                <a href="goWordDetail?word_num=${WL.word_num }"><span class="g-action fa fa-eye"> 클릭</span></a>
                                                                            </td>
                                                                        </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="dashborad-box">
                                                        <h4 class="title">모의고사 점수</h4>
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
    
    var scorelist = ${fn:escapeXml(scorelist)};
    
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
                data: scorelist
            
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