<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
		<%@ include file ="./tabRigth.jsp" %>
		
		<script>
			let msg = "${msg}";
			if (msg == "DEL_OK")
				alert("게시글이 삭제되었습니다.");
			if (msg == "DEL_ERR")
				alert("게시글 삭제에 실패하였습니다.");
			if (msg == "LIST_ERR")
				alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
			if (msg == "WRT_OK")
				alert("성공적으로 등록되었습니다.");
			if (msg == "MOD_OK")
				alert("게시글 수정을 성공하였습니다.");
		</script>
	
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
                        <c:forEach var="boardDTO" items="${list}">
	                        <li class="item">
	                        	<input type="hidden" value="${boardDTO.b_num} " name="b_num">
	                            <a href="<c:url value='/board/read?b_num=${boardDTO.b_num}'/>">
	                            <!-- ${ph.sc.getQueryString() } -->
	                                <div class="areaThumb">
	                                    <!-- <i class="fa-thin fa-rectangle-xmark"></i> -->
	                                    <!-- <p class="pLine"></p> -->
	                                    <img src="./resources/img/notice.png" alt="" class="thumb">
	                                   <!--  <img src="./resource/img/notice.png" alt="" class="thumb"> -->
	                                </div> <!--.areaThumb, 리스트 이미지-->
	
	                                <div class="areaText">
	                                    <!-- <i class="fa-brands fa-horizontal-rule"></i> 이미지 없으면 선 -->
	                                    <strong class="category" >${boardDTO.b_cate }</strong> <!-- 카테고리 -->
	                                    <br>
	                                    <strong class="titleEll">${boardDTO.b_title}</strong> <!-- 제목 -->
	                                    <p class="content"><c:out value='${boardDTO.b_content }'/>/p> <!-- 본문내용 -->
	                                    <div class="textInfo">
	                                        <div class="divInfo">
	                                            <p class="local">${boardDTO.userDTO.m_addr1}</p> <!-- 위치 -->
	                                            &nbsp;•&nbsp;
	                                            <p class="time"></p>${boardDTO.b_crDate} <!-- 시간 -->
	                                            &nbsp;•&nbsp;
	                                            <p class="look" >${boardDTO.b_viewCnt}</p> <!-- 조회 -->
	                                        </div>
	                                        <div class="Atten">
	                                            <p class="heart">
	                                                <!-- <i class="far fa-heart"></i> -->
	                                                <i class="fas fa-heart"></i>
	                                                <p value="${boardDTO.b_likey}"></p>
	                                            </p> <!-- 관심 -->
	                                            &nbsp;&nbsp;&nbsp;
	                                            <p class="chat">
	                                                <!-- <i class="far fa-comment"></i> -->
	                                                <i class="fas fa-comment"></i>
	                                                <p value="${boardDTO.b_comm}"></p>
	                                            </p> <!-- 댓글 -->
	                                        </div>
	                                    </div>
	                                </div> <!--.areaText, 리스트 제목-->
	                            </a>
	                        </li>
						</c:forEach>
                    </ul>

                </div> <!--.boradList-->
            </div> <!--.board-->

		<div>
			<c:if test="${ph.showPrev}">
	       		<a href="<c:url value='/board/list${ph.sc.getQueryString(1)}'/>"> &lt;&lt;</a>   
	       	</c:if>
	       	
	       	<c:if test="${ph.showPrev}">
	       		<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1)}'/>"> &lt;</a>   
	       	</c:if>
	       	
	       	<c:forEach var="i" begin="${ph.frPage}" end="${ph.endPage}">
	       		<a class="num" href="<c:url value='/board/list${ph.sc.getQueryString(i)}'/>"> ${i}</a>
	       	</c:forEach>
	       	
	       	<c:if test="${ph.showNext}">
	       		<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage+1)}'/>"> &gt;</a>   
	       	</c:if>
	       	<c:if test="${ph.showNext}">
	       		<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.totalPage)}'/>"> &gt;&gt;</a>   
	       	</c:if>
	     </div>
     
            <div class="boardPage">
                <div class="pageList">
                    <ul>
                        <li class="firstPage"><a href="#">
                                <p>첫 페이지</p>
                            </a></li>
                        <!-- <li class="prevPage"><a href="#">
                                <p>이전 페이지</p>
                            </a></li> -->
                        <li class="prevPage">
                        	<c:if test="${ph.showPrev}">
								<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1)}'/>"> &lt;</a>   
	       					</c:if>
						</li>
                        <li class="num"><a href="#">
                                <p>1</p>
                            </a></li>
                        <li class="num">
							<c:forEach var="i" begin="${ph.frPage}" end="${ph.endPage}">
	       						<a href="<c:url value='/board/list${ph.sc.getQueryString(i)}'/>"> ${i}</a>
	       					</c:forEach>
                        </li>
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