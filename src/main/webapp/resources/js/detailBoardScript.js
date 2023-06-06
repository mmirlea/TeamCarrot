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
	
	if (b_cate.value == "" || form.b_cate.value == "주제선택") {
		setMessage('카테고리를 선택하세요', form.b_cate);
		return false;
	}
	
	if (b_content.value == "") {
		setMessage('내용을 입력하세요', form.b_content);
		return false;
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
$('#close').on('click',()=>{
	history.back();
})

let fileList = ['${boardDTO.b_img}'];
console.log(fileList);
createFileList();
function fileToBase64(file){
	const reader = new FileReader();
    reader.readAsDataURL(file)
    reader.onload = () => {
    	 const b_img = event.target.result;
         fileList = [];
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
		$li.className = 'lPhoto';
		$div.className = 'dPhoto';
		$img.className = 'img-photo'
		$img.src = b_img;
		$div.append($img);		
		$li.append($div);
		divPhoto.append($li);
		$('#b_img').val(b_img);
	})
}
})