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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<% String menu = request.getParameter("menu"); %>
<script type="text/javascript">
	let menu = '<%= request.getParameter("menu") %>'
	let msg="${msg}"
	console.log(menu);
	//if(msg == "MOD_ERR") alert("게시글 수정에 실패하였습니다.")
	if(msg == "DEL_ERR") alert("게시글 삭제에 실패하였습니다.")
	
</script>
<body>
	<form class="wrap" id="form">
	
		<%@ include file ="./header.jsp" %>
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
					
					<div class="crud-wrap">
                    	<input type="hidden" value="${menu eq 'board' ? boardDTO.b_num : 0}" name="b_num" id="b_num">
                    	<input type="hidden" value="${menu ne 'board' ? 0 : productDTO.p_num}" name="p_num" id="p_num">
                    	<button type="button" class="btnModify" id="btnModify" value="board">수정</button>
                    	<button type="button" class="btnDel" id="btnDel">삭제</button>
	                </div>
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
                    <span class="itemAttention">
                    	<button type="button" class="likey" id="btnLikey" name='${menu == "board"? "b_likey" : "p_likey"}'><i class="far fa-heart"></i></button>
                         관심 ${menu == "board" ? boardDTO.b_likey : productDTO.p_likey}</span>
                    &nbsp;•&nbsp;
                    <span class="itemChat">채팅 ${menu == "board" ? boardDTO.b_comm : productDTO.p_comm}</span>
                    &nbsp;•&nbsp;
                    <span class="itemCheck">조회 ${menu == "board" ? boardDTO.b_viewCnt : productDTO.p_viewcnt}</span>
                </div><!--.countUp-->
                <hr>
            </div><!--.content-wrap-->
            <c:if test="${menu ne 'board' }">
	            <div class="heartBar-wrap">
	                <div class="heartBar">
	                    <div class="heartBtn">
	                        <i class="xi-heart-o xi-4x"></i>  
	                     </div><!--heartBtn-->
	                    <div class="priceInfo">
	                        <div class="price">${productDTO.p_price } 원</div>
	                        <div class="priceNego">가격 제안 가능</div>
	                    </div><!--priceInfo-->
	                    <button type="button" class="chatBtn">채팅하기</button>
	                </div><!--.heartBar-->
	                <hr>
	            </div><!--.heartBar-wrap-->
            </c:if>
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
    </form>
    
    comment : <input type="text" name="c_content"> <br>
	
		<button id="sendBtn" type="button">SEND</button>
		<button id="modBtn" type="button">수정확인</button>
		
		<!-- 댓글 표시 -->
		<div id="commentsList"></div>
		
		<div id="replyForm" style="display:none">
			<input type="text" name="replyComment">
			<button type="button" id="wrtRepBtn">등록</button>
		</div>
    
    <script>
		  //댓글 관련-----------------------------------------------
		  let c_pnum = Math.max(0,${commentsDTO.c_pnum});
		
		  //댓글 리스트
		  let showList = function(c_pnum) {
		    $.ajax({
		      type: 'GET',
		      url: '/carrot/comments?p_num=' + c_pnum,
		      success: function(result) {
		        $("#commentsList").html(toHtml(result));
		      },
		      error: function() {
		        alert("error");
		      }
		    });
		  }
		
		  //댓글 작성
		  $(document).ready(function() {
		    //목록 보이기
		    showList(c_pnum);
		
		    $("#sendBtn").click(function() {
		      let c_content = $("input[name=c_content]").val()
		
		      if (c_content.trim() == '') {
		        alert("댓글을 입력하세요!")
		        $("input[name=c_content]").focus();
		        return;
		      }
		
		      $.ajax({
		        type: 'POST',
		        url: '/carrot/comments?p_num=' + c_pnum,
		        headers: {
		          "content-type": "application/json"
		        },
		        data: JSON.stringify({
		          c_pnum: c_pnum,
		          c_content: c_content
		        }),
		        success: function(result) {
		          alert(result);
		          showList(c_pnum);
		        },
		        error: function() {
		          alert("error");
		        }
		      });
		    })
		
		    //답글 달기
		    $("#commentsList").on("click", ".replyBtn", function() {
		      $("#replyForm").appendTo($(this).parent());
		      $("#replyForm").css("display", "block");
		    })
		
		    $("#wrtRepBtn").click(function() {
		      let c_content = $("input[name=replyComment]").val()
		
		      let c_pcnum = $("#replyForm").parent().attr("data-c_pcnum")
		
		      if (c_content.trim() == '') {
		        alert("댓글을 입력하세요!")
		        $("input[name=replyComment]").focus();
		        return;
		      }
		
		      $.ajax({
		        type: 'POST',
		        url: '/carrot/comments?c_pnum=' + c_pnum,
		        headers: {
		          "content-type": "application/json"
		        },
		        data: JSON.stringify({
		          c_pnum: c_pnum,
		          c_pcnum: c_pcnum,
		          c_content: c_content
		        }),
		        success: function(result) {
		          alert(result);
		          showList(c_pnum);
		        },
		        error: function() {
		          alert("error");
		        }
		      });
		
		      $("#replyForm").css("display", "none");
		      $("input[name=replyComment]").val('');
		      $("#replyForm").appendTo("body");
		    })
		
		    //댓글 삭제
		    $("#commentsList").on("click", ".delBtn", function() {
		      let c_num = $(this).parent().attr("data-c_num");
		      let c_pnum = $(this).parent().attr("data-c_pnum");
		
		      $.ajax({
		        type: 'DELETE',
		        url: '/carrot/comments/' + c_num + '?c_pnum=' + c_pnum,
		        success: function(result) {
		          alert(result);
		
		          showList(c_pnum);
		        },
		        error: function() {
		          alert("error");
		        }
		      });
		    })
		
		    //수정 확인
		    $("#modBtn").click(function() {
		      let c_content = $("input[name=c_content]").val()
		
		      let c_num = $(this).attr("data-c_num");
		
		      if (c_content.trim() == '') {
		        alert("댓글을 입력하세요!")
		        $("input[name=c_content]").focus();
		        return;
		      }
		
		      $.ajax({
		        type: 'PATCH',
		        url: '/carrot/comments/' + c_num,
		        headers: {
		          "content-type": "application/json"
		        },
		        data: JSON.stringify({
		          c_num: c_num,
		          c_content: c_content
		        }),
		        success: function(result) {
		          alert(result);
		          showList(c_pnum);
		        },
		        error: function() {
		          alert("error");
		        }
		      });
		    })
		
		    //댓글 수정
		    $("#commentsList").on("click", ".modBtn", function() {
		      let c_num = $(this).parent().attr("data-c_num");
		
		      let c_content = $("span.c_content", $(this).parent()).text();
		
		      $("input[name=c_content]").val(c_content);
		
		      $("#modBtn").attr("data-c_num", c_num);
		    })
		  })
		
		  //결과를 화면에 출력하기 위한 함수 생성
		  let toHtml = function(comments) {
		    let tmp = "<ul id='comments'>";
		
		    comments.forEach(function(comment) {
		      tmp += '<li data-c_num=' + comment.c_num;
		      tmp += ' data-c_pcnum=' + comment.c_pcnum;
		      tmp += ' data-c_pnum=' + comment.c_pnum + '>';
		
		      if (comment.c_num != comment.pcno)
		        tmp += 'ㄴ';
		
		      tmp += ' commenter=<span class="commenter">' + comment.c_email + '</span>';
		      tmp += ' comments=<span class="comments">' + comment.c_content + '</span>';
		      tmp += ' up_date=' + dateToString(comment.c_update);
		      tmp += ' <button class="delBtn">삭제</button>';
		      tmp += ' <button class="modBtn">수정</button>';
		      tmp += ' <button class="replyBtn">답글</button>';
		      tmp += '</li>';
		    })
		    tmp += "</ul>";
		
		    return tmp;
		  }
		
	</script>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	    	
		$("#btnDel").on("click", function(){
			
			if(!confirm("정말로 삭제하시겠습니까?")) return;
			
			
			let form = $('#form');
			
			console.log($(location).attr("pathname"))
			
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
 			let bNum = $('#b_num').val();
 			let pNum = $('#p_num').val();
 			const $a = document.createElement('a'); //가상 a태그 생성
			if(menu !== 'board'){
			  	$a.href = '/carrot/carrot/select?menu=product&'+'p_num='+ pNum;
			} else {
			  	$a.href = '/carrot/board/select?menu=board&'+'b_num='+bNum;
			} 
			$a.click();
 		}) 
		
		$("#btnLikey").on("click", function() {
			debugger;
			 let form = $('#form');
			 
			 alert("알람!!!");
			
			/* if (document.getElementById("btnLikey").innerHTML == '<i class="far fa-heart" aria-hidden="true"></i>') {
				document.getElementById("btnLikey").innerHTML = "<i class='fas fa-heart'></i>";
				
				form.attr("action", "<c:url value='/board/likeCnt'/>");
				form.attr("method", "post");
				form.append("<input type='hidden' name='b_num' value='${boardDTO.b_num}'>");
				form.submit(); 
			} else{
				document.getElementById("btnLikey").innerHTML = '<i class="far fa-heart" aria-hidden="true"></i>';
			} */
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
</body>
</html>