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
<% String menu = request.getParameter("menu"); %>
<script type="text/javascript">
	const menu = '<%= request.getParameter("menu") %>'
	let b_title = document.getElementById("b_title");
	let b_cate = document.getElementById("b_cate");
	let b_content = document.getElementById("b_content");
	let form = document.getElementById("form");
	
	function formCheck() {
		/* if (form.b_title.value == "") {
			setMessage('제목을 입력하세요', form.b_title);
			return false;
		}
		
		if (form.b_cate.value == "" || form.b_cate.value == "주제선택") {
			setMessage('카테고리를 선택하세요', form.b_cate);
			return false;
		}
		
		if (form.b_content.value == "") {
			setMessage('내용을 입력하세요', form.b_content);
			return false;
		} */
	
		return true;
	}
	
	function setMessage(msg, element) {
		alert(msg);
	
		if (element) {
			element.select();
		}
	}

	$(document).ready(function() {
	$('#close').on('click',()=>{
		history.back();
	})
	
	let fileList = [];
	
	function fileToBase64(file){
		const reader = new FileReader();
	    reader.readAsDataURL(file)
	    reader.onload = () => {
	    	 const b_img = event.target.result;
	         console.log('업로드할 blob파일',b_img);
	         fileList.push(b_img);
	         createFileList();
	    }
	}
	
	
	$('#fileUpload').on('change',(e)=>{
		 const file = $('#fileUpload')[0].files[0];
		 fileToBase64(file);
	})
	
	$("#btnBoard").on("click", function() {
				location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
			})
			
			$("#btnModify").on("click", function() {
				if (formCheck()) {
					let form = $('#form');
		
					form.attr("action", "<c:url value='/board/modify'/>");
					form.attr("method", "post");
		
					form.submit();
				}
			})
			
			$("#btnWrite").on("click", function() {
				if (formCheck()) {
					let form = $('#form');
					$('.imgUpload').value = fileList;
					form.attr("action", "<c:url value='/board/write?'/>");
					form.attr("method", "post");
		
					form.submit();
				}
			})

			//임시저장
			$("#btnSave").on("click", function() {
				if (formCheck()) {
					let form = $('#form');
					
					if($("#txtSave").val() == null || $("#txtSave").val() == "" || $("#txtSave").val() == "N"){
						$("#txtSave").attr("value", "Y");
					}
					
					form.attr("action", "<c:url value='/board/save'/>");
					form.attr("method", "post");
					
					form.submit();
				}
			})
	
	//파일 생성하기
	function createFileList(){
		const divPhoto = document.querySelector('.divPhoto > ul');
		divPhoto.innerHTML = '';
		fileList.forEach((b_img) => {
			const $li = document.createElement('li');
			const $div = document.createElement('div');
			const $img = document.createElement('img');
			$li.className = ''
			$div.className = ''
			$img.className = ''
			$img.src = b_img;
			$div.append($img);		
			$li.append($div);
			divPhoto.append($li);
		})
	}
})
</script>
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
                    <a class="aTitle" id="close">
                        <button type="button" class="btnBoard" id="btnBoard">
                            <i class="fa-solid fa-circle-xmark"></i>
                        </button>
                    </a>
                </div>
               
                <div class="headerTitle">
                	<h1>${menu eq "board" ? "동네생활" : "내 물건 팔기" }</h1>
                    <!-- <h1>동네생활</h1> -->
                    <!-- 중고 -->
                    <!-- <h1>내 물건 팔기</h1> -->
                </div>

                <div class="gnb">
                    <div class="gnbItem">                    
                        <button type="button" class="btnPic" >
                        	<label for="fileUpload"><i class="fa-solid fa-image"></i></label>                        	
                        	<input type="file" id="fileUpload"  style="display:none">
                        </button>
                    </div>
                    <div class="gnbItem">
                   	 	<input type="hidden" id ="txtSave" name="b_tempSaveYn" value="N">
                        <button type="button" class="btnSave" id="btnSave">저장</button>
                    </div>
                    <div class="gnbItem">
                    	<c:if test="${mode == 'new' }">
	                        <button type="button" class="btnWrite" id="btnWrite">완료</button>
                    	</c:if>
                    	<c:if test="${mode != 'new' }">
                    		<input type="hidden" value="${boardDTO.b_num} " name="b_num">
	                        <button type="button" class="btnModify" id="btnModify">수정</button>
                    	</c:if>
                    	<input type="hidden" id="imgUpload"  />
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
						value="<c:out value='${menu == "board" ? boardDTO.b_title : productDTO.p_title }'/>">
				</div>
                
                <c:set var='menu' value="<%= menu %>"/>
                <c:if test="${menu eq 'board' }">
                	<!-- 동네 -->
	                <div class="divCategory"  >
	                    <select name="b_cate" value="${boardDTO.b_cate}" class="boardCategory">
	                    	<option value="주제선택" ${boardDTO.b_cate == '주제선택' ? "selected" : ""}>주제선택</option>
	                        <option value="동네사건사고" ${boardDTO.b_cate == '동네사건사고' ? "selected" : ""}>동네사건사고</option>
	                        <option value="동네맛집" ${boardDTO.b_cate == '동네맛집' ? "selected" : ""}>동네맛집</option>
	                        <option value="동네소식" ${boardDTO.b_cate == '동네소식' ? "selected" : ""}>동네소식</option>
	                        <option value="생활정보" ${boardDTO.b_cate == '생활정보' ? "selected" : ""}>생활정보</option>
	                        <option value="취미생활" ${boardDTO.b_cate == '취미생활' ? "selected" : ""}>취미생활</option>
	                        <option value="일상" ${boardDTO.b_cate == '일상' ? "selected" : ""}>일상</option>
	                        <option value="분실/실종센터" ${boardDTO.b_cate == '분실/실종센터' ? "selected" : ""}>분실/실종센터</option>
	                        <option value="해주세요" ${boardDTO.b_cate == '해주세요' ? "selected" : ""}>해주세요</option>
	                        <option value="동네사진전" ${boardDTO.b_cate == '동네사진전' ? "selected" : ""}>동네사진전</option>
	                    </select>
	                </div>
                </c:if>
                
                <c:if test="${menu eq 'product' }">
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

			 <div class="divPhoto">
				<ul>
						
				</ul>
			</div>
			
            <div class="divContent" >				
                <!-- 가까이 사는 동네 이웃들에게 궁금한 것을 물어보세요! &#10; 우리동네 근처 이웃이 친절하게 진짜 동네 정보를 알려줄 거예요 -->
				<textarea class="spContent" name="${menu == 'board' ? 'b_content' : 'p_content'}"><c:out value='${menu == "board" ? boardDTO.b_content : productDTO.p_content }'/></textarea>
			</div>
        </div> <!--.container-->
    </form>

</body>
</html>