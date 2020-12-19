<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String category = request.getParameter("category");
String pageNum = request.getParameter("pageNum");

PostDao postDao = PostDao.getInstance();
postDao.deletePost(num);	

response.sendRedirect("category.jsp?pageNum="+pageNum+"&category="+category);
%>
