<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/script.jsp"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Myorder 결제내역 보기</title>
<!--font awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap 적용 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style>
.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}
</style>    
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<form>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>결제상세내역</h2>
    			<h3 class="pull-right">Order #${orderinfo.order_id}</h3>
    		</div> 
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>프로젝트 정보:</strong><br>
    					${proinfo.pro_name}<br>
    				<strong>프로젝트 종료일:</strong><br>	
    					${proinfo.pro_end}<br>
    				<strong>메이커:</strong>
    					${meminfo.mem_name}<br>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>배송지 To:</strong><br>
    					${shipinfo.order_name}<br>
    					${shipinfo.order_address1}<br>
    					${shipinfo.order_address3}<br>
    					${shipinfo.order_address4}
    				</address>
    			</div>
    		</div>
    		<!-- row -->
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					${orderinfo.order_date}<br><br>
    				</address>
    			</div>
    		</div>
    		<!-- row -->
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>주문 정보</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Reward</strong></td>
        							<td class="text-center"><strong>가격</strong></td>
        							<td class="text-center"><strong>수량</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<c:set var="total" value="0" />
    							<c:forEach items="${rewardinfo}" var="rewards">
    							<tr>
    								<td>
    								<input type="hidden" class="reward_option" value="${rewards.reward_id}">
    								<input type="hidden" id="qty${rewards.reward_id}" value="${rewards.order_qty}">
    								<input type="hidden" id ="delMoney${rewards.reward_id}" value="${rewards.delivery_fee}">
    								${rewards.reward_title}<br>
    								<small class="text-muted">${rewards.reward_description}</small>
    								<c:set var="opCount" value= "0" />	
    								<c:set var="opMoney" value= "0" />
    								<c:forEach items="${optioninfo}" var="options">
	    								<c:if test="${options.reward_id eq rewards.reward_id}">
	    									옵션명: ${options.op_name}
	    									${options.op_count}개
	    								<c:set var="total" value="${total + (rewards.reward_price * options.op_count)}" />	
	    								<c:set var="opCount" value="${opCount + options.op_count}" />	
	    								<c:set var="opMoney" value="${rewards.reward_price}" />
	    								</c:if>
    								</c:forEach>
    								
    								<input type="hidden" id="op_qty${rewards.reward_id}" value="${opCount}">
 									<input type="hidden" id="op_money${rewards.reward_id}" value="${opMoney}">
    								</td>
    								<td class="text-center"><span id="re_money${rewards.reward_id}"><fmt:formatNumber pattern="###,###,###" value= "${rewards.reward_price}"/>원 </span></td>
    								<td class="text-center"><span id="re_qty${rewards.reward_id}">${rewards.order_qty} </span></td> 
    								<td class="text-right"><span id="re_total${rewards.reward_id}"><fmt:formatNumber pattern="###,###,###" value= "${rewards.reward_price * rewards.order_qty}"/>원</span></td>
    							</tr>
    							<c:set var="total" value="${total + (rewards.reward_price * rewards.order_qty)}" />
    							<c:set var="shipMoney" value="${rewards.delivery_fee}"/>
    							</c:forEach>
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal </strong></td>
    								<td class="thick-line text-right"><fmt:formatNumber pattern="###,###,###" value= "${total}"/>원</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right delMoneyInput"></td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right totalMoney"></td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    			<!-- panel body -->
    		</div>
    		<!-- panel panel-default -->
    	</div>
    	<!-- col-md-12 -->
    	<div class="btn-backlist">	
			<a class="btn btn-primary stretched-link" href="${path}/mypage/myorder/orderlist">목록으로 이동하기</a>
		</div>
    </div>
    <!-- row -->   
</div>
</form>
</body>
<script>
$(document).ready(function() {
optionSet();
delMoney();
//옵션이 있을경우, 리워드별 금액, 갯수 설정,
function optionSet() {
	$('.reward_option').each(function(idx) {
		var rewardId = $(this).val();
		var rewardQty = $("#qty"+rewardId).val();
		var opQty =  $("#op_qty"+rewardId).val();
		var opMoney = $("#op_money"+rewardId).val();
		var opTotal = opQty * opMoney;	
		console.log(opTotal);
		
		if (rewardQty == 0) {
			$("#re_qty"+rewardId).text(opQty);
			$("#re_money"+rewardId).text(makeComma(opMoney)+"원");
			$("#re_total"+rewardId).text(makeComma(opTotal)+"원");
		}
	});
}

//금액 정규식 
function makeComma(str) {
	 str = String(str);
	 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
});

//배송금액 설정 
function delMoney() {
	var delMoneyArr = new Array();
	var delivery_fee;
	$('.reward_option').each(function(idx) {
		var rewardId = $(this).val();
		var delMoney = $('#delMoney' + rewardId).val();
		delMoneyArr.push(delMoney);
	});
	
	var max = Math.max.apply(null, delMoneyArr);
	if (delMoneyArr.includes('0')) {
		delivery_fee = 0;
	} else {
		delivery_fee = max;
	} 
	$(".delMoneyInput").text(makeComma(delivery_fee)+"원");
	$(".totalMoney").text(makeComma(delivery_fee + ${total})+"원");
}
//금액 정규식 
function makeComma(str) {
	 str = String(str);
	 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
</script>
</html>