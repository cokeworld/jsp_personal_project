<%@page import="com.vo.ZangtuVo"%>
<%@page import="com.dao.ZangtuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");

ZangtuDao zangtudao = new ZangtuDao();
ZangtuVo zangtuVo = new ZangtuVo();
zangtuVo.setId(id);
zangtuVo.setPasswd(passwd);
zangtuVo.setName(name);
zangtudao.addUser(zangtuVo);

%>
<script>
	alert('회원가입 완료되었습니다!');
	location.href='index.jsp';
</script>