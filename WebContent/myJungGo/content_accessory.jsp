<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// category 설정
	String category = "accessory";

	// 파라미터값 int num, String pageNum 가져오기
	int postNum = Integer.parseInt(request.getParameter("postNum")); // 글번호
	String pageNum = request.getParameter("pageNum"); // 페이지번호

	// DAO 객체 준비
	PostDao	postDao = new PostDao();
	
	// 조회수 1 증가하기
	postDao.updatePostView(postNum);
	
	// 글번호에 해당하는 글 한개 가져오기
	PostVo postVo = postDao.getPostByNum(postNum);
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
						물건보기
					</div>
				</div>
			<div class="row">
				<br>
				<div class="products">
					
			<table border="1">
		<tr>
			<th>글번호</th><td><%=postVo.getId() %></td>
			<th>조회수</th><td><%=postVo.getView() %></td>
		</tr>
		<tr>
			<th>작성자</th><td><%=postVo.getSeller() %></td>
<%-- 			<th>작성일</th><td><%=postVo.getRegDate() %></td> --%>
		</tr>
		<tr>
			<th>글제목</th><td colspan="3"><%=postVo.getTitle() %></td>
		</tr>
		<tr>
			<th>사진</th>
			<td colspan="3">
				<%
				if (postVo.getFile() != null) {
					String filename = postVo.getFile();
					%>
					<a href="../upload/<%=filename %>"><%=filename %></a>
					<%
					if (filename.endsWith("jpg") || filename.endsWith("jpeg") 
							|| filename.endsWith("gif") || filename.endsWith("png")) {
						%>
						<br>
						<img src="../upload/<%=filename %>" width="100" height="100">
						<%
					}
				}
				%>
			</td>
		</tr>
		<tr>
			<th>글내용</th><td colspan="3"><pre><%=postVo.getDescription() %></pre></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="파일글수정" onclick="location.href='fileUpdateForm.jsp?num=<%=postNum %>&pageNum=<%=pageNum %>'"> 
				<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=postNum %>&pageNum=<%=pageNum %>'">
				<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=postNum %>&pageNum=<%=pageNum %>'">
<%-- 				<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?reRef=<%=postVo.getReRef() %>&reLev=<%=postVo.getReLev() %>&reSeq=<%=postVo.getReSeq() %>&pageNum=<%=pageNum %>'"> --%>
				<input type="button" value="글목록" onclick="location.href='category_<%=category %>.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>
	<br>
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
</body>
</html>
