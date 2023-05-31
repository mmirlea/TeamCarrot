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
                	<img src="./resource/img/DaangnMarket_logo.png" alt="당근마켓로고">
                </a>
            </div>
            <h1 class="title">당근마켓</h1>
        </div><!--.headerIn-->
    </div><!--header-->
    <div class="container">
        <form action="<c:url value="/register/save"/>" method="post" onsubmit="return formCheck(this)">
            <table>
                <tr>
                    <td class="tdImg" colspan="2">
                        <div class="profileImg">
                            <img src="./resource/img/memberImg.png" alt="프로필이미지">
                        </div>
                        <button type="submit" class="uploadImgBtn">사진 올리기</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="msg" class="msg">${URLDecoder.decode(param.msg,"utf-8")}</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="email">이메일</label></td>
                    <td><input type="email" id="email" class="inputInfo" name="email"></td>
                </tr>
                <tr>
                	<td colspan="2" class="emailBtn">
                        <button type="button" id="emailOverlap" class="emailOverlap">이메일 중복확인</button>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw">비밀번호</label></td>
                    <td>
                        <input type="password" id="pw" class="inputInfo" name="pw">
                        <div class="warning">영문/숫자/특수문자 8~14자리</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw2">비밀번호 확인</label></td>
                    <td>
                        <input type="password" id="pw2" class="inputInfo" name="pw2">
                        <div class="warning">영문/숫자/특수문자 8~14자리</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="nickname">닉네임</label></td>
                    <td><input type="text" id="nickname" class="inputInfo" name="nickname"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="joinBtn">회원가입</button>
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
    					setMessage("이메일을 입력하세요.", $("#eamil"))
    				else if (data == 0){
    					$("#emailOverlap").attr("value","Y")
    					setMessage("사용가능한 아이디입니다.", $("#pw"))
    				}
    				else if (date == 1){
    					setMessage("중복된 이메일입니다.", $)
    				}
    			}
    		})
    	}
    	
    </script>
</body>
</html>