<%@page import="com.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int commentId = Integer.parseInt(request.getParameter("commentId"));
String postNum = request.getParameter("postNum");
CommentDao commentDao = CommentDao.getInstance();
commentDao.deleteComment(commentId);

response.sendRedirect("content.jsp?postNum=" + postNum);
%>