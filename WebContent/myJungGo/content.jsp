<%@page import="java.util.ArrayList"%>
<%@page import="com.vo.CommentVo"%>
<%@page import="com.dao.CommentDao"%>
<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 파라미터값 int num, String pageNum 가져오기
	int postNum = Integer.parseInt(request.getParameter("postNum")); // 글번호
	String pageNum = request.getParameter("pageNum"); // 페이지번호

	// DAO 객체 준비
	PostDao	postDao = PostDao.getInstance();
	
	// 조회수 1 증가하기
	postDao.updatePostView(postNum);
	
	// 글번호에 해당하는 글 한개 가져오기
	PostVo postVo = postDao.getPostByNum(postNum);
	
	// category 설정
	String category = postVo.getCategory();
	//category 한글 이름 설정
	String categoryKoreanName = "";
	
	switch (category) {
	case "female": 
		categoryKoreanName = "여성의류";
		break;
	case "accessory": 
		categoryKoreanName = "액세서리";
		break;
	case "male": 
		categoryKoreanName = "남성의류";
		break;
	case "digital": 
		categoryKoreanName = "디지털/가전";
		break;
	}
	// sessionId, sellerId
	String sellerId = postVo.getSellerId();
	String sessionId = (String) session.getAttribute("id");
	if(sessionId==null) {
		sessionId = "";
	}
	
	// commentList
	List<CommentVo> commentList = null;
	CommentDao commentDao = CommentDao.getInstance();
	commentList = commentDao.getCommentList(postNum, 0, 9);
	
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
				<br>
				<div class="products">
					
			<table class="table table-bordered">
		<tr>
			<th>글번호</th><td><%=postVo.getPostId() %></td>
			<th>작성일</th><td><%=postVo.getRegDate() %></td>
		</tr>
			<th>카테고리</th><td><%=categoryKoreanName %></td>
			<th>조회수</th><td><%=postVo.getView() %></td>
		<tr>
		</tr>
		<tr>
			<th>작성자ID</th><td><%=postVo.getSellerId() %></td>
			<th>위치</th><td><%=postVo.getLocation() %></td>
		</tr>
		<tr>
			<th>글제목</th><td colspan="3"><%=postVo.getTitle() %></td>
		</tr>
		<tr>
			<th>사진</th>
			<td colspan="3">
				<%
				String filename = postVo.getFile();
				if (filename != null) {
					%>
					<a href="../upload/<%=filename %>"><%=filename %></a>
					<%
					if (filename.endsWith("jpg") || filename.endsWith("jpeg") 
							|| filename.endsWith("gif") || filename.endsWith("png")) {
						%>
						<br>
						<img src="../upload/<%=filename %>" width="300" height="300">
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
				<input type="button" value="글수정" <%=(sessionId.equals(sellerId))?"":"hidden" %> onclick="location.href='fileUpdateForm.jsp?num=<%=postNum %>&pageNum=<%=pageNum %>&category=<%=category %>'"> 
				<input type="button" value="글삭제" <%=(sessionId.equals(sellerId))?"":"hidden" %> onclick="location.href='deleteForm.jsp?num=<%=postNum %>&pageNum=<%=pageNum %>&category=<%=category %>'">
<%-- 				<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?reRef=<%=postVo.getReRef() %>&reLev=<%=postVo.getReLev() %>&reSeq=<%=postVo.getReSeq() %>&pageNum=<%=pageNum %>'"> --%>
				<input type="button" value="글목록" onclick="location.href='category.jsp?pageNum=<%=pageNum %>&category=<%=category %>'">
			</td>
		</tr>
	</table>
	<br>
		</div>
		<hr>

		<%-- 로그인 상태 true == 로그인 상태 --%>
		<%boolean logined = !sessionId.equals(""); %>
		<%-- start comment 영역 --%>
		<div class="comment-container">
			<div class="category_title">댓글</div>
			<form class="form" action="commentWritePro.jsp">
				<input type="text" name="commentContent" class="form-control" <%=logined ? "":"placeholder='로그인 후 댓글을 남겨주세요.' disabled" %>>
				<input type="submit" value="댓글달기" <%=logined ? "":"disabled" %>>
				<input type="hidden" name="commentSecret" <%=logined ? "":"disabled" %>> <label hidden>비밀댓글</label>
				<input type="hidden" name="postId" value="<%=postNum %>">
				<input type="hidden" name="userId" value="<%=sessionId %>">
				<input type="hidden" name="category" value="<%=category %>">
			</form>
			<br>
						
			<table class="table comment_table table-bordered">
			<%
			for(CommentVo commentVo : commentList) {
			%>
				<tr>
					<th><%=commentVo.getUserId() %></th>
					<td><%=commentVo.getCommentContent() %></td>
					<td><%=commentVo.getCommentDate() %></td>
					<td><a class="<%=sessionId.equals(commentVo.getUserId())?"":"d-none " %> commentDeleteBtn" href="commentDeletePro.jsp?commentId=<%=commentVo.getCommentId() %>&postNum=<%=postNum %>"><i class="fas fa-times"></i></a></td>
				</tr>
			<%
			}
			%>
			</table>
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
		$('.commentDeleteBtn').click(function() {
			var isDelete = confirm("삭제할까요?");
			if(!isDelete) {
				return false;
				}
			}); 
		

	</script>
</body>
</html>
