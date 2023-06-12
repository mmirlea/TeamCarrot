<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/junggoDetailStyle.css?afaa'/>" rel="stylesheet" />
<!-- swiper cdn -->
<link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/c0e3b26a7d.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<% String menu = request.getParameter("menu"); %>
<script type="text/javascript">
	let menu = '<%= request.getParameter("menu") %>'
	let msg="${msg}"
	//if(msg == "MOD_ERR") alert("게시글 수정에 실패하였습니다.")
	if(msg == "DEL_ERR") alert("게시글 삭제에 실패하였습니다.")
</script>
<body>
	<form class="wrap" id="form">
	
		<jsp:include page ="./header.jsp" flush="false">
			<jsp:param name="detail" value="detail" />
		</jsp:include>
		<%@ include file ="./tabRigth.jsp" %>
        <div class="container">
            <div class="swiper-modify">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
	                <div class="swiper-slide"><a href="#"><img src="${menu == 'board' ? boardDTO.b_img : productDTO.p_img}" alt="" class="thumb" onerror="this.src='/carrot/resources/img/이사가느라 가전 팔아요1.jpg'"></a></div>
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
                                <span class="celsius"></span>
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

            	<div class="content-top">
	            	<h1 class="contentTitle">${menu == 'board' ? boardDTO.b_title : productDTO.p_title}</h1><!--.contentTitle-->
            		<c:if test="${login_email != null && (login_email == productDTO.p_email || login_email == boardDTO.b_email)}">
						<div class="crud-wrap">
		                    <input type="hidden" value="${boardDTO.b_num} " name="b_num">
		                    <button type="button" class="btnModify" id="btnModify" value="board">수정</button>
		                    <button type="button" class="btnDel" id="btnDel">삭제</button>
		                </div>
	                </c:if>
            	</div>

                <div class="contentInfo">
                    <span class="categry">${menu == "board" ? boardDTO.b_cate : productDTO.p_cate}</span>
                    &nbsp;•&nbsp;

                    <span class="pullUp">끌올</span>
                    &nbsp;•&nbsp;
                    <span class="time">${menu == "board" ? boardDTO.b_upDate : productDTO.p_update}</span>
                </div><!--contentInfo-->
                <div class="content">
					
                    <c:out value='${menu == "board" ? boardDTO.b_content : productDTO.p_content}'/>
                </div><!--content-->
                <div class="countUp">
                    <span class="itemAttention">관심 ${menu == "board" ? boardDTO.b_likey : productDTO.p_likey}</span>
                    &nbsp;•&nbsp;
                    <span class="itemChat">채팅 ${menu == "board" ? boardDTO.b_comm : productDTO.p_comm}</span>
                    &nbsp;•&nbsp;
                    <span class="itemCheck">조회 ${menu == "board" ? boardDTO.b_viewCnt : productDTO.p_viewcnt}</span>
                </div><!--.countUp-->
                <hr>
            </div><!--.content-wrap-->
	            <div class="heartBar-wrap">
	                <div class="heartBar">
                    	<div class="heartBtn">
                    		<button type="button" class="likey"  id="btnLikey" name='${menu == "board"? "b_likey" : "p_likey"}'><i class="far fa-heart"></i></button>
                    		<button type="button" class="disLikey" id="btnDisLikey" name='${menu == "board"? "b_likey" : "p_likey"}'><i class="fas fa-heart"></i></button>
	                     </div>
	                     <!--heartBtn-->
						<c:if test="${menu ne 'board' }">
		                    <div class="priceInfo">
		                        <div class="price">${productDTO.p_price } 원</div>
		                        <div class="priceNego">가격 제안 가능</div>
		                    </div><!--priceInfo-->
            			</c:if>
						
		                <button type="button" class="chatBtn">채팅하기</button>
	                </div><!--.heartBar-->
	                <hr>
	            </div><!--.heartBar-wrap-->
    	</div> <!-- .container -->
    	
    </form><!--.wrap-->
  
    
    <form class="wrap" id="commFrm">
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
		                <input type="radio" id="firstComments" name="orderBtn" value="firstComments" checked="checked"><span>등록순</span>
		            </label>
		            <label for="lastComments">
		                <input type="radio" id="lastComments" name="orderBtn" value="lastComments"><span>최신순</span>
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
    </form>
    
    comment : <input type="text" name="cp_content"> <br>
	
		<button id="sendBtn" type="button">SEND</button>
		<button id="modBtn" type="button">수정확인</button>
		
		<!-- 댓글 표시 -->
		<div id="commentsList"></div>
		
		<div id="replyForm" style="display:none">
			<input type="text" name="replyContent">
			<button type="button" id="wrtRepBtn">등록</button>
		</div>
    	
    	<%@ include file ="./footer.jsp" %>
    <script>
		//댓글 관련-----------------------------------------------

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
				let cp_content = $("input[name=cp_content]").val();
				
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("input[name=cp_content]").focus();
					return;
				}
				
				$.ajax({
					type: 'POST',
					url: '/carrot/commentsp?cp_pnum=' + cp_pnum + '&cp_pcnum=' + cp_pcnum,
					headers : {"content-type" : "application/json"},
					data : JSON.stringify({cp_pnum:cp_pnum, cp_content:cp_content}),
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				});
			})
			
			//답글 달기
			$("#commentsList").on("click", ".replyBtn", function(){
				$("#replyForm").appendTo($(this).parent());
				$("#replyForm").css("display", "block");
				
				let cp_pcnum = $(this).parent().attr("data-cp_num");
				cp_pcnum = parseInt(cp_pcnum);
			    $("#replyForm").attr("data-cp_pcnum", cp_pcnum);
			})
			
			$("#wrtRepBtn").click (function(){
				let cp_content = $("input[name=replyContent]").val();
				let cp_pcnum = $("#replyForm").parent().attr("data-cp_pcnum");
				
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("input[name=replyContent]").focus();
					return ;
				}
				
				$.ajax({
					type:'POST',
					url: '/carrot/commentsp?cp_pnum=' + cp_pnum,
					headers : {"content-type" : "application/json"},
					data : JSON.stringify({cp_pnum:cp_pnum, cp_pcnum:cp_pcnum, cp_content: cp_content}),
					success : function(result){
						alert(result);
						showList(cp_pnum);
					},
					error : function(){alert("error")}
				});
				$("#replyForm").css("display","none");
				$("input[name=replyContent]").val('');
				$("#replyForm").appendTo("body");
			})
			
			//댓글 삭제
			$("#commentsList").on("click", ".delBtn", function(){
				let cp_num=$(this).parent().attr("data-cp_num");
				let cp_pnum=$(this).parent().attr("data-cp_pnum");
				
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
				let cp_content = $("input[name=cp_content]").val();
				let cp_num = $(this).attr("data-cp_num");
				
				if(cp_content.trim() == ''){
					alert("댓글을 입력하세요!")
					$("input[name=cp_content]").focus();
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
			})
			
			//댓글 수정
			$("#commentsList").on("click", ".modBtn", function(){
				let cp_num=$(this).parent().attr("data-cp_num");
				
				let cp_content = $("span.cp_content", $(this).parent()).text();
				
				$("input[name=cp_content]").val(cp_content);
				
				$("#modBtn").attr("data-cp_num", cp_num);
			})
		})
		
		//결과물 출력
		let toHtml = function(commentsp){
			let tmp="<ul id='commentsp'>";
			
			commentsp.forEach(function(commentsp){
				tmp += '<li data-cp_num=' + commentsp.cp_num
				tmp += ' data-cp_pcnum=' + commentsp.cp_pcnum
				tmp += ' data-cp_pnum=' + commentsp.cp_pnum + '>'
				
				if(commentsp.cp_num != commentsp.cp_pcnum)
					tmp += 'ㄴ'
				tmp += ' commenter=<span class="cp_email">' + commentsp.cp_nicknm + '</span>'
				tmp += ' comment=<span class="cp_content">' + commentsp.cp_content + '</span>'
				tmp += ' up_date=' + dateToString(commentsp.cp_update)
				tmp += ' <button class="delBtn">삭제</button>'
				tmp += ' <button class="modBtn">수정</button>'
				tmp += ' <button class="replyBtn">답글</button>'
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