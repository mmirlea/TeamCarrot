<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="./resource/css/loginStyle.css">
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
    </div><!--.header-->
    <div class="container">
        <form action="">
            <table>
                <tr>
                    <td class="inputInfo">
                        <input type="email" id="loginEmail" class="loginEmail" placeholder="이메일">
                    </td>
                </tr>
                <tr>
                    <td class="inputInfo">
                        <input type="password" id="loginPw" class="loginPw" placeholder="비밀번호">
                    </td>
                </tr>
                <tr>
                    <td class="tdBtn1">
                        <button type="submit" class="loginBtn">로그인</button>
                    </td>
                </tr>
                <tr>
                    <td class="tdBtn2">
                        <button type="button" class="searchEmailBtn helpBtn">아이디 찾기</button>
                        <button type="button" class="searchPwBtn helpBtn">비밀번호 찾기</button>
                        <button type="button" class="joinBtn helpBtn" onclick="/register/add">회원가입</button>
                    </td>        
                </tr>       
            </table>
        </form>
    </div>
</body>
</html>