<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/f9adbb06a2.js"
	crossorigin="anonymous"></script>
<title>로그인</title>
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
	<div class="logo">중고짱터</div>
	<form action="loginProcess.jsp">
		<div class="loginInfo">
			<div class="id">
				<i class="far fa-envelope"></i> <input type="text" name="id"
					placeholder="아이디(이메일)" required> <br> <span id="msgId"></span>
			</div>
			<div class="passwd">
				<i class="fas fa-key"></i> <input type="password" name="passwd"
					placeholder="비밀번호" required>
			</div>
		</div>
		<a href="">아이디(이메일)/비밀번호 찾기</a>
		<br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">;
		<script src="../js/jquery-3.5.1.js"></script>
		<script>

</script>
	</form>
	<div class="right">©JunghoZangtu Corp. All rigths Reserved.</div>
</body>
</html>