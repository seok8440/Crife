<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<!--jquery3.3.1 script 추가  -->
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--체크 박스 클릭 시 적용 css -->
<link rel="stylesheet" href="${path}/resources/reward/firstReward.css">

<!--font awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap 적용 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<style>
	.bd-placeholder-img {
	    font-size: 1.125rem;
	    text-anchor: middle;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	}
	
	@media (min-width: 768px) {
	    .bd-placeholder-img-lg {
	        font-size: 3.5rem;
	    }
	}

</style>

<title>리워드 step10 화면입니다.</title>

</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="container">
	<div class="py-5 text-center">
	    <h2>주문페이지 입니다.</h2>
	    <p class="lead">자바스크립트를 통해 체크 박스를 통해 선택한 리워드의 수량 입력창을 추가하고 남은 갯수을 넘기거나, 500개 이상, 1개미만 유효성 처리를 하였습니다. 
	    다음 페이지를 클릭 했을 시 선택한 리워드들을 합산한 금액, 수량, 상품번호를 값을 전달하기위해 자바스크립트를 사용하여 form태그에 추가하였습니다.</p>
    </div>
	
	<form role="form" id="send_to_reward20" method="post"
		action="${path}/reward/step20/${pro_id}">
		<div class="row">	
			<div class="col-sm-10 order-md-1 mb-3" style="margin: 0 auto;">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">리워드 선택</span>
				</h4>
		
				<ul class="list-group mb-3 reward_list " id="reward_list">
					<c:forEach items="${rewards}" var="reward" varStatus="status">
						<!-- 값은 안넘기지만 유효성 검사나 현재페이지에 보여지기 위해 생성한 input type들 입니다.  -->			
						<input type="hidden" id="reward_sell_count${reward.reward_id}" value="${reward.reward_sell_count}">
						<input type="hidden" id="reward_price${reward.reward_id}" value="${reward.reward_price}">
						<input type="hidden" id="deliveryMoeny${reward.reward_id}" value="${reward.delivery_fee}">							
						<input type="hidden" id="reward_remain_count${reward.reward_id}" value="${reward.reward_sell_count - reward.order_qty}">							
						<input type="hidden" name="list[${status.index}].reward_title" value="${reward.reward_title}">
						<li class="list-group-item d-flex justify-content-between lh-condensed">
	                        <div class= "col-lg-12">
	                            <h6 class="my-0">${reward.reward_title}</h6>
	                            <small class="text-muted">${reward.reward_description}</small>
	                            <c:if test="${reward.op_val eq 0}">
	                            	<p class="text-muted">남은 수량: ${reward.reward_sell_count - reward.order_qty} </p>
	                            </c:if>
	                            <c:if test="${reward.op_val eq 1}">
	                            	<p class="text-muted" id="remainOpText${reward.reward_id}"></p>
	                            </c:if>
		                       	<div class="list_wrap row">
		                       		<div class="col-lg-5 mb-3">
			                        <span class="text-muted"><fmt:formatNumber pattern="###,###,###" value="${reward.reward_price}" />원</span>
				                    <span><input type="checkbox" name="check_box" id="check_box${reward.reward_id}"
											value="${reward.reward_id}" class="check_box_js"
											data-toggle="checkbox" >
									</span>
									</div>  
									<div class="col-lg-7 mb-3">
										<div class="number" id="number${reward.reward_id}" data-check="${reward.op_val}">
											<c:set var="optionRemainCount" value="0" />
											<c:if test="${reward.op_val eq 1}">
												<select class="form-control op_category">
												<option value='' selected>옵션을 선택해주세요</option>
													<c:forEach items="${options}" var="option">
														<div>
														<c:if test="${reward.reward_id eq option.reward_id}">
																<option value="${option.op_name}" id="${option.op_id}" data-remain="${option.op_limit_qty - option.op_count}">
																${option.op_name}
																(${option.op_limit_qty - option.op_count}개 남음)
																</option>
																<c:set var="optionRemainCount" value="${optionRemainCount + (option.op_limit_qty - option.op_count)}" />
														</c:if>
														</div>	
													</c:forEach>
												</select>	
												<input type="hidden" id="remainOption${reward.reward_id}" value="${optionRemainCount}"/>
												<table class="table table-condensed table-hover table-sel${reward.reward_id}">
									    			<thead>
									    				<tr>
									    					<th>옵션명</th>
									    					<th>수량</th>
									    					<th></th>
									    				</tr>
									    			</thead>
									    			<tbody>
									    			</tbody>
									    			<template>
									    				<tr>
									    					<td></td>
									    					<td>
									    						
													        </td>
													        <td>x</td>
									    				</tr>
									    			</template>
								    			</table>
											</c:if>	
											<c:if test="${reward.op_val eq 0}">
												<i class="fa fa-minus-square decreaseQuantity"  aria-hidden="true"></i>
												<input type="text" name="before_qty" id="qty${reward.reward_id}" class="before_qty text-center" value="0">
												<i class="fa fa-plus-square increaseQuantity" aria-hidden="true"></i>	
											</c:if>
										</div>
									</div>
								</div>
							</div>
	                   	</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--row-->	
		<div class="row ">
			<div class="col-sm-10 order-md-1 mb-3" style="margin: 0 auto;">
				<hr class="mb-4">
	               <h4 class="mb-3">Payment</h4>
	               <div class="mb-3">
	                <!-- <span class="text-muted">후원금 </span>
	                <input type="text" class="form-control col-md-5" id="addDonationTmp" value=0  name="sub_money" maxlength="8"> -->
	               </div>
	               <input type="hidden" id="addDonation" name="addDonation" value="0">				
				<hr class="mb-4">
	               <!-- <div class="custom-control custom-checkbox">
	                   <input type="checkbox" class="custom-control-input" id="dontShowNameYn" name="dontShowNameYn" value="N">
	                   <label class="custom-control-label" for="dontShowNameYn">이름비공개</label>
	               </div>
	               <div class="custom-control custom-checkbox">
	                   <input type="checkbox" class="custom-control-input" id="dontShowAmountYn" name="dontShowAmountYn" value="N">
	                   <label class="custom-control-label" for="dontShowAmountYn">펀딩금액 비공개</label>
	               </div> -->
	               <hr class="mb-4">
				<div>
	                <span>Total</span>
	                <strong id="sumTotalNum"> 0</strong>
	               </div>
				<button type="button" id="nextButton" class="btn btn-primary btn-lg btn-block">다음단계로</button>
			</div>
		</div>
		<!-- row  -->
	</form>		
</div>
<!--container  -->
<script>
$(function() {
    const SHOWING_ON = "showing";
    var firstform = $("form[role='form']");
    //옵션 남은 수량
    opLimitText();
    
    $(document).on("click", "#nextButton", function(e) {
    	if(vaildCheck()) {
    		rewardNextStep();
    		optionMake();
            firstform.submit();
    	}
    	else {
    		return;
    	}
    });
 
   	// 페이지 로딩 시 남은 수량에 따라 체크 버튼 비활성화 = 마감표시
    $('.check_box_js').each(function(idx) {
    	var rewardId = $(this).val();
    	var limitCnt = $("#reward_sell_count" + rewardId).val() * 1;
        var remainCnt = $("#reward_remain_count" + rewardId).val() * 1;
		var opCheck = $("#number" + rewardId).data('check');
		var opRemain = $("#remainOption" + rewardId).val() * 1;
		if (opCheck == 0) {
	        if(remainCnt != 0) { 
	        	$(this).attr("disabled", false);  
	    	} else {
	    	    $(this).attr("disabled", true); 
	    	    $(this).parent().append('<span>마감되었습니다.</span>');
	    	}
		}
		if (opCheck == 1) {
			if(opRemain != 0) { 
	        	$(this).attr("disabled", false);  
	    	} else {
	    	    $(this).attr("disabled", true); 
	    	    $(this).parent().append('<span>마감되었습니다.</span>');
	    	}
		}
    }); 

    // 뒤로가기 시 체크버튼, 수량 값, 금액 초기화
    $(window).on("pageshow", function(event) {
    	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    		//뒤로가기시 페이지 새로고침인데 너무 느리다.
    		//document.location.reload();	
            // 체크박스 해제, 각 리워드별 수량 초기화
            $('.check_box_js').each(function(idx) { 
            	var rewardId = $(this).val();
            	$(this).attr("checked", false);
            	$("#qty" + rewardId).val(0);
            });
            // 후원금 0원으로 초기화
            $('#addDonation').val(0);
            // 총 금액 계산 0으로 초기화
            calculateTotal();
        }
    });

    // 체크박스 유무 확인 후 클래스 추가, 제거	      
    function qtyShow(chose) {
        chose.addClass(SHOWING_ON);
    }

    function qtyHidden(chose) {
        chose.removeClass(SHOWING_ON);
    }

    // 총 금액 계산 함수
    function calculateTotal() {
        selectSumTotal = 0;
        fundingPrice = 0;
        $('.check_box_js').each(function(i) {
            var rewardId = $(this).val();
            // rewardId 값 모두 출력
            // console.log(rewardId);
			var op_check = $('#number'+rewardId).data('check');
            var amount = calculateReward(rewardId, op_check);
            fundingPrice = fundingPrice + amount;
            //console.log(fundingPrice); 각 현재 리워드별 금액
        });
        var addDonation = $('#addDonation').val();
        if (addDonation == '') {
            addDonation = 0 * 1;
        }
        selectSumTotal = fundingPrice + addDonation * 1;
        $('#sumTotalNum').html(selectSumTotal.format() + '원');
    }

    function calculateReward(rewardId, op_check) {
    	if (op_check === 0) {
	        var calQty = $('#qty' + rewardId).val();
	        if (addDonation == '') {
	        	calQty = 0 * 1;
	        }
	        var calPrice = $('#reward_price' + rewardId).val();
	        return calQty * calPrice;
    	}
    	if (op_check === 1) { 
    		var sum = 0;
    		var number = $('#number'+rewardId);
        	number.find('.op_count').each(function(idx) {
    			var opId = $(this).attr('id').replace('op_qty','');
	    		var calQty = $('#op_qty' + opId).val();
		        if (addDonation == '') {
		        	calQty = 0 * 1;
		        }
		        var calPrice = $('#reward_price' + rewardId).val();
		        sum = sum + (calQty * calPrice);
    		});
	        return sum;
    	}
    }

    // check 박스 체크 이벤트 처리
    $(document).on("change", ".check_box_js", function(e) {
        e.preventDefault();
        $('.check_box_js').each(function(idx) { 
        	var rewardId = $(this).val();
        	var qty = $('#number'+rewardId);
        	var template = $(this).closest('.list_wrap').find('.table-sel'+rewardId);
        	if ($(this).is(":checked")) {
                qtyShow(qty);
                qty.children(".before_qty").val(1);
            } else {
                qty.children(".before_qty").val(0);
                qtyHidden(qty);
                if(template) {
                	template.find('tbody tr').remove();
                }
            }
        	
        });    
        calculateTotal();
    });
	
    // 옵션 셀렉트 이벤트처리
    $(document).on("change", '.op_category', function(e) {
    	let template = document.querySelector("template");
    	let cloneNode = document.importNode(template.content, true);
    	//var tbody = document.querySelector(".table-condensed tbody");
    	var op_id = $(this).find('option:selected').attr('id');
    	var op_name = $(this).find('option:selected').val();
    	var op_remain = $(this).find('option:selected').data('remain');
    	if(op_id) {
	    	var tbody = $(this).parent().find(".table-condensed tbody");
	        let tds = cloneNode.querySelectorAll("td");
	        var opArray = new Array();
	        tbody.find('input[type="text"]').each(function(idx) {
	        	opArray.push($(this).attr('id'));
	        });
	        if(!opArray.includes("op_qty"+op_id)) {
		        tds[0].textContent = $(this).val();
		        tds[1].innerHTML = '<i class="fa fa-minus-square decreaseQuantity"  aria-hidden="true"></i>' +
		        					'<input type="text" name="op_qty" id="op_qty'+op_id+'" class="before_qty op_count text-center" value="1">' +
		        					'<i class="fa fa-plus-square increaseQuantity" aria-hidden="true"></i>' +
		        					'<input type="hidden" id="op_remain_qty'+op_id+'" value="'+op_remain+'">' +
		        					'<input type="hidden" id="op_name'+op_id+'" value="'+op_name+'">';
		    	tbody.append(cloneNode);
		    	calculateTotal();
	        }
	        else 
	        	alert('이미 선택된 옵션 입니다.');
    	}
    });
 	// 수량 감소 증가 
    // 수량 감소 이벤트
    $(document).on("click", ".decreaseQuantity", function(e) {
        e.preventDefault();
        var op_check = $(this).closest(".number").data('check');
        
        if (op_check === 0) {
	        var parent = $(e.target.parentNode); // 바로 위 부모 객체를 찾아감 (number)
	        var rewardId = $(e.target.parentNode).children('.before_qty').prop("id").replace("qty", ""); // rewardId 찾음
	        var stat = parent.children('.before_qty').val();
	        var num = parseInt(stat, 10);
	        num--;
	        if (num <= 0) {
	            alert('더이상 수량을 줄일수 없습니다.');
	            num = 1;
	        }
	        parent.children('.before_qty').val(num);
	        countValidation(rewardId, num, op_check);
	        calculateTotal();
        }
        
        if (op_check === 1) {
        	var parent = $(e.target.parentNode);
        	var rewardId = $(this).closest(".number").attr('id').replace('number','');
        	var stat = parent.children('.before_qty').val();
        	var num = parseInt(stat, 10);
	        num--;
	        if (num <= 0) {
	            alert('더이상 수량을 줄일수 없습니다.');
	            num = 1;
	        }
	        var op_id = $(this).parent().find('.op_count').attr('id').replace('op_qty','');
	        parent.children('#op_qty'+op_id).val(num);
	        countValidation(op_id, num, op_check);
	        calculateTotal();
        }
        
    });

    // 수량 증가 이벤트
    $(document).on("click", ".increaseQuantity", function(e) {
        e.preventDefault();
        var op_check = $(this).closest(".number").data('check');
        if (op_check === 0) {
	        var parent = $(e.target.parentNode); // 부모 객체인 number을 찾아 감
	        var rewardId = $(e.target.parentNode).children('.before_qty').prop("id").replace("qty", ""); // 체크박스의 id값을 가지고옴.
	        var stat = parent.children('.before_qty').val(); //input 태그의 값을 가져옴
	        var num = parseInt(stat, 10); // 10진수로 가져온 값을 int형으로 변환함
	        num++;
	
	        if (num > 500) {
	            alert('더이상 수량을 늘릴수 없습니다.');
	            num = 500;
	        }
	        parent.children('.before_qty').val(num);
	        countValidation(rewardId, num, op_check);
	        calculateTotal();
        }
        if (op_check === 1) { 
        	var parent = $(e.target.parentNode); // 부모 객체인 number을 찾아 감
        	var rewardId = $(this).closest(".number").attr('id').replace('number','');
	        var stat = parent.children('.before_qty').val(); //input 태그의 값을 가져옴
	        var num = parseInt(stat, 10); // 10진수로 가져온 값을 int형으로 변환함
	        num++;
	
	        if (num > 500) {
	            alert('더이상 수량을 늘릴수 없습니다.');
	            num = 500;
	        }
	        var op_id = $(this).parent().find('.op_count').attr('id').replace('op_qty','');
	        parent.children('#op_qty'+op_id).val(num);
	        countValidation(op_id, num, op_check);
	        calculateTotal();
        }
    });

    //공개여부 
    //이름
    $('#dontShowNameYn').change(function() {
        if ($(this).is(':checked')) {
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    });
    //펀딩금액
    $('#dontShowAmountYn').change(function() {
        if ($(this).is(':checked')) {
            var a = $(this).val('Y');

        } else {
            var b = $(this).val('N');

        }
    });
    // 수량 유효성 검증
    $(document).on("focusout", ".before_qty", function(e) {
        e.preventDefault();
        var before_qty = $(this).val() * 1;
        var op_check = $(this).closest(".number").data('check');
        if (op_check === 0) {
        	var rewardId = $(this).prop("id").replace("qty", "");
	        countValidation(rewardId, before_qty, op_check);
	        calculateTotal();
	    }
        if (op_check === 1) {
        	var opId = $(this).parent().find('.op_count').attr('id').replace('op_qty','');
        	countValidation(opId, before_qty, op_check);
	        calculateTotal();
        }
    });
    // 후원금 추가 총 금액 계산
    $('#addDonationTmp').focus(function() {
        if ($("#addDonation").val() == 0) {
            $(this).val("");
        } else {
            $(this).val($("#addDonation").val().format());
        }
    });
    $('#addDonationTmp').keyup(function() {
        setAddDonationField($(this));
    });
    $('#addDonationTmp').blur(function() {
        setAddDonationField($(this));
    });

    function setAddDonationField(obj) {
        var addDonationTmp = (obj.val() == '') ? 0 : obj.val().replace(/[^0-9]/g,'') * 1;
        $('#addDonation').val(addDonationTmp);
        $('#addDonationTmp').val(addDonationTmp.format());

        calculateTotal();
    }
	
    // 수량체크시 중복되는 유효성검사
    function countValidation(Id, num, op_check) {
        /* console.log(rewardId) */
        // qty : 리워드별 주문자가 선택한 수량
        // remain_cnt : 서버에서 전달된 리워드 별 남은수량
        if (op_check === 0) {
        	//rewardID
	        var limitCnt = $("#reward_sell_count" + Id).val() * 1;
	        var remainCnt = ($("#reward_remain_count" + Id).val() * 1);
	        var qty = $("#qty" + Id);
    	}
    	if (op_check === 1) {
    		//opId
    		var limitCnt = $("#op_limit_qty" + Id).val() * 1;
	        var remainCnt = ($("#op_remain_qty" + Id).val() * 1);
	        var qty = $("#op_qty" + Id);
    	}
        /* 
        console.log("limitCnt" + limitCnt);
        console.log("remainCnt" + remainCnt); 
        */
        if (num < 1) {
            alert('1개 이하로 수량을 선택할 수 없습니다.');
            qty.val(1);
            return;
        }
        if (limitCnt === 0 && num > 500) {
            alert('500개 이상 수량을 선택 할 수 없습니다.');
            qty.val(500);
            return
        }
        if (remainCnt < num) {
            alert('잔여 수량보다 많을 수 없습니다');
            qty.val(remainCnt);
            return
        }
    }

    /*숫자 타입에서 쓸 수 있도록 format() 함수 추가*/
    Number.prototype.format = function() {
        if (this == 0) return 0;
        var reg = /(^[+-]?\d+)(\d{3})/;
        var n = (this + '');
        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
        return n;
    };

    /* 문자열 타입에서 쓸 수 있도록 format() 함수 추가*/
    String.prototype.format = function() {
        var num = parseFloat(this);
        if (isNaN(num)) return "0";
        return num.format();
    };

    /*다음 단계로 */
    function rewardNextStep() {
    	// if문 때문에 배열이 .append에 들어가는 idx가 0부터 시작하지 않는다.
    	// 0부터 시작하기 위해 count 생성
    	var count = 0;
        $('.check_box_js').each(function(idx) {
            if ($(this).is(":checked")) {
                var rewardId = $(this).val();
                var qty = $('#qty' + rewardId).val();
                var reward_price = $('#reward_price' + rewardId).val();
                var reward_delivery = $('#deliveryMoeny' + rewardId).val();
                //리워드 별 금액
                var sumAmount = parseInt(reward_price) * parseInt(qty);
                //옵션 유무
                var op_check = $('#number'+rewardId).data('check');
		        // qty : 리워드별 주문자가 선택한 수량
	            // remain_cnt : 서버에서 전달된 리워드 별 남은수량
	            // reward_delivery: 리워드별 배송금액
	            $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].reward_id" value="' + rewardId + '" />');
	            $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].delivery_fee" value="' + reward_delivery + '" />');
	            //옵션이 없을경우
	            if(op_check === 0) {
	                $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].qty" value="' + qty + '" />');
	                $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].sumAmount" value="' + sumAmount + '" />');         
                }
	            count++;
        	};
        });
    }
    /* 선택한 옵션, 옵션 별 갯수 전달, 리워드 별 금액의 합   */
    function optionMake() {
    	$('.op_count').each(function(idx) {
    		var rewardId = $(this).closest('.number').attr('id').replace('number','');
           	var optionId = $(this).attr('id').replace('op_qty','');
           	var opName = $(this).parent().find('#op_name'+optionId).val();
           	var opCount = $(this).val() * 1;
           	console.log(opName);
           	var reward_price = $('#reward_price' + rewardId).val() * 1;
            //리워드 별 금액
            var sumAmount = parseInt(reward_price) * parseInt(opCount);
            
           	$('[role="form"]').append('<input type="hidden" name="optionlist[' + idx + '].op_id" value="' + optionId + '" />');
           	$('[role="form"]').append('<input type="hidden" name="optionlist[' + idx + '].op_name" value="' + opName + '" />');
           	$('[role="form"]').append('<input type="hidden" name="optionlist[' + idx + '].op_count" value="' + opCount + '" />');
           	$('[role="form"]').append('<input type="hidden" name="optionlist[' + idx + '].reward_id" value="' + rewardId + '" />');
            $('[role="form"]').append('<input type="hidden" name="optionlist[' + idx + '].sumAmount" value="' + sumAmount + '" />');
        });
    }
    /*버튼 클릭 시 체크 유무 확인 */
    function vaildCheck() {
    	var check_count=0;
    	$('.check_box_js').each(function(idx) {
    		if ($(this).is(":checked")) {
    			check_count++;
    		}
    	});
    	if (check_count<=0) {
    		alert('최소 하나의 리워드를 체크하여야합니다.');
    		return false;
    	}
    	return true;
    }
    /* 옵션 남은 갯수  */
    function opLimitText() {
    	$('.check_box_js').each(function(idx) {
    		var rewardId = $(this).val();
    		var opLimitQty = $("#remainOption"+rewardId).val();
			$("#remainOpText"+rewardId).text("남은수량: "+ opLimitQty);
    	});
    }
});
</script>

</body>


</html>