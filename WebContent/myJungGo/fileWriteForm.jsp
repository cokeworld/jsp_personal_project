<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String pageNum = request.getParameter("pageNum");
String category = request.getParameter("category");
if(pageNum == null) {
	pageNum="";
}
if(category == null) {
	category="";
}
String sessionId = (String) session.getAttribute("id");
if(sessionId == null) {
	response.sendRedirect("loginForm.jsp");
	return;
}
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
						판매하기
					</div>
				</div>
				<br>
				<div class="products">
						<form action="fileWritePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="sellerId" value="<%=sessionId %>">
		<table class="table table-borderless">
			<tr>
				<th>카테고리</th>
				<td>
				<select name="category" id="category-select" class="form-control">
				    <option value="female" <%=(category.equals("female"))?"selected":"" %>>여성의류</option>
				    <option value="accessory" <%=(category.equals("accessory"))?"selected":"" %>>액세서리</option>
				    <option value="male" <%=(category.equals("male"))?"selected":"" %>>남성의류</option>
				    <option value="digital" <%=(category.equals("digital"))?"selected":"" %>>디지털/가전</option>
				</select>	
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="form-control" required></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="filename" class="form-control"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="price" class="form-control"></td>
			</tr>
			<tr>
				<th>위치</th>
				<td><input type="text" name="location" class="form-control"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="13" cols="40" name="description" class="form-control"required></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="파일 글쓰기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="홈으로" onclick="location.href='index.jsp'">
				</td>
			</tr>
		</table>
	</form>
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
