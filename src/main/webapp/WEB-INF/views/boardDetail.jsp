<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/boardDetailStyle.css'/>" rel="stylesheet" />
</head>
<body>
	 <div class="wrap">

        <div class="header">
            <div class="headerIn">
                <div class="divBorad">
                    <a class="aTitle" href="<c:url value='/board/list'/>">
                        <button class="btnBoard">
                            <i class="fa-solid fa-circle-xmark"></i>
                        </button>
                    </a>
                </div>
               
                <div class="headerTitle">
                    <h1>동네생활</h1>
                    <!-- 중고 -->
                    <!-- <h1>내 물건 팔기</h1> -->
                </div>

                <div class="gnb">
                    <div class="gnbItem">
                        <button class="btnPic"><i class="fa-solid fa-image"></i></button>
                    </div>
                    <div class="gnbItem">
                        <button type="submit" class="btnTempSace">저장</button>
                    </div>
                    <div class="gnbItem">
                        <button type="submit" class="btnSave">완료</button>
                    </div>
                </div> <!--gnb-->
            </div> <!--.headeIn-->
        </div> <!--.header-->

        <div class="container">

            <div class="divTitle" id="divTitle">
                <!-- <h1 class="spanTitle">제목</h1> -->
                <div class="hTitle">
                    <input type="text" name = "title" class = "spanTitle" placeholder = "제목을 입력하세요">
                </div>

                <!-- 중고 -->
                <!-- <div class="divPrice">
                    <span class="spPrice">
                        <i class="fa-solid fa-won-sign"></i> &nbsp; 가격
                        &nbsp;
                        <input type="checkbox" name="chkShare" id="chkShare">
                        <label for="chkShare">나눔</label>
                        &nbsp;
                        <input type="checkbox" name="chkProposal" id="chkProposal">
                        <label for="chkProposal">가격제안받기</label>
                    </span>
                </div> -->

                <!-- 동네 -->
                <div class="divCategory">
                    <select name="boardCategory" class="boardCategory">
                        <option value="opDefault">주제선택</option>
                        <option value="opAccident">동네사건사고</option>
                        <option value="opRestaurant">동네맛집</option>
                        <option value="opNews">동네소식</option>
                        <option value="opLifeInfo">생활정보</option>
                        <option value="opHobby">취미생활</option>
                        <option value="opDaily">일상</option>
                        <option value="opLost">분실/실종센터</option>
                        <option value="opPlease">해주세요</option>
                        <option value="opPhoto">동네사진전</option>
                    </select>
                </div>
            </div>

            <div class="divLine">
                <p class="pLine"></p>
            </div>

            <!-- id="editor" contenteditable="true" -->
            <div class="divContent" >
                <!-- <span class="spContent" >
                    가까이 사는 동네 이웃들에게 궁금한 것을 물어보세요!
                    <br>
                    <b class="bTown">우리동네</b> 근처 이웃이 친절하게 진짜 동네 정보를 알려줄 거예요
                </span> -->
                <textarea class="spContent" >가까이 사는 동네 이웃들에게 궁금한 것을 물어보세요! &#10; 우리동네 근처 이웃이 친절하게 진짜 동네 정보를 알려줄 거예요
                </textarea>
            </div>

        </div> <!--.container-->

        <div class="footer">

        </div> <!--.footer-->

    </div>
</body>
</html>