<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<c:url value='/resources/css/junggoDetailStyle.css?sss'/>"
	rel="stylesheet" />

<!-- swiper cdn -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/c0e3b26a7d.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<%
String menu = request.getParameter("menu");
%>
<script type="text/javascript">
	let menu = '<%=request.getParameter("menu")%>'
	let msg="${msg}"
	//if(msg == "MOD_ERR") alert("게시글 수정에 실패하였습니다.")
	if(msg == "DEL_ERR") alert("게시글 삭제에 실패하였습니다.")
</script>
<body>
	<form class="wrap" id="form">

		<jsp:include page="./header.jsp" flush="false">
			<jsp:param name="detail" value="detail" />
		</jsp:include>
		<%@ include file="./tabRigth.jsp"%>
		<div class="container">
			<div class="swiper-modify">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="#"><img
								src="${menu == 'board' ? boardDTO.b_img : productDTO.p_img}"
								alt="" class="thumb"
								onerror="this.src='/carrot/resources/img/이사가느라 가전 팔아요1.jpg'"></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img src="../resources/img/이사가느라 가전 팔아요1.jpg"
								alt="이사가느라 가전 팔아요1"></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img src="../resources/img/이사가느라 가전 팔아요2.jpg"
								alt="이사가느라 가전 팔아요2"></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img src="../resources/img/이사가느라 가전 팔아요3.jpg"
								alt="이사가느라 가전 팔아요3"></a>
						</div>
					</div>
					<!--swiper-wrapper-->
					<div class="swiper-pagination"></div>
				</div>
				<!--swiper mySwiper-->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
			<!--.swiper-modify-->
			<div class="memberAll">
				<div class="member-wrap">
					<div class="memberInfo-wrap">
						<div class="memberInfo-Img">
							<img src="../resources/img/memberImg.png" alt="회원이미지">
						</div>
						<div class="memberInfo-Text">

							<div class="nickname">${menu == "board" ? boardDTO.userDTO.m_nicknm : productDTO.userDTO.m_nicknm}</div>
							<div class="memberAddress">
								<span>${menu == "board" ? boardDTO.userDTO.m_addr1 : productDTO.userDTO.m_addr1}</span>
								<span>${menu == "board" ? boardDTO.userDTO.m_addr2 : productDTO.userDTO.m_addr2}</span>
							</div>

						</div>
						<!--memberInfo-Text-->
					</div>
					<!--memberInfo-wrap-->
					<div class="memberOndo-wrap">
						<div class="memberOndo-Text">
							<div class="ondo">
								<span class="ondoNum">${productDTO.userDTO.m_ondo }</span> <span
									class="celsius">°C</span> <span class="celsius"></span>
							</div>
							<!--ondo-->
							<div class="ondoBar"></div>
						</div>
						<div class="memberOndo-right">
							<div class="ondoFace"></div>
						</div>
					</div>
					<!--memberOndo-wrap-->
				</div>
				<!--member-wrap-->
				<div class="mannerOndo">매너온도</div>
				<hr>
			</div>
			<!--memberAll-->
			<div class="content-wrap">

				<div class="content-top">
					<h1 class="contentTitle">${menu == 'board' ? boardDTO.b_title : productDTO.p_title}</h1>
					<!--.contentTitle-->
				</div>

				<div class="contentInfo">
					<span class="categry">${menu == "board" ? boardDTO.b_cate : productDTO.p_cate}</span>
					&nbsp;•&nbsp; <span class="pullUp">끌올</span> &nbsp;•&nbsp; <span
						class="time">${menu == "board" ? boardDTO.b_upDate : productDTO.p_update}</span>
				</div>
				<!--contentInfo-->
				<div class="content">

					<c:out
						value='${menu == "board" ? boardDTO.b_content : productDTO.p_content}' />
				</div>
				<!--content-->
				<div class="countUp">
					<span class="itemAttention">관심 ${menu == "board" ? boardDTO.b_likey : productDTO.p_likey}</span>
					&nbsp;•&nbsp; <span class="itemChat">채팅 ${menu == "board" ? boardDTO.b_comm : productDTO.p_comm}</span>
					&nbsp;•&nbsp; <span class="itemCheck">조회 ${menu == "board" ? boardDTO.b_viewCnt : productDTO.p_viewcnt}</span>
				</div>
				<!--.countUp-->
				<hr>
			</div>
			<!--.content-wrap-->
			<div class="heartBar-wrap">
				<div class="heartBar">
					<div class="heartBtn">
						<button type="button" class="likey" id="btnLikey"
							name='${menu == "board"? "b_likey" : "p_likey"}'>
							<i class="far fa-heart"></i>
						</button>
						<button type="button" class="disLikey" id="btnDisLikey"
							name='${menu == "board"? "b_likey" : "p_likey"}'>
							<i class="fas fa-heart"></i>
						</button>
					</div>
					<!--heartBtn-->
					<c:if test="${menu ne 'board' }">
						<div class="priceInfo">
							<div class="price">${productDTO.p_price }원</div>
							<div class="priceNego">가격 제안 가능</div>
						</div>
						<!--priceInfo-->
					</c:if>

					<c:if
						test="${login_email != null && (login_email == productDTO.p_email || login_email == boardDTO.b_email)}">
						<div class="crud-wrap">
							<input type="hidden"
								value="${menu eq 'board' ? boardDTO.b_num : 0}" name="b_num"
								id="b_num"> <input type="hidden"
								value="${menu eq 'product' ? productDTO.p_num : 0}" name="p_num"
								id="p_num">
							<button type="button" class="btnModify" id="btnModify"
								value="board">수정</button>
							<button type="button" class="btnDel" id="btnDel">삭제</button>
						</div>
					</c:if>

					<button type="button" class="chatBtn">채팅하기</button>
				</div>
				<!--.heartBar-->
				<hr>
			</div>
			<!--.heartBar-wrap-->
		</div>
		<!-- .container -->

	</form>
	<!--.wrap-->


	<form class="wrap" id="commFrm">
		<div class="comments-wrap">
			<div class="commentsHeader">
				<div class="commentsCnt">
					<div class="iconComments">
						<i class="xi-speech-o xi-x"></i>
					</div>
					<div class="daetgeul">댓글</div>
					<div class="commentsNum">${productDTO.p_comm}</div>
				</div>
				<!--commentsCnt-->

				<div class="commentsFilter">
					<label for="firstComments"> <input type="radio"
						id="firstComments" class="orderBtn" name="orderBtn"
						value="firstComments" checked="checked"><span>등록순</span>
					</label> <label for="lastComments"> <input type="radio"
						id="lastComments" class="orderBtn" name="orderBtn"
						value="lastComments"><span>최신순</span>
					</label>
				</div>
				<!--.commentsFilter-->
			</div>
			<!--commentsHeader-->
		</div>
		<!--.comments-wrap-->
	</form>
	<!-- 댓글 표시 -->
	<div id="commentsList"></div>

	<div id="replyForm" style="display: none" class="commentsWrite-box">
		<textarea rows="3" class="commentsWrite-textarea" name="replyContent"
			placeholder="대댓글을 남겨보세요"></textarea>
		<button type="button" class="replyBtn" id="wrtRepBtn">등록</button>
		<button type="button" class="replyBtn" id="RepBtnHide">취소</button>
	</div>
	<c:if test="${login_email != null}">
		<div class="commentsWrite-box">
			<div class="commentsProfile-Img">
				<c:choose>
					<c:when test="${userDTO.m_proimg eq null}">
						<img src="../resources/img/memberImg.png" alt="회원이미지">
					</c:when>
					<c:otherwise>
						<img src="/proimg/${userDTO.m_proimg}" alt="프로필 사진">
					</c:otherwise>
				</c:choose>

			</div>
			<div class="commentsWrtR">
				<div class="commentsProfile-Text">
					<span class="commentsNickname">${userDTO.m_nicknm}</span> <span
						class="commentsAddr"> ${userDTO.m_addr1 }</span> <span
						class="commentsAddr"> ${userDTO.m_addr2 }</span> <input
						type="hidden" name='${menu == "board"? "cb_nicknm" : "cp_nicknm"}'
						value="${userDTO.m_nicknm}">
				</div>
				<div class="div-textarea">
					<textarea rows="3" placeholder="댓글을 남겨보세요"
						class="commentsWrite-textarea"
						name='${menu == "board"? "cb_content" : "cp_content"}'></textarea>
					<!-- <input type="text" name="cp_content"> <br> -->
				</div>
				<div class="commentsWrite-writeBtn">
					<button id="modBtn" type="button" style="display: none">수정확인</button>
					<button type="button" class="writeBtn" id="sendBtn">
						<i class="fa-solid fa-circle-up"></i>
					</button>
				</div>
			</div>
			<!-- <button id="sendBtn" type="button">SEND</button> -->

		</div>
	</c:if>

	<%@ include file="./footer.jsp"%>
	<script>
    	if(${menu eq 'board'}){
    		//게시판 댓글 출력
    		//댓글 관련-----------------------------------------------

    		let cb_pnum = Math.max(0,${boardDTO.b_num});
    		//let cb_pnum=${productDTO.p_num};

    		
    		//댓글 리스트
    		let showList = function(cb_pnum){
    			$.ajax({
    				type: 'GET',
    				url: '/carrot/commentsb?cb_pnum=' + cb_pnum,
    				success : function(result){
    					$("#commentsList").html(toHtml(result));
    				},
    				error : function(){alert("error")}
    			});
    		}
    		
    		//댓글 작성
    		$(document).ready(function(){
    			//목록 보이기
    			showList(cb_pnum);
    			
    			$("#sendBtn").click(function(){
    				let cb_content = $("textarea[name=cb_content]").val();
    				let cb_nicknm = $("input[name=cb_nicknm]").val();
    				if(cb_content.trim() == ''){
    					alert("댓글을 입력하세요!")
    					$("textarea[name=cb_content]").focus();
    					return;
    				}
    				
    				$.ajax({
    					type: 'POST',
    					url: '/carrot/commentsb?cb_pnum=' + cb_pnum + '&cb_nicknm=' + cb_nicknm,
    					headers : {"content-type" : "application/json"},
    					data : JSON.stringify({cb_pnum:cb_pnum, cb_content:cb_content}),
    					success : function(result){
    						alert(result);
    						showList(cb_pnum);
    					},
    					error : function(){alert("error")}
    				});
    				
    				$("textarea[name=cb_content]").val("");
    			})
    			
    			//답글 달기
    			$("#commentsList").on("click", ".replyBtn", function(){
    				
    				$("#replyForm").appendTo($(this).parent());
    				$("#replyForm").css("display", "block");
    				
    				let cb_pcnum = $(this).parent().parent().attr("data-cb_num");
    				cb_pcnum = parseInt(cb_pcnum);
    			    $("#replyForm").attr("data-cb_pcnum", cb_pcnum);
    			})
    			
    			$("#wrtRepBtn").click (function(){
    				let cb_content = $("textarea[name=replyContent]").val();
    				let cb_pcnum = $("#replyForm").attr("data-cb_pcnum");
    				let cb_nicknm = $("input[name=cb_nicknm]").val();
    				
    				if(cb_content.trim() == ''){
    					alert("댓글을 입력하세요!")
    					$("textarea[name=replyContent]").focus();
    					return ;
    				}
    				
    				$.ajax({
    					type:'POST',
    					url: '/carrot/commentsb?cb_pnum=' + cb_pnum  + '&cb_nicknm=' + cb_nicknm,
    					headers : {"content-type" : "application/json"},
    					data : JSON.stringify({cb_pnum:cb_pnum, cb_pcnum:cb_pcnum, cb_content: cb_content}),
    					success : function(result){
    						alert(result);
    						showList(cb_pnum);
    					},
    					error : function(){alert("error")}
    				});
    				$("#replyForm").css("display","none");
    				$("textarea[name=replyContent]").val('');
    				$("#replyForm").appendTo("body");
    			})
    			
    			//답글 달기 취소 클릭 시
    			$(function(){
    				$("#RepBtnHide").click(function(){
    					$("#replyForm").hide();
    				})
    			})
    			
    			//댓글 삭제
    			$("#commentsList").on("click", ".delBtn", function(){
    				let cb_num=$(this).parent().parent().attr("data-cb_num");
    				let cb_pnum=$(this).parent().parent().attr("data-cb_pnum");
    				
    				$.ajax({
    					type:"DELETE",
    					url: '/carrot/commentsb/' + cb_num + '?cb_pnum=' + cb_pnum,
    					success : function(result){
    						alert(result);
    						showList(cb_pnum);
    					},
    					error : function(){alert("error")}
    				});
    			})
    			
    			//수정 확인을 클릭하면
    			$("#modBtn").click(function(){
    				let cb_content = $("textarea[name=cb_content]").val();
    				let cb_num = $(this).attr("data-cb_num");
    				
    				if(cb_content.trim() == ''){
    					alert("댓글을 입력하세요!")
    					$("textarea[name=cb_content]").focus();
    					return;
    				}
    				
    				$.ajax({
    					type:'PATCH',
    					url: '/carrot/commentsb/' + cb_num,
    					headers : {"content-type" : "application/json"},
    					data : JSON.stringify({cb_num:cb_num, cb_content:cb_content}),
    					success : function(result){
    						alert(result);
    						showList(cb_pnum);
    					},
    					error : function(){alert("error")}
    				})
    				
    				$("textarea[name=cb_content]").val("");

    				$("#modBtn").hide();
    			})
    			
    			//댓글 수정
    			$("#commentsList").on("click", ".modBtn", function(){
    				let cb_num=$(this).parent().parent().attr("data-cb_num");
    				
    				let cb_content = $("span.cb_content", $(this).parent()).text();
    				
    				$("textarea[name=cb_content]").val(cb_content);
    				
    				$("#modBtn").attr("data-cb_num", cb_num);
    				
    				$("#modBtn").show();
    				
    			})
    			
    			
    		})
    		 
    		//결과물 출력
    		let toHtml = function(commentsb){
    			let tmp="<ul id='commentsb'>";
    			
    			commentsb.forEach(function(commentsb){
    				tmp += '<li id="commentspBox" data-cb_num=' + commentsb.cb_num
    				tmp += ' data-cb_pcnum=' + commentsb.cb_pcnum
    				tmp += ' data-cb_pnum=' + commentsb.cb_pnum + '>'
    				
    				if(commentsb.cb_pcnum > 0)
    					tmp += '<img src="../resources/img/대댓글.png" alt="회원이미지" class="repImg">'
    				tmp += ' <div class="m_proimg">' +  '<img src="../resources/img/memberImg.png" alt="회원이미지">' + '</div>'
    				tmp += '<div class="commR">' +' <span class="cb_email">' + commentsb.cb_nicknm + '</span>'
    				tmp += ' <span class="cb_content">' + commentsb.cb_content + '</span>'
    				tmp += ' <span class="cb_date">' + dateToString(commentsb.cb_update) + '</span>'
    				if('${login_email}' == commentsb.cb_email) {
    					tmp += ' <button class="delBtn" id=commDelBtn>삭제</button>'
    					tmp += ' <button class="modBtn" id="commModBtn">수정</button>'
    				}
    				if(commentsb.cb_pcnum == null)
    					tmp += ' <button class="replyBtn">답글쓰기</button>' +'<br><br>'+ '</div>' 
    				tmp += '</li>'
    			})
    			tmp += "</ul>"
    			
    			return tmp;
    		}
    		 
    		let addZero = function(value=1){
    			return value > 9 ? value : "0" + value;
    		}
    		
    		let dateToString = function(ms=0){
    			let date = new Date(ms);
    			
    			let yyyy = date.getFullYear();
    			let mm = addZero(date.getMonth()+1);
    			let dd = addZero(date.getDate());
    			
    			let HH = addZero(date.getHours());
    			let MM = addZero(date.getMinutes());
    			let ss = addZero(date.getSeconds());
    			
    			return yyyy+"년"+mm+"월"+dd+"일"+HH+":"+MM;
    		}
    	} else {
    	//상품 댓글 관련
		let cp_pnum = Math.max(0,${productDTO.p_num});
		//let cp_pnum=${productDTO.p_num};

		
		//댓글 리스트
		let showList = function(cp_pnum){
			$.ajax({
				type: 'GET',
				url: '/carrot/commentsp?cp_pnum=' + cp_pnum,
				success : function(result){
					$("#commentsList").html(toHtml(result));
				},
				error : function(){alert("error")}
			});
		}
		
		//댓글 작성
		$(document).ready(function(){
			//목록 보이기
			showList(cp_pnum);
			
			$("#sendBtn").click(function(){
				let cp_content = $("textarea[name=cp_content]").val();
				let cp_nicknm = $("input[name=cp_nicknm]").val();
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("textarea[name=cp_content]").focus();
					return;
				}
				
				$.ajax({
					type: 'POST',
					url: '/carrot/commentsp?cp_pnum=' + cp_pnum + '&cp_nicknm=' + cp_nicknm,
					headers : {"content-type" : "application/json"},
					data : JSON.stringify({cp_pnum:cp_pnum, cp_content:cp_content, cp_nicknm:cp_nicknm}),
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				});
				
				$("textarea[name=cp_content]").val("");
			})
			
			//답글 달기
			$("#commentsList").on("click", "#repBtn", function(){
				
				$("#replyForm").appendTo($(this).parent());
				$("#replyForm").css("display", "block");
				
				let cp_pcnum = $(this).parent().parent().attr("data-cp_num");
				cp_pcnum = parseInt(cp_pcnum);
			    $("#replyForm").attr("data-cp_pcnum", cp_pcnum);
			})
			
			$("#wrtRepBtn").click (function(){
				let cp_content = $("textarea[name=replyContent]").val();
				let cp_pcnum = $("#replyForm").attr("data-cp_pcnum");
				let cp_nicknm = $("input[name=cp_nicknm]").val();
				
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("textarea[name=replyContent]").focus();
					return ;
				}
				
				$.ajax({
					type:'POST',
					url: '/carrot/commentsp?cp_pnum=' + cp_pnum  + '&cp_nicknm=' + cp_nicknm,
					headers : {"content-type" : "application/json"},
					data : JSON.stringify({cp_pnum:cp_pnum, cp_pcnum:cp_pcnum, cp_content: cp_content}),
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				});
				$("#replyForm").css("display","none");
				$("textarea[name=replyContent]").val('');
				$("#replyForm").appendTo("body");
				
			})
			//답글 달기 취소 클릭 시
				$(function(){
					$("#RepBtnHide").click(function(){
						$("#replyForm").hide();
					})
				})
			
			//댓글 삭제
			$("#commentsList").on("click", ".delBtn", function(){
				let cp_num=$(this).parent().parent().attr("data-cp_num");
				let cp_pnum=$(this).parent().parent().attr("data-cp_pnum");
				
				$.ajax({
					type:"DELETE",
					url: '/carrot/commentsp/' + cp_num + '?cp_pnum=' + cp_pnum,
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				});
			})
			
			//수정 확인을 클릭하면
			$("#modBtn").click(function(){
				let cp_content = $("textarea[name=cp_content]").val();
				let cp_num = $(this).attr("data-cp_num");
				
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("textarea[name=cp_content]").focus();
					return;
				}
				
				$.ajax({
					type:'PATCH',
					url: '/carrot/commentsp/' + cp_num,
					headers : {"content-type" : "application/json"},
					data : JSON.stringify({cp_num:cp_num, cp_content:cp_content}),
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				})
				
				$("textarea[name=cp_content]").val("");

				$("#modBtn").hide();
			})
			
			//댓글 수정
			$("#commentsList").on("click", ".modBtn", function(){
				let cp_num=$(this).parent().parent().attr("data-cp_num");
				
				let cp_content = $("span.cp_content", $(this).parent()).text();
				
				$("textarea[name=cp_content]").val(cp_content);
				
				$("#modBtn").attr("data-cp_num", cp_num);
				
				$("#modBtn").show();
				
			})
			
			
		})
		
		/* if (userDTO.m_email === cp_email) {
			document.getElementById('#commDelBtn').style.display='block';
			document.getElementById('#commModBtn').style.display='block';
		} else{
			document.getElementById('#commDelBtn').style.display='none';
			document.getElementById('#commModBtn').style.display='none';
		}
		 */
		 
		//결과물 출력
		let toHtml = function(commentsp){
			let tmp="<ul id='commentsp'>";
			
			commentsp.forEach(function(commentsp){
				tmp += '<li id="commentspBox" data-cp_num=' + commentsp.cp_num
				tmp += ' data-cp_pcnum=' + commentsp.cp_pcnum
				tmp += ' data-cp_pnum=' + commentsp.cp_pnum + '>'
				
				if(commentsp.cp_pcnum != null)
					tmp += '<img src="../resources/img/대댓글.png" alt="답글 이미지" class="repImg">'
					/* tmp += '&nbsp&nbsp&nbsp&nbsp&nbsp' */
				tmp +=  ' <div class="m_proimg">' +  '<img src="../resources/img/memberImg.png" alt="회원이미지">' + '</div>'
				tmp += '<div class="commR">' +' <span class="cp_email">' + commentsp.cp_nicknm + '</span>'
				tmp += ' <span class="cp_content" id="contentPosi">' + commentsp.cp_content + '</span>'
				tmp += ' <span class="cp_date">' + dateToString(commentsp.cp_update) + '</span>'
				if('${login_email}' == commentsp.cp_email) {
					tmp += ' <button class="delBtn" id=commDelBtn>삭제</button>'
					tmp += ' <button class="modBtn" id="commModBtn">수정</button>'
				}
				if(commentsp.cp_pcnum == null)
					tmp += ' <button class="replyBtn" id="repBtn">답글쓰기</button>' +'<br><br>'+ '</div>' 
				tmp += '</li>'
			})
			tmp += "</ul>"
			
			return tmp;
		}
		 
		let addZero = function(value=1){
			return value > 9 ? value : "0" + value;
		}
		
		let dateToString = function(ms=0){
			let date = new Date(ms);
			
			let yyyy = date.getFullYear();
			let mm = addZero(date.getMonth()+1);
			let dd = addZero(date.getDate());
			
			let HH = addZero(date.getHours());
			let MM = addZero(date.getMinutes());
			let ss = addZero(date.getSeconds());
			
			return yyyy+"년"+mm+"월"+dd+"일"+HH+":"+MM;
		}
		
    	}
		
		
	</script>

	<script type="text/javascript">
    $(document).ready(function() {
    	
    	let bNum = $('#b_num').val();
 		let pNum = $('#p_num').val();
 		
 		if(menu !== 'board'){
 	 		if ('${productDTO.p_likeYN}' === 'Y') {
 				$("#btnLikey").hide();
 	    	} else {
 				$("#btnDisLikey").hide();
 	    	}
 		} else {
 	 		if ('${boardDTO.b_likeYN}' === 'Y') {
 				$("#btnLikey").hide();
 	    	} else {
 				$("#btnDisLikey").hide();
 	    	}
 		}
    	
		$("#btnDel").on("click", function(){
			if(!confirm("정말로 삭제하시겠습니까?")) return;
				let form = $('#form');
			
				if(menu !== 'board'){
					form.attr("action", "<c:url value='/carrot/remove?page=${page}&pageSize=${pageSize}'/>");
					form.attr("method", "post");
					form.append("<input type='hidden' name='p_num' value='${productDTO.p_num}'>");
					
					form.submit();
					
				} else{
					form.attr("action", "<c:url value='/board/remove?page=${page}&pageSize=${pageSize}'/>");
					form.attr("method", "post");
					form.append("<input type='hidden' name='b_num' value='${boardDTO.b_num}'>");
					
					form.submit();
				} 
		})
		
 		$("#btnModify").on("click", function() {
 			const $a = document.createElement('a'); //가상 a태그 생성
			if(menu !== 'board'){
			  	$a.href = '/carrot/carrot/select?menu=product&'+'p_num='+ pNum;
			} else {
			  	$a.href = '/carrot/board/select?menu=board&'+'b_num='+bNum;
			} 
			$a.click();
 		}) 
		
		$("#btnLikey").on("click", function() {
			$("#btnDisLikey").show();
			$("#btnLikey").hide();
			const $a = document.createElement('a'); //가상 a태그 생성
			if(menu !== 'board'){
			 	$a.href = '/carrot/carrot/like?menu=product&'+'p_num='+ pNum;
			} else {
			 	$a.href = '/carrot/board/like?menu=board&'+'b_num='+bNum;
			} 
			$a.click();
		})
		
		$("#btnDisLikey").on("click", function() {
			$("#btnLikey").show();
			$("#btnDisLikey").hide();
			const $a = document.createElement('a'); //가상 a태그 생성
			if(menu !== 'board'){
			 	$a.href = '/carrot/carrot/dislike?menu=product&'+'p_num='+ pNum;
			} else {
			 	$a.href = '/carrot/board/dislike?menu=board&'+'b_num='+bNum;
			} 
			$a.click();
		})
	})
    </script>

	<script type="text/javascript">
			 $(document).ready(function() {
				 document.querySelectorAll('.time').forEach(($time)=>{
					 const time = $time.innerText
					 $time.innerText = timeForToday(time);
				 })
				
			 }) 
			function timeForToday(value) {
				const today = new Date();
		        const timeValue = new Date(value);
		
		        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
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
</body>
</html>