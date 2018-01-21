<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
</head>
<body>
<c:set var="image" value="/tcat/resources/image/"/>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="row pt5">
			<div class="col-md-2 thumbnail mr15 h300">
				<div class="list-group pt20">
				  <a href="#" class="list-group-item disabled">
				    <span class="text-warning">클래식</span>
				  </a>
				  <a href="#" class="list-group-item">클래식</a>
				  <a href="#" class="list-group-item">국악</a>
				</div>
			</div>
			<div class="col-md-7 thumbnail mr15 h300">
			<!-- 슬라이드 -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="${image}classic/A_1.jpg"  width="100%" height="300px" alt="A_1">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}classic/A_2.jpg" width="100%" height="300px" alt="A_2">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}classic/A_3.jpg" width="100%" height="300px" alt="A_3">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<!-- 슬라이드 끝 -->
			
			</div>
			<div class="col-md-2 thumbnail">
				<div class="list-group pt11">
				  <div class="pt11"><p class="686868 b m10"><span class="glyphicon glyphicon-star"></span> 랭킹</p></div>
				  <a href="#" class="list-group-item">1. 빌하모니</a>
				  <a href="#" class="list-group-item">2. 아리랑</a>
				  <a href="#" class="list-group-item">3. 모스크바심포지움</a>
				  <a href="#" class="list-group-item">4. 클래식시리즈</a>
				  <a href="#" class="list-group-item">5. 김영임공연</a>
				</div>
			</div>	
			
		</div>
	</div>
	 <div class="col-md-1"></div>
</div><!-- row end -->


</body>
</html>