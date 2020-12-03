<%@page import="com.vo.UserVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고매물</title>
</head>
<body>
<div class="title">전체 중고매물</div>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
<%
	PostDao zangtuDao = new PostDao();
List<UserVo> itemList = zangtuDao.getPostList();
for(UserVo zangtuVo : itemList) {
%>
			<tr>
				<td>글번호 넣자</td>
				<td><%=zangtuVo.getSubject() %></td>
				<td><%=zangtuVo.getName() %></td>
				<td><%=zangtuVo.getRegDate()%></td>
				<td><%=zangtuVo.getReadCount()%></td>
			</tr>
	<%	
}
%>
		</tbody>
	</table>
</body>
</html>