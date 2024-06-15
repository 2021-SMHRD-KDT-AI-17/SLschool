<%@page import="kr.smhrd.entity.A_Suggestion"%>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet"> 
    <style>
    
    @media (max-width:641px) {
  html {
    font-size: small;
  }
}
@media (max-width:321px) {
  html {
    font-size: x-small;
  }
}

.content {
  width:500px;
  height:600px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.close{
margin-left:480px;
}
.certificate-wrapper {
  margin: 1rem;
  padding: 1rem;
}

.certificate {
  padding: 1rem;
  text-align: center;
  background-color: #ffffff;
}
.certificate__body {
  padding: 1rem 0;
}
.certificate__title {
  font-size: 4rem;
}
.certificate__recipient-name {
  font-size: 18px;
  margin-top:15px;
  margin-left:180px;
  margin-bottom:30px;
  font-family:'Nanum Myeongjo';
  font-weight:bold;
    color:#353535;
}
.certificate__content {
  font-size: 2rem;
  white-space: nowrap;
}
.certificate__description {
  font-size: 14px;
  margin: 0 auto;
  margin-bottom:30px !important;
  max-width: 70%;
  font-family:'Nanum Myeongjo';
  font-weight:bold
}
.certificate__date {
  font-size: 1.5rem;
}
.certificate__signature {
  font-size: 1.5rem;
}
.certificate__footer {
  display: flex;
  justify-content: space-around;
  margin-bottom:20px;
  font-family:'Nanum Myeongjo';
  font-weight:bold;
  letter-spacing:10px;
}

.entry-column {
  display: flex;
  flex-direction: column;
}
.entry-column__input {
  font-size: 1.5rem;
  font-family: cursive;
}
.entry-column__label {
  border-top: 1px solid;
  font-size: 1rem;
}
.certificate__signature .entry-column__input {
  color: #5DADE2;
}

.title-decoration {
  display: flex;
  flex-direction: column;
}
.title-decoration__main {
  line-height: 1em;
  margin-top:30px;
  font-size:40px;
  margin-bottom:20px;
  color:#353535;
  font-family:'Nanum Myeongjo';
  font-weight:700;
  letter-spacing:5px;
}
.title-decoration__sub {
  font-size: 0.25em;
  margin-top:20px;
}

.ribbon {
  display: inline-block;
  position: relative;
  height: 1.5em;
  line-height: 1.5em;
  text-align: center;
  padding: 0 2em;
  background: #5DADE2;
  color: #FFF;
  box-sizing: border-box;
}
.ribbon:before, .ribbon:after {
  position: absolute;
  content: '';
  width: 0px;
  height: 0px;
  z-index: 1;
}
.ribbon:before {
  top: 0;
  left: 0;
  border-width: 0.75em 0 0.75em 0.5em;
  border-color: transparent transparent transparent #fff;
  border-style: solid;
}
.ribbon:after {
  top: 0;
  right: 0;
  border-width: 0.75em 0.5em 0.75em 0;
  border-color: transparent #fff transparent transparent;
  border-style: solid;
}
.frame {
  position: relative;
  padding: 1.25rem;
  background:
    radial-gradient(circle at top left, transparent 1.25rem, #ca4 1.25rem, #ca4 1.5rem, transparent 1.5rem) left top / 1.5rem 1.5rem no-repeat,
    radial-gradient(circle at top right, transparent 1.25rem, #ca4 1.25rem, #ca4 1.5rem, transparent 1.5rem) right top / 1.5rem 1.5rem no-repeat,
    radial-gradient(circle at bottom left, transparent 1.25rem, #ca4 1.25rem, #ca4 1.5rem, transparent 1.5rem) left bottom / 1.5rem 1.5rem no-repeat,
    radial-gradient(circle at bottom right, transparent 1.25rem, #ca4 1.25rem, #ca4 1.5rem, transparent 1.5rem) right bottom / 1.5rem 1.5rem no-repeat,
    linear-gradient(90deg, transparent 1.25rem, #ca4 1.5rem) left top / 51% 0.25rem no-repeat,
    linear-gradient(-90deg, transparent 1.25rem, #ca4 1.5rem) right top / 51% 0.25rem no-repeat,
    linear-gradient(90deg, transparent 1.25rem, #ca4 1.5rem) left bottom / 51% 0.25rem no-repeat,
    linear-gradient(-90deg, transparent 1.25rem, #ca4 1.5rem) right bottom / 51% 0.25rem no-repeat,
    linear-gradient(180deg, transparent 1.25rem, #ca4 1.5rem) left top / 0.25rem 51% no-repeat,
    linear-gradient(0deg, transparent 1.25rem, #ca4 1.5rem) left bottom / 0.25rem 51% no-repeat,
    linear-gradient(180deg, transparent 1.25rem, #ca4 1.5rem) right top / 0.25rem 51% no-repeat,
    linear-gradient(0deg, transparent 1.25rem, #ca4 1.5rem) right bottom / 0.25rem 51% no-repeat;
}
.frame:before {
    position: absolute;
    content: "";
    border: 0.25rem double #ca4;
    margin: 0.5rem;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

/* bug fix */
@media print {
  .ribbon:before {
    left: -0.25px;
  }
  .ribbon:after {
    right: -0.25px;
  }
  .certificate__description {
    max-width: 90%;
  }
}
    .modal {
  display: none; /* 기본적으로 숨기기 */
  position: fixed; /* 화면에 고정 */
  left: 35%;
  top: 20%;
  width: 510px;
  height: 100%;
  overflow: auto; /* 스크롤 가능 */
}
.modal-content{
align-items: center;
}
    .list {
    font-size: 1.2em; /* 원하는 크기로 조정 */
    font-weight: bold; /* 굵게 지정 */
    color:#4D869C;
    
}
   .list2{
      margin-left:30px;
      margin-bottom:10px;
   }
   .reward{
   position: fixed;
   top:72%;
   left:78%;
   width:200px;
   height:200px;
   }
   
   .sign {
  position: absolute; /* 절대 위치 설정 */
  top: 87%; /* 수직 가운데 정렬 */
  right: 85px; /* 오른쪽으로 이동 (필요에 따라 조정) */
  transform: translateY(-50%); /* 수직 가운데 정렬 보정 */
  width:70px;
  opacity:0.8;
  height:70px;
}
    </style>

</head>
<body>
<% Member loginMember = (Member)session.getAttribute("loginMember"); %>

    <c:if test="${point >= 10000 }">
      <div id="openModal" class="reward-container">
      		    
      	<img class="reward" src="resources/img/common/sschool.gif" alt="Reward">
      		    
      </div>
    </c:if>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <div class="content">
        <div class="certificate-wrapper frame">
          <div class="certificate">
            <div class="certificate__header">
              <div class="certificate__title title-decoration">
                <span class="title-decoration__sub">
                  <img src="resources/img/common/reward.png" alt="Title Decoration">
                </span>
                <span class="title-decoration__main">교육수료증</span>
              </div>
            </div>
            <div class="certificate__body">
              <div class="certificate__recipient-name">김아무</div>
              <div class="certificate__description">위 사람은 「수어스쿨」 교육 과정을 성실히 이수하였기에 본 증서를 수여합니다.</div>
              <div class="certificate__description">2024. 06. 15</div>
            </div>
            <div class="certificate__footer">
              <div class="certificate__date entry-column">
                수어스쿨
                <img class="sign" src="resources/img/common/ssc.png">
              </div>
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
                                                            
                                                            
                                                            <c:forEach items="${suggestionList }" var="SL" varStatus="s">
                                                               <a href="goSuggestionDetail?sug_num=${SL.sug_num }" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    ${SL.sug_title }
                                                                    <span class="badge badge-light badge-pill">+</span>
                                                                </a>
                                                            </c:forEach>
                                                            
                                                            <a href="goMyPage" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                                                    <strong>마이페이지로 돌아가기</strong>
                                                                    <span class="badge badge-light badge-pill"> < </span>
                                                            </a>
                                                            </ul>
                                                        </div><!-- Détail-->
                                                    </div><!-- User profile box-->
                                                </div>
                                                <div class="col-lg-8 col-md-7 col-xs-12">
                                                    <div class="dashborad-box">
                                                        <h4 class="title">${suggestion.sug_title }</h4>
                                                        <div class="section-body">
                                                            <div class="row">
                                                                <div class="question">
                                                                   ${suggestion.sug_content}
                                                                </div>
                                                                <div class="date">
                                                                    ${suggestion.sug_time }
                                                                </div>
                                                            </div><!-- row -->
                                                        </div><!-- sbody -->
                                                    </div><!-- dashbox -->
                                                    
                                                    <c:choose>
                                                    	<c:when test="${empty aSuggestion }">
                                                    		<div class="dashborad-box">
                                                        	<h4 class="title"></h4>
                                                       		<div class="section-body">
                                                            <div class="row">
                                                                <div class="answer">
                                                                    아직 답변되지 않았습니다.
                                                                    <img src="resources/img/common/logo_2.png" alt="Sample" class="inline-img" style="width:30%"/>
                                                                </div>
                                                                <div class="date">
                                                                    
                                                                </div>
                                                            </div><!-- row -->
                                                        </div><!-- sbody -->
                                                    </div><!-- dashbox -->
                                                    <%if(loginMember.getId().equals("admin")) {%>
                                                    <a href="goWriteA?sug_num=${suggestion.sug_num }"><button class="btn btn-primary btn-sm mt-3" id="buttonans">답변하기</button></a>
                                                    <%} %>
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<div class="dashborad-box">
                                                        <h4 class="title">${aSuggestion.sugA_title }</h4>
                                                        <div class="section-body">
                                                            <div class="row">
                                                                <div class="answer">
                                                                    ${aSuggestion.sugA_content }
                                                                    <img src="resources/img/common/logo_2.png" alt="Sample" class="inline-img" style="width:30%"/>
                                                                </div>
                                                                <div class="date">
                                                                    ${aSuggestion.sugA_time }
                                                                </div>
                                                            </div><!-- row -->
                                                        </div><!-- sbody -->
                                                    </div><!-- dashbox -->
                                                    	</c:otherwise>
                                                    </c:choose>
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