<%@page import="com.vo.UserVo"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");

PostDao zangtudao = new PostDao();
UserVo zangtuVo = new UserVo();
zangtuVo.setId(id);
zangtuVo.setPasswd(passwd);
zangtuVo.setName(name);
zangtudao.addUser(zangtuVo);
%>
<script>
	alert('회원가입 완료되었습니다!');
	location.href='index.jsp';
</script>