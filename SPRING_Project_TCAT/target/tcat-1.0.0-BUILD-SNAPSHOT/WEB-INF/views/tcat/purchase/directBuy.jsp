<%@page import="spring.project.tcat.VO.MemberVO"%>
<%@page import="spring.project.tcat.VO.TcatPerDiscVO"%>
<%@page import="spring.project.tcat.VO.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$( function() {
		var addrInfo = document.getElementById("addrInfo");
		var msg = "";
		msg += "<table class='table table-striped' style='border-top:3px solid #bbbbbb;'>"+
						"<tr>"+
						"<th>배송지 </th>"+
						"<td>${memVO.getMember_addr()}&nbsp<input type='button' onclick='addrChange();' value='배송지변경'></td>"+
					"</tr>"+
					"<tr>"+
						"<th>이름</th>"+
						"<td>${memVO.getMember_name()}</td>"+
					"</tr>"+
					"<tr>"+
						"<th>연락처</th>"+
						"<td>${memVO.getMember_hp()}</td>"+
					"</tr>"+
				"</table>";
		addrInfo.innerHTML = msg;
	});
	function addrChange() {
		var addrInfo = document.getElementById("addrInfo");
		var msg = "";
		msg += "<table class='table table-striped' style='border-top:3px solid #bbbbbb;'>"+
						"<tr>"+
						"<th>배송지 </th>"+
						"<td><input type='text' name='postNum' id='sample6_postcode' placeholder='우편번호'>"+
						"<input type='button' onclick='sample6_execDaumPostcode()' value='우편번호 찾기'>&nbsp<input type='button' onclick='addr();' value='기본배송지 이용'><br>"+
						"<input type='text' name='addr1' id='sample6_address' placeholder='주소'>"+
						"<input type='text' name='addr2' id='sample6_address2' placeholder='상세주소'></td>"+
					"</tr>"+
					"<tr>"+
						"<th>이름</th>"+
						"<td><input type='text' name='member_name'>"+
						"<input type='hidden' name='addrChange' value='1'></td>"+
					"</tr>"+
					"<tr>"+
						"<th>연락처</th>"+
						"<td><input type='text' name='member_hp'></td>"+
					"</tr>"+
				"</table>";
				$("input[name=addrD]").val("1");
		addrInfo.innerHTML = msg;
	}
	function addr() {
		var addrInfo = document.getElementById("addrInfo");
		var msg = "";
		msg += "<table class='table table-striped' style='border-top:3px solid #bbbbbb;' >"+
						"<tr>"+
						"<th>배송지 </th>"+
						"<td>${memVO.getMember_addr()}&nbsp<input type='button' onclick='addrChange();' value='배송지변경'></td>"+
					"</tr>"+
					"<tr>"+
						"<th>이름</th>"+
						"<td>${memVO.getMember_name()}</td>"+
					"</tr>"+
					"<tr>"+
						"<th>연락처</th>"+
						"<td>${memVO.getMember_hp()}</td>"+
					"</tr>"+
				"</table>";
				$("input[name=addrD]").val("0");
		addrInfo.innerHTML = msg;
	}
	function pSubmit() { /*AJAX submit  */
		var formData = new FormData();
		formData.append("count", $("input[name=count]").val());
		alert($("input[name=count]").val());
		formData.append("disc_code",$("input[name=disc_code]").val());
		var addrD=$("input[name=addrD]").val();
		if(addrD==1){
			formData.append("addrChange","1");
			formData.append("postNum",$("input[name=postNum]").val());
			formData.append("addr1",$("input[name=addr1]").val());
			formData.append("addr2",$("input[name=addr2]").val());	
		}else if(addrD==0){
			formData.append("addrChange","0");
		}
		$.ajax({
			url : 'directPay',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
				alert("구매되었습니다.");
			}, 
			error : onError
	   });
	   function onError(data, status){alert("error");}
		
	}
	// 모두체크하기

	 

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="" name="delevaryForm" style="border-top:3px solid #bbbbbb">
				<input type="hidden" name="count" value="${count}">
				<input type="hidden" name="disc_code" value="${perVO.disc_code}">
				<input type="hidden" name="addrD" value="0">
				<h2>주문/결제</h2>
				<hr>
				<h4>주문상품 정보</h4>
				<table class='table table-striped' style="border-top:3px solid #bbbbbb" align="center">
				<tr>
					<th style="width:42%;">상품정보</th>
					<th style="width:12%;">할인금액</th>
					<th style="width:12%;">배송비</th>
					<th style="width:12%;">총 주문금액</th>
				</tr>
					<tr>
						<td>
							<table class="table table-striped">
							
								
									<tr>
										<td>
											<img src="${image}/store/${perVO.disc_image}">
										</td>
										<td>
										    ${perVO.disc_title}
										</td>
										<td>
											${count}개
										</td>
										<td>
											${perVO.disc_price*count}원
										</td>
									</tr>	
								
							</table>
						</td>
						
						<td valign=middle>
							<c:if test="${memVO.getRating()=='VIP'}">
								25%[VIP등급]
							</c:if>
							<c:if test="${memVO.getRating()=='S'}">
								20%[S등급]
							</c:if>
							<c:if test="${memVO.getRating()=='A'}">
								15%[A등급]
							</c:if>
							<c:if test="${memVO.getRating()=='B'}">
								10%[B등급]
							</c:if>
							<c:if test="${memVO.getRating()=='C'}">
								5%[C등급]
							</c:if>
							<c:if test="${memVO.getRating()=='D'}">
								없음
							</c:if>
						</td>
						<td valign=middle>
							<c:if test="${perVO.getDisc_price()*count<15000}">
								3000원
							</c:if>
							<c:if test="${perVO.getDisc_price()*count>=15000}">
								무료
							</c:if>
						</td>
						<%
						TcatPerDiscVO perVO=(TcatPerDiscVO)request.getAttribute("perVO");
						MemberVO memVO=(MemberVO)request.getAttribute("memVO");
						int count=(Integer)request.getAttribute("count");
						%>
						<td valign=middle>
							<%if(memVO.getRating().equals("VIP")){
							%>
								<%=Math.round(perVO.getDisc_price()*count*0.85)%>원
							<%
							}else if(memVO.getRating().equals("S")){
							%>
								<%=Math.round(perVO.getDisc_price()*count*0.80)%>원
							<%	
							}else if(memVO.getRating().equals("A")){
							%>
								<%=Math.round(perVO.getDisc_price()*count*0.85)%>원
							<%	
							}else if(memVO.getRating().equals("B")){
							%>
								<%=Math.round(perVO.getDisc_price()*count*0.90)%>원
							<%
							}else if(memVO.getRating().equals("C")){
							%>
								<%=Math.round(perVO.getDisc_price()*count*0.95)%>원
							<%
							}else if(memVO.getRating().equals("D")){
							%>
								<%=perVO.getDisc_price()*count%>원
							<%
							}
							%>
						</td>
						<tr>
				</table>
				<br>
			
				<h4>배송지 정보</h4>
				<div id="addrInfo">
				
				</div>
				<br><br>
				
				<h4>결제수단</h4>
				<table class="table table-striped">
					<tr>
						<th>결제방법</th>
						<td>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="1" onclick="nonchange();" checked>
									계좌이체
								</label>
							</div>
						</td>
						<td>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="1" onclick="nonchange();" checked>
									핸드폰
								</label>
							</div>
						</td>
						<td>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="1" onclick="nonchange();" checked>
									무통장입금
								</label>
							</div>
						</td>
						<td>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="1" onclick="nonchange();" checked>
									신용카드
								</label>
							</div>
						</td>
						<td rowspan="3">
							<b>포인트 사용</b>
							<input type="text" value="0"><input type="button" value="전액사용">
							<ul>
								<li>현재 사용가능 포인트 : ${memVO.getPoint()}</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>카드 종류</th>
						<td>
						<select>
							<option>카드선택</option>
							<option>1</option>
						</select>
						</td>
						<td><input type="button" value="카드 이벤트 안내"> 
					</tr>
					<tr>
						<th>할부 기간</th>
						<td>
							<select>
								<option>일시불</option>
								<option>1개월</option>
								<option>2개월</option>
								<option>3개월</option>
							</select>
						</td>
						<td><input type="button" value="무이자 할부 안내">
					</tr>
				
				</table>
				<h4>약관동의</h4>
				<table class="table table-striped">
					<tr>
						<th>
							<input type="checkbox" name="confirm"> 개인정보 제 3자 제공에 동의합니다.<br>
							<input type="checkbox" name="confirm"> 결제대행 서비스 이용약관에 동의합니다.<br>
							<input type="checkbox" name="confirm"> 주문할 상품설명에 명시된 내용과 사용조건을 확인하였으며 취소,환불규정에 동의합니다.
						</th>
						<th>
						<table style="font-size:20px;">
								<tr>
									<th style="color:orange">총 상품금액</th>
									<th style="color:orange"><%if(memVO.getRating().equals("VIP")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.85)%>원
										<%
										}else if(memVO.getRating().equals("S")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.80)%>원
										<%	
										}else if(memVO.getRating().equals("A")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.85)%>원
										<%	
										}else if(memVO.getRating().equals("B")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.90)%>원
										<%
										}else if(memVO.getRating().equals("C")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.95)%>원
										<%
										}else if(memVO.getRating().equals("D")){
										%>
											<%=perVO.getDisc_price()*count%>원
										<%
										}
										%></th>
									</tr>
									<tr>
									<th>배송비</th>
									<th>
										<%if(perVO.getDisc_price()*count<15000){%>
											3000원
										<%} %>
										<%if(perVO.getDisc_price()*count>=15000){%>
											무료
										<%} %>
									</th>
									</tr>
									<tr>
									<th>할인금액</th>
									<th><%if(memVO.getRating().equals("VIP")){
										%>
											<%=Math.round(perVO.getDisc_price()*count-perVO.getDisc_price()*count*0.85)%>원
										<%
										}else if(memVO.getRating().equals("S")){
										%>
											<%=Math.round(perVO.getDisc_price()*count-perVO.getDisc_price()*count*0.80)%>원
										<%
										}else if(memVO.getRating().equals("A")){
										%>
											<%=Math.round(perVO.getDisc_price()*count-perVO.getDisc_price()*count*0.85)%>원
										<%	
										}else if(memVO.getRating().equals("B")){
										%>
											<%=Math.round(perVO.getDisc_price()*count-perVO.getDisc_price()*count*0.90)%>원
										<%
										}else if(memVO.getRating().equals("C")){
										%>
											<%=Math.round(perVO.getDisc_price()*count-perVO.getDisc_price()*count*0.95)%>원
										<%
										}else if(memVO.getRating().equals("D")){
										%>
											<%=Math.round(perVO.getDisc_price()*count)%>원
										<%
										}
										%></th>
										</tr>
										<tr>
									<th>올라가는 포인트(0.5%)</th>
									<th><%if(memVO.getRating().equals("VIP")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.85*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.85*0.05)%>" name="point">
										<%
										}else if(memVO.getRating().equals("S")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.80*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.80*0.05)%>" name="point">
										<%	
										}else if(memVO.getRating().equals("A")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.85*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.85*0.05)%>" name="point">
										<%	
										}else if(memVO.getRating().equals("B")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.90*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.90*0.05)%>" name="point">
										<%
										}else if(memVO.getRating().equals("C")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.95*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.95*0.05)%>" name="point">
										<%
										}else if(memVO.getRating().equals("D")){
										%>
											<%=Math.round(perVO.getDisc_price()*count*0.05)%>원
											<input type="hidden" value="<%=Math.round(perVO.getDisc_price()*0.05)%>" name="point">
										<%
										}
										%>
										
										</th>
								</tr>
							</table>
						</th>
					</tr>
				</table>

		<div id="result2"></div>
		<button onclick="pSubmit();">구입하기</button>
		</form>
		<div class="col-md-2"></div>
		</div>
	</div>


	

</body>
</html>