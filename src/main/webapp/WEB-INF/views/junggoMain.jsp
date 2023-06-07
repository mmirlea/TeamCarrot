<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/junggoStyle.css'/>" rel="stylesheet" />
</head>
<body>
<% String menu = request.getParameter("menu"); %>
<script>
	let msg="${msg}"
    if(msg=="LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
	if(msg=="READ_ERR") alert("게시물을 읽어들이는데 실패했습니다.");
	if (msg == "DEL_OK") alert("게시글이 삭제되었습니다.");
	if (msg == "DEL_ERR") alert("게시글 삭제에 실패하였습니다.");
	if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
	if (msg == "MOD_OK") alert("게시글 수정을 성공하였습니다.");
</script>

	<div class="wrap">
	
		<jsp:include page ="./header.jsp" flush="false">
			<jsp:param name="menu" value="product" />
		</jsp:include>
		<jsp:include page="./tabRigth.jsp" flush="false">
			<jsp:param name="menu" value="product" />
		</jsp:include>
		
        <div class="container">
            <div class="mainBanner">
                <a href="#"><img src="../resources/img/중고거래 배너.png" alt="동네 이웃과 안전한 중고거래..."></a>
            </div><!--mainBanner-->
            <form>
	            <div class="category-wrap">
	                <ul>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn">
	                            <i class="fa-solid fas fa-star" name="cate" value="star"></i> 
	                            <div class="categoryText">인기매물</div>
	                        </button> 
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="digital">
	                            <i class="fa-solid fas fa-laptop"></i> 
	                            <div class="categoryText">디지털기기/가전</div>
	                        </button>
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="funiture">
	                            <i class="fa-solid fas fa-couch"></i>
	                            <div class="categoryText">가구/인테리어</div>
	                        </button>
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="kitchen">
	                            <i class="fa-solid fas fa-kitchen-set"></i>
	                            <div class="categoryText">생활/주방</div> 
	                        </button>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="baby">
	                            <i class="fa-solid fas fa-baby-carriage"></i>
	                            <div class="categoryText">유아용품</div>
	                        </button>
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="clothes">
	                            <i class="fa-solid fas fa-shirt"></i>
	                            <div class="categoryText">의류</div>
	                        </button>
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="book">
	                            <i class="fa-solid fas fa-book"></i>
	                            <div class="categoryText">도서</div>
	                        </button>
	                    </li>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="ticket">
	                            <i class="fa-solid fas fa-ticket"></i> 
	                            <div class="categoryText">티켓/교환권</div>
	                        </button>
	                    <li class="categoryItem">
	                        <button type="button" class="categoryBtn" name="cate" value="etc">
	                            <i class="fa-solid fas fa-box"></i>
	                            <div class="categoryText">기타 중고물품</div>
	                        </button>
	                    </li>
	                </ul>
	            </div>
            </form>
            <div class="productList">
                <h1>중고거래 매물</h1>
                <c:if test="${ph.getTotalCnt()==null || ph.getTotalCnt() == 0}">
					<div>게시글이 없습니다.</div>
				</c:if>
                <ul>
                	<c:forEach var="productDTO" items="${list}">
                		<li>
                			<input type="hidden" value="${productDTO.p_num} " name="p_num">
                			<a href="<c:url value='/carrot/read?${ph.sc.getQueryString()}&p_num=${productDTO.p_num }&menu=product'/>">
                            <div class="itemImg">
                               	<img src="${productDTO.p_img}" alt="" class="thumb" onerror="this.src='/carrot/resources/img/notice.png'">
                            </div>
                            <div class="itemName"><c:out value="${productDTO.p_title}"/></div>
                            <div class="itemPrice"><c:out value="${productDTO.p_price}"/></div>
                            <div class="itemAddress">
                            	<span>${productDTO.userDTO.m_addr1}</span>
                            	<span>${productDTO.userDTO.m_addr2}</span>
                            </div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 ${productDTO.p_likey}</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">채팅 3</span>
                                &nbsp;•&nbsp;
                                <span class="time">${productDTO.p_update}</span>
                            </div>
                        </a>    
                		</li>
                	</c:forEach>
                </ul>
            </div><!--productList-->
            <div class="paging">
               <div class="paging">
				<div class="pageList">
					<ul>
						<li class="firstPage">
							<c:if test="${ph.showPrev}">
			       				<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.beginPage-1)}'/>"> 
			       				<p>&lt;&lt;</p>
			       				</a>  
			       			</c:if>
		       			</li>
		       	
		       			<li class="prevPage">
		       				<c:if test="${ph.showPrev}">
			       				<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.beginPage-1)}'/>"> 
			       				<p>&lt;</p>
			       				</a>   
			       			</c:if>
		       			</li>
		       			
		       			<li class="num">
					       	<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
					       		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(i)}'/>"> 
					       		<p>${i}</p>
					       		</a>
					       	</c:forEach>
				       	</li>
				       	
				       	<li class="nextPage">
					       	<c:if test="${ph.showNext}">
					       		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.endPage+1)}'/>">
					       		<p>&gt;</p>
			       				</a>   
					       	</c:if>
				       	</li>
				       	
				       	<li class="lastPage">
					       	<c:if test="${ph.showNext}">
					       		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.endPage+1)}'/>">
								<p>&gt;&gt;</p>
			       				</a>    
					       	</c:if>
				       	</li>
				   	</ul>
				</div> <!--pageList-->
			</div> <!--paging-->
                
            </div><!--paging-->
                
            </div><!--paging-->
        </div><!--container-->
       
       <%@ include file ="./footer.jsp" %>

    </div> <!--wrap-->  
    
    <script type="text/javascript">
			 $(document).ready(function() {
				 document.querySelectorAll('.time').forEach(($time)=>{
					 const time = $time.innerText
					 $time.innerText = timeForToday(time);
				 })
				
			 }) 
			function timeForToday(value) {
				const today = new Date();
		        const timeValue = new Date(value);
		
		        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
		        console.log(betweenTime);
		        if (betweenTime < 1) return '방금전';
		        if (betweenTime < 60) {
		            return betweenTime + '분전';
		        }
		
		        const betweenTimeHour = Math.floor(betweenTime / 60);
		        if (betweenTimeHour < 24) {
		            return betweenTimeHour + '시간전';
		        }
		
		        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
		        if (betweenTimeDay < 365) {
		            return betweenTimeDay + '일전';
		        }
		
		        return Math.floor(betweenTimeDay / 365) + '년전';
		 	}
    </script> 
</body>
</html>