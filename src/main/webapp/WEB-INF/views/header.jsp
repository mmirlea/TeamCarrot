<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/headerStyle.css'/>" rel="stylesheet" />
</head>
<body>

<c:set var="loginOutLink" value="${sessionScope.m_email==null ? '/login/login' : '/login/logout'}" />
<c:set var="loginOut" value="${sessionScope.m_email==null ? '로그인/회원가입' : '로그아웃'}" />

	 <div class="header">
            <div class="headerIn ">
                <div class="hTop">
                    <div class="divLogo">
                            <a href="<c:url value='/'/>">

                            <img src="../resources/img/DaangnMarket_logo.png" alt="당근마켓로고"/>

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

                <div class="hBottom">
                    <div class="d"></div>
                    <div class="searchLocal">
                        <div class="search">
                            <input type="text" name="txtSearch" class="txtSearch" placeholder="찾으실 항목을 입력하세요">
                            <button type="submit" class="btnSearch">
                                <i class="fas fa-chevron-circle-right"></i>
                                <!-- <i class="xi-heart"></i> -->
                            </button>
                        </div>
                    </div> <!--.searchLocal-->

                    <div class="divChat">
                        <button class="btnChat">
                            <!-- <i class="fas fa-comment-dots"></i> -->
                            <i class="far fa-comment-dots"></i>

                            <!-- <i class="fas fa-bullhorn"></i> -->
                            <!-- 공지사항 -->
                        </button>
                    </div>

                    <div class="divSetLocal">
                        <select name="region" class="region">
                            <option value="opRegion">지역을 선택하세요</option>
                        </select>
                        <select name="town" class="town">
                            <option value="opTown">동네를 선택하세요</option>
                        </select>
                    </div> <!--.divSetLocal-->
                </div> <!--.hBottom-->
            </div><!--.headIn-->
        </div> <!--.header-->
</body>
</html>