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
<link href="<c:url value='/resources/css/headerStyle.css?b'/>" rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<body>

<c:set var="loginOutLink" value="${sessionScope.m_email==null ? '/login/login' : '/login/logout'}" />
<c:set var="loginOut" value="${sessionScope.m_email==null ? '로그인/회원가입' : '로그아웃'}" />
<c:set var="menu" value="${param.menu}"/>
<c:set var="detail" value="${param.detail}"/>
	<div class="header">
		<div class="headerIn ">
			<div class="hTop">
				<div class="divLogo">
					<a href="<c:url value='/'/>"> <img src="/carrot/resources/img/DaangnMarket_logo.png" alt="당근마켓로고" />
						<p>당근마켓</p>
					</a>
				</div>
				<div class="gnb">
					<ul>
						<li><a href="<c:url value='/carrot/junggoMain'/>" class="gnbMenu">중고거래</a></li>
						<li><a href="<c:url value='/board/list'/>" class="gnbMenu">동네소식</a></li>
					</ul>
				</div>
				<div class="member">
					<ul>
						<li><a href="<c:url value='${loginOutLink}'/>" class="meMenu">${loginOut}</a></li>
						<li><a href="/carrot/mypage/home" class="meMenu">마이페이지</a></li>
					</ul>
				</div>
			</div> <!--.hTop-->
			<c:choose>
				<c:when test="${menu eq 'product'}">
					<form id="form" action="<c:url value="/carrot/junggoMain"/>" method="get">
				</c:when>
				<c:when test="${menu eq 'board'}">
					<form action="<c:url value="/board/list"/>" method="get" name="cateForm">
				</c:when>
			</c:choose>
			
				<div class="hBottom">
					<div class="d"></div>
					<div class="searchLocal">
						<div class="search">
							<input type="text" name="keyword" class="txtSearch" id="keyword" value="${param.keyword}" placeholder="찾으실 항목을 입력하세요">
							<button type="submit" class="btnSearch">
								<i class="fas fa-chevron-circle-right"></i>
							</button>
						</div>
					</div>
					<!--.searchLocal-->

					<div class="divChat">
						<button class="btnChat">
							<i class="far fa-comment-dots"></i>
						</button>
					</div>
					<select id="searchMenu" name="searchOption" class="searchOption">
						<option value="all">전체</option>
						<option value="product">중고거래</option>
						<option value="board">동네소식</option>
					</select>

					<div class="divSetLocal">
						<select name="addr1" class="region" id="region">
							<option value="opRegion" ${addr1=='opRegion' ? "selected" : ""}>지역을 선택하세요</option>
							<option value="울산광역시 북구" ${addr1=='울산광역시 북구' ? "selected" : ""}>울산광역시 북구</option>
							<option value="울산광역시 동구" ${addr1=='울산광역시 동구' ? "selected" : ""}>울산광역시 동구</option>
							<option value="울산광역시 남구" ${addr1=='울산광역시 남구' ? "selected" : ""}>울산광역시 남구</option>
							<option value="울산광역시 중구" ${addr1=='울산광역시 중구' ? "selected" : ""}>울산광역시 중구</option>
						</select>
						
					</div> <!--.divSetLocal-->
				</div> <!--.hBottom-->
				<c:if test="${menu eq 'product' && detail eq 'no'}" >
			        	<div class="category-wrap">
			                <ul>
			                    <li class="categoryItem">
			                    	<input type="radio" id="all" class="categoryBtn" name="cate" value="all">
			                    	<label for="all">
			                        	<i class="fa-solid fas fa-star"></i> 
			                            <div class="categoryText">전체</div>
			                         </label>
			                    </li>
			                    <li class="categoryItem">
			                    	<input type="radio" id="digital" class="categoryBtn" name="cate" value="digital">
			                    	<label for="digital">
			                            <i class="fa-solid fas fa-laptop"></i> 
			                            <div class="categoryText">디지털기기/가전</div>
			                        </label>
			                    </li>
			                    <li class="categoryItem">
			                       <input type="radio" id="furniture" class="categoryBtn" name="cate" value="furniture">
			                       <label for="furniture">	
			                            <i class="fa-solid fas fa-couch"></i>
			                            <div class="categoryText">가구/인테리어</div>
			                        </label>
			                    </li>
			                    <li class="categoryItem">
			                        <input type="radio" id="kitchen" class="categoryBtn" name="cate" value="kitchen">
			                        <label for="kitchen">
			                            <i class="fa-solid fas fa-kitchen-set"></i>
			                            <div class="categoryText">생활/주방</div> 
			                        </label>
			                    <li class="categoryItem">
			                        <input type="radio" id="baby" class="categoryBtn" name="cate" value="baby">
			                        <label for="baby">
			                            <i class="fa-solid fas fa-baby-carriage"></i>
			                            <div class="categoryText">유아용품</div>
			                        </label>
			                    </li>
			                    <li class="categoryItem">
			                        <input type="radio" id="clothes" class="categoryBtn" name="cate" value="clothes">
			                        <label for="clothes">
			                            <i class="fa-solid fas fa-shirt"></i>
			                            <div class="categoryText">의류</div>
			                        </label>
			                    </li>
			                    <li class="categoryItem">
			                    	<input type="radio" id="book" class="categoryBtn" name="cate" value="book">
			                        <label for="book">
			                            <i class="fa-solid fas fa-book"></i>
			                            <div class="categoryText">도서</div>
			                        </label>
			                    </li>
			                    <li class="categoryItem">
			                        <input type="radio" id="ticket" class="categoryBtn" name="cate" value="ticket">
			                        <label for="ticket">
			                            <i class="fa-solid fas fa-ticket"></i> 
			                            <div class="categoryText">티켓/교환권</div>
			                        </label>
			                    <li class="categoryItem">
			                    	<input type="radio" id="etc" class="categoryBtn" name="cate" value="etc">
			                        <label for="etc">
			                            <i class="fa-solid fas fa-box"></i>
			                            <div class="categoryText">기타 중고물품</div>
			                        </label>
			                    </li>
			                </ul>
			            </div>
					</c:if>	         
			</form>
		</div> <!--.headIn-->
	</div> <!--.header-->
	
<script type="text/javascript">
	$(document).ready(function() {
		$(".categoryBtn").change(function(){
			let form = $('#form');
													
			form.submit();
			
		})
		
		$('#form #keyword').each(function(){
			$(this).val("");
		})
		$('#form #searchMenu').each(function(){
			$(this).val("all");
		})
		$('#form #region').each(function(){
			$(this).val("opRegion");
		})
				
	})
</script>
</body>
</html>