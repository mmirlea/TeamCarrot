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
		<jsp:include page="./tabRigth.jsp" flush="false">
			<jsp:param name="menu" value="board" />
		</jsp:include>

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
							<select name="b_cate" class="boardCategory">
								<option value="주제선택">주제선택</option>
								<option value="동네사건사고">동네사건사고</option>
								<option value="동네맛집">동네맛집</option>
								<option value="동네소식">동네소식</option>
								<option value="생활정보">생활정보</option>
								<option value="취미생활">취미생활</option>
								<option value="일상">일상</option>
								<option value="분실/실종센터">분실/실종센터</option>
								<option value="해주세요">해주세요</option>
								<option value="동네사진전">동네사진전</option>
							</select>
						</div>

                        <div class="divWrite">
                            <a href="<c:url value='/board/write?menu=board'/>">
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
	                            <a href="<c:url value='/board/read?${ph.sc.getQueryString()}&menu=board&b_num=${boardDTO.b_num}'/>">
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
	                                    <p class="content"><c:out value='${boardDTO.b_content }'/> <!-- 본문내용 -->
	                                    <div class="textInfo">
	                                        <div class="divInfo">
	                                            <p class="local">${boardDTO.userDTO.m_addr1}</p> <!-- 위치 -->
	                                            &nbsp;•&nbsp;
	                                           <!--  <p class="time" onblur="timeForToday('boardDTO.b_crDate')"></p> --> <!-- 시간 -->
	                                            <p class="time" >${boardDTO.b_upDate}</p> <!-- 시간 -->
	                                            &nbsp;•&nbsp;
	                                            <p class="look">${boardDTO.b_viewCnt}</p> <!-- 조회 -->
	                                        </div>
	                                        <div class="Atten">
	                                            <p class="heart">
	                                                <!-- <i class="far fa-heart"></i> -->
	                                                <i class="fas fa-heart"></i>
	                                                &nbsp;
	                                                <p>${boardDTO.b_likey}</p>
	                                            </p> <!-- 관심 -->
	                                            &nbsp;&nbsp;&nbsp;
	                                            <p class="chat">
	                                                <!-- <i class="far fa-comment"></i> -->
	                                                <i class="fas fa-comment"></i>
	                                                &nbsp;
	                                                <p>${boardDTO.b_comm}</p>
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

			<div class="paging">
				<div class="pageList">
					<ul>
						<li class="firstPage">
							<c:if test="${ph.showPrev}">
			       				<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1)}'/>"> 
			       				<p>&lt;&lt;</p>
			       				</a>  
			       			</c:if>
		       			</li>
		       	
		       			<li class="prevPage">
		       				<c:if test="${ph.showPrev}">
			       				<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1)}'/>"> 
			       				<p>&lt;</p>
			       				</a>   
			       			</c:if>
		       			</li>
		       			
		       			<li class="num">
					       	<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
					       		<a href="<c:url value='/board/list${ph.sc.getQueryString(i)}'/>"> 
					       		<p>${i}</p>
					       		</a>
					       	</c:forEach>
				       	</li>
				       	
				       	<li class="nextPage">
					       	<c:if test="${ph.showNext}">
					       		<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage+1)}'/>">
					       		<p>&gt;</p>
			       				</a>   
					       	</c:if>
				       	</li>
				       	
				       	<li class="lastPage">
					       	<c:if test="${ph.showNext}">
					       		<a href="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage+1)}'/>">
								<p>&gt;&gt;</p>
			       				</a>    
					       	</c:if>
				       	</li>
				   	</ul>
				</div> <!--pageList-->
			</div> <!--paging-->

		</div> <!--.container-->

       <%@ include file ="./footer.jsp" %>

		<script type="text/javascript">
			 $(document).ready(function() {
				 document.querySelectorAll('.time').forEach(($time)=>{
					 const time = $time.innerText
					 console.log(timeForToday(time),new Date(time));
					 $time.innerText = timeForToday(time);
				 })
				
			 }) 
			function timeForToday(value) {
				const today = new Date();
		        const timeValue = new Date(value);
		
		        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
		        console.log(betweenTime);
		        if (betweenTime < 1) return '방금전';
		        if (betweenTime < 60) {
		            return betweenTime + '분전';
		        }
		
		        const betweenTimeHour = Math.floor(betweenTime / 60);
		        if (betweenTimeHour < 24) {
		            return betweenTimeHour + '시간전';
		        }
		
		        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
		        if (betweenTimeDay < 365) {
		            return betweenTimeDay + '일전';
		        }
		
		        return Math.floor(betweenTimeDay / 365) + '년전';
		 	}
    </script>
	</div> <!--.wrap-->
</body>
</html>