<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

// DAO 객체 준비
PostDao postDao = new PostDao();

// 전체 글갯수 가져오기
int count = postDao.getFemaleCount();

// 한페이지당 보여줄 글갯수 설정
int pageSize = 10;

// 사용자가 요청하는 페이지번호 파라미터값 가져오기
String strPageNum = request.getParameter("pageNum");
// 사용자 요청 페이지번호 정보가 없을때(null 일때)
// 기본 요청 페이지번호를 1페이지로 설정하기
strPageNum = (strPageNum == null) ? "1" : strPageNum;
// 사용자 요청 페이지를 정수로 변환
int pageNum = Integer.parseInt(strPageNum);

// 가져올 첫행번호 구하기
int startRow = (pageNum - 1) * pageSize;

// 글목록 가져오기
List<PostVo> postList = null;
if (count > 0) {
	postList = postDao.getFemalePosts(startRow, pageSize);
}
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap News Template - Free HTML Templates</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Bootstrap News Template - Free HTML Templates"
	name="keywords">
<meta content="Bootstrap News Template - Free HTML Templates"
	name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/slick/slick.css" rel="stylesheet">
<link href="lib/slick/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Top Bar Start -->
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="tb-contact">
						<p>
							<i class="fas fa-envelope"></i>info@mail.com
						</p>
						<p>
							<i class="fas fa-phone-alt"></i>+012 345 6789
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="tb-menu">
						<a href="">About</a> <a href="">Privacy</a> <a href="">Terms</a> <a
							href="">Contact</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar Start -->

	<!-- Brand Start -->
	<div class="brand">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-4">
					<div class="b-logo">
						<a href="index.html"> <img src="img/logo.png" alt="Logo">
						</a>
					</div>
				</div>
				<div class="col-lg-6 col-md-4">
					<div class="b-ads">
						<a href="https://htmlcodex.com"> <img src="img/ads-1.jpg"
							alt="Ads">
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-4">
					<div class="b-search">
						<input type="text" placeholder="Search">
						<button>
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Brand End -->

	<!-- Nav Bar Start -->
	<div class="nav-bar">
		<div class="container">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a href="#" class="navbar-brand">MENU</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto">
						<a href="index.html" class="nav-item nav-link">Home</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">Dropdown</a>
							<div class="dropdown-menu">
								<a href="#" class="dropdown-item">Sub Item 1</a> <a href="#"
									class="dropdown-item">Sub Item 2</a>
							</div>
						</div>
						<a href="single-page.html" class="nav-item nav-link active">Single
							Page</a> <a href="contact.html" class="nav-item nav-link">Contact
							Us</a>
					</div>
					<div class="social ml-auto">
						<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
							class="fab fa-facebook-f"></i></a> <a href=""><i
							class="fab fa-linkedin-in"></i></a> <a href=""><i
							class="fab fa-instagram"></i></a> <a href=""><i
							class="fab fa-youtube"></i></a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Nav Bar End -->

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">News</a></li>
				<li class="breadcrumb-item active">News details</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Single News Start-->
	<div class="single-news">
		<div class="container">
			<div class="row">
				<div class="category_row d-flex justify-content-between">
					<div class="category_title">
						여성의류 <a href='' class="title_button">전체보기</a>
					</div>
					<input type="button" name="btnFileUpload" value="상품 팔기" onclick="location.href='fileWriteForm.jsp'">
				</div>
				<br>
				<div class="products">
		<%
			if (count > 0) {
			for (PostVo postVo : postList) {
		%>
					<div class="product">
						<a href='index.jsp' class="">
							<div class="post_image">
								<img src="../upload/<%=postVo.getFile() %>" width="194" height="194" alt="상품 이미지">
							</div>
							<div class="post_description">
								<div class="post_title"><%=postVo.getTitle() %></div>
								<div class="sc-fHSTwm emplOu">
									<div class="post_price"><%=postVo.getPrice() %></div>
								</div>
							</div>
						</a>
					</div>
			<%
			}
		} else { // count == 0
			%>
				<h1>게시판 글 없음</h1>
			<%
		}
		%>
		
				</div>
			</div>
				<%
	// 글갯수가 0보다 크면 페이지블록 계산해서 출력하기
	if (count > 0) {
		// 총 필요한 페이지 갯수 구하기
		// 글50개. 한화면에보여줄글 10개 => 50/10 = 5 
		// 글55개. 한화면에보여줄글 10개 => 55/10 = 5 + 1페이지(나머지존재) => 6
		int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
		//int pageCount = (int) Math.ceil((double) count / pageSize);
		
		// 한 화면에 보여줄 페이지갯수 설정
		int pageBlock = 5;
		
		// 화면에 보여줄 시작페이지번호 구하기
		// 1~5          6~10          11~15          16~20       ...
		// 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		
		// 화면에 보여줄 끝페이지번호 구하기
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		// [이전]
		if (startPage > pageBlock) {
			%>
			<a href="category_female.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a>
			<%
		}
		
		// 1 ~ 5
		for (int i=startPage; i<=endPage; i++) {
			if (i == pageNum) {
				%>
				<a href="category_female.jsp?pageNum=<%=i %>" class="active">[<%=i %>]</a>
				<%
			} else {
				%>
				<a href="category_female.jsp?pageNum=<%=i %>">[<%=i %>]</a>
				<%
			}
		} // for
		
		
		// [다음]
		if (endPage < pageCount) {
			%>
			<a href="category_female.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
			<%
		}
	}
	%>
		</div>
	</div>
	</div>
	<!-- Single News End-->

	<!-- Footer Start -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h3 class="title">Get in Touch</h3>
						<div class="contact-info">
							<p>
								<i class="fa fa-map-marker"></i>123 News Street, NY, USA
							</p>
							<p>
								<i class="fa fa-envelope"></i>info@example.com
							</p>
							<p>
								<i class="fa fa-phone"></i>+123-456-7890
							</p>
							<div class="social">
								<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-linkedin-in"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-youtube"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h3 class="title">Useful Links</h3>
						<ul>
							<li><a href="#">Lorem ipsum</a></li>
							<li><a href="#">Pellentesque</a></li>
							<li><a href="#">Aenean vulputate</a></li>
							<li><a href="#">Vestibulum sit amet</a></li>
							<li><a href="#">Nam dignissim</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h3 class="title">Quick Links</h3>
						<ul>
							<li><a href="#">Lorem ipsum</a></li>
							<li><a href="#">Pellentesque</a></li>
							<li><a href="#">Aenean vulputate</a></li>
							<li><a href="#">Vestibulum sit amet</a></li>
							<li><a href="#">Nam dignissim</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h3 class="title">Newsletter</h3>
						<div class="newsletter">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Vivamus sed porta dui. Class aptent taciti sociosqu</p>
							<form>
								<input class="form-control" type="email"
									placeholder="Your email here">
								<button class="btn">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<!-- Footer Menu Start -->
	<div class="footer-menu">
		<div class="container">
			<div class="f-menu">
				<a href="">Terms of use</a> <a href="">Privacy policy</a> <a href="">Cookies</a>
				<a href="">Accessibility help</a> <a href="">Advertise with us</a> <a
					href="">Contact us</a>
			</div>
		</div>
	</div>
	<!-- Footer Menu End -->

	<!-- Footer Bottom Start -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 copyright">
					<p>
						Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>.
						All Rights Reserved
					</p>
				</div>

				<div class="col-md-6 template-by">
					<p>
						Template By <a href="https://htmlcodex.com">HTML Codex</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Bottom End -->

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
