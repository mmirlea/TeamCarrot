<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
menu = '<%= request.getParameter("menu") %>'
console.log(menu);
$(document).ready(function() {
	$('#wirte').on('click',()=>{
		if(menu ==  "product"){
			window.location.href= window.location.origin+"/carrot/carrot/write?menu="+menu
		
		}else {
			window.location.href= window.location.origin+"/carrot/board/write?menu="+menu
		}
	
	})
})
</script>
	<form class="divTab">
		<a href="#header">
			<div class="divTabBtn">
				<i class="fas fa-chevron-up"></i>
			</div>
		</a>
		<a id ="wirte">
			<div class="divTabBtn">
				<i class="fas fa-circle-plus"></i>
			</div>
		</a>
		 <a href="">
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
	</form> <!--.divTab-->
	
<!-- 	<script type="text/javascript">
	$(document).ready(function() {
		$("#wirte").on("click", function() {
			let form = $('#form');
			if($(location).attr("search") == "?menu=product"){
				form.attr("action", "<c:url value='/carrot/chkLogin'/>");
				form.attr("method", "get");
	
				form.submit();
			} else {
				form.attr("action", "<c:url value='/board/chkLogin'/>");
				form.attr("method", "get");
	
				form.submit();
			}
			
		})
	})
	</script> -->
</body>
</html>