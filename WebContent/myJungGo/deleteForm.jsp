<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	int postNum = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	PostDao postDao = PostDao.getInstance();
	PostVo postVo = postDao.getPostByNum(postNum);
	
	// sessionId, sellerId
	String sellerId = postVo.getSeller();
	String sessionId = (String) session.getAttribute("id");
	if(sessionId==null) {
		sessionId = "";
	}

	// 잘 못된 접근 방지
	if(!sessionId.equals(sellerId)) {
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%-- head 컨텐트 영역 --%>
	<jsp:include page="/include/headContent.jsp" />
</head>
<style>
table {
	width: 600px;
}
</style>
<body>
	<%-- topHeader 영역 --%>
	<jsp:include page="/include/topHeader.jsp" />
	
	<!-- Post Start-->
	<div class="single-news">
		<div class="container">
				<div class="category_row d-flex justify-content-between">
					<div class="category_title">
						글삭제
					</div>
				</div>
				<br>				
			<div class="row">
				<div class="products">
					
	<form action="deletePro.jsp" method="post" id="frm">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="num" value="<%=postNum %>">
		<input type="hidden" name="category" value="<%=category %>">
		<table class="table table-borderless">
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="passwd" class="form-control" required></td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글삭제">
					<input type="reset" value="다시쓰기">
					<input type="button" value="글목록" onclick="location.href='category.jsp?pageNum=<%=pageNum %>&category=<%=category %>'">
				</td>
			</tr>
		</table>
	</form>
		</div>
	</div>
	</div>
	<br>
	<!-- Post End-->

	<%-- footer 영역 --%>
	<jsp:include page="/include/footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%-- JavaScriptContent 영역 --%>
	<jsp:include page="/include/jsContent.jsp" />
	
	<script>
	$('#frm').submit(function () {
		var isRemove = confirm('정말 삭제하시겠습니까?');
		if (!isRemove) {
			return false;
		}
	});
	</script>
</body>
</html>
