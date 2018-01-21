<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script>
/* 0111 현석 */
$( function() {
    $( "#d1" ).datepicker();
    $( "#d2" ).datepicker();
  } );
</script>

<script type="text/javascript">
/* 0111 현석 */
  function round(){
    window.open("remain_round", "confirm", "menubar=no, width=500, height=330");
 } 



//ajax
function ajaxSubmit(url){   /* AJAX submit */  
   var result = document.getElementById("result");
   var formData = $("#ajaxSubmitForm").serialize();
   $.ajax({
               type : "POST",
               url : url,
               cache : false,
               data : formData,
               success :  function(msg) {
                  $('#result').html(msg);
               }, 
               error : onError
   });
   function onError(data, status){alert("error");}
}
 
/*동적 리스트  */	///////////////////////////////수정요망***************************************
function select_sDev(){
	/*중분류 = 소분류 배열  */
	//공연 소분류
	var musical=new Array("라이선스","오리지널","창작","넌버벌 퍼포먼스")
	var concert = new Array("국내뮤지션","해외뮤지션","페스티벌");
	var drama=new Array("대학로","기타");
	var classic = new Array("클래식","무용","국악");
	//스토어 소분류
	var	music = new Array("뮤지컬OST","콘서트LIVE","클래식LIVE");
	var collection =new Array("전시컬렉션");
	//#sDev: 소분류 셀렉트 id
	//#mDev: 중분류 셀렉트 id, onchange="select_sDev()" 추가
	//기존의 구의 값을 초기화 한다.
	$('#sDev option').remove();	//목록제거
	$('#sDev').append("<option value=''>전체보기</option>");//전체보기
	/*뮤지컬  */
	if($('#mDev option:selected').text()=="뮤지컬"){
		for(var i=0;i<musical.length;i++){
			$('#sDev').append(	"<option value='"+musical[i]+"'>"+musical[i]+"</option>");
		}
	}
	//콘서트
	else if($('#mDev option:selected').text()=="콘서트"){
		for(var i=0;i<concert.length;i++){
			$('#sDev').append("<option value='"+concert[i]+"'>"+concert[i]+"</option>");
		}
	} 
	//연극
	else if($('#mDev option:selected').text()=="연극"){
		for(var i=0;i<drama.length;i++){
			$('#sDev').append("<option value='"+drama[i]+"'>"+drama[i]+"</option>");
		}
	} 
	//클래식
	else if($('#mDev option:selected').text()=="클래식"){
		for(var i=0;i<classic.length;i++){
			$('#sDev').append("<option value='"+classic[i]+"'>"+classic[i]+"</option>");
		}
	} 
	//스토어
	//음반
	else if($('#mDev option:selected').text()=="음반"){
		for(var i=0;i<music.length;i++){
			$('#sDev').append("<option value='"+music[i]+"'>"+music[i]+"</option>");
		}
	} 
	//컬렉션
	else if($('#mDev option:selected').text()=="컬렉션"){
		for(var i=0;i<collection.length;i++){
			$('#sDev').append("<option value='"+collection[i]+"'>"+collection[i]+"</option>");
		}
	} 
	//중분류
	else{
		$('#sDev option').remove();	
		$('#sDev').append("<option value=''>소분류</option>");
	}
 }
 //상세페이지 오픈
function detailOpen(category,id){
	if(category == 'performance'){//공연
		window.open('productDetail_perf?per_id='+id,'상세페이지','menubar=no,width=600px,height=600px');
	}
	if(category == 'store'){		//스토어
		window.open('productDetail_store?disc_code='+id,'상세페이지','menubar=no,width=600px,height=600px');
	}
}
/////////////////////////////////180115 장명훈 끝 ///////////////////////////////////////////

 //모든 결과를 콜백되는 load쪽으로 뿌려준다.
 //첫 페이지 hostMain [그후부터 들어오는 url에따라 result와 side_result를 바꿔준다.]
 
 function load(url){
	 
	 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );	//hostPage의 오른쪽 result에 결과를 뿌려준다.
	 
	 if(url=="hostMain" || url=="join_retireMember" || url=="hotMusical" || url=="sleepMember" || url=="stockDelete_musical" || url=="stockOutOf_musical"
		 || url=="productList" || url=="orderList" || url == "productRank" || url=="categoryList" || url=="stockManagement" || url=="googleMap" || url=="registItem" || url=="memberModified"){
	 $( "#side_result" ).load( "${pageContext.request.contextPath}/"+url+"_side" );	//들어오는 url이 if조건에 만족할때 그에맞는 사이드페이지를 hostPage의 왼쪽 side_result쪽에 뿌려준다.
	 }
 }
 
/* 동금이 제작 */
 //공연상품삭제alert
 function stock_Delete(per_id, url){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		load("stockDelete_Pro?per_id="+per_id+"&url="+url);
	}else{   //취소
	    return;
	}		
 }
 //스토어상품삭제alert
 function store_Delete(disc_code, url){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		load("storeDelete_Pro?disc_code="+disc_code+"&url="+url);
	}else{   //취소
	    return;
	}		
 }
 //판매중단
 function sale_stop(disc_code, url){
	 if(confirm("판매중단을 하시겠습니까?")==true){
		 load("storeSale_stop?disc_code="+disc_code+"&url="+url);
	 }else{
		 return;
	 }
 }
 //판매중단해제
 function sale_stopRelease(disc_code, url){
	 if(confirm("중단을 해제겠습니까?")==true){
		 load("storeSale_Release?disc_code="+disc_code+"&url="+url);
	 }else{
		 return;
	 }
 }
 /* 동금이 제작 */
 
 
 /* 영민이 제작 */
	//핫리스트 조건
	 function hotDelete(hotListSize, per_id,url){
		 alert(url);
		 if(hotListSize>1){
			 load('hotMenuDelete?Hcnt='+per_id+'&url='+url);
		 }else{
			 alert("핫리스트가 1건 입니다.");
			 alert("삭제할 수 없습니다.");
			 return false;
		 } 
	 }
	
	 function hotUpdate(hotListSize, per_id,url){
		 alert(url);
		 if(hotListSize<4){
			 load('hotMenuUpdate?Hcnt='+per_id+'&url='+url);
		 }else{
			 alert("핫리스트가 꽉 찾습니다.");
			 alert("추가할 수 없습니다.");
			 return false;
		 } 
	 }
	 /* 영민이 제작 */
	 /* 태성이 제작 */
	 function Cfirst_grade(url,category,id,first_grade){
	var params="id="+id+"&category="+category+"&first_grade="+first_grade;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
 }
function Sfirst_grade(url,category,disc_code,first_grade){
	var params="disc_code="+disc_code+"&category="+category+"&first_grade="+first_grade;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
}
function Cstep(url,category,id,per_step){
	var params="id="+id+"&category="+category+"&per_step="+per_step;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
 }
function Sstep(url,category,disc_code,disc_step){
	var params="disc_code="+disc_code+"&category="+category+"&disc_step="+disc_step;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
}
 
	 
</script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" onclick="load('hostMain');"><b>TCAT 관리자센터</b></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a onclick="load('productList')">상품목록</a></li>
            <li class="divider"></li>
           <li><a onclick="load('categoryList');">카테고리별 상품진열관리</a></li>
            <li><a onclick="load('hotMusical');">핫카테고리 상품진열관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('registItem');">상품등록</a></li>
            <li><a href="#">상품등록수정</a></li>
            <li><a onclick="load('stockDelete_musical');">상품삭제</a></li>
            <li class="divider"></li>
            <li><a onclick="load('stockManagement');">상품재고관리</a></li>
             <li><a onclick="load('stockOutOf_musical');">품절상품관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">주문관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
           <li><a onclick="load('orderList')">전체 주문 목록조회</a></li>
            <li><a href="#">주문승인관리</a></li>
            <li><a href="#">배송관리</a></li>
            <li class="divider"></li>
            <li><a href="#">취소/교환/반품/환불관리</a></li>
            <li class="divider"></li>
            <li><a href="#">자동입금확인 관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a onclick="load('memberModified');">회원정보조회/수정</a></li>
            <li class="divider"></li>
            <li><a href="#">회원등급관리</a></li>
            <li><a href="#">회원혜택관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('join_retireMember');">회원가입/탈퇴관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('sleepMember');">휴면회원관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">공연/지역 관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">공연장 관리</a></li>
            <li><a href="#">지역 관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">공지사항 게시판관리</a></li>
            <li><a href="#">SNS후기 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">QnA 게시판관리</a></li>
            <li><a href="#">1 : 1 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">관람/상품후기 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">영상 게시판관리</a></li>
            <li><a href="#">사진 게시판관리</a></li>
          </ul>
        </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매출분석 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">일별매출</a></li>
            <li><a href="#">주별매출</a></li>
            <li><a href="#">월별매출</a></li>
            <li class="divider"></li>
            <li><a href="#">매출집계</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a onclick="load('productRank')" class="" role="button" aria-expanded="false">상품분석 </span></a>
         
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객분석 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">요일별분석</a></li>
            <li><a href="#">시간별분석</a></li>
            <li class="divider"></li>
            <li><a href="#">등급별분석</a></li>
            <li class="divider"></li>
            <li><a href="#">지역별분석</a></li>
            <li><a href="#">성별분석</a></li>
            <li><a href="#">연령분석</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="w100p h50"></div>

</body>
</html>