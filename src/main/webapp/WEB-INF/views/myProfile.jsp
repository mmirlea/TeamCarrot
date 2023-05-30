<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./resource/css/myProfileStyle.css" rel="stylesheet" />
</head>
<body>
	 <div class="wrap">
        <div class="header">
            <div class="headerIn">
                <div class="divLogo">
                    <a href="CarrotMain.jsp"><img src="./resource/img/DaangnMarket_logo.png" lt="당근마켓로고"></a>
                    <a href="MyPage.jsp"> 내 프로필</a>
                </div>
               
            </div> <!--.headerIn-->
        </div> <!--.header-->

        <div class="container">
            <div class="divProfile">
                <p class="pTitle">기본정보</p>
                <div class="divUser">
                    <div class="divUserImg">
                        <button class="btnUserImg">
                            <i class="fa-solid fa-user-pen"></i>
                            <!-- <i class="fas fa-user-circle"></i> -->
                        </button>
                    </div>

                    <div class="divInfo">
                        <p class="pProName">이름</p>
                        <p>이메일</p>
                    </div>

                    <!-- <div class="divUpdate">
                        <button class="btnUpdate">사진변경</button>
                    </div> -->
                </div>
                <p class="pLine"></p>
                <div class="divNicNm">
                    <div class="divText">
                        <p>닉네임</p>
                    </div>
                    <div class="divBtn">
                        <button type="submit" class="btnUpdate">수정</button>
                    </div>
                </div>
            </div> <!--.divProfile-->

            <div class="divSecurity">
                <p class="pTitle">기본보안설정</p>
                <div class="divSetPw">
                    <div class="divText">
                        <i class="fas fa-lock"></i>
                        <p>비밀번호</p>
                    </div>
                   
                    <div class="divBtn">
                        <button type="submit" class="btnUpdate">수정</button>
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

        <div class="footer"></div> <!--.footer-->
    </div>
</body>
</html>