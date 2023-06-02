<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/carrotStyle.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/footerStyle.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/headerStyle.css'/>" rel="stylesheet" />
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<body>
 <div class="wrap">
 
     <c:set var="loginOutLink" value="${sessionScope.m_email==null ? '/login/login' : '/login/logout'}" />
	<c:set var="loginOut" value="${sessionScope.m_email==null ? '로그인/회원가입' : '로그아웃'}" />

	 <div class="header">
            <div class="headerIn ">
                <div class="hTop">
                    <div class="divLogo">
                            <a href="<c:url value='/'/>">

                            <img src="./resources/img/DaangnMarket_logo.png" alt="당근마켓로고"/>

                            <p>당근마켓</p>
                        </a>
                    </div>
                    <div class="gnb">
                        <ul>
                            <li><a href="<c:url value='/carrot/junggoMain'/>" class="gnbMenu">중고거래</a></li>
                            <li><a href="<c:url value='/board/list'/>" class="gnbMenu">동네소식</a></li>
                        </ul>
                    </div>
                    <div class="member">
                        <ul>
                            <li><a href="<c:url value='${loginOutLink}'/>" class="meMenu">${loginOut}</a></li>
                            <li><a href="/carrot/mypage/home" class="meMenu">마이페이지</a></li>
                        </ul>
                    </div>
                </div> <!--.hTop-->

                <div class="hBottom">
                    <div class="d"></div>
                    <div class="searchLocal">
                        <div class="search">
                            <input type="text" name="txtSearch" class="txtSearch" placeholder="찾으실 항목을 입력하세요">
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
                        <select name="region" class="region">
                            <option value="opRegion">지역을 선택하세요</option>
                        </select>
                        <select name="town" class="town">
                            <option value="opTown">동네를 선택하세요</option>
                        </select>
                    </div> <!--.divSetLocal-->
                </div> <!--.hBottom-->
            </div><!--.headIn-->
        </div> <!--.header-->
      <%@ include file ="./tabRigth.jsp" %>
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
    </div>
    <div class="footer">
            <div class="fLine"> </div>
            <div class="footerIn">
                <div class="footMenu1">
                    <ul>
                        <li>
                            <a href="">중고거래</a>
                        </li>
                        <li>
                            <a href="">동네가게</a>
                        </li>
                        <li>
                            <a href="">당근알바</a>
                        </li>
                        <li>
                            <a href="">부동산 직거래</a>
                        </li>
                        <li>
                            <a href="">중고차 직거래</a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a href="">당근비즈니스</a>
                        </li>
                        <li>
                            <a href="">채팅하기</a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a href="">자주 묻는 질문</a>
                        </li>
                        <li>
                            <a href="">회사 소개</a>
                        </li>
                        <li>
                            <a href="">인재 채용</a>
                        </li>
                    </ul>
                    <div class="appDownload">
                        <p>당근마켓 앱 다운로드</p>
                        <div>
                            <button><a href="https://apps.apple.com/kr/app/%EB%8B%B9%EA%B7%BC%EB%A7%88%EC%BC%93-%EC%A4%91%EA%B3%A0%EA%B1%B0%EB%9E%98-%ED%95%84%EC%88%98%EC%95%B1/id1018769995" target="_blank"><img src="./resources/img/carrotimg/apple.png" alt="apple store" class="apple"> App Store</a></button>
                            <button><a href="https://play.google.com/store/apps/details?id=com.towneers.www&hl=ko&pli=1" target="_blank"><img src="./resources/img/carrotimg/googleplay.png" alt="google play"> Google Play</a></button>
                        </div>
                    </div>
                </div>
                <div class="fLine"></div>
                <div class="info">
                    <b>대표</b> 김용현, 황도연 | <b>사업자번호</b> 375-87-00088<br>
                    <b>직업정보제공사업 신고번호</b> 2016-서울서초-0051<br>
                    <b>주소</b> 서울 특별시 구로구 디지털로 30길 28, 609호(당근서비스)<br>
                    <b>전화</b> 1544-9796 | <b>고객문의</b> cs@daangnservice.com<br>
                </div>
                <div class="fMenu2">
                    <ul>
                        <li><a href="">제휴 문의</a></li>
                        <li><a href="">광고 문의</a></li>
                        <li><a href="">PR 문의</a></li>
                        <li><a href="">IR 문의</a></li>
                    </ul>
                    <ul>
                        <li><a href="">이용약관</a></li>
                        <li><a href=""><strong>개인정보처리방침</strong></a></li>
                        <li><a href="">위치기반서비스 이용약관</a></li>
                        <li><a href="">이용자보호 비전과 계획</a></li>
                    </ul>
                    <div class="snsNation">
                        <ul>
                            <li>
                                <a href="http://www.facebook.com/daangn" target="_blank"><img src="./resources/img/carrotimg/facebook.png" alt="페이스북 로고"></a>
                            </li>
                            <li>
                                <a href="http://www.instagram.com/daangnmarket/" target="_blank"><img src="./resources/img/carrotimg/instagram.png" alt="인스타그램 로고"></a>
                            </li>
                            <li>
                                <a href="https://www.youtube.com/channel/UC8tsBsQBuF7QybxgLmStihA" target="_blank"><img src="./resources/img/carrotimg/youtube.png" alt="유튜브 로고"></a>
                            </li>
                            <li>
                                <a href="https://blog.naver.com/daangn" target="_blank"><img src="./resources/img/carrotimg/blog.png" alt="블로그 로고"></a>
                            </li>
                        </ul>
                        <div class="nation">
                            <label for="label-select-nation">
                                <img src="../resources/img/carrotimg/earth.png" alt="국가" class="earth">
                                <select id="label-select-nation">
                                    <option value="kr">한국</option>
                                    <option value="http://uk.karrotmarket.com" >영국</option>
                                    <option value="http://ca.karrotmarket.com">캐나다</option>
                                    <option value="http://us.karrotmarket.com">미국</option>
                                    <option value="http://jp.karrotmarket.com">일본</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>
           </div>
        </div><!--footer-->
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