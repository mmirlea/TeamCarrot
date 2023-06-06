<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/myProfileStyle.css?esdsd'/>" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<%@ include file ="./header.jsp" %>
<body>
	 <div class="wrap">
        <form  enctype="multipart/form-data" action="<c:url value='/mypage/modify'/>" method="post">
	        <div class="container">
	            <div class="divProfile">
	                <p class="pTitle">기본정보</p>
	                <div class="divUser">
	                    <div class="divUserImg">
	                        <div class="btnUserImg">
	                        	<c:choose>
		                        	<c:when test="${dto.m_proimg eq null}">
		                        		<i class="fa-solid fa-user-pen"></i>
		                        	</c:when>
		                        	<c:otherwise> <img src="/proimg/${dto.m_proimg}" lt="프로필 사진"></c:otherwise>
	                            </c:choose>
	                            <!-- <i class="fas fa-user-circle"></i> -->
	                        </div>
	                    </div>
	
	                    <div class="divInfo">
	                        <p class="pProName">${dto.m_nicknm}</p>
	                        <p>${dto.m_email}</p>
	                    </div>
	
	                    <!-- <div class="divUpdate">
	                        <button class="btnUpdate">사진변경</button>
	                    </div> -->
	                </div>
	                <p class="pLine"></p>
	                <div class="divNicNm">
	                    <div class="divText">
	                    	<div id="uploadImgBtn" style="display:none"> <label for="imgMod">사진 올리기</label><input type="file" id="imgMod" name="imageFile" class="imgMod"></div>
	                        <input type="text" id="m_nicknm" name="m_nicknm" class="m_nicknm" value="${dto.m_nicknm}" style="display:none">
	                        <button type="submit" class="modBtn" id="modBtn" style="display:none">수정확인</button>
	                    </div>
	                    <div class="divBtn">
	                        <button type="button" class="btnUpdate" id="modifyBtn">수정</button>
	                    </div>
	                </div>
	            </div> <!--.divProfile-->
	
	            <div class="divSecurity">
	                <p class="pTitle">기본보안설정</p>
	                <div class="divSetPw">
	                    <div class="divText">
	                        <i class="fas fa-lock"></i>
	                        <p>비밀번호</p>
	                        <div id="divNowPw" style="display:none"> &nbsp&nbsp&nbsp 현재 비밀번호&nbsp<input type="password" id="nowPw" ><button type="button" id="nowPwValid">확인</button><i id="nowPwErr" style="display:none">잘못된 비밀번호 입니다.</i></div>
	                        <div id="divModPw" style="display:none">
	                        	&nbsp&nbsp&nbsp 수정할 비밀번호&nbsp<input type="password" id="modPw" onblur="checkPw()"> 비밀번호 확인<input type="password" id="modPw2" name="m_pw"><button type="button" class="modBtn2" id="modBtn2">수정확인</button>
	                        	<div id="modErr1"><i>&nbsp&nbsp&nbsp영문/숫자/특수문자 8~14자리 </i><i id="modErr2" style="display:none">&nbsp&nbsp&nbsp 비밀번호가 일치하지 않습니다. </i></div>
	                        </div> 
	                        <div id="modFail" style="display:none"><i>비밀번호 변경 실패</i></div>
	                        
	                    </div>
	                   
	                    <div class="divBtn">
	                        <button type="button" class="btnUpdate" id="pwModBtn">수정</button>
	                    </div>
	                </div>
	            </div> <!--.divSecurity-->
	
	            <div class="divLocal">
	                <p class="pTitle">우리 동네 설정</p>
	
	                <div class="divSetLocal">
	                    <div class="divSel">
	                        <select name="region" class="region">
	                            <option value="opRegion">${dto.m_addr1}</option>
	                            <option value="울산광역시 남구">울산광역시 남구</option>
	                            <option value="울산광역시 중구">울산광역시 중구</option>
	                            <option value="울산광역시 동구">울산광역시 동구</option>
	                            <option value="울산광역시 북구">울산광역시 북구</option>
	                        </select>
	                        <input type="text" name="m_addr1" id="m_addr1" style="display:none">
	                        <select name="town" class="town">
	                            <option value="opTown">${dto.m_addr2}</option>
	                            <option value="옥동">옥동</option>
	                            <option value="신정동">신정동</option>
	                            <option value="삼산동">삼산동</option>
	                            <option value="수암동">수암동</option>
	                            <option value="성남동">성남동</option>
	                            <option value="송정동">송정동</option>
	                        </select>
	                        <input type="text" name="m_addr2" id="m_addr2" style="display:none">
	                    </div>
	                    
	                    <div class="divBtn">
	                        <button type="button" class="btnUpdate" id="modBtn3">수정</button>
	                    </div>
	                </div>
	            </div> <!--.divLocal-->
	             <div class="remove"> 
	             	<button type="button" class="delBtn" id="delBtn">계정 삭제</button>
	             	<div class="delBtn2" id="delBtn2" style="display:none">
	             		정말 삭제하시겠습니까? 
	             		<button type="button" class="realDel" id="delBtnY">예</button> 
	             		<button type="button" class="realDel" id="delBtnN">아니오</button>
	             	</div>
	             </div>
	        </div> <!--.container-->
		</form>
        <%@ include file ="./footer.jsp" %>
    </div>
    <script>
    	let pw = document.getElementById("modPw");
    	
	    function checkPw(){
			//영문/숫자/특수문자 8~14자리
			let pattern = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*+-/=_])(?=.*[0-9]).{8,14}$/;
			
			if(!pattern.test(pw.value)){
				pw.focus();
				return false;
			}
			document.getElementById("msg").innerHTML=""
			return true;
		}
    
    	//주소 변경
    	$(document).ready(function() {
	        $("#modBtn3").click(function() {
	          	var regionValue = $(".region").val();
	          	var townValue = $(".town").val();
	          
	         	$("#m_addr1").val(regionValue);
	         	$("#m_addr2").val(townValue);
	          
	          	var form = $("<form></form>");
	          	form.attr("action", "<c:url value='/mypage/modify/addr'/>");
	          	form.attr("method", "POST");
	          
	          	var mAddr1Input = $("<input>");
	          	mAddr1Input.attr("type", "hidden");
	          	mAddr1Input.attr("name", "m_addr1");
	          	mAddr1Input.val(regionValue);
	          
	          	var mAddr2Input = $("<input>");
	          	mAddr2Input.attr("type", "hidden");
	          	mAddr2Input.attr("name", "m_addr2");
	          	mAddr2Input.val(townValue);
	          
	          	form.append(mAddr1Input);
	          	form.append(mAddr2Input);
	          
	          	$("body").append(form);
	          	form.submit();
	        });
      	});
    	
    
    	//패스워드 값 넘기기
    	$(document).ready(function() {
       		$("#modBtn2").click(function() {
        		if($("#modErr2").css("display")=="none"){
	          		var form = $("<form></form>");
		          	form.attr("action", "<c:url value='/mypage/modify/pw'/>");
		          	form.attr("method", "POST");
		
		          	var mPwInput = $("<input>");
		         	mPwInput.attr("type", "hidden");
		          	mPwInput.attr("name", "m_pw");
		          	mPwInput.val($("input[name='m_pw']").val());
		
		          	form.append(mPwInput);
		
		          	$("body").append(form);
		          	form.submit();
        		}
	    	});
	 	});
    
    	//수정 인풋 화면표시
	   	$(function(){
	   		$("#modifyBtn").click(function(){
	   			if($("#m_nicknm").css("display")=="none"){
	   				$("#m_nicknm").show();
	   				$("#uploadImgBtn").show();
	   				$("#modBtn").show();
	   			}
	   		})
	   	})
	   	
	   	$(function(){
	   		$("#modBtn").click(function(){
	   			if($("#m_nicknm").css("display")!="none"){
	   				$("#m_nicknm").hide();
	   				$("#uploadImgBtn").hide();
	   				$("#modBtn").hide();
	   			}
	   		})
	   	})
	   	
	   	$(function(){
	   		$("#pwModBtn").click(function(){
	   			if($("#divNowPw").css("display")=="none" && $("#divModPw").css("display")=="none"){
	   				$("#divNowPw").show();
	   			}
	   		})
	   	})
	   	
	   	$(function(){
            $("#nowPwValid").click(function(){
                var originPw = '<c:out value="${dto.m_pw}"/>';
                var inputPw = $("#nowPw").val();
                if (inputPw == originPw){
                    $("#divNowPw").hide();
                    $("#divModPw").show();
                }
                $("#nowPwErr").show();
            });
        });
	   	
	  	$(function(){
	  		$("#modPw2").blur(function(event){
	  			var pw1 = $("#modPw").val();
	  			var pw2 = $("#modPw2").val();
	  			if(pw1 != pw2){
	  				$("#modErr2").show();
	  				return false;
	  			}
	  			$("#modErr2").hide();
	  		})
	  	})
	   	
	  	$(function(){
	   		$("#delBtn").click(function(){
	   			if($("#delBtn2").css("display")=="none"){
	   				$("#delBtn2").show();
	   			}
	   		})
	   	})
	   	
	   	$(function(){
	   		$("#delBtnN").click(function(){
	   			$("#delBtn2").hide();
	   		})
	   	})
	   	
	   	$(document).ready(function() {
       		$("#delBtnY").click(function() {
	          		var form = $("<form></form>");
		          	form.attr("action", "<c:url value='/mypage/userDel'/>");
		          	form.attr("method", "POST");
		          	
		          	$("body").append(form);
		          	form.submit();
		          
	    	});
	 	});
    </script>
</body>
</html>