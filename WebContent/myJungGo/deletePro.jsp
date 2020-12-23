<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int postNum = Integer.parseInt(request.getParameter("postNum"));
String category = request.getParameter("category");
String pageNum = request.getParameter("pageNum");

PostDao postDao = PostDao.getInstance();
postDao.deletePost(postNum);	

response.sendRedirect("category.jsp?pageNum="+pageNum+"&category="+category);
%>
