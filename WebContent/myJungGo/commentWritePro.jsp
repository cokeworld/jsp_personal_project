<%@page import="java.sql.Timestamp"%>
<%@page import="com.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="commentVo" class="com.vo.CommentVo" />
<jsp:setProperty property="*" name="commentVo" />

<%
// commentId 설정
CommentDao commentDao = CommentDao.getInstance();
int commentId = commentDao.getNextNum();
commentVo.setCommentId(commentId);
// 시간 설정
commentVo.setCommentDate(new Timestamp(System.currentTimeMillis()));
// commentSecret(비밀댓글) null 값 처리?
		
// addComment(commentVO)
commentDao.addComment(commentVo);
// category 값 받기
String category = request.getParameter("category");

response.sendRedirect("content.jsp?postNum=" + commentVo.getPostId() + "&category=" +category);
%>
