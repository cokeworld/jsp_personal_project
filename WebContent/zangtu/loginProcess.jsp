<%@page import="com.dao.ZangtuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

ZangtuDao zangtuDao = new ZangtuDao();

//1: id passwd 인증성공
//0: id 틀림
//-1: pass 틀림
int checkUser = zangtuDao.checkUser(id, passwd);

if(checkUser==1) {
	session.setAttribute("id", id);
	%>
	<script>
	alert('로그인 성공');
	location.href = 'index.jsp';
	</script>
	<%
} else if(checkUser==0) {
	%>
	<script>
	alert('가입되지 않은 ID입니다.');
	history.back();
	</script>
	<%
} else {
	%>
	<script>
	alert('비밀번호가 일치하지 않습니다.');
	history.back();
	</script>
	<%	
}
%>