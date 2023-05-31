<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/joinStyle.css'/>" rel="stylesheet" />
</head>
<body>
	 <div class="header">
        <div class="headerIn">
            <div class="logoImg">
            	<a href="CarrotMain.jsp">
                	<img src="./resources/img/DaangnMarket_logo.png" alt="당근마켓로고">
                </a>
            </div>
            <h1 class="title">당근마켓</h1>
        </div><!--.headerIn-->
    </div><!--header-->
    <div class="container">
        <form action="<c:url value="/register/save"/>" method="post"   onsubmit="return formCheck(this)">
            <table>
                <tr>
                    <td class="tdImg" colspan="2">
                        <div class="profileImg">
                            <img src="./resources/img/memberImg.png" alt="프로필이미지">
                        </div>
                        <button type="submit" class="uploadImgBtn" >사진 올리기</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="msg" class="msg">${URLDecoder.decode(param.msg,"utf-8")}</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="email">이메일</label></td>
                    <td><input type="email" id="email" class="inputInfo" name="email" onblur="checkEmail()"></td>
                </tr>
                <tr>
                	<td colspan="2" class="emailBtn">
                        <button type="button" id="emailOverlap" class="emailOverlap" onclick="fn_emailOverlap()">이메일 중복확인</button>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw">비밀번호</label></td>
                    <td>
                        <input type="password" id="pw" class="inputInfo" name="pw" onblur="checkPw()">
                        <div class="warning">영문/숫자/특수문자 8~14자리</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw2">비밀번호 확인</label></td>
                    <td>
                        <input type="password" id="pw2" class="inputInfo" name="pw2" onblur="checkPw2()">
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="nickname">닉네임</label></td>
                    <td>
                    	<input type="text" id="nickname" class="inputInfo" name="nickname" onblur="checkNickname()">
                    	<div class="warning">한글 초성 및 모음 , 특수문자 불가능</div>
                    </td>
                </tr>
                <tr>
                	<td class="tdText"> <label for="addr1">주소</label> </td>
                	<td><input type="text" id="addr1" class="inputInfo" name="addr1"></td>
                </tr>
                <tr>
                	<td class="tdText"><label for="addr2">상세주소</label> </td>
                	<td><input type="text" id="addr2" class="inputInfo" name="addr2"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="joinBtn">회원가입</button>
                    </td>
                </tr>
            </table>
        </form>
    </div><!--container-->
    <script>
    	//공백확인
    	function formCheck(frm) {
    		var msg='';
    		
    		if(frm.email.value == ""){
    			setMessage('이메일을 입력하세요.', frm.email);
    			return false;
    		}
    		
    		if(frm.pw.value == "") {
    			setMessage('비밀번호를 입력하세요.', frm.pw);
    			return false;
    		}
    		
    		if(frm.pw2.value =="") {
    			setMessage('비밀번호확인란에 입력하세요.', frm.pw2);
    			return false;
    		}
    		
    		if(frm.nickname.value ==""){
    			setMessage('닉네임을 입력하세요.', frm.nickname);
    			return false;    			
    		}
    		
    		if(frm.addr1.value ==""){
    			setMessage('주소를 입력하세요.', frm.addr1);
    			return false;
    		}
    		
    		if(frm.addr2.value ==""){
    			setMessage('상세주소를 입력하세요.', frm.addr2);
    			return false;
    		}
    		
    		return true;
    	}
    	
    	// 이메일 중복
    	function fn_emailOverlap(){
    		$.ajax({
    			url : "/carrot/register/emailOverlap",
    			type : "post",
    			dataType : "json",
    			data : {"email": $("#email").val()},
    			success : function(data){
    				if($("#email").val() == null || $("#email").val() == "")
    					setMessage("이메일을 입력하세요.", $("#email"))
    				else if (data == 0){
    					$("#emailOverlap").attr("value","Y")
    					setMessage("사용가능한 아이디입니다.", $("#pw"))
    				}
    				else if (date == 1)
    					setMessage("중복된 이메일입니다.", $("#email"))
    			}
    		})
    	}
    	
    	//형식 검사 (정규표현식)
    	let email = document.getElementById("email");
    	let pw = document.getElementById("pw");
    	let pw2 = document.getElementById("pw2");
    	let nickname = document.getElementById("nickname");
    	
    	function checkEmail(){
    		//이메일 형식
    		let pattern = /^[a-zA-Z0-9]([-_.]*?[a-zA-Z0-9])*@[a-zA-Z0-9]([-_]?[a-zA-Z0-9])*\.[a-zA-Z.]{2,10}$/;
    		
    		if(!pattern.test(email.value)){
    			setMessage("이메일 형식이 아닙니다.", email);
    			return false;
    		}
    		document.getElementById("msg").innerHTML=""
    		return true;
    	}
    	
    	function checkPw(){
    		//영문/숫자/특수문자 8~14자리
    		let pattern = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*+-/=_])(?=.*[0-9]).{8,14}$/;
    		
    		if(!pattern.test(pw.value)){
    			setMessage("영문자, 특수문자, 숫자 모두를 포함하여 8~12글자로 작성하세요.", pw);
    			return false;
    		}
    		document.getElementById("msg").innerHTML=""
    		return true;
    	}
    	
    	//비밀번호 확인
    	function checkPw2(){
    		if(pw.value != pw2.value){
    			setMessage("비밀번호가 일치하지 않습니다.", pw2);
    			return false;
    		} else {
    			setMessage("비밀번호가 일치합니다.");
    			document.getElementById("msg").innerHTML=""
    			return true;
    		}
    	}
    	
    	function checkNickname(){
    		//한글 초성 및 모음 , 특수문자 불가능
    		let pattern=/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/
    		
    		if(!pattern.test(nickname.value)){
    			setMessage("한글 초성 및 모음, 특수문자는 불가능합니다.", nickname);
    			return false;
    		}
    		document.getElementById("msg").innerHTML=""
    		return true;
    	}
    	
    	//알림메세지
		function setMessage(msg, element) {
			document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

			if (element) {
				element.select();
			}
		}
    	
    	
    	
    	
    </script>
</body>
</html>