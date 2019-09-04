<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<script type = "text/javascript">
function chk() {
	if (confirm("정말 로그아웃 하시겠습니까?")) {
		<% session.setAttribute("back",request.getRequestURI()); %>
		location.href = "/login/Logout.jsp";	
	} else {
		return false
	}
}
</script>
<link href="/test.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header">
		<div class="top_fix">
			<div class="inner">
				<div class="topArea">
					<div class="logo">
						<a href="/Main"> <img src="<%= application.getInitParameter("IMG_SRC")%>/header/LOGO.JPG" alt="로고">
						</a>
					</div>
					<div class="test_allmenu">
						<header>
							<ul class="test_gnb">
								<li><a href="/My_Info"> ME </a></li>
								<li><a href="/Cart">CART / POINT</a></li>
								<!-- <li><a href="">ORDER</a> -->
								<li><a href="">준비중</a>
									<ul>
										<li><a href=""> <span> 주문내역 조회 </span></a></li>
										<li><a href=""> <span> 취소/반품/교환 조회 </span></a></li>
									</ul>
								</li>
								<!-- <li><a href="">MY PAGE</a> -->
								<li><a href="">준비중</a>
									<ul>
										<li><a href=""> <span> 배송 조회하기 </span></a></li>
										<li><a href=""> <span> 개인정보 수정 </span></a></li>
										<li><a href=""> <span> 내 게시물 관리 </span></a></li>
										<li><a href=""> <span> 내 주소록 관리 </span></a></li>
									</ul>
								</li>
								<!-- <li><a href="">COMMUNITY</a> -->
								<li><a href="">준비중</a>
									<ul>
										<li><a href=""> <span> ALL </span></a></li>
										<li><a href=""> <span> 공지사항</span></a></li>
										<li><a href=""> <span> REVIEW </span></a></li>
										<li><a href=""> <span> 자주 묻는 질문 </span></a></li>
										<li><a href=""> <span> 상품 Q&amp;A </span></a></li>
										<li><a href=""> <span> 교환 및 환불 </span></a></li>
										<li><a href=""> <span> 자유 게시판 </span></a></li>
									</ul>
								</li>
								<li><a href="/login/Logout.jsp" onclick = "return chk();">LOGOUT</a></li>
							</ul>
						</header>
					</div>
					<!-- all_menu close -->
				</div>
				<!-- topArea close -->
			</div>
			<!-- inner close -->
			<hr class="garo">
			<a href="/Main"><img src="<%= application.getInitParameter("IMG_SRC")%>/header/main_logo.JPG" align="middle"></a>
			<hr class="garo">
 			<div class="util_test">
				<nav>
					<ul class="menu_gnb">
								<li><a href="/Product_List?category_code=100">OUTER </a></li>
									
								<li><a href="/Product_List?category_code=200">TOP</a></li>
								<li><a href="/Product_List?category_code=300">PANTS</a>
		
								</li>
								<li><a href="/Product_List?category_code=400">SKIRT</a>
	
								</li>
								<li><a href="/Product_List?category_code=500">SHOES</a>

								</li>
					
							</ul>
				</nav>
			</div> 
		</div> <!-- top_fix close -->
	</div>	<!-- header close -->
	<hr class="garo">
</body>
</html>