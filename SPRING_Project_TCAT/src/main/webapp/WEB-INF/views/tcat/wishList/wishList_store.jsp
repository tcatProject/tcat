<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.ui.card>.image, .ui.cards>.card>.image {
	position: relative;
	display: block;
	-webkit-box-flex: 0;
	flex: 0 0 auto;
	padding: 0;
	background: rgba(0, 0, 0, .05);
}

.ui.card>:first-child, .ui.cards>.card>:first-child {
	border-radius: .28571429rem .28571429rem 0 0 !important;
	border-top: none !important;
}

.ui.card>.extra, .ui.cards>.card>.extra {
	max-width: 100%;
	min-height: 0 !important;
	-webkit-box-flex: 0;
	flex-grow: 0;
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	position: static;
	background: 0 0;
	width: auto;
	margin: 0;
	padding: .75em 1em;
	top: 0;
	left: 0;
	color: rgba(0, 0, 0, .4);
	box-shadow: none;
	transition: color .1s ease;
}

.ui.card>.content {
	-webkit-box-flex: 1;
	flex-grow: 1;
	border-top: 1px solid rgba(34, 36, 38, .1);
	background: 0 0;
	margin: 0;
	padding: 0.5em;
	box-shadow: none;
	font-size: 1em;
	border-radius: 0;
}

.header {
	color: black;
	font-weight: 700;
	font-size: 1em;
	margin-top: -.21425em;
	line-height: 1.28571429em;
	font-weight: 700;
}

.wish {
	border: 0;
	background: none;
	outline: none;
}

.wish.active {
	color: red;
}
</style>

<script type="text/javascript">
function setDisc_code(wish_num){
	var disc_code = $("input[name='"+wish_num+"_disc_code']").val();
	var formData = {"wish_num":wish_num,"disc_code":disc_code};
	var cla = "."+wish_num;
	var active = $(cla).hasClass("active");
	if(active){
		$.ajax({
			type : "POST",
			url : "delWishList",
			cache : false,
			data : formData,
			success : function() {
				$(cla).removeClass("active");
			},
			error : function(){
				alert("위시리스트 실패하였습니다.");
			}
		});
	}else{
		$.ajax({
			type : "POST",
			url : "addWishList",
			cache : false,
			data : formData,
			success : function() {
				$(cla).addClass("active");
			},
			error : function(){
				alert("위시리스트 실패하였습니다.");
			}
		});
	}
}
</script>
</head>
<body>

	<br>
	<div class="row">
		<div class="col-md-1"></div>

		<div class="col-md-10">
			<!--사이드 메뉴 -->
			<div class="col-md-2">
				<div class="sidebar-nav disInline w100p floatR">
					<div class="well borderMenu disInline w100p"
						style="background-color: white; padding: 8px 0;">
						<ul class="nav nav-list  w100p ">
							<li><a class="list_side"><b>위시리스트</b></a>
								<hr class="w90p" style="margin: 0 auto;"></li>
							<li><a onclick="load('wishList?wish_step=1');"
								class="list_side">공연상품</a></li>
							<li><a onclick="load('wishList_store?wish_step=2');"
								class="list_side">스토어 상품</a></li>
						</ul>
					</div>
				</div>

			</div>
			<!--위시리스트  -->
			<div class="col-md-8">

				<c:forEach var="wish" items="${wishs}">
					<!-- 리스트 시작 -->
					<div class="col-md-4">
						<div class="ui centered fluid card"
							style="border: 1px solid #d0d0d0; border-radius: 5px; margin-bottom: 20px;">
							<div class="image">
								<%-- <c:choose>
									<c:when test="${wish.mDev.equals('뮤지컬') }">
										<c:set var="folder" value="musical/" />
									</c:when>
									<c:when test="${wish.mDev.equals('콘서트') }">
										<c:set var="folder" value="concert/" />
									</c:when>
									<c:when test="${wish.mDev.equals('연극') }">
										<c:set var="folder" value="drama/" />
									</c:when>
									<c:when test="${wish.mDev.equals('클래식') }">
										<c:set var="folder" value="classic/" />
									</c:when>
								</c:choose> --%>
								<a onclick="contentMain_store(${wish.disc_code})"> <img
									src="${image}${folder}${wish.disc_image}" />
								</a>
							</div>
							<div class="content">
								<a class="header" onclick="contentMain_store(${wish.disc_code})">${wish.disc_title }</a>
								<div class="meta">
									<span class="date"> 
										<fmt:formatNumber value="${wish.disc_price }" pattern="#.###"/>원
									</span>
								</div>
							</div>
							<div class="extra content">
								<!--좋아요 추가하기 위한 데이터  -->
								<input type="hidden" name="${wish.wish_num}_disc_code" value="${wish.disc_code }">
								<span class="right floated"><i
									class="glyphicon glyphicon-heart wish active ${wish.wish_num} "
									onclick="setDisc_code(${wish.wish_num})"></i>좋아요</span>
							</div>
						</div>


					</div>
					<!--리스트 끝  -->
				</c:forEach>
			</div>
			<div class="col-md-2"></div>
		</div>

		<div class="col-md-1"></div>
	</div>
</body>
</html>