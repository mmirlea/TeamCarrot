<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/loginStyle.css'/>" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	  <div class="header">
        <div class="headerIn">
            <div class="logoImg">
            	<a href="/carrot">
                	<img src="../resources/img/DaangnMarket_logo.png" alt="당근마켓로고">
                </a>
            </div>
            <h1 class="title">당근마켓</h1>    
        </div><!--.headerIn-->
    </div><!--.header-->
    <div class="container">
        <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">  
            <table>
            	<tr>
            		<td id="msg">
					    <c:if test="${not empty param.msg}">
						<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>            
					    </c:if> 
            		</td>
            	</tr>
                <tr>
                    <td class="inputInfo">
                        <input type="email" id="m_email" class="loginEmail" name="m_email" placeholder="이메일">
                    </td>
                </tr>
                <tr>
                    <td class="inputInfo">
                        <input type="password" id="m_pw" class="loginPw" name="m_pw"placeholder="비밀번호">
                        <input type="hidden" class="toURL" value="${param.toURL}">                        
                    </td>
                </tr>
                <tr>
                    <td class="tdBtn1">
                        <button class="loginBtn">로그인</button>
                    </td>
                </tr>
                <tr>
                    <td class="tdBtn2">
                        <button type="button" class="searchEmailBtn helpBtn">아이디 찾기</button>
                        <button type="button" class="searchPwBtn helpBtn">비밀번호 찾기</button>
                        <button type="button" class="joinBtn helpBtn"><a href="<c:url value='/register/add'/>">회원가입</a></button>
                    </td>        
                </tr>       
            </table>
            <script>
            	function formCheck(frm){
            		let msg ='';
            		
            		if(frm.m_email.value.length==0){
            			setMessage('id를 입력해주세요.', frm.m_email);
            			return false;
            		}
            		
            		if(frm.m_pw.value.length==0){
            			setMessage('password를 입력해주세요.', frm.m_pw);
            			return false;
               		}
            		return true;
            	}
            	
            	function setMessage(msg, element){
                    document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
        
                    if(element) {
                        element.select();
                    }
               }
            </script>
        </form>
    </div>
</body>
</html>