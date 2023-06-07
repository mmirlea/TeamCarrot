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
let menu = '<%= request.getParameter("menu") %>'

function formCheck() {
	let form = document.getElementById("form");
	let b_title = document.getElementById("b_title");
	let b_cate = document.getElementById("b_cate");
	let b_content = document.getElementById("b_content");

	if (b_title.value == "") {
		setMessage('제목을 입력하세요', form.b_title);
		return false;
	}
	if (b_content.value == "") {
		setMessage('내용을 입력하세요', form.b_content);
		return false;
	}

	if (menu === 'board') {
		if (b_cate.value == "" || form.b_cate.value == "주제선택") {
			setMessage('카테고리를 선택하세요', form.b_cate);
			return false;
		}
	}
	return true;
}

function setMessage(msg, element) {
	alert(msg);

	if (element) {
		element.focus();
	}
}

$(document).ready(function() {
	$('#btnBoard').on('click',()=>{
		history.back();
	})

	// 수정
	$("#btnModify").on("click", function() {
		let form = $('#form');
		
		if (menu !== 'board') {

			if($("input:checkbox[name='p_negoyn']").is(":checked")){
				
				$("input:checkbox[name='p_negoyn']").attr("value", "Y");
				alert($('input:checkbox[name="p_negoyn"]').val());
			}
			
			form.attr("action", "<c:url value='/carrot/modify'/>");
		} else {
			form.attr("action", "<c:url value='/board/modify'/>");
		}
		
		form.attr("method", "post");
		form.submit();
	})

	// 저장
	$("#btnWrite").on("click", function() {
		let form = $('#form');
		if (menu !== 'board') {
			if($("input:checkbox[name='p_negoyn']").is(":checked")){
				
				$("input:checkbox[name='p_negoyn']").attr("value", "Y");
				alert($('input:checkbox[name="p_negoyn"]').val());
					
			}
			form.attr("action", "<c:url value='/carrot/write'/>");
		} else {
			form.attr("action", "<c:url value='/board/write'/>");
		}
		
		form.attr("method", "post");
		form.submit();
		
	})

	//임시저장
	$("#btnSave").on("click", function() {
		let form = $('#form');
		
		if($(".txtSave").val() == null || $(".txtSave").val() == "" || $(".txtSave").val() == "N"){
			$(".txtSave").attr("value", "Y");
		}
		
		if (menu !== 'board') {
			if($("input:checkbox[name='p_negoyn']").is(":checked")){
				
				$("input:checkbox[name='p_negoyn']").attr("value", "Y");
				alert($('input:checkbox[name="p_negoyn"]').val());
					
			}
			
			form.attr("action", "<c:url value='/carrot/save'/>");
		} else {
			form.attr("action", "<c:url value='/board/save'/>");
		}
		
		form.attr("method", "post");
		form.submit();
	})
	
	// 수정하기 시 파일 가져와 웹에 보이기
	let fileList = ['${boardDTO.b_img}'];
	createFileList();

	let fileList_p = ['${productDTO.p_img}'];
	createFileList_p();	
	
	// 파일 이벤트핸들러
	$('#fileUpload').on('change',(e)=>{
		 const file = $('#fileUpload')[0].files[0];
		 fileToBase64(file); // 올린파일을 웹에서 볼 수 있게 변환
	})

	// 파일 변환해서 생성하기
	function fileToBase64(file){
		const reader = new FileReader();
	    reader.readAsDataURL(file)
	    reader.onload = () => {
	    	
	    	 if (menu !== 'board') {
	    		 const p_img = event.target.result;
		         fileList_p = [];
		         fileList_p.push(p_img);
		         createFileList_p();
	    	 }else{
	    		 const b_img = event.target.result;
		         fileList = [];
		         fileList.push(b_img);
		         createFileList();
	    	 }
	    }
	}

	// 생성한 파일 웹그리기
	function createFileList(){
		const divPhoto = document.querySelector('.divPhoto > ul');
		divPhoto.innerHTML = '';
		fileList.filter(file=>file !== '').forEach((b_img) => {
			const $li = document.createElement('li');
			const $div = document.createElement('div');
			const $button = document.createElement('button');
			const $i = document.createElement('i');
			const $img = document.createElement('img');
			$li.className = 'lPhoto';
			$div.className = 'dPhoto';
			$button.className = 'btnImgDel'
			$i.className = 'fa-solid fa-circle-xmark'
			// 파일 삭제하기
			$button.addEventListener('click',function (){
				const fileURL = fileList[0];
				if(fileURL && !fileURL.includes('base64')){
					let fileName = fileURL.split('/')[3];
					$.ajax({
						type: 'get',
						url: '/carrot/delFile/'+fileName,
					})
				}else{
					$('#fileUpload')[0].value = "";
				}
				fileList = [];
				createFileList();
			})
			$img.className = 'img-photo'
			$img.src = b_img;
			$div.append($img);		
			$button.append($i);
			$div.append($button);
			$li.append($div);
			divPhoto.append($li);
			$('#b_img').val(b_img);
		})
	}
	// 생성한 파일 웹그리기
	function createFileList_p(){
		const divPhoto = document.querySelector('.divPhoto > ul');
		divPhoto.innerHTML = '';
		fileList_p.filter(file=>file !== '').forEach((p_img) => {
			const $li = document.createElement('li');
			const $div = document.createElement('div');
			const $button = document.createElement('button');
			const $i = document.createElement('i');
			const $img = document.createElement('img');
			$li.className = 'lPhoto';
			$div.className = 'dPhoto';
			$button.className = 'btnImgDel'
			$i.className = 'fa-solid fa-circle-xmark'
			// 파일 삭제하기
			$button.addEventListener('click',function (){
				const fileURL = fileList_p[0];
				if(fileURL && !fileURL.includes('base64')){
					let fileName = fileURL.split('/')[3];
					$.ajax({
						type: 'get',
						url: '/carrot/delFile/'+fileName,
					})
				}else{
					$('#fileUpload')[0].value = "";
				}
				fileList_p = [];
				createFileList_p();
			})
			$img.className = 'img-photo'
			$img.src = p_img;
			$div.append($img);		
			$button.append($i);
			$div.append($button);
			$li.append($div);
			divPhoto.append($li);
			$('#p_img').val(p_img);
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
	<form class="wrap" id="form" enctype="multipart/form-data">

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
                        	<input type="file" id="fileUpload" name="fileUpload" style="display:none">
                        </button>
                    </div>
                    <div class="gnbItem">
                   	 	<input type="hidden" class ="txtSave" name="b_tempSaveYn" value="N">
                   	 	<input type="hidden" class ="txtSave" name="p_tempsaveyn" value="N">
                        <button type="button" class="btnSave" id="btnSave">저장</button>
                    </div>
                    <div class="gnbItem">
                    	<c:if test="${mode == 'new' }">
	                        <button type="button" class="btnWrite" id="btnWrite">완료</button>
                    	</c:if>
                    	<c:if test="${mode != 'new' }">
                    		<input type="hidden" value="${boardDTO.b_num} " name="b_num">
                    		<input type="hidden" value="${productDTO.p_num} " name="p_num">
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
					<input type="text" id="b_title" name="${menu == 'board' ? 'b_title' : 'p_title'}" class="spanTitle"
						placeholder="제목을 입력하세요"
						value="<c:out value='${menu == "board" ? boardDTO.b_title : productDTO.p_title }'/>">
				</div>
                
                <c:set var='menu' value="<%= menu %>"/>
                <c:if test="${menu eq 'board' }">
                	<!-- 동네 -->
	                <div class="divCategory"  >
	                    <select id="b_cate" name="b_cate" value="${boardDTO.b_cate}" class="boardCategory">
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
	                        <input type="text" name="p_price" value="${productDTO.p_price}" >	                        
	                        &nbsp;
	                        <input type="checkbox" name="chkShare" id="chkShare">
	                        <label for="chkShare">나눔</label>
	                        &nbsp;
	                        <input type="checkbox" name="p_negoyn" id="chkProposal" ${productDTO.p_negoyn == "Y" ? "checked" : "" }>
	                        <label for="chkProposal">가격제안받기</label>
	                        
	                    </span>
	                </div>
	                
	                
	                <div class="divCategory"  >
	                    <select name="p_cate" value="${productDTO.p_cate}" class="productCategory">
	                    	<option value="주제선택" ${productDTO.p_cate == '카테고리선택' ? "selected" : ""}>카테고리선택</option>
	                        <option value="디지털기기/가전" ${productDTO.p_cate == '디지털기기/가전' ? "selected" : ""}>디지털기기/가전</option>
	                        <option value="가구/인테리어" ${productDTO.p_cate == '가구/인테리어' ? "selected" : ""}>가구/인테리어</option>
	                        <option value="생활/주방" ${productDTO.p_cate == '생활/주방' ? "selected" : ""}>생활/주방</option>
	                        <option value="유아용품" ${productDTO.p_cate == '유아용품' ? "selected" : ""}>유아용품</option>
	                        <option value="의류" ${productDTO.p_cate == '의류' ? "selected" : ""}>의류</option>
	                        <option value="도서" ${productDTO.p_cate == '도서' ? "selected" : ""}>도서</option>
	                        <option value="티켓/교환권" ${productDTO.p_cate == '티켓/교환권' ? "selected" : ""}>티켓/교환권</option>
	                        <option value="기타 중고물품" ${productDTO.p_cate == '기타 중고물품' ? "selected" : ""}>기타 중고물품</option>                        
	                    </select>
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
				<textarea class="spContent" id="b_content" name="${menu == 'board' ? 'b_content' : 'p_content'}"><c:out value='${menu == "board" ? boardDTO.b_content : productDTO.p_content }'/></textarea>
			</div>
        </div> <!--.container-->
    </form>

</body>
</html>