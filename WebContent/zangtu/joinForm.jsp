<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/f9adbb06a2.js" crossorigin="anonymous"></script>
<title>회원가입</title>
</head>

<style>
* {
text-align: center;
}
li {
    list-style-type: none;
}
.user_info {
    display: flex;
    flex-direction: column;
    padding: 20px;
}
.logo {
    font-size: 50px;
    color: #893AE1;
    font-weight: bold;
}
</style>

<body>
<div class="logo">중고짱터</div>
<form action="joinProcess.jsp">
    <div class="user_info">
        <div class="introduction">회원정보를 입력해주세요.</div>
        <div class="id">
            <i class="far fa-envelope"></i>
            <input type="text" name="id" placeholder="아이디(이메일)" required>
        </div>
        <div class="passwd">
            <i class="fas fa-key"></i>
            <input type="password" name="passwd" placeholder="비밀번호" required>
        </div>
        <div class="passwd_checked">
            <i class="fas fa-key"></i>
            <input type="password" name="passwd_checked" placeholder="비밀번호(확인)" required>
        </div>
        <div class="name">
            <i class="far fa-user"></i>
            <input type="text" name="name" placeholder="이름" required>
        </div>
    </div>
    <div class="confirm">
        <div class="introduction">중고짱터 서비스 약관에 동의해 주세요.</div>
        <ul>
            <li><input type="checkbox">[필수] 만 14세 이상입니다.</li>
            <li><input type="checkbox">[필수] 중고짱터 이용약관 동의.</li>
            <li><input type="checkbox">[필수] 전자금융 이용약관 동의</li>
            <li><input type="checkbox">[필수] 개인정보 수집 및 이용 동의</li>
        </ul>
        <input type="submit" value="동의하고 가입하기">
    </div>

</form>
<div class="right">©JunghoZangtu Corp. All rigths Reserved.</div>
</body>
</html>