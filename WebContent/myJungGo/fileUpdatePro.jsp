<%@page import="java.io.File"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.vo.PostVo"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 업로드 객체 생성할때 필요한 인자값
// 1. request
// 2. 업로드 할 폴더의 물리적 경로
// 3. 업로드 최대 크기 제한
// 4. 파일명 한글처리 utf-8
// 5. 파일명 중복될때 이름변경규칙 가진 객체를 전달

// 업로드 할 실제 물리적 경로 구하기
// String realPath = application.getRealPath("/upload");
String realPath = request.getServletContext().getRealPath("upload");
System.out.println("realPath : " + realPath);

// 파일 업로드 하기
MultipartRequest multi = new MultipartRequest(
		request,
		realPath,
		1024 * 1024 * 20, // 최대 업로드 20MB로 제한
		"utf-8",
		new DefaultFileRenamePolicy());

//기존 첨부파일 삭제할 필요 있으면 삭제하기
String delFilename = multi.getParameter("delFilename");
if (delFilename != null) {
	File file = new File(realPath, delFilename);
	
	if (file.exists()) {
		file.delete();
	}
}
// enctype="multipart/form-data" 로 전송받으면
// 기본내장객체인 request에서 파라미터값을 바로 찾을수 없음!
// MultipartRequest 객체로부터 파라미터값을 찾아야 함! 사용방법은 동일함.

// post 파라미터값 한글처리는 위에 생성자에서 처리하기 때문에 할필요 없음!
//request.setCharacterEncoding("utf-8");

// category 받아오기
String category = multi.getParameter("category");

// VO 객체 준비
PostVo postVo = new PostVo();

// 파라미터값 가져와서 VO에 저장. MultipartRequest 로부터 찾음.
postVo.setId(Integer.parseInt(multi.getParameter("id")));
postVo.setSeller(multi.getParameter("seller"));
postVo.setPasswd(multi.getParameter("passwd"));
postVo.setTitle(multi.getParameter("title"));
postVo.setPrice(Integer.parseInt(multi.getParameter("price")));
postVo.setLocation(multi.getParameter("location"));
postVo.setDescription(multi.getParameter("description"));
postVo.setCategory(category);

// 원본파일 이름 가져오기
System.out.println("원본파일명 : " + multi.getOriginalFileName("filename"));

// 업로드한 실제 파일이름 가져오기
System.out.println("실제파일명 : " + multi.getFilesystemName("filename"));
postVo.setFile(multi.getFilesystemName("filename"));

// DAO 객체 준비
PostDao postDao = PostDao.getInstance();

// // re_ref  re_lev  re_seq
// boardVo.setReRef(nextNum); // 주글일때는 글번호가 그룹번호가 됨
// boardVo.setReLev(0); // 주글일때는 들여쓰기 레벨이 0 (들여쓰기 없음)
// boardVo.setReSeq(0); // 주글일때는 글그룹 내에서 순번이 0 (첫번째)

// 주글 등록하기
postDao.updatePost(postVo);

// 글내용 상세보기 화면 content.jsp로 이동
response.sendRedirect("category.jsp?category=" + category);
%>




