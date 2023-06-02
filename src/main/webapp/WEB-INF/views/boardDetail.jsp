<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/boardDetailStyle.css'/>" rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<script>
		let msg = "${msg}";
		if (msg == "WRT_ERR")
			alert("게시글 등록에 실패하였습니다.");
		if (msg == "MOD_ERR")
			alert("게시글 수정에 실패하였습니다.");
	</script>

	 <form class="wrap" id="form">

        <div class="header">
            <div class="headerIn">
                <div class="divBorad">
                    <a class="aTitle" href="<c:url value='/board/list'/>">
                        <button type="button" class="btnBoard" id="btnBoard">
                            <i class="fa-solid fa-circle-xmark"></i>
                        </button>
                    </a>
                </div>
               
                <div class="headerTitle">
                	<h1>${menu == "board" ? "동네생활" : "내 물건 팔기" }</h1>
                    <!-- <h1>동네생활</h1> -->
                    <!-- 중고 -->
                    <!-- <h1>내 물건 팔기</h1> -->
                </div>

                <div class="gnb">
                    <div class="gnbItem">
                        <button type="button" class="btnPic" ><i class="fa-solid fa-image"></i></button>
                    </div>
                    <div class="gnbItem">
                        <button type="button" class="btnTempSace" id="btnSave">저장</button>
                    </div>
                    <div class="gnbItem">
                        <button type="button" class="btnWrite" id="btnWrite">완료</button>
                    </div>
                </div> <!--gnb-->
            </div> <!--.headeIn-->
        </div> <!--.header-->

        <div class="container">
            <div class="divTitle" id="divTitle">
                <!-- <h1 class="spanTitle">제목</h1> -->
                <div class="hTitle">
					<input type="text" name="${menu == 'board' ? 'b_title' : 'p_title'}" class="spanTitle"
						placeholder="제목을 입력하세요"
						value="<c:out value='${menu == "board" ? boardDTO.b_title : productDTO.p_title }'/>  ">
				</div>
                
                <c:if test="${menu == 'board' }">
                	<!-- 동네 -->
	                <div class="divCategory"  >
	                    <select name="${menu == 'board' ? 'b_cate' : 'p_cate'}" class="boardCategory">
	                    	<option value="주제선택">주제선택</option>
	                        <option value="동네사건사고">동네사건사고</option>
	                        <option value="동네맛집">동네맛집</option>
	                        <option value="동네소식">동네소식</option>
	                        <option value="생활정보">생활정보</option>
	                        <option value="취미생활">취미생활</option>
	                        <option value="일상">일상</option>
	                        <option value="분실/실종센터">분실/실종센터</option>
	                        <option value="해주세요">해주세요</option>
	                        <option value="동네사진전">동네사진전</option>
	                    </select>
	                </div>
                </c:if>
                
                <c:if test="${menu != 'board' }">
                	<!-- 중고 -->
	                <div class="divPrice">
	                    <span class="spPrice">
	                        <i class="fa-solid fa-won-sign"></i> &nbsp; 
	                        <input type="text" placeholder="가격">	                        
	                        &nbsp;
	                        <input type="checkbox" name="chkShare" id="chkShare">
	                        <label for="chkShare">나눔</label>
	                        &nbsp;
	                        <input type="checkbox" name="chkProposal" id="chkProposal">
	                        <label for="chkProposal">가격제안받기</label>
	                    </span>
	                </div>
                </c:if>
            </div>

            <div class="divLine">
                <p class="pLine"></p>
            </div>

            <div class="divContent" >				
                <!-- 가까이 사는 동네 이웃들에게 궁금한 것을 물어보세요! &#10; 우리동네 근처 이웃이 친절하게 진짜 동네 정보를 알려줄 거예요 -->
                <textarea class="spContent"  name="${menu == 'board' ? 'b_content' : 'p_content'}">
                	<c:out value='${menu == "board" ? boardDTO.b_content : productDTO.p_content }'/>
                </textarea>
            </div>
        </div> <!--.container-->
    </form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnBoard").on("click", function() {
				location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
			})
			
			$("#btnWrite").on("click", function() {

				let form = $('#form');
				form.attr("action", "<c:url value='/board/write'/>");
				form.attr("method", "post");

				form.submit();
			})

			//임시저장
			$("#btnSave").on("click", function() {

				let form = $('#form');
				form.attr("action", "<c:url value='/board/save'/>");
				form.attr("method", "post");

				form.submit();
			})
		})
	</script>
</body>
</html>