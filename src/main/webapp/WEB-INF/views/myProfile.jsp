<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/myProfileStyle.css?aa3dw3'/>" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	 <div class="wrap">
        <div class="header">
            <div class="headerIn">
                <div class="divLogo">
                    <a href="/carrot"><img src="../resources/img/DaangnMarket_logo.png" lt="당근마켓로고"></a>
                    <a href="MyPage.jsp"> 내 프로필</a>
                </div>
               
            </div> <!--.headerIn-->
        </div> <!--.header-->
        <form action="<c:url value='/mypage/modify'/>" method="post">
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
		                        	<c:otherwise> <img src="${dto.m_proimg}" lt="프로필 사진"></c:otherwise>
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
	                    	<div id="uploadImgBtn" style="display:none"> <label for="imgMod">사진 올리기</label><input type="file" id="imgMod" name="m_proimg" class="imgMod"></div>
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
	                        	&nbsp&nbsp&nbsp 수정할 비밀번호&nbsp<input type="password" id="modPw" > 비밀번호 확인<input type="password" id="modPw2" name="m_pw"><button type="submit" class="modBtn2" id="modBtn2">수정확인</button>
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
	                            <option value="opRegion">지역을 선택하세요</option>
	                        </select>
	                        <select name="town" class="town">
	                            <option value="opTown">동네를 선택하세요</option>
	                        </select>
	                    </div>
	                    
	                    <div class="divBtn">
	                        <button type="submit" class="btnUpdate">수정</button>
	                    </div>
	                </div>
	            </div> <!--.divLocal-->
	        </div> <!--.container-->
		</form>
        <%@ include file ="./footer.jsp" %>
    </div>
    <script>
    
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
	   			if($("#divNowPw").css("display")=="none"){
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
	  	
	  	
	  	
	  	
	   	
	   	
	   	
    </script>
</body>
</html>