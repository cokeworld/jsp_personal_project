<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션값 가져오기
String id = (String) session.getAttribute("id");
%>
<!-- Top Bar Start -->
<div class="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="tb-contact">
                    <p><i class="fas fa-envelope"></i>xorud1350@naver.com</p>
                    <p><i class="fas fa-phone-alt"></i>010-2542-1350</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="tb-menu">
                    <a href="https://cokeworld.github.io/Portfolio/">다른 포트폴리오 보러가기</a>
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
                    <a href="index.jsp">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                </div>
            </div>
            <div class="col-lg-6 col-md-4">
                <div class="b-ads">
                    <%-- <a href="https://htmlcodex.com">
                        <img src="img/ads-1.jpg" alt="Ads">
                    </a> --%>
                </div>
            </div>
            <div class="col-lg-3 col-md-4">
                <div class="b-search">
                    <input type="text" placeholder="Search">
                    <button><i class="fa fa-search"></i></button>
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
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto">
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">카테고리</a>
                        <div class="dropdown-menu">
                            <a href="category.jsp?category=female" class="dropdown-item">여성의류</a>
                            <a href="category.jsp?category=accessory" class="dropdown-item">액세서리</a>
                            <a href="category.jsp?category=male" class="dropdown-item">남성의류</a>
                            <a href="category.jsp?category=digital" class="dropdown-item">디지털/가전</a>
                        </div>
                    </div>
                    <a href="fileWriteForm.jsp" class="nav-item nav-link active">판매하기</a>
                  	<%-- <a href="single-page.html" class="nav-item nav-link">Single Page</a>
                    <a href="contact.html" class="nav-item nav-link">Contact Us</a> --%>
                </div>
                <div class="login ml-auto nav-item">
                <%
                if(id == null) {
                		%>
                    
                    <a href="loginForm.jsp">로그인</a>                		
               <!--<i class="fas fa-key"></i>  <i class="fas fa-user-plus"></i> -->
                    <a href="joinForm.jsp">회원가입</a>
                		<%
                	} else {
                		%>
                		<a href="mypage.jsp"><%=id %> 님 로그인 하셨습니다.</a>
                		<a href="logout.jsp">로그아웃</a>
                		<%
                	}
                %>
<!--                             <a href=""><i class="fab fa-linkedin-in"></i></a> -->
<!--                             <a href=""><i class="fab fa-instagram"></i></a> -->
<!--                             <a href=""><i class="fab fa-youtube"></i></a> -->
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Nav Bar End -->