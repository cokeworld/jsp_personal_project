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
            <input type="text" name="userId" placeholder="아이디" required>
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
        <br>
        <!-- <div class="name">
            <i class="far fa-user"></i>
            <input type="text" name="address" placeholder="주소" required>
        </div>
         -->
         
        <!-- 카카오 로컬 API -->
        <div class="address">
        	<i class="fas fa-map-marker-alt pr-1"></i>
        	
			<input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소" hidden>
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			<input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden>
			
			<!-- 카카오 로컬 API SCRIPT-->
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			    function sample4_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var roadAddr = data.roadAddress; // 도로명 주소 변수
			                var extraRoadAddr = ''; // 참고 항목 변수
			
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample4_postcode').value = data.zonecode;
			                document.getElementById("sample4_roadAddress").value = roadAddr;
			                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			
			                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			                if(roadAddr !== ''){
			                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			                } else {
			                    document.getElementById("sample4_extraAddress").value = '';
			                }
			                
			                var guideTextBox = document.getElementById("guide");
			                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			                if(data.autoRoadAddress) {
			                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
			                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
			                    guideTextBox.style.display = 'block';
			
			                } else if(data.autoJibunAddress) {
			                    var expJibunAddr = data.autoJibunAddress;
			                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
			                    guideTextBox.style.display = 'block';
			                } else {
			                    guideTextBox.innerHTML = '';
			                    guideTextBox.style.display = 'none';
			                }
			            }
			        }).open();
			    }
			</script>
        
        
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

</form>
<div class="right">©MyJung-go Corp. All rigths Reserved.</div>

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


</body>
</html>