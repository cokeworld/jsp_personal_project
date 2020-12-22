<%@page import="com.dao.PostDao"%>
<%@page import="com.vo.PostVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PostDao postDao = PostDao.getInstance();
//글목록 가져오기
int startPost = 0;
int postSize = 4;
List<PostVo> postList = null;

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

		<%-- topNews 영역 --%>
		<jsp:include page="/include/topNews.jsp" />

        <!-- Category News Row1 Start-->
        <div class="cat-news">
            <div class="container">
                <div class="row">
                
                    <div class="col-md-6">
                        <h2>여성의류 <input type="button" value="전체보기" onclick="location.href='category.jsp?category=female'"></h2>
                        <div class="row cn-slider">
                        <%
                        // category 설정
                        String category = "female";
                        
                        postList = postDao.getPostList(category, startPost, postSize);
                        for (PostVo postVo : postList) {
                        %>
                            <div class="col-md-6">
                                <div class="cn-img">
                                <%
                      			String file = postVo.getFile();
								if(file != null) {
									
									// Start makeSampleImages
									if(file.equals("sample1")) {
									%>
										<img src="img/sample1.png" width="194" height="194" alt="상품 이미지">
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
                                    <div class="cn-title">
                                        <a href="content.jsp?postNum=<%=postVo.getPostId() %>&pageNum=1&category=<%=category %>">
                                        <%=postVo.getTitle() %>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%
                        	}
                            %>
                        </div>
                    </div>
                    
					<div class="col-md-6">
                        <h2>액세서리 <input type="button" value="전체보기" onclick="location.href='category.jsp?category=accessory'"></h2>
                        <div class="row cn-slider">
                        <%
                        // category 설정
                        category = "accessory";

                        postList = postDao.getPostList(category, startPost, postSize);
                        for (PostVo postVo : postList) {
                        %>
                            <div class="col-md-6">
                                <div class="cn-img">
                                <%
                      			String file = postVo.getFile();
								if(file != null) {
									
									// Start makeSampleImages
									if(file.equals("sample2")) {
									%>
										<img src="img/sample2.jpg" width="194" height="194" alt="상품 이미지">
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
                                    <div class="cn-title">
                                        <a href="content.jsp?postNum=<%=postVo.getPostId() %>&pageNum=1&category=<%=category %>">
                                        <%=postVo.getTitle() %>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%
                        	}
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- Category News Row1 End-->
		
		<!-- Category News Row2 Start-->
        <div class="cat-news">
            <div class="container">
                <div class="row">
                
                    <div class="col-md-6">
                        <h2>남성의류 <input type="button" value="전체보기" onclick="location.href='category.jsp?category=male'"></h2>
                        <div class="row cn-slider">
                        <%
                        // category 설정
                        category = "male";
                        
                        postList = postDao.getPostList(category, startPost, postSize);
                        for (PostVo postVo : postList) {
                        %>
                            <div class="col-md-6">
                                <div class="cn-img">
                                <%
                      			String file = postVo.getFile();
								if(file != null) {
									
									// Start makeSampleImages
									if(file.equals("sample3")) {
									%>
										<img src="img/sample3.jpg" width="194" height="194" alt="상품 이미지">
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
                                    <div class="cn-title">
                                        <a href="content.jsp?postNum=<%=postVo.getPostId() %>&pageNum=1&category=<%=category %>">
                                        <%=postVo.getTitle() %>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%
                        	}
                            %>
                        </div>
                    </div>
                    
					<div class="col-md-6">
                        <h2>디지털/가전 <input type="button" value="전체보기" onclick="location.href='category.jsp?category=digital'"></h2>
                        <div class="row cn-slider">
                        <%
                        // category 설정
                        category = "digital";
                        
                        postList = postDao.getPostList(category, startPost, postSize);
                        for (PostVo postVo : postList) {
                        %>
                            <div class="col-md-6">
                                <div class="cn-img">
                                <%
                      			String file = postVo.getFile();
								if(file != null) {
									
									// Start makeSampleImages
									if(file.equals("sample4")) {
									%>
										<img src="img/sample4.png" width="194" height="194" alt="상품 이미지">
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
                                    <div class="cn-title">
                                        <a href="content.jsp?postNum=<%=postVo.getPostId() %>&pageNum=1&category=<%=category %>">
                                        <%=postVo.getTitle() %>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%
                        	}
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Category News Row2 End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="nav nav-pills nav-justified">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#featured">Featured News</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#popular">Popular News</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#latest">Latest News</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div id="featured" class="container tab-pane active">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-1.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-2.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-3.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                            <div id="popular" class="container tab-pane fade">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-4.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-5.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-1.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                            <div id="latest" class="container tab-pane fade">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-2.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-3.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-4.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <ul class="nav nav-pills nav-justified">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#m-viewed">Most Viewed</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#m-read">Most Read</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#m-recent">Most Recent</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div id="m-viewed" class="container tab-pane active">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-5.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-4.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-3.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                            <div id="m-read" class="container tab-pane fade">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-2.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-1.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-3.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                            <div id="m-recent" class="container tab-pane fade">
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-4.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-5.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                                <div class="tn-news">
                                    <div class="tn-img">
                                        <img src="img/news-350x223-1.jpg" />
                                    </div>
                                    <div class="tn-title">
                                        <a href="">Lorem ipsum dolor sit amet</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tab News Start-->

        <!-- Main News Start-->
        <div class="main-news">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-1.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-2.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-3.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-4.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-5.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-1.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-2.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-3.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="img/news-350x223-4.jpg" />
                                    <div class="mn-title">
                                        <a href="">Lorem ipsum dolor sit</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="mn-list">
                            <h2>Read More</h2>
                            <ul>
                                <li><a href="">Lorem ipsum dolor sit amet</a></li>
                                <li><a href="">Pellentesque tincidunt enim libero</a></li>
                                <li><a href="">Morbi id finibus diam vel pretium enim</a></li>
                                <li><a href="">Duis semper sapien in eros euismod sodales</a></li>
                                <li><a href="">Vestibulum cursus lorem nibh</a></li>
                                <li><a href="">Morbi ullamcorper vulputate metus non eleifend</a></li>
                                <li><a href="">Etiam vitae elit felis sit amet</a></li>
                                <li><a href="">Nullam congue massa vitae quam</a></li>
                                <li><a href="">Proin sed ante rutrum</a></li>
                                <li><a href="">Curabitur vel lectus</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main News End-->
        
	<%-- footer 영역 --%>
	<jsp:include page="/include/footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<%-- JavaScriptContent 영역 --%>
	<jsp:include page="/include/jsContent.jsp" />
    </body>
</html>
