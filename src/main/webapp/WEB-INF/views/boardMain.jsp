<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/boardStyle.css'/>" rel="stylesheet" />
</head>
<body>
	<div class="wrap">
		<%@ include file ="./header.jsp" %>
		<div class="container">
			<div class="mainBanner">
                <!-- <a href="#"><img src="./resource/img/동네소식.png" alt="게시판"></a> -->
            </div>

            <div class="board">
                <div class="boardMenu">
                    <h1>동네생활</h1>

                    <div class="divA">
                        <div class="divSelect">
                            <select name="boardCategory" class="boardCategory">
                                <option value="opDefault">주제선택</option>
                                <option value="opAccident">동네사건사고</option>
                                <option value="opRestaurant">동네맛집</option>
                                <option value="opNews">동네소식</option>
                                <option value="opLifeInfo">생활정보</option>
                                <option value="opHobby">취미생활</option>
                                <option value="opDaily">일상</option>
                                <option value="opLost">분실/실종센터</option>
                                <option value="opPlease">해주세요</option>
                                <option value="opPhoto">동네사진전</option>
                            </select>
                        </div>

                        <div class="divWrite">
                            <a href="<c:url value='/board/write'/>">
                                <button class="btnWrite">
                                    <i class="fas fa-circle-plus"></i>
                                </button>
                            </a>
                        </div>
                    </div>
                </div> <!--.boardMenu-->

                <div class="boradList">
                    <ul>
                        <!-- 첫째줄 -->
                        <li class="item">
                            <a href="<c:url value='/board/read'/>">
                                <div class="areaThumb">
                                    <!-- <i class="fa-thin fa-rectangle-xmark"></i> -->
                                    <!-- <p class="pLine"></p> -->
                                    <img src="./resource/img/notice.png" alt="" class="thumb">
                                </div> <!--.areaThumb, 리스트 이미지-->

                                <div class="areaText">
                                    <!-- <i class="fa-brands fa-horizontal-rule"></i> 이미지 없으면 선 -->
                                    <strong class="category">생활정보</strong> <!-- 카테고리 -->
                                    <br>
                                    <strong class="titleEll">쇼파옮기기..</strong> <!-- 제목 -->
                                    <p class="content">쇼파하나를 구매하려는데 쇼파하나만 용달하려면 얼마쯤 들까요?</p> <!-- 본문내용 -->
                                    <div class="textInfo">
                                        <div class="divInfo">
                                            <p class="local">삼산동</p> <!-- 위치 -->
                                            &nbsp;•&nbsp;
                                            <p class="time">23분전</p> <!-- 시간 -->
                                            &nbsp;•&nbsp;
                                            <p class="look">조회20</p> <!-- 조회 -->
                                        </div>
                                        <div class="Atten">
                                            <p class="heart">
                                                <!-- <i class="far fa-heart"></i> -->
                                                <i class="fas fa-heart"></i>
                                                &nbsp; 1
                                            </p> <!-- 관심 -->
                                            &nbsp;&nbsp;&nbsp;
                                            <p class="chat">
                                                <!-- <i class="far fa-comment"></i> -->
                                                <i class="fas fa-comment"></i>
                                                &nbsp; 1
                                            </p> <!-- 댓글 -->
                                        </div>
                                    </div>
                                </div> <!--.areaText, 리스트 제목-->
                            </a>
                        </li>

                        <!-- 둘째줄 -->

                        <!-- 셋째줄 -->

                        <!-- 넷째줄 -->

                    </ul>

                </div> <!--.boradList-->
            </div> <!--.board-->

            <div class="boardPage">
                <div class="pageList">
                    <ul>
                        <li class="firstPage"><a href="#">
                                <p>첫 페이지</p>
                            </a></li>
                        <li class="prevPage"><a href="#">
                                <p>이전 페이지</p>
                            </a></li>
                        <li class="num"><a href="#">
                                <p>1</p>
                            </a></li>
                        <li class="num"><a href="#">
                                <p>2</p>
                            </a></li>
                        <li class="num"><a href="#">
                                <p>3</p>
                            </a></li>
                        <li class="nextPage"><a href="#">
                                <p>다음 페이지</p>
                            </a></li>
                        <li class="lastPage"><a href="#">
                                <p>마지막 페이지</p>
                            </a></li>
                    </ul>
                </div><!--pageList-->
                <hr>
            </div> <!--.boardCount-->
        </div> <!--.container-->

       <%@ include file ="./footer.jsp" %>
    </div> <!--.wrap-->
</body>
</html>