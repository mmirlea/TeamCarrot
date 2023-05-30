<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/carrotStyle.css'/>" rel="stylesheet" />
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<body>
 <div class="wrap">
 
      <%@ include file ="./header.jsp" %>
      
        <div class="container">
            <div class="popularSearch">
                <p><a href="">중고거래 인기검색어</a></p>
                <ul class="popularList">
                    <li><a href="">자전거</a></li>
                    <li><a href="">의자</a></li>
                    <li><a href="">아이폰</a></li>
                    <li><a href="">냉장고</a></li>
                    <li><a href="">노트북</a></li>
                    <li><a href="">패딩</a></li>
                    <li><a href="">아이패드</a></li>
                    <li><a href="">모니터</a></li>
                    <li><a href="">스타벅스</a></li>
                    <li><a href="">책상</a></li>
                </ul>
            </div>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                  <div class="swiper-slide"><a href=""><img src="./resources/img/carrotimg/당근1.png" alt="당신 근처의 당근마켓"></a></div>
                  <div class="swiper-slide"><a href=""><img src="./resources/img/carrotimg/당근2.png" alt="우리 동네 중고 직거래 마켓"></a></div>
                  <div class="swiper-slide"><a href=""><img src="./resources/img/carrotimg/당근3.png" alt="이웃과 함께 하는 동네생활"></a></div>
                  <div class="swiper-slide"><a href=""><img src="./resources/img/carrotimg/당근4.png" alt="내 근처에서 찾는 동네가게"></a></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div><!--slide-->
            <div class="popularItem">
                <h1><a href="">중고거래 인기매물</a></h1>
                <ul class="pItemList">
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건1.jpg" alt="정품입니다."></div>
                            <div class="pItemName">정품입니다.</div>
                            <div class="pItemPrice">10,000원</div>
                            <div class="pItemAddress">부산 북구 구포동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 37</span>
                                <span class="pItemChat">채팅 12</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건2.jpg" alt="위닉스 제습기"></div>
                            <div class="pItemName">위닉스 제습기</div>
                            <div class="pItemPrice">50,000원</div>
                            <div class="pItemAddress">서울 성동구 행당동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 55</span>
                                <span class="pItemChat">채팅 85</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건3.jpg" alt="그루m3 접이식 자전거"></div>
                            <div class="pItemName">그루m3 접이식 자전거</div>
                            <div class="pItemPrice">50,000원</div>
                            <div class="pItemAddress">서울 금천구 가산동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 15</span>
                                <span class="pItemChat">채팅16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건4.jpg" alt="이사가느라 가전 팔아요"></div>
                            <div class="pItemName">이사가느라 가전 팔아요~! 직접 가지러 오셔야 합니다.</div>
                            <div class="pItemPrice">99원</div>
                            <div class="pItemAddress">광주 북구 신용동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 29</span>
                                <span class="pItemChat">채팅 31</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건5.jpg" alt="발뮤다 더 토스터, 더 오븐기"></div>
                            <div class="pItemName">발뮤다 더 토스터, 더 오븐기 상태 좋아요</div>
                            <div class="pItemPrice">100,000원</div>
                            <div class="pItemAddress">경기도 성남시 분당구 이매동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 30</span>
                                <span class="pItemChat">채팅 31</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건6.jpg" alt="캠핑테이블"></div>
                            <div class="pItemName">캠핑테이블</div>
                            <div class="pItemPrice">10,000원</div>
                            <div class="pItemAddress">경기도 부천시 중동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 15</span>
                                <span class="pItemChat">채팅 15</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건7.jpg" alt="버스킹 물품, 악기 대여"></div>
                            <div class="pItemName">버스킹 물품, 악기 대여</div>
                            <div class="pItemPrice">60,000원</div>
                            <div class="pItemAddress">인천 부평구 부개동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 26</span>
                                <span class="pItemChat">채팅 38</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건8.jpg" alt="RTX 3070 8GB 그래픽 카드"></div>
                            <div class="pItemName">RTX 3070 8GB 그래픽 카드</div>
                            <div class="pItemPrice">250,000원</div>
                            <div class="pItemAddress">경기도 부천시 중동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 26</span>
                                <span class="pItemChat">채팅 17</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건9.jpg" alt="pxg 경량 스탠드백 골프백"></div>
                            <div class="pItemName">pxg 경량 스탠드백 골프백</div>
                            <div class="pItemPrice">170,000원</div>
                            <div class="pItemAddress">서울 강남구 대치동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 66</span>
                                <span class="pItemChat">채팅 41</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건10.jpg" alt="아마하 오디오(CRX-040)"></div>
                            <div class="pItemName">아마하 오디오(CRX-040)</div>
                            <div class="pItemPrice">10,000원</div>
                            <div class="pItemAddress">서울 서대문구 북아현동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 11</span>
                                <span class="pItemChat">채팅 16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건11.jpg" alt="하이메이드 냉장고 팝니다."></div>
                            <div class="pItemName">하이메이드 냉장고 팝니다.</div>
                            <div class="pItemPrice">50,000원</div>
                            <div class="pItemAddress">광주 남구 방림2동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 2</span>
                                <span class="pItemChat">채팅 14</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="pItemImg"><img src="./resources/img/carrotimg/물건12.jpg" alt="학교 졸업해서 이제 사용안해서 팔아요!!"></div>
                            <div class="pItemName">학교 졸업해서 이제 사용안해서 팔아요!!</div>
                            <div class="pItemPrice">265,000원</div>
                            <div class="pItemAddress">대전 서구 둔산동</div>
                            <div class="pItemCountUp">
                                <span class="pItemAttention">관심 42</span>
                                <span class="pItemChat">채팅 19</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="seeMore"><a href="">인기매물 더 보기</a></div>
            </div>
            <div class="qrCode">
                <div><a href=""><img src="./resources/img/carrotimg/qr코드.png" alt="당근마켓 qrCode 배너"></a></div>
            </div>
        </div><!--.conts-->
        
      <%@ include file ="./footer.jsp" %>
    </div>
    <script>
    var swiper = new Swiper(".mySwiper", {
    	  slidesPerView: 1,
    	  spaceBetween: 30,
    	  loop: true,
    	  pagination: {
    	    el: ".swiper-pagination",
    	    clickable: true,
    	  },
    	  navigation: {
    	    nextEl: ".swiper-button-next",
    	    prevEl: ".swiper-button-prev",
    	  },
    	});


    </script>
</body>
</html>