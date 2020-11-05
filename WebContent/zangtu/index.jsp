<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고짱</title>
    <script src="https://kit.fontawesome.com/f9adbb06a2.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div id="container" class="first-home">
        <header id = "header">
            <div class="header_left">
                <div class="like">즐겨찾기</div>
            </div>
            <div class="header_right">
                <input type="button" name="login" value="로그인" onclick="location.href='loginForm.jsp'">
                <input type="button" name="join" value="회원가입" onclick="location.href='joinForm.jsp'">
                <input type="button" name="cs-center" value="고객센터" onclick="location.href='csCenterForm.jsp'">
            </div>
        </header>
    
        <section class="top_section">
            <div class="category"><i class="fas fa-bars"></i><br>카테고리</div>
            <div class="top_section_right">
                <div class="logo">중고짱터</div>
                <div class="search_btn">
                        <input type="text" class="search_text" placeholder="찾고 싶은 상품을 검색해보세요!">
                        <div class="searchic">
                            <i class="fas fa-microphone-alt"></i>
                            <i class="fas fa-search"></i>
                        </div>
                </div>
                <div class="my_menus">
                    <div class="my_coupang">마이페이지<i class="far fa-user"></i></div>
                    <div class="my_bascket">장바구니<i class="fas fa-shopping-cart"></i></div>
                </div>
            </div>
        </section>
        <ul class="top_section2">
            <li class="list"><a href="list.jsp"><i class="fas fa-rocket">중고 게시물 둘러보기</i></a></li>
            <li class="list">중고 게시물 등록/판매</li>
            <li class="list"><i class="fas fa-rocket"></i>내 주변 판매자</li>
            <li class="list">이벤트/쿠폰</li>
          </ul>
        
        <section class="photo_section">
            <div class="background_photo">
                <img src="imgs/big_photo.png" alt="">
            </div>
            <div class="side_photo">
                <div class="side_photo">
                    <span>캠핑용품!</span>
                    <img src="imgs/side1.png" alt="side_photo">
                </div>
                <div class="side_photo">
                    <span>오늘까지!</span>
                    <img src="imgs/side2.png" alt="side_photo">
                </div>
                <div class="side_photo">
                    <span>해외직구 중고
                    </span>
                    <img src="imgs/side3.png" alt="side_photo">
                </div>
                <div class="side_photo">
                    <span>겨울신상
                        SALE
                    </span>
                    <img src="imgs/side4.png" alt="side_photo">
                </div>
            </div>
        </section>
        <footer>
    
        </footer>
    </div>
</body>
</html>
</html>