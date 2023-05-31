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
<script>
	let msg="${msg}"
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
</script>

	<div class="wrap">
	
		<%@ include file ="./header.jsp" %>
		
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
                <ul>
                	<c:forEach var="productDTO" items="${list}">
                		<li>
                			<a href="junggoDetail.jsp">
                            <div class="itemImg"><img src="../resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
                            <div class="itemName">${productDTO.p_title}</div>
                            <div class="itemPrice">${productDTO.p_price}</div>
                            <div class="itemAddress">
                            	<span>${productDTO.userDTO.m_addr1}</span>
                            	<span>${productDTO.userDTO.m_addr2}</span>
                            </div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 ${productDTO.p_likey}</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 ${productDTO.p_comm}</span>
                            </div>
                        </a>    
                		</li>
                	</c:forEach>
                    <!-- <li>
                        <a href="junggoDetail.jsp">
                            <div class="itemImg"><img src="./resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
                            <div class="itemName">전동드릴 공구 셋트</div>
                            <div class="itemPrice">10,000원</div>
                            <div class="itemAddress">서울 마포구 동교동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 25</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 65</span>
                            </div>
                        </a>    
                    </li>
                    <li>
                        <a href="">
                            <div class="itemImg"><img src="./resources/img/LG 43인치 UHDtv1.jpg" alt="LG 43인치 UHDtv1"></div>
                            <div class="itemName">LG 43인치 UHDtv1 팝니다.</div>
                            <div class="itemPrice">250,000원</div>
                            <div class="itemAddress">경기도 안양시 만안구 안양동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 28</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 63</span>
                        </div>
                        </a>
                    </li>
                    <li>
                        <a href="junggoDetail.jsp">
                            <div class="itemImg"><img src="./resources/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></div>
                            <div class="itemName">이사가느라 가전 팔아요~!골라가세요~!</div>
                            <div class="itemPrice">99원</div>
                            <div class="itemAddress">광주 북구 신용동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 26</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 27</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/발뮤다 더 토스터1.jpg" alt="발뮤다 더 토스터1"></div>
                            <div class="itemName">발뮤다 더 토스터,더 오븐레인지,더 팟 팝니다.</div>
                            <div class="itemPrice">100,000원</div>
                            <div class="itemAddress">경기도 성남시 분당구 이매동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 30</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 31</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
                            <div class="itemName">전동드릴 공구 셋트</div>
                            <div class="itemPrice">10,000원</div>
                            <div class="itemAddress">서울 마포구 동교동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 25</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 65</span>
                            </div>
                        </a>    
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/LG 43인치 UHDtv1.jpg" alt="LG 43인치 UHDtv1"></div>
                            <div class="itemName">LG 43인치 UHDtv1 팝니다.</div>
                            <div class="itemPrice">250,000원</div>
                            <div class="itemAddress">경기도 안양시 만안구 안양동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 28</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 63</span>
                        </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></div>
                            <div class="itemName">이사가느라 가전 팔아요~!골라가세요~!</div>
                            <div class="itemPrice">99원</div>
                            <div class="itemAddress">광주 북구 신용동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 26</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 27</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/발뮤다 더 토스터1.jpg" alt="발뮤다 더 토스터1"></div>
                            <div class="itemName">발뮤다 더 토스터,더 오븐레인지,더 팟 팝니다.</div>
                            <div class="itemPrice">100,000원</div>
                            <div class="itemAddress">경기도 성남시 분당구 이매동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 30</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 31</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
                            <div class="itemName">전동드릴 공구 셋트</div>
                            <div class="itemPrice">10,000원</div>
                            <div class="itemAddress">서울 마포구 동교동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 25</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 65</span>
                            </div>
                        </a>    
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/LG 43인치 UHDtv1.jpg" alt="LG 43인치 UHDtv1"></div>
                            <div class="itemName">LG 43인치 UHDtv1 팝니다.</div>
                            <div class="itemPrice">250,000원</div>
                            <div class="itemAddress">경기도 안양시 만안구 안양동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 28</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 63</span>
                        </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></div>
                            <div class="itemName">이사가느라 가전 팔아요~!골라가세요~!</div>
                            <div class="itemPrice">99원</div>
                            <div class="itemAddress">광주 북구 신용동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 26</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 27</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/발뮤다 더 토스터1.jpg" alt="발뮤다 더 토스터1"></div>
                            <div class="itemName">발뮤다 더 토스터,더 오븐레인지,더 팟 팝니다.</div>
                            <div class="itemPrice">100,000원</div>
                            <div class="itemAddress">경기도 성남시 분당구 이매동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 30</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 31</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/전동드릴 공구 셋트1.jpg" alt="전동드릴 공구 셋트1"></div>
                            <div class="itemName">전동드릴 공구 셋트</div>
                            <div class="itemPrice">10,000원</div>
                            <div class="itemAddress">서울 마포구 동교동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 25</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 65</span>
                            </div>
                        </a>    
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/LG 43인치 UHDtv1.jpg" alt="LG 43인치 UHDtv1"></div>
                            <div class="itemName">LG 43인치 UHDtv1 팝니다.</div>
                            <div class="itemPrice">250,000원</div>
                            <div class="itemAddress">경기도 안양시 만안구 안양동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 28</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 63</span>
                        </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/이사가느라 가전 팔아요1.jpg" alt="이사가느라 가전 팔아요1"></div>
                            <div class="itemName">이사가느라 가전 팔아요~!골라가세요~!</div>
                            <div class="itemPrice">99원</div>
                            <div class="itemAddress">광주 북구 신용동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 26</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 27</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="itemImg"><img src="./resources/img/발뮤다 더 토스터1.jpg" alt="발뮤다 더 토스터1"></div>
                            <div class="itemName">발뮤다 더 토스터,더 오븐레인지,더 팟 팝니다.</div>
                            <div class="itemPrice">100,000원</div>
                            <div class="itemAddress">경기도 성남시 분당구 이매동</div>
                            <div class="itemCountUp">
                                <span class="itemAttention">관심 30</span>
                                &nbsp;•&nbsp;
                                <span class="itemChat">댓글 31</span>
                            </div>
                        </a>
                    </li> -->
                </ul>
            </div><!--productList-->
            <div class="paging">
                <div class="pageList">
                    <ul>
                        <li class="firstPage"><a href="#"><p>첫 페이지</p></a></li>
                        <li class="prevPage"><a href="#"><p>이전 페이지</p></a></li>
                        <li class="num"><a href="#"><p>1</p></a></li>
                        <li class="num"><a href="#"><p>2</p></a></li>
                        <li class="num"><a href="#"><p>3</p></a></li>
                        <li class="nextPage"><a href="#"><p>다음 페이지</p></a></li>
                        <li class="lastPage"><a href="#"><p>마지막 페이지</p></a></li>
                    </ul>
                </div><!--pageList-->   
                
            </div><!--paging-->
        </div><!--container-->
       
       <%@ include file ="./footer.jsp" %>
       
    </div> <!--wrap-->   
</body>
</html>