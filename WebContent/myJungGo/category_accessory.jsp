<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// category 설정
String category = "accessory";
String categoryKoreanName = "액세서리";

// DAO 객체 준비
PostDao postDao = new PostDao();

// 전체 글갯수 가져오기
int count = postDao.getPostsCount();

// 한페이지당 보여줄 글갯수 설정
int pageSize = 10;

// 사용자가 요청하는 페이지번호 파라미터값 가져오기
String strPageNum = request.getParameter("pageNum");
// 사용자 요청 페이지번호 정보가 없을때(null 일때)
// 기본 요청 페이지번호를 1페이지로 설정하기
strPageNum = (strPageNum == null) ? "1" : strPageNum;
// 사용자 요청 페이지를 정수로 변환
int pageNum = Integer.parseInt(strPageNum);

// 가져올 첫행번호 구하기
int startRow = (pageNum - 1) * pageSize;

// 글목록 가져오기
List<PostVo> postList = null;
if (count > 0) {
	postList = postDao.getPostList(category, startRow, pageSize);
}
%>    
<!DOCTYPE html>
<html lang="en">
<head>
	<%-- head 컨텐트 영역 --%>
	<jsp:include page="/include/headContent.jsp" />
</head>

<body>
	<%-- topHeader 영역 --%>
	<jsp:include page="/include/topHeader.jsp" />

	<!-- Posts List Start-->
	<div class="single-news">
		<div class="container">
				<div class="category_row d-flex justify-content-between">
					<div class="category_title">
						<%=categoryKoreanName %>
<!-- 						<a href='' class="title_button">전체보기</a> -->
					</div>
					<input type="button" name="btnFileUpload" value="판매하기" onclick="location.href='fileWriteForm.jsp'">
				</div>
			<div class="row">
				<br>
				<div class="products">
		<%
			if (count > 0) {
			for (PostVo postVo : postList) {

		%>
					<div class="product">
						<a href='content_<%=category %>.jsp?postNum=<%=postVo.getId() %>&pageNum=<%=pageNum %>' class="">
							<div class="post_image">
							<%
							String file = postVo.getFile();
							
							if(file != null) {
								
								// Start makeSampleImages
								if(file.equals("sample1")) {
								%>
									<img src="img/sample1.png" width="194" height="194" alt="상품 이미지">
								<%
								} else if(file.equals("sample2")) {
									%>
										<img src="img/sample2.png" width="194" height="194" alt="상품 이미지">
									<%	
								} else {
								// End makeSampleImages
								
								%>
									<img src="../upload/<%=file %>" width="194" height="194" alt="상품 이미지">
								<%	
								}
							} else {
								%>
								<img src="img/no-image.png" width="194" height="194" alt="No Image">
								<%
							}
							%>
							</div>
							<div class="post_description mt-3">
								<div class="post_title mb-1"><%=postVo.getTitle() %></div>
								<div class="post_middle mb-1">
									<div class="post_price font-weight-bold"><%=postVo.getPrice() %> 원</div>
									
								</div>
								<div class="post_location"><i class="fas fa-map-marker-alt pr-1"></i><%=postVo.getLocation() %></div>
							</div>
						</a>
					</div>
			<%
			}
		} else { // count == 0
			%>
				<h1>게시판 글 없음</h1>
			<%
		}
		%>
		
				</div>
			</div>
				<%
	// 글갯수가 0보다 크면 페이지블록 계산해서 출력하기
	if (count > 0) {
		// 총 필요한 페이지 갯수 구하기
		// 글50개. 한화면에보여줄글 10개 => 50/10 = 5 
		// 글55개. 한화면에보여줄글 10개 => 55/10 = 5 + 1페이지(나머지존재) => 6
		int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
		//int pageCount = (int) Math.ceil((double) count / pageSize);
		
		// 한 화면에 보여줄 페이지갯수 설정
		int pageBlock = 5;
		
		// 화면에 보여줄 시작페이지번호 구하기
		// 1~5          6~10          11~15          16~20       ...
		// 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		
		// 화면에 보여줄 끝페이지번호 구하기
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		%>
			<div class="page_index mt-3 text-center">
		<%
		// [이전]
		if (startPage > pageBlock) {
			%>
				<a href="category_<%=category %>.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a>
				<%
			}
			
			// 1 ~ 5
			for (int i=startPage; i<=endPage; i++) {
				if (i == pageNum) {
					%>
					<a href="category_<%=category %>.jsp?pageNum=<%=i %>" class="font-weight-bold"> [<%=i %>]</a>
					<%
				} else {
					%>
					<a href="category_<%=category %>.jsp?pageNum=<%=i %>">[<%=i %>]</a>
					<%
				}
			} // for
			
			
			// [다음]
			if (endPage < pageCount) {
				%>
				<a href="category_<%=category %>.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
			<%
		}
			%>
			</div> 
<!-- 			page_index -->
			<%
	}
	%>
		</div>
	</div>
	</div>
	<!-- Posts List End-->

	<%-- footer 영역 --%>
	<jsp:include page="/include/footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%-- JavaScriptContent 영역 --%>
	<jsp:include page="/include/jsContent.jsp" />
</body>
</html>
