<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
    <link href="<c:url value='/resources/css/myPageStyle.css?bfda'/>" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<body>
<script>
	let msg="${msg}"
    if(msg=="LIST_ERR") alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
	if(msg=="READ_ERR") alert("게시물을 읽어들이는데 실패했습니다.")
</script>
   <%--  <%@ include file ="./header.jsp" %> --%>
    <div class="wrap">
        <div class="container">
            <div class="myProfile">
                <div class="profileLeft">
                    <div><img src="../resources/img/carrotimg/profilimg.png" alt="나의 프로필 이미지" class="myProfileImg"></div>
                    <div class="nameTitle">
                        <p class="nickname">${dto.m_nicknm}</p>
                        <p class="nicknameTag">#${dto.m_num}</p>
                    </div>    
                </div><!--.profileLeft-->
                <div class="mpInfo">
                    <div><i class="xi-gps-none">${dto.m_addr2} <b> 4회</b> 인증</i></div>
                    <div><i class="xi-clock-o">최근 3일 이내 활동 (2022년 4월 2일 가입)</i></div>
                </div>
                <div class="myState">
                    <div class="re-dealing">
                        <p><i class="xi-heart-o"></i> 재거래 희망률 100%</p> 
                        <p class="state">4명 중 4명이 만족</p>
                    </div> 
                    <div class="respond">
                        <p><i class="xi-speech-o"></i> 응답률 -%</p> 
                        <p class="state">표시될 만큼 충분히 채팅하지 않았어요.</p>
                    </div>
                </div>
                <div class="mpMannerOndo">
                    <p class="mpOndoTitle"><i class="xi-help-o"></i>매너온도</p>
                    <div class="mpMyOndo">${dto.m_ondo}<img src="../resources/img/carrotimg/ondoimg.png" alt="" class="mpOndoImg"></div>
                    <div class="mpOndoBar">
                        <div class="mpOndoBar1"></div>
                        <div class="mpOndoBar2"></div>
                    </div>
                </div><!--mpMannerOndo-->
                <button type="menu" class="ModifyProfileBtn"><a href="/carrot/mypage/myprofile">프로필 수정</a></button>
                
            </div>
            <div class="MyPageMenu">
                <div class="mpMenu">
                    <ul class="mpMenuList">
                        <li class="mpMenuCategory">나의 거래</li>
                        <li><a href="javascript:show1();" class="interestClick" >관심목록</a></li>
                        <li><a href="javascript:show2();" class="saleClick">판매내역</a></li>
                        <li><a href="javascript:show3();" class="buyClick">구매내역</a></li>
                        <li class="mpMenuCategory">나의 동네생활</li>
                        <li><a href="javascript:show4();" class="postCommentClick">동네생활 게시글</a></li>
                        <li><a href="javascript:show5();" class="postCommentClick">동네생활 댓글</a></li>
                        <li><a href="javascript:show6();" class="postCommentClick">중고거래 댓글</a></li>
                        <li class="mpMenuCategory">기타</li>
                        <li>알림 키워드 설정</li>
                        <li>자주 묻는 질문</li>
                        <li>친구초대</li>
                    </ul>
                </div>
                <div class="mpMenuScreen">
                    <div class="interestsList" id="interestMenu">
                        <h3>관심목록</h3>
                        <ul class="mpItemList">
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건2.jpg" alt="위닉스 제습기"></div>
                                    <div class="mpItemName">위닉스 제습기</div>
                                    <div class="mpItemPrice">50,000원</div>
                                    <div class="mpItemAddress">서울 성동구 행당동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 55</span>
                                        <span class="mpItemChat">채팅 85</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건5.jpg" alt="발뮤다 더 토스터, 더 오븐기"></div>
                                    <div class="mpItemName">발뮤다 더 토스터, 더 오븐기 상태 좋아요</div>
                                    <div class="mpItemPrice">100,000원</div>
                                    <div class="mpItemAddress">경기도 성남시 분당구 이매동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 30</span>
                                        <span class="mpItemChat">채팅 31</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건6.jpg" alt="캠핑테이블"></div>
                                    <div class="mpItemName">캠핑테이블</div>
                                    <div class="mpItemPrice">10,000원</div>
                                    <div class="mpItemAddress">경기도 부천시 중동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 15</span>
                                        <span class="mpItemChat">채팅 15</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건8.jpg" alt="RTX 3070 8GB 그래픽 카드"></div>
                                    <div class="mpItemName">RTX 3070 8GB 그래픽 카드</div>
                                    <div class="mpItemPrice">250,000원</div>
                                    <div class="mpItemAddress">경기도 부천시 중동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 26</span>
                                        <span class="mpItemChat">채팅 17</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건9.jpg" alt="pxg 경량 스탠드백 골프백"></div>
                                    <div class="mpItemName">pxg 경량 스탠드백 골프백</div>
                                    <div class="mpItemPrice">170,000원</div>
                                    <div class="mpItemAddress">서울 강남구 대치동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 66</span>
                                        <span class="mpItemChat">채팅 41</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="mpItemImg"><img src="../resources/img/carrotimg/물건10.jpg" alt="아마하 오디오(CRX-040)"></div>
                                    <div class="mpItemName">아마하 오디오(CRX-040)</div>
                                    <div class="mpItemPrice">10,000원</div>
                                    <div class="mpItemAddress">서울 서대문구 북아현동</div>
                                    <div class="mpItemCountUp">
                                        <span class="mpItemAttention">관심 11</span>
                                        <span class="mpItemChat">채팅 16</span>
                                        <i class="xi-heart xi-2x"></i>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <div class="pagination">
                            <a href=""><i class="xi-angle-left-min"></i></a>
                            <a href="">1</a>
                            <a href="">2</a>
                            <a href="">3</a>
                            <a href="">4</a>
                            <a href=""><i class="xi-angle-right-min"></i></a>
                        </div>
                    </div>
                    <div class="saleList" id="saleMenu" style="display: none;">
                        <h3>판매내역</h3>
                        <div class="saleSmallList">
                            <button><a href="javascript:saleShow1();">판매중 3</a></button>
                            <button><a href="javascript:saleShow2();">거래완료 3</a></button>
                            <button><a href="javascript:saleShow3();">숨김 2</a></button>
                        </div>
                        <form action="">
                        <div id="saleing">
                            <ul class="saleProduct" >

                            	<c:forEach var="productDTO" items="${listM}">
                                <li>
                                    <a href="<c:url value='/carrot/read?${phm.scm.getQueryString()}&p_num=${productDTO.p_num }'/>" class="product">
                                        <img src="../resources/img/carrotimg/물건4.jpg" alt="">
                                        <div class="productInfo">
                                            <div class="productName"><c:out value="${productDTO.p_title}"/></div>
                                            <div class="productData">
                                            	<span>${productDTO.userDTO.m_addr1 }</span>
                                            	<span>${productDTO.userDTO.m_addr2 }</span>
                                            	 ⋅ 
                                            	<span>2개월 전</span>
                                            </div>
                                            <div class="buttonArea">
                                            	<div class="productPrice"><c:out value="${productDTO.p_price}"/>원</div>
                                            	<div class="pBtn"><button type="button" id="modifyBtn" class="modifyBtn">수정하기</button></div>
                                            	<div class="pBtn"><button type="button" id="removeBtn" class="removeBtn">삭제하기</button></div>
                                          	</div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 ${productDTO.p_likey}</span>
                                                <span class="productChat">채팅 31</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="productBtn">
                                        <button><a href="">끌어올리기</a></button>
                                        <button class="Btn2"><a href="">예약중</a></button>
                                        <button><a href="">거래완료</a></button>
                                    </div>
                              	 </li>
                                
                               </c:forEach>
                               <div>
						        	<c:if test="${phm.showPrev}">
						        		<a href="<c:url value='/mypage/home${phm.scm.getQueryString(phm.beginPage-1)}'/>"> &lt; </a>   
						        	</c:if>
						        	
						        	<c:forEach var="i" begin="${phm.beginPage}" end="${phm.endPage}">
						        		<a href="<c:url value='/mypage/home${phm.scm.getQueryString(i)}'/>"> ${i}</a>
						        	</c:forEach>
						        	
						        	
						        	<c:if test="${phm.showNext}">
						        		<a href="<c:url value='/mypage/home${phm.scm.getQueryString(phm.endPage+1)}'/>"> &gt; </a>   
						        	</c:if>
        
								</div> 
                              
                            </ul>
                        </div><!-- .saleing -->
                        </form>
                        <div id="saleFinish" style="display: none;">
                            <ul class="saleFinish">
                                <li>
                                    <a href="" class="product">
                                        <img src="../resources/img/carrotimg/물건3.jpg" alt="그루m3 접이식 자전거">
                                        <div class="productInfo">
                                            <div class="productName">그루m3 접이식 자전거</div>
                                            <div class="productData">서울 금천구 가산동 ⋅ 10일 전</div>
                                            <div class="buyFin">
                                                <div class="deal"> 거래완료 </div>
                                                <div class="productPrice">50,000원</div>
                                            </div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 15</span>
                                                <span class="productChat">채팅 16</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="sendingRev">
                                        <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                    </div>
                                </li>
                                <li>
                                    <a href="" class="product">
                                        <img src="../resources/img/carrotimg/물건10.jpg" alt="아마하 오디오(CRX-040)">
                                        <div class="productInfo">
                                            <div class="productName">아마하 오디오(CRX-040)</div>
                                            <div class="productData">서울 서대문구 북아현동 ⋅ 3개월 전</div>
                                            <div class="buyFin">
                                                <div class="deal"> 거래완료 </div>
                                                <div class="productPrice">10,000원</div>
                                            </div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 11</span>
                                                <span class="productChat">채팅 16</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="sendingRev">
                                        <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                    </div>
                                </li>
                                <li>
                                    <a href="" class="product">
                                        <img src="../resources/img/carrotimg/물건8.jpg" alt="RTX 3070 8GB 그래픽 카드">
                                        <div class="productInfo">
                                            <div class="productName">RTX 3070 8GB 그래픽 카드</div>
                                            <div class="productData">경기도 부천시 중동 ⋅ 5개월 전</div>
                                            <div class="buyFin">
                                                <div class="deal"> 거래완료 </div>
                                                <div class="productPrice">250,000원</div>
                                            </div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 26</span>
                                                <span class="productChat">채팅 17</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="sendingRev">
                                        <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div id="saleHide" style="display: none;">
                            <ul class="saleHide">
                                <li>
                                    <a href="" class="product">
                                        <img src="../resources/img/carrotimg/물건3.jpg" alt="그루m3 접이식 자전거">
                                        <div class="productInfo">
                                            <div class="productName">그루m3 접이식 자전거</div>
                                            <div class="productData">서울 금천구 가산동 ⋅ 10일 전</div>
                                            <div class="buyFin">
                                                <div class="productPrice">50,000원</div>
                                            </div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 15</span>
                                                <span class="productChat">채팅 16</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="sendingRev">
                                        <button class="unhideBtn"><a href="">숨기기 해제</a></button>
                                    </div>
                                </li>
                                <li>
                                    <a href="" class="product">
                                        <img src="../resources/img/carrotimg/물건10.jpg" alt="아마하 오디오(CRX-040)">
                                        <div class="productInfo">
                                            <div class="productName">아마하 오디오(CRX-040)</div>
                                            <div class="productData">서울 서대문구 북아현동 ⋅ 3개월 전</div>
                                            <div class="buyFin">
                                                <div class="productPrice">10,000원</div>
                                            </div>
                                            <div class="productCountUp">
                                                <span class="productAttention">관심 11</span>
                                                <span class="productChat">채팅 16</span>
                                            </div>
                                            <i class="xi-ellipsis-v"></i>
                                        </div>
                                    </a>
                                    <div class="sendingRev">
                                        <button class="unhideBtn"><a href="">숨기기 해제</a></button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="buyList" id="buyMenu" style="display: none;">
                        <h3>구매내역</h3>
                        <ul class="buyProduct">
                            <li>
                                <a href="" class="product">
                                    <img src="../resources/img/carrotimg/물건3.jpg" alt="그루m3 접이식 자전거">
                                    <div class="productInfo">
                                        <div class="productName">그루m3 접이식 자전거</div>
                                        <div class="productData">서울 금천구 가산동 ⋅ 10일 전</div>
                                        <div class="buyFin">
                                            <div class="deal"> 거래완료 </div>
                                            <div class="productPrice">50,000원</div>
                                        </div>
                                        <div class="productCountUp">
                                            <span class="productAttention">관심 15</span>
                                            <span class="productChat">채팅 16</span>
                                        </div>
                                        <i class="xi-ellipsis-v"></i>
                                    </div>
                                </a>
                                <div class="sendingRev">
                                    <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                </div>
                            </li>
                            <li>
                                <a href="" class="product">
                                    <img src="../resources/img/carrotimg/물건10.jpg" alt="아마하 오디오(CRX-040)">
                                    <div class="productInfo">
                                        <div class="productName">아마하 오디오(CRX-040)</div>
                                        <div class="productData">서울 서대문구 북아현동 ⋅ 3개월 전</div>
                                        <div class="buyFin">
                                            <div class="deal"> 거래완료 </div>
                                            <div class="productPrice">10,000원</div>
                                        </div>
                                        <div class="productCountUp">
                                            <span class="productAttention">관심 11</span>
                                            <span class="productChat">채팅 16</span>
                                        </div>
                                        <i class="xi-ellipsis-v"></i>
                                    </div>
                                </a>
                                <div class="sendingRev">
                                    <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                </div>
                            </li>
                            <li>
                                <a href="" class="product">
                                    <img src="../resources/img/carrotimg/물건8.jpg" alt="RTX 3070 8GB 그래픽 카드">
                                    <div class="productInfo">
                                        <div class="productName">RTX 3070 8GB 그래픽 카드</div>
                                        <div class="productData">경기도 부천시 중동 ⋅ 5개월 전</div>
                                        <div class="buyFin">
                                            <div class="deal"> 거래완료 </div>
                                            <div class="productPrice">250,000원</div>
                                        </div>
                                        <div class="productCountUp">
                                            <span class="productAttention">관심 26</span>
                                            <span class="productChat">채팅 17</span>
                                        </div>
                                        <i class="xi-ellipsis-v"></i>
                                    </div>
                                </a>
                                <div class="sendingRev">
                                    <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                </div>
                            </li>
                            <li>
                                <a href="" class="product">
                                    <img src="../resources/img/carrotimg/물건6.jpg" alt="캠핑테이블">
                                    <div class="productInfo">
                                        <div class="productName">캠핑테이블</div>
                                        <div class="productData">경기도 부천시 중동 ⋅ 6개월 전</div>
                                        <div class="buyFin">
                                            <div class="deal"> 거래완료 </div>
                                            <div class="productPrice">10,000원</div>
                                        </div>
                                        <div class="productCountUp">
                                            <span class="productAttention">관심 15</span>
                                            <span class="productChat">채팅 15</span>
                                        </div>
                                        <i class="xi-ellipsis-v"></i>
                                    </div>
                                </a>
                                <div class="sendingRev">
                                    <button class="reviewBtn"><a href="">보낸 후기 보기</a></button>
                                </div>
                            </li>
                    </div>
                    <div class="myPostComment" id="myPostMenu" style="display: none;">
                        <h3>내 게시글 목록</h3>
                        <ul class="myPostList">
                            <li>
                                <a href="">
                                    <div class="postCategory">일상</div>
                                    <div class="postContent">
                                        점심에 냉동삼겹살 먹을려고 하는데, 동네에 맛집있으면 추천해주세요~ <br>
                                        남구 주변이었으면 좋겠습니다ㅎㅎ
                                    </div>
                                    <div class="postInfo">
                                        <div class="mpComment">댓글 11</div>
                                        <div>
                                            <i class="xi-thumbs-up">2</i>
                                        </div>
                                        <div class="modAndDel">
                                        	<button>수정</button> <button>삭제</button>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="postCategory">동네질문</div>
                                    <div class="postContent">
                                        남구 or 중구에 괜찮은 셀프세차장 추천 좀 부탁드립니다! <br>
                                        신차 구매 후 기계세차는 부담이라 노브러쉬 세차만 하다가 셀프세차를 좀 하고싶어서 찾아봤는데
                                        공업탑에 크게 하나 있던게 사라져서 ㅜㅜ 괜찮은곳 추천 부탁드려요!!
                                    </div>
                                    <div class="postInfo">
                                        <div class="mpComment">댓글 18</div>
                                        <div>
                                            <i class="xi-thumbs-up">5</i>
                                        </div>
                                        <div class="modAndDel">
                                        	<button>수정</button> <button>삭제</button>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="postCategory">맛집후기</div>
                                    <div class="postContent">
                                        <div> 안녕하세요 우와~~~대박대박~~~짱 맛있어요 효성상가에 새로 생겼네요 무심코 지나가다 초밥집이 생겨서 주문 했는데 신선함과 쫄깃한맛 짱 맛있네요 초밥에 밥도 적당히 들어가 입안가득 회가 가득한 식감 처음 먹어 보는 듯한 이 느낌 짱 맛있네요 자주 이용해야 겠어요 사장님 정말 맛있게 잘 먹었습니다!!</div>
                                        <img src="../resources/img/carrotimg/맛집후기.jpg" alt="">
                                    </div>
                                    <div class="postInfo">
                                        <div class="mpComment">댓글 25</div>
                                        <div>
                                            <i class="xi-thumbs-up">13</i>
                                        </div>
                                        <div class="modAndDel">
                                        	<button>수정</button> <button>삭제</button>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="myPostComment" id="myCommentMenu1" style="display: none;">
                        <h3>내 동네생활 댓글 목록</h3>
                        <ul class="myCommentList">
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        공업탑에 정말 자주 갔는데 없어져서 아쉽네요 ㅜㅜ <br>
                                        추천해주신 세차장 한번 가보겠습니다 감사합니다!!
                                    </div>
                                    <div class="commentInfo">
                                        '남구or중구에 괜찮은 셀프세차...'에서 2달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        큰 기대없이 가봤는데 정말 만족했어요~!! <br>
                                        초밥 좋아하시는 분들 정말 추천드려요!! 사장님도 정말 친철하시더라고요 ㅎㅎ
                                    </div>
                                    <div class="commentInfo">
                                        '효성상가에 새로 생긴 초밥집...'에서 5달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        신호 케이블 양쪽 탈거 후 다시 꼽아보세요 <br>
                                        모니터 설정에서 입력신호를 케이블 종류에 맞게 바꿔보세요 <br>
                                        rgb dvi hdmi등
                                    </div>
                                    <div class="commentInfo">
                                        '혹시 울산 남구 쪽 컴퓨터 ...'에서 7달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        모니터 전원 램프가 어떤가요? 색이 다르거나 점멸아닌지?<br>
                                        화면에 신호없음이나 검정화면 백라이트가 들어오나요?
                                    </div>
                                    <div class="commentInfo">
                                        '혹시 울산 남구 쪽 컴퓨터 ...'에서 7달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="myPostComment" id="myCommentMenu2" style="display: none;">
                        <h3>내 중고거래 댓글 목록</h3>
                        <ul class="myCommentList">
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        제습기 몇달 사용하셨나요??
                                    </div>
                                    <div class="commentInfo">
                                        '위닉스 제습기 50,000원'에서 10일 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        스크래치나 오염 별로 없나요??
                                    </div>
                                    <div class="commentInfo">
                                        'pxg 경량 스탠드백 골프백 170,000원'에서 2달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="commentContent">
                                        너무 싸게 내놓으셨는데 물건에 문제 없는건가요?? <br>
                                        저번에 오디오 싸게 샀다가 고장난 물건 받아서요 ㅜㅜ
                                    </div>
                                    <div class="commentInfo">
                                        '아마하 오디오(CRX-040) 10,000원'에서 3달 전 작성
                                    </div>
                                    <i class="xi-ellipsis-v"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <%@ include file ="./footer.jsp" %>
    <script src="<c:url value='/resources/js/mypagejs.js'/>"></script>
</body>
</html>

