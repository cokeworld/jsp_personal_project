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

.introduction {
	font-size: 20px;
	font-weight: bold;
}
</style>

<body>
<img src="img/logo.png" alt="Logo">
<form action="joinProcess.jsp">
    <div class="user_info">
        <div class="introduction">회원정보를 입력해주세요.</div>
        <div class="id">
            <i class="far fa-envelope"></i>
            <input type="text" name="id" placeholder="아이디" required>
            <br>
            <span id="msgId"></span>
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
        <div class="name">
            <i class="far fa-user"></i>
            <input type="text" name="address" placeholder="주소" required>
        </div>
    </div>
    <br>
    <div class="confirm">
        <div class="introduction">서비스 약관에 동의해 주세요.</div>
        <ul>
            <li><input type="checkbox" >[필수] 만 14세 이상입니다. </li>
            <li><input type="checkbox" >[필수] 중고짱터 이용약관 동의.</li>
            <li><input type="checkbox" >[필수] 전자금융 이용약관 동의.</li>
            <li><input type="checkbox" >[필수] 개인정보 수집 및 이용 동의.</li>
        </ul>
        <br>
        <input type="submit" value="동의하고 가입하기">
    </div>

<script src="../js/jquery-3.5.1.js"></script>
<script>
	function checkId(item) {
		let $spanMsg = $('#msgId');
		// 0 = 중복x2
		if(item.duplication == 0) {
				$spanMsg.html('사용가능한 아이디입니다.');
			} else {
					$spanMsg.html('다른 아이디를 입력해주세요.').css('color', 'red');
				}
		
		}
	$('input[name="id"]').keyup(function() {
		let str = $(this).serialize();
		console.log('쿼리스트링: ' + str);
		
		$.ajax({
			url: 'ajaxCheckDuplicatedId.jsp',
			data: str,
			success: function(data) {
				console.log(typeof data);
				console.log(data);
				checkId(data);
				}
			})})
</script>
</form>
<div class="right">©MyJung-go Corp. All rigths Reserved.</div>
</body>
</html>