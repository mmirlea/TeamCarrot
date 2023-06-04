<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="<c:url value='/resources/css/junggoStyle.css?aaa'/>" rel="stylesheet" />
</head>
<body>
<script>
	let msg="${msg}"
    if(msg=="LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
	if(msg=="READ_ERR") alert("게시물을 읽어들이는데 실패했습니다.")
</script>

	<div class="wrap">
	
		<%@ include file ="./header.jsp" %>
		<jsp:include page="./tabRigth.jsp" flush="false">
			<jsp:param name="menu" value="product" />
		</jsp:include>
		
        <div class="container">
            <div class="mainBanner">
                <a href="#"><img src="../resources/img/중고거래 배너.png" alt="동네 이웃과 안전한 중고거래..."></a>
            </div><!--mainBanner-->
            <div class="category-wrap">
                <ul>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-star"></i> 
                            <div class="categoryText">인기매물</div>
                        </button> 
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-laptop"></i> 
                            <div class="categoryText">디지털기기/가전</div>
                        </button>
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-couch"></i>
                            <div class="categoryText">가구/인테리어</div>
                        </button>
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-kitchen-set"></i>
                            <div class="categoryText">생활/주방</div> 
                        </button>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-baby-carriage"></i>
                            <div class="categoryText">유아용품</div>
                        </button>
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-shirt"></i>
                            <div class="categoryText">의류</div>
                        </button>
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-book"></i>
                            <div class="categoryText">도서</div>
                        </button>
                    </li>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-ticket"></i> 
                            <div class="categoryText">티켓/교환권</div>
                        </button>
                    <li class="categoryItem">
                        <button type="button" class="categoryBtn">
                            <i class="fa-solid fas fa-box"></i>
                            <div class="categoryText">기타 중고물품</div>
                        </button>
                    </li>
                </ul>
            </div>
            <div class="productList">
                <h1>중고거래 매물</h1>
                <c:if test="${ph.getTotalCnt()==null || ph.getTotalCnt() == 0}">
					<div>게시글이 없습니다.</div>
				</c:if>
                <ul>
                	<c:forEach var="productDTO" items="${list}">
                		<li>
                			<div>${productDTO.p_num}</div>
                			<a href="<c:url value='/carrot/read?${ph.sc.getQueryString()}&p_num=${productDTO.p_num }'/>">
                            <div class="itemImg"><img src="../resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
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
                            </div>
                        </a>    
                		</li>
                	</c:forEach>
                </ul>
            </div><!--productList-->
            <div class="paging">
                <!-- <div class="pageList">
                    <ul>
                        <li class="firstPage"><a href="#"><p>첫 페이지</p></a></li>
                        <li class="prevPage"><a href="#"><p>이전 페이지</p></a></li>
                        <li class="num"><a href="#"><p>1</p></a></li>
                        <li class="num"><a href="#"><p>2</p></a></li>
                        <li class="num"><a href="#"><p>3</p></a></li>
                        <li class="nextPage"><a href="#"><p>다음 페이지</p></a></li>
                        <li class="lastPage"><a href="#"><p>마지막 페이지</p></a></li>
                    </ul>
                </div>pageList  -->  
                
                <div>
		        	<c:if test="${ph.showPrev}">
		        		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.beginPage-1)}'/>"> 이전 페이지</a>   
		        	</c:if>
		        	
		        	<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
		        		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(i)}'/>"> ${i}</a>
		        	</c:forEach>
		        	
		        	
		        	<c:if test="${ph.showNext}">
		        		<a href="<c:url value='/carrot/junggoMain${ph.sc.getQueryString(ph.endPage+1)}'/>"> 다음 페이지</a>   
		        	</c:if>
        
        		</div>
                
            </div><!--paging-->
        </div><!--container-->
       
       <%@ include file ="./footer.jsp" %>
       
    </div> <!--wrap-->   
</body>
</html>