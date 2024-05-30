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
    <meta property="og:title" content="퀴즈-뜻 맞추기">
    <meta property="og:description" content=""><!-- 사이트 설명문구 -->
    <meta property="og:image" content="resources/img/common/logo.png">
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
        h1 {
  font-size: 1em;
}

.back h2 {
  font-size: 2.3em;
  color:white;
  margin-left: -5px;
}

.flip {
  position: relative;
}

.flip > .front,
.flip > .back {
  display: block;
  transition-timing-function: cubic-bezier(.175, .885, .32, 1.275);
  transition-duration: .5s;
  transition-property: transform, opacity;
}

.flip > .front {
  transform: rotateY(0deg);
}

.flip > .back {
  position: absolute;
  opacity: 0;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  
  transform: rotateY(-180deg);
}

.flip:hover > .front {
  transform: rotateY(180deg);
}

.flip:hover > .back {
  opacity: 1;
  transform: rotateY(0deg);
}

.flip.flip-vertical > .back {
  transform: rotateX(-180deg);
}

.flip.flip-vertical:hover > .front {
  transform: rotateX(180deg);
}

.flip.flip-vertical:hover > .back {
  transform: rotateX(0deg);
}

.flip {
  position: relative;
  display: inline-block;
  margin-right: 2px;
  margin-bottom: 1em;
  width: 150px;
}

.flip > .front,
.flip > .back {
  display: block;
  color: white;
  width: inherit;
  background-size: cover !important;
  background-position: center !important;
  height: 100px;
  padding: 1em 2em;
  background: #313131;
  border-radius: 10px;
}


.text-shadow {
  text-shadow: 1px 1px rgba(0, 0, 0, 0.04), 2px 2px rgba(0, 0, 0, 0.04), 3px 3px rgba(0, 0, 0, 0.04), 4px 4px rgba(0, 0, 0, 0.04), 0.125rem 0.125rem rgba(0, 0, 0, 0.04), 6px 6px rgba(0, 0, 0, 0.04), 7px 7px rgba(0, 0, 0, 0.04), 8px 8px rgba(0, 0, 0, 0.04), 9px 9px rgba(0, 0, 0, 0.04), 0.3125rem 0.3125rem rgba(0, 0, 0, 0.04), 11px 11px rgba(0, 0, 0, 0.04), 12px 12px rgba(0, 0, 0, 0.04), 13px 13px rgba(0, 0, 0, 0.04), 14px 14px rgba(0, 0, 0, 0.04), 0.625rem 0.625rem rgba(0, 0, 0, 0.04), 16px 16px rgba(0, 0, 0, 0.04), 17px 17px rgba(0, 0, 0, 0.04), 18px 18px rgba(0, 0, 0, 0.04), 19px 19px rgba(0, 0, 0, 0.04), 1.25rem 1.25rem rgba(0, 0, 0, 0.04);
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
                                
                                <!-- multistep form -->
<form id="msform">
    <!-- progressbar -->
    <ul id="progressbar">
      <li class="active">1번 문제</li>
      <li>2번 문제</li>
      <li>3번 문제</li>
      <li>4번 문제</li>
      <li>5번 문제</li>
    </ul>
    <!-- fieldsets -->
    <fieldset>
      <h2 class="fs-title">1번 문제</h2>
      <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
      <video controls style="width:100%;">
        <source src="http://sldict.korean.go.kr/multimedia/multimedia_files/convert/20200901/739060/MOV000251190_700X466.mp4" type="video/mp4">
    </video>
      
        <div class="flip">
            <div class="front" style="background-image: url(https://images.pexels.com/photos/540518/pexels-photo-540518.jpeg?w=1260&h=750&dpr=2&auto=compress&cs=tinysrgb)">
            <h1 class="text-shadow">산</hi>
            </div>
            <div class="back">
            <h2>산</h2>
            <input type="radio" name="answer" value="산">
            </div>
        </div>
        <div class="flip">
            <div class="front" style="background-image: url(https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?w=1260&h=750&dpr=2&auto=compress&cs=tinysrgb)">
            <h1 class="text-shadow">바다</hi>
            </div>
            <div class="back">
            <h2>바다</h2>
            <input type="radio" name="answer" value="바다">
            </div>
        </div>
        <div class="flip">
            <div class="front" style="background-image: url(https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?w=1260&h=750&dpr=2&auto=compress&cs=tinysrgb)">
            <h1 class="text-shadow">나무</hi>
            <input type="radio" name="answer" value="나무">
            </div>
            <div class="back">
            <h2>나무</h2>
            </div>
        </div>
        <div class="flip">
            <div class="front" style="background-image: url(https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?w=1260&h=750&dpr=2&auto=compress&cs=tinysrgb)">
            <h1 class="text-shadow">고양이</hi>
            </div>
            <div class="back">
            <h2>고양이</h2>
            <input type="radio" name="answer" value="고양이">
            </div>
        </div>
        <Br>
        <input type="button" name="next" class="next action-button" value="다음문제" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">2번 문제</h2>
        <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
        <video controls style="width:100%;">
          <source src="http://sldict.korean.go.kr/multimedia/multimedia_files/convert/20200901/739060/MOV000251190_700X466.mp4" type="video/mp4">
      </video>
        <input type="text" name="answer" placeholder="정답입력" />
        <input type="button" name="next" class="next action-button" value="다음문제" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">3번 문제</h2>
        <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
        <video controls style="width:100%;">
          <source src="http://sldict.korean.go.kr/multimedia/multimedia_files/convert/20200901/739060/MOV000251190_700X466.mp4" type="video/mp4">
      </video>
        <input type="text" name="answer" placeholder="정답입력" />
        <input type="button" name="next" class="next action-button" value="다음문제" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">4번 문제</h2>
        <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
        <video controls style="width:100%;">
          <source src="http://sldict.korean.go.kr/multimedia/multimedia_files/convert/20200901/739060/MOV000251190_700X466.mp4" type="video/mp4">
      </video>
        <input type="text" name="answer" placeholder="정답입력" />
        <input type="button" name="next" class="next action-button" value="다음문제" />
      </fieldset>
      <fieldset>
        <h2 class="fs-title">5번 문제</h2>
        <h3 class="fs-subtitle">영상을 보고 정답을 맞춰주세요</h3>
        <video controls style="width:100%;">
          <source src="http://sldict.korean.go.kr/multimedia/multimedia_files/convert/20200901/739060/MOV000251190_700X466.mp4" type="video/mp4">
      </video>
        <input type="text" name="answer" placeholder="정답입력" />
        <a href="quiz_score.html">
        <input type="button" name="next" class="next action-button" value="결과보기" />
        </a>
      </fieldset>
  </form>
                                
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


$(document).ready(function() {
    AOS.init();
});

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
		//this comes from the custom easing plugin
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
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

</script> 
</body>
</html>

