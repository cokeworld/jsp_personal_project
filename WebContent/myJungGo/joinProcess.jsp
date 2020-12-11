<%@page import="com.dao.UserDao"%>
<%@page import="com.vo.UserVo"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%-- 액션태그로 VO 객체 준비 --%>
<jsp:useBean id="userVo" class="com.vo.UserVo" />
<%-- 액션태그로 VO객체에 파라미터값 저장 --%>
<jsp:setProperty property="*" name="userVo" />

<%
// 가입날짜 생성해서 넣기
// memberVo.setRegDate(new Timestamp(System.currentTimeMillis()));

UserDao userDao = new UserDao();
userDao.addUser(userVo);
%>

<script>
	alert('회원가입 완료되었습니다!');
	location="loginForm.jsp";a
</script>

<%-- response.sendRedirect("loginForm.jsp"); --%>