<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/junggoDetailStyle.css'/>" rel="stylesheet" />
<!-- swiper cdn -->
<link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/c0e3b26a7d.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<div class="wrap">
	
		<%@ include file ="./header.jsp" %>
		<%@ include file ="./tabRigth.jsp" %>
        <div class="container">
            <div class="swiper-modify">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img src="../resources/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></a></div>
                    <div class="swiper-slide"><a href="#"><img src="../resources/img/이사가느라 가전 팔아요2.jpg" alt="이사가느라 가전 팔아요2"></a></div>
                    <div class="swiper-slide"><a href="#"><img src="../resources/img/이사가느라 가전 팔아요3.jpg" alt="이사가느라 가전 팔아요3"></a></div>
                    </div><!--swiper-wrapper-->
                    <div class="swiper-pagination"></div>
                </div><!--swiper mySwiper-->  
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div><!--.swiper-modify-->
            <div class="memberAll">
                <div class="member-wrap">
                    <div class="memberInfo-wrap">
                        <div class="memberInfo-Img"><img src="../resources/img/memberImg.png" alt="회원이미지"></div>
                        <div class="memberInfo-Text">

                            <div class="nickname">${menu == "board" ? boardDTO.userDTO.m_nicknm : productDTO.userDTO.m_nicknm}</div>
                            <div class="memberAddress">
                              <span>${menu == "board" ? boardDTO.userDTO.m_addr1 : productDTO.userDTO.m_addr1}</span>
                              <span>${menu == "board" ? boardDTO.userDTO.m_addr2 : productDTO.userDTO.m_addr2}</span>
                            </div>

                        </div><!--memberInfo-Text-->
                    </div><!--memberInfo-wrap-->
                    <div class="memberOndo-wrap">
                        <div class="memberOndo-Text">
                            <div class="ondo">
                                <span class="ondoNum">${productDTO.userDTO.m_ondo }</span>
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


            	<h1 class="contentTitle">${menu == 'board' ? boardDTO.b_title : productDTO.b_title}</h1><!--.contentTitle-->
                <div class="contentInfo">
                    <span class="categry">${menu == "board" ? boardDTO.b_cate : productDTO.b_cate}</span>
                    &nbsp;•&nbsp;

                    <span class="pullUp">끌올</span>
                    &nbsp;
                    <span class="ctime">1${menu == "board" ? boardDTO.b_upDate : productDTO.p_update}<span>
                </div><!--contentInfo-->
                <div class="content">

                    <c:out value='${menu == "board" ? boardDTO.b_content : productDTO.p_content}'/>
                </div><!--content-->
                <div class="countUp">
                    <span class="itemAttention">관심 ${menu == "board" ? boardDTO.b_likey : productDTO.p_likey}</span>
                    &nbsp;•&nbsp;
                    <span class="itemChat">채팅 ${menu == "board" ? boardDTO.b_comm : productDTO.p_comm}</span>
                    &nbsp;•&nbsp;
                    <span class="itemCheck">조회 ${menu == "board" ? boardDTO.b_viewCnt : productDTO.p_viewCnt}</span>
                </div><!--.countUp-->
                <hr>
            </div><!--.content-wrap-->
            <c:if test="${menu != 'board' }">
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
            </c:if>

            <div class="comments-wrap">
                <div class="commentsHeader">
                    <div class="commentsCnt">
                        <div class="iconComments">
                            <i class="xi-speech-o xi-2x"></i>
                         </div>
                        <div class="daetgeul">댓글</div>
                        <div class="commentsNum">${productDTO.p_comm}</div>
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
                            <div class="commentsProfile-Img"><img src="../resources/img/memberImg.png" alt="회원이미지"></div>
                            <div class="comments-box">
                                    <div class="commentsProfile-Text">
                                        <span class="commentsNickname">블루</span>
                                        <span>주소1 </span>
                                        <span>주소2</span>
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
                            <div class="commentsProfile-Img"><img src="../resources/img/memberImg.png" alt="회원이미지"></div>
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