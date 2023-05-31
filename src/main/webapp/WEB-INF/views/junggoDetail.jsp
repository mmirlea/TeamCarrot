<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/junggoDetailStyle.css'/>" rel="stylesheet" />
</head>
<body>
	<div class="wrap">
	
		<%@ include file ="./header.jsp" %>
	
        <div class="container">
            <div class="swiper-modify">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img src="./resource/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></a></div>
                    <div class="swiper-slide"><a href="#"><img src="./resource/img/이사가느라 가전 팔아요2.jpg" alt="이사가느라 가전 팔아요2"></a></div>
                    <div class="swiper-slide"><a href="#"><img src="./resource/img/이사가느라 가전 팔아요3.jpg" alt="이사가느라 가전 팔아요3"></a></div>
                    </div><!--swiper-wrapper-->
                    <div class="swiper-pagination"></div>
                </div><!--swiper mySwiper-->  
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div><!--.swiper-modify-->
            <div class="memberAll">
                <div class="member-wrap">
                    <div class="memberInfo-wrap">
                        <div class="memberInfo-Img"><img src="./resource/img/memberImg.png" alt="회원이미지"></div>
                        <div class="memberInfo-Text">
                            <div class="nickname">밍띠</div>
                            <div class="memberAddress">북구 신용동</div>
                        </div><!--memberInfo-Text-->
                    </div><!--memberInfo-wrap-->
                    <div class="memberOndo-wrap">
                        <div class="memberOndo-Text">
                            <div class="ondo">
                                <span class="ondoNum">37.8</span>
                                <span class="celsius">°C</span>
                            </div><!--ondo-->
                            <div class="ondoBar"></div>
                        </div>
                        <div class="memberOndo-right">
                            <div class="ondoFace"></div>
                        </div>
                    </div><!--memberOndo-wrap-->
                </div><!--member-wrap--> 
                <div class="mannerOndo">매너온도</div>   
                <hr>
            </div><!--memberAll-->  
            <div class="content-wrap">
                <h1 class="contentTitle">이사가느라 가전 팔아요~!골라가세요~!</h1><!--.contentTitle-->
                <div class="contentInfo">
                    <span class="categry">가구/인테리어</span>
                    &nbsp•&nbsp
                    <span class="pullUp">끌올</span>
                    &nbsp;
                    <span class="ctime">1일전<span>
                </div><!--contentInfo-->
                <div class="content">
                    1. 건조기&#40;LG RH16VTN&#41;16KG
                    <br>
                    21년6월 출고 제품, 사용한지 1년 됐습니다.
                    <br>
                    입주할때 삿어요	&#126;&#33; 외관 이상 무&#33;
                </div><!--content-->
                <div class="countUp">
                    <span class="itemAttention">관심 26</span>
                    &nbsp•&nbsp
                    <span class="itemChat">채팅 27</span>
                    &nbsp•&nbsp
                    <span class="itemCheck">조회 3794</span>
                </div><!--.countUp-->
                <hr>
            </div><!--.content-wrap-->
            <div class="heartBar-wrap">
                <div class="heartBar">
                    <div class="heartBtn">
                        <i class="xi-heart-o xi-4x"></i>  
                     </div><!--heartBtn-->
                    <div class="priceInfo">
                        <div class="price">10,000원</div>
                        <div class="priceNego">가격 제안 가능</div>
                    </div><!--priceInfo-->
                    <button type="button" class="chatBtn">채팅하기</button>
                </div><!--.heartBar-->
                <hr>
            </div><!--.heartBar-wrap-->
            <div class="comments-wrap">
                <div class="commentsHeader">
                    <div class="commentsCnt">
                        <div class="iconComments">
                            <i class="xi-speech-o xi-2x"></i>
                         </div>
                        <div class="daetgeul">댓글</div>
                        <div class="commentsNum">9</div>
                    </div><!--commentsCnt-->
                    
                    <div class="commentsFilter">
                        <label for="firstComments">
                            <input type="radio" id="firstComments" name="orderBtn" value="firstComments" checked="checked"><span>등록순</span></input>
                        </label>
                        <label for="lastComments">
                            <input type="radio" id="lastComments" name="orderBtn" value="lastComments"><span>최신순</span></input>
                        </label>
                    </div><!--.commentsFilter-->
                </div><!--commentsHeader-->
                
                
                <div class="comments-area">
                    <ul>
                        <li class="comments-list">
                            <div class="commentsProfile-Img"><img src="./resource/img/memberImg.png" alt="회원이미지"></div>
                            <div class="comments-box">
                                    <div class="commentsProfile-Text">
                                        <span class="commentsNickname">그린</span>
                                        <span class="commentsAddress">남구 삼산동</span>
                                    </div>
                                    <div class="comments-textbox">
                                        안녕하세요 여기는 댓글입니다.
                                        <br>
                                        안녕하세요 여기는 댓글입니다.
                                        <br>
                                        안녕하세요 여기는 댓글입니다.
                                    </div>
                                    <div class="commentsInfo">
                                        <span class="commentsInfo-date">2023-04-05 12:12:12</span>
                                        <span class="commentsInfo-replyBtn">
                                            <button type="button" class="replyBtn">답글쓰기</button>
                                        </span>
                                    </div>
                            </div><!--comments-box-->
                        </li>
                        <li class="comments-list reply">
                            <div class="commentsProfile-Img"><img src="./resource/img/memberImg.png" alt="회원이미지"></div>
                            <div class="comments-box">
                                    <div class="commentsProfile-Text">
                                        <span class="commentsNickname">레드</span>
                                        <span class="commentsAddress">남구 달동</span>
                                    </div>
                                    <div class="comments-textbox">
                                        안녕하세요 여기는 대댓글입니다.
                                    </div>
                                    <div class="commentsInfo">
                                        <span class="commentsInfo-date">2023-04-06 15:15:15</span>
                                        <span class="commentsInfo-replyBtn">
                                            <button type="button" class="replyBtn">답글쓰기</button>
                                        </span>
                                    </div>
                            </div><!--comments-box-->
                        </li>
                        <li class="comments-list">
                            <div class="commentsWrite-box">
                                <div class="commentsProfile-Text">
                                    <span class="commentsNickname">블루</span>
                                    <span class="commentsAddress">남구 옥동</span>
                                </div>                     
                                <div class="div-textarea">
                                    <textarea rows="1" placeholder="댓글을 남겨보세요" class="commentsWrite-textarea"></textarea>
                                </div>
                                <div class="commentsWrite-writeBtn">
                                    <button type="button" class="writeBtn"><i class="fa-solid fa-circle-up"></i></button>
                                </div>
                            </div><!--.commentsWrite-box-->
                        </li>
                    </ul>
                    
                </div><!--comments-area-->
            
            </div><!--.comments-wrap-->
        </div><!--.container-->
    </div><!--.wrap-->
</body>
</html>