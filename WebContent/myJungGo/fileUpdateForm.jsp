<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
int postNum = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String category = request.getParameter("category");

PostDao postDao = PostDao.getInstance();
PostVo postVo = postDao.getPostByNum(postNum);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%-- head 컨텐트 영역 --%>
	<jsp:include page="/include/headContent.jsp" />
</head>
<style>
span#delFile {
	color: red;
	background-color: yellow;
	font-weight: bold;
	border: 1px solid black;
	border-radius: 5px;
	cursor: pointer;
}
</style>
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
				<br>
		<div class="row">
			<br>
			<div class="products">
				<form action="fileUpdatePro.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="<%=pageNum %>">
					<input type="hidden" name="id" value="<%=postVo.getId() %>">
					<table class="table table-borderless">
						<tr>
							<th>판매자</th>
							<td><input type="text" name="seller" value="<%=postVo.getSeller() %> " class="form-control" required readonly></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="passwd" value="<%=postVo.getPasswd() %>" class="form-control" required></td>
						</tr>
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
							<td><input type="text" name="title" value="<%=postVo.getTitle() %>" class="form-control" required></td>
						</tr>
						<tr>
							<th>파일</th>
							<td>
							<%
							String filename = postVo.getFile();
							if (filename != null) {
								%>
								<div id="oldFileArea">
									<img src="../upload/<%=filename %>" width="300" height="300">
									<span id="delFile">X</span>
									<input type="hidden" name="oldFilename" value="<%=filename %>">
									<input type="hidden" name="filename" value="<%=filename %>">
								</div>
									<%
							} else {
								%>
								<img src="img/no-image.png" width="300" height="300" alt="No Image">
								<input type="file" name="filename" class="form-control">
								<%
							}
							%> 
							</td>

						</tr>
						<tr>
							<th>가격</th>
							<td><input type="number" name="price" value="<%=postVo.getPrice() %>" class="form-control"></td>
						</tr>
						<tr>
							<th>위치</th>
							<td><input type="text" name="location" value="<%=postVo.getLocation() %>" class="form-control"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="13" cols="40" name="description" class="form-control" required><%=postVo.getDescription() %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="파일 수정하기">
								<input type="reset" value="다시쓰기">
								<input type="button" value="글목록" onclick="location.href='category.jsp?pageNum=<%=pageNum %>&category=<%=category %>'">
							</td>
						</tr>
					</table>
				</form>
		</div>
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
	
<script>
	// 기존 첨부파일 삭제 [X]를 클릭했을때
	$('span#delFile').click(function () {
		// hidden 태그의 name 속성값을 변경하기
		$(this).closest('div').next().prop('name', 'delFilename');

		$(this).closest('td').prepend('<input type="file" name="filename">');
		
		$(this).closest('div').remove();
	});
</script>

</body>
</html>
