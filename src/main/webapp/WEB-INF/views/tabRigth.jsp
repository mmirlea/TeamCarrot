<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link href="<c:url value='/resources/css/tabStyle.css'/>"
	rel="stylesheet" />
</head>
<body>
	<div class="divTab">
		<a href="#header">
			<div class="divTabBtn">
				<i class="fas fa-chevron-up"></i>
			</div>
		</a> <a href="<c:url value='/board/write'/>">
			<div class="divTabBtn">
				<i class="fas fa-circle-plus"></i>
			</div>
		</a> <a href="">
			<div class="divTabBtn">
				<i class="fas fa-heart"></i>
			</div>
		</a> <a href="">
			<div class="divTabBtn">
				<i class="far fa-comment-dots"></i>
			</div>
		</a> <a href="">
			<div class="divTabBtn">
				<i class="fa-solid fa-bag-shopping"></i>
			</div>
		</a> <a href="./myProfile.html">
			<div class="divTabBtn">
				<i class="fas fa-user-circle"></i>
			</div>
		</a> <a href="#footer">
			<div class="divTabBtn">
				<i class="fas fa-chevron-down"></i>
			</div>
		</a>
	</div>
	<!--.divTab-->
</body>
</html>