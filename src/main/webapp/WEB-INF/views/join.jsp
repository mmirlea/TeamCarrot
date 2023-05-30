<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="./resource/css/joinStyle.css">
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
        <form action="">
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
                    <td class="tdText"><label for="eamil">이메일</label></td>
                    <td><input type="email" id="email" class="inputInfo"></td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw">비밀번호</label></td>
                    <td>
                        <input type="password" id="pw" class="inputInfo">
                        <div class="warning">영문/숫자/특수문자 8~14자리</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="pw2">비밀번호 확인</label></td>
                    <td>
                        <input type="password" id="pw2" class="inputInfo">
                        <div class="warning">영문/숫자/특수문자 8~14자리</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdText"><label for="nickname">닉네임</label></td>
                    <td><input type="text" id="nickname" class="inputInfo"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="joinBtn">회원가입</button>
                    </td>
                </tr>
            </table>
        </form>

    </div><!--container-->
</body>
</html>