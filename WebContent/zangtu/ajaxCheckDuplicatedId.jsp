<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.dao.ZangtuDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

ZangtuDao zangtuDao = new ZangtuDao();

int duplication = zangtuDao.checkDuplicatedId(id);

JSONObject jsonObject = new JSONObject();
jsonObject.put("duplication", duplication);

%>

<%=jsonObject.toString()%>