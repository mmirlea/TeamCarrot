<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/headerStyle.css'/>" rel="stylesheet" />
</head>
<body>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}" />
<c:set var="loginOut" value="${sessionScope.id==null ? '로그인/회원가입' : '로그아웃'}" />
	 <div class="header">
            <div class="headerIn ">
                <div class="hTop">
                    <div class="divLogo">
                            <a href="<c:url value='/'/>">
                            <img src="../resources/img/DaagnMarket_logo.png" alt="당근마켓로고"/>
                            <p>당근마켓</p>
                        </a>
                    </div>
                    <div class="gnb">
                        <ul>
                            <li><a href="JunggoMain.jsp" class="gnbMenu">중고거래</a></li>
                            <li><a href="<c:url value='/board/list'/>" class="gnbMenu">동네소식</a></li>
                        </ul>
                    </div>
                    <div class="member">
                        <ul>
                            <li><a href="<c:url value='${loginOutLink}'/>" class="meMenu">${loginOut}</a></li>
                            <li><a href="MyPage.jsp" class="meMenu">마이페이지</a></li>
                        </ul>
                    </div>
                </div> <!--.hTop-->
				<form action="<c:url value="/carrot/JunggoMain"/>" method="get" name="cateForm">
                <div class="hBottom">
                    <div class="d"></div>
                    <div class="searchLocal">
                        <div class="search">
                            <input type="text" name="txtSearch" class="txtSearch" value="${parma.keyword}" placeholder="찾으실 항목을 입력하세요">
                            <button type="submit" class="btnSearch">
                                <i class="fas fa-chevron-circle-right"></i>
                                <!-- <i class="xi-heart"></i> -->
                            </button>
                        </div>
                    </div> <!--.searchLocal-->

                    <div class="divChat">
                        <button class="btnChat">
                            <!-- <i class="fas fa-comment-dots"></i> -->
                            <i class="far fa-comment-dots"></i>

                            <!-- <i class="fas fa-bullhorn"></i> -->
                            <!-- 공지사항 -->
                        </button>
                    </div>

                    <div class="divSetLocal">
                        <select name="addr1" class="region">
                            <option value="opRegion" ${region=='opRegion' ? "selected" : ""}>지역을 선택하세요</option>
                            <option value="울산광역시 북구" ${region=='울산광역시 북구' ? "selected" : ""}>울산광역시 북구</option>
                            <option value="울산광역시 동구" ${region=='울산광역시 동구' ? "selected" : ""}>울산광역시 동구</option>
                            <option value="울산광역시 남구" ${region=='울산광역시 남구' ? "selected" : ""}>울산광역시 남구</option>
                            <option value="울산광역시 중구" ${region=='울산광역시 중구' ? "selected" : ""}>울산광역시 중구</option>
                        </select>
                        <select name="addr2" class="town">
                        	<option value="opTown">동네를 선택하세요</option>
                        	                            <c:choose >
                            	<c:when test="${SearchConditionP.addr1 =='울산광역시 북구'}">
                            		<option value="화봉동">화봉동</option>
                            		<option value="양정동">양정동</option>
                            		<option value="염포동">염포동</option>
                            	</c:when>
                            	<c:when test="${SearchConditionP.addr1 =='울산광역시 동구'}">
                            		<option value="방어동">방어동</option>
                            		<option value="남목동">남목동</option>
                            		<option value="일산동">일산동</option>
                            	</c:when>
                          	</c:choose> --%>
                          	
                        </select>
                    </div> <!--.divSetLocal-->
                </div> <!--.hBottom-->
               </form> 
            </div><!--.headIn-->
        </div> <!--.header-->
<script >
	function addr1Cate(){
		let x = document.cateForm.addr1.options.selectedIndex; //대분류 선택한 인덱스
		let addr1Cnt = document.cateForm.addr1.options.length;//대분류 갯수
		let addr1Arr = new Array(addr1Cnt);// 대분류 갯수만큼 배열생성
		
		for(i=0; i<addr1Cnt; i++){
			addr1Arr[i]=new Array();
		}// 이차원 배열 생성
		
		addr1Arr[0][0] = new Option("지역을 선택하세요", "opRegion");
		addr1Arr[1][1] = new Option("울산광역시 북구", "울산광역시 북구");
		addr1Arr[1][2] = new Option("울산광역시 동구", "울산광역시 동구");
		addr1Arr[1][3] = new Option("울산광역시 남구", "울산광역시 남구");
		addr1Arr[1][4] = new Option("울산광역시 중구", "울산광역시 중구");
		
		temp = document.cateForm.addr2;// 중분류 얻기
		for(j=temp.option.length-1; j>0; j--){ //현재 값 지우기
			temp.options[j]=null
		}
		for(i=0; addr1Arr[x].length-1; i++){ //값 넣기
		//예) <option value="울산광역시 남구">울산광역시 남구</option>
			temp.option[i]=new Option(addr1Arr[x][i].text, addr1Arr.[x[i].vlaue]);
		}
		temp.option[0].selected=true
		
	} //addr1Cate()
		
	function addr2Change(){
		
		let addr1Index = document.cateForm.addr1.options.selecteIndex; //첫번째(대분류) 인덱스
		let x = document.cateForm.addr2.options.selectedIndex; //현재 선택한 인텍스(중분류)
		let addr2Cnt = document.cateForm.addr2.options.length;
		let addr2Arr = new Array(addr2Cnt);
		
		for(i=0; i<addr2Cnt; i++){
			addr2Arr[i] = new Array();
		}//이차원 배열 생성
		
		if(addr1Index == 1){
			addr2Arr[0][0] = new Option("동네를 선택하세요", "opTown");
			//울산광역시 북구
			group[1][0] = new Option("화봉동", 화봉동);
			group[1][1] = new Option("염포동", 염포동);
			group[1][2] = new Option("양정동", 양정동);
			
		}
		
	}

</script>

</body>
</html>