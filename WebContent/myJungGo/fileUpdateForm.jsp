<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String pageNum = request.getParameter("pageNum");
String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%-- head 컨텐트 영역 --%>
	<jsp:include page="/include/headContent.jsp" />
</head>

<body>
	<%-- topHeader 영역 --%>
	<jsp:include page="/include/topHeader.jsp" />

	<!-- File Form Start-->
	<div class="single-news">
		<div class="container">
				<div class="category_row d-flex justify-content-between">
					<div class="category_title">
						글 수정하기
					</div>
				</div>
		<div class="row">
			<br>
			<div class="products">
				<form action="fileupdatePro.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="<%=pageNum %>">
					<table border="1">
						<tr>
							<th>판매자</th>
							<td><input type="text" name="seller" required readonly></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="passwd" required></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
							<select name="category" id="category-select">
							    <option value="female">여성의류</option>
							    <option value="accessory">액세서리</option>
							    <option value="male">남성의류</option>
							    <option value="digital">디지털/가전</option>
							</select>	
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" required></td>
						</tr>
						<tr>
							<th>파일</th>
							<td><input type="file" name="filename"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="number" name="price"></td>
						</tr>
						<tr>
							<th>위치</th>
							<td><input type="text" name="location"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="13" cols="40" name="description" required></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="파일 수정하기">
								<input type="reset" value="다시쓰기">
								<input type="button" value="홈으로" onclick="location.href='index.jsp'">
							</td>
						</tr>
					</table>
				</form>
		</div>
	</div>
	</div>
	<!-- File Form End-->

	<%-- footer 영역 --%>
	<jsp:include page="/include/footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%-- JavaScriptContent 영역 --%>
	<jsp:include page="/include/jsContent.jsp" />
</body>
</html>
