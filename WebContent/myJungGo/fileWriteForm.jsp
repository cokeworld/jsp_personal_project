<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- pageNum 파라미터값 가져오기 --%>
<% String pageNum = request.getParameter("pageNum"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파일 게시판 글쓰기</h1>
	<hr>
	<form action="fileWritePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<table border="1">
			<tr>
				<th>판매자</th>
				<td><input type="text" name="seller" required></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="passwd" required></td>
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
					<input type="submit" value="파일 글쓰기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="홈으로" onclick="location.href='index.jsp'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>



