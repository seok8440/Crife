<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="generator" content="Jekyll v3.8.5">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<link rel="stylesheet" href="${path}/resources/reward/parsley.css">
<!--font awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap 적용 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="${path}/resources/reward/parsley.min.js"></script>
<script src="${path}/resources/reward/pasley.ko.js"></script>	
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>	
<script type="text/javascript">
	var jq = jQuery.noConflict();
</script>
	
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
<title>리워드 두번째 페이지</title>

</head>
<body>
<%@ include file="../include/navbar.jsp"%>
    <div class="container">
        <div class="py-5 text-center">
            <h2>주문페이지2 입니다.</h2>
            <p class="lead">전달 받은 값을 controller을 거쳐 list 형식으로 출력 후 회원정보, 최근 배송정보를 출력합니다. 유효성 검사를 위해 parsleyjs를 사용하였습니다. Daum우편번호 API를 사용하여 새로운 배송정보를 입력할 수 있으며, 최근주소지를 클릭 시 새로운 배송정보를 입력받지 않아도 예약이 가능합니다.</p>
        </div>
        <form role="form" method="post" action="${path}/order/reservation/${pro_id}">
        	<input type="hidden" id="project_title" value="" />
            <div class="row">
                <div class="col-md-8 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-4">리워드 선택 목록</h4>
                    <c:set var="total" value="0" />
                    <ul class="list-group mb-3">
                        <c:forEach items="${rewardSel.list}" var="reward2">
                            <c:if test="${reward2.reward_id != 0}">
                                <input type="hidden" class="reward-select" value="${reward2.reward_id}">
                                <input type="hidden" id="qty${reward2.reward_id}" value="${reward2.qty}">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <div>
                                        <h6 class="my-0">${reward2.reward_title}</h6>
	                                    <small class="text-muted" id="re_qty${reward2.reward_id}">${reward2.qty}개</small>
	                                    <ul class="list-group mb-3">
	                              		    <c:set var="sumCount" value="0" />
	                              		    <c:set var="optionMoney" value="0" />
		                                    <c:forEach items="${rewardSel.optionlist}" var="option">
			                                    <c:if test="${option.reward_id eq reward2.reward_id}">	
		                                    		<li class="list-group-item d-flex justify-content-between lh-condensed reward_count" data-id="${reward2.reward_id}">
					                                    <div>
					                                    <input type="hidden" id="opQty${option.op_id}" value="${option.op_count}">
			                                    		<input type="hidden" class="option_count" value="${option.op_id}">
				                                        	<h6 class="my-0" style="margin-right:8px;"> ${option.op_name}</h6>
					                                    </div>
					                                    <div>
				                                        	<small class="text-muted"> ${option.op_count}개</small>
			                                        	</div>
		                                        	</li>
		                                         <c:set var="total" value="${total + option.sumAmount}" />	
		                                		 <c:set var="sumCount" value="${sumCount + option.op_count}"/>	
		                                		 <c:set var="optionMoney" value="${optionMoney + option.sumAmount}"/>
		                                		 </c:if>
	                                		 </c:forEach>
                                		</ul>
                                		<input type="hidden" id="option_qty${reward2.reward_id}" value="${sumCount}">
                                		<input type="hidden" id="option_money${reward2.reward_id}" value="${optionMoney}">
                                    </div>
                                    <span class="text-muted" id="re_money${reward2.reward_id}"><fmt:formatNumber pattern="###,###,###" value= "${reward2.sumAmount}" />원</span>
                                </li>
                                <c:set var="total" value="${total + reward2.sumAmount}" />
                            </c:if>
                            <input type="hidden" id="delMoney${reward2.reward_id}" value="${reward2.delivery_fee}" />
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>배송금액</span>
                            <span class="text-muted delMoneyInput">원</span>
                        </li>
                        <c:set var="totalMoney" value="${total}" />
                        <li class="list-group-item d-flex justify-content-between">
                            <strong class="text-muted">총 금액</strong>
                            <strong class="text-muted totalMoney"></strong>
                        </li>
                    </ul>
                </div>
            </div>
            <!--row -->
            <div class="row">
                <div class="col-md-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-4">펀딩 서포터</h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <span>이름</span>
                            <small class="text-muted">${pinfo.mem_name}</small>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <span>이메일</span>
                            <small class="text-muted">${pinfo.mem_email}</small>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <span>휴대폰번호</span>
                            <small class="text-muted phone_format_js">${pinfo.mem_phone}</small>
                        </li>
                    </ul>
                </div>
            </div>
            <!--row -->
            <br>
            <div class="d-block my-3">
                <h4 class="d-flex justify-content-between align-items-center mb-4">배송지 선택</h4>
                <div class="custom-control custom-radio">
                    <button class="btn btn-light" id="toggle-list">최근 주소지 <i class="fa fa-angle-down"></i></button>
                    <div class="toggle-data row">
                        <div class="col-md-6 my-3 p-3 bg-white rounded shadow-sm">
                            <input id="old_address" name="addressSelect" type="radio" class="form-check-input" required="">
                            <label class="form-check-label" for="old_address">최근주소지</label>
                            <div class="media text-muted pt-3">
                                <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#007bff"></rect>
                                    <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text>
                                </svg>
                                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">${orderInfo.order_name}</strong>
                                    </div>
                                    <span class="d-block phone_format_js">${orderInfo.order_phone}</span>
                                    <span class="d-block">${orderInfo.order_address1} ${orderInfo.order_address3} ${orderInfo.order_address4}</span>

                                    <%-- <span class="d-block">${orderInfo.order_address_all}</span> --%>
                                        <!--얘를 1,3,4로 바꾸어야지  -->
                                </div>
                            </div>
                        </div>
                        <!--toggle-data -->
                    </div>
                    <!--col-md-4 -->
                </div>
                <!--custom-control -->
                <div class="custom-control custom-radio">
                    <input id="new_address" name="addressSelect" type="radio" class="form-check-input" checked="" required="">
                    <label class="form-check-label" for="new_address">새로운 주소지</label>
                    <div class="row input_address">
                        <div class="col-md-8">
                            <div class="mb-3">
                                <label for="order_name_js">이름</label>
                                <input type="text" class="form-control" id="order_name_js" data-parsley-length="[2, 10]" required="" value="">
                            </div>
                            <div class="mb-3">
                                <label for="order_phone_js">전화번호</label>
                                <input type="number" class="form-control phone_format_js" id="order_phone_js" required="">
                            </div>
                            <div class="mb-3">
                                <p>주소</p>
                                <input type="button" class="btn btn-secondary mb2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="d_btn">
                                <input type="text" class="form-control" id="home_address" required="" readonly>
                                <input type="text" id="order_address4" class="d_form form-control" placeholder="상세주소" required="">
                            </div>
                        </div>
                    </div>
                    <!--row input_address-->
                </div>
                <!--custom-control custom-radio -->
            </div>
            <!--d-block my-3-->
            <input type="hidden" id="sample4_postcode" placeholder="우편번호" value="">
            <input type="hidden" id="sample4_roadAddress" placeholder="도로명주소" value="">
            <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" value="">
            <div class="row">
                <div class="col-md-9 mb-4">
                    <input id="rbtn" class="btn btn-primary btn-block" type="button" value="결제예약하기" />
                </div>
            </div>
            <br>
        </form>
    </div>
    <!--container-->
</body>

<script>
$(document).ready(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init("imp99453622"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// 옵션 설정
	optionSet();
	// 배송금액설정
	delMoney();
	//옵션이 있을경우, 리워드별 금액, 갯수 설정,
	function optionSet() {
		$('.reward-select').each(function(idx) {
			var rewardId = $(this).val();
			var rewardQty = $("#qty"+rewardId).val();
			var opQty = $("#option_qty"+rewardId).val();
			var opMoney = $("#option_money"+rewardId).val();
			
			if (rewardQty == 0) {
				$("#re_qty"+rewardId).text(opQty+"개");
				$("#re_money"+rewardId).text(makeComma(opMoney)+"원");
			}
		});
	}
	// 배송금액 설정 
	function delMoney() {
		var delMoneyArr = new Array();
		var delivery_fee;
		$('.reward-select').each(function(idx) {
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
		$('[role="form"]').append('<input type="hidden" name="delivery_fee" value="' + delivery_fee + '" />');
	}
	
	//금액 정규식 
	function makeComma(str) {
		 str = String(str);
		 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	//휴대폰 번호 포맷
	phoneFormat();
	/*  method="post" action="${path}/order/reservation"  */
 	var formObj = $("form[role='form']");
 	
	$(document).on('click',"#rbtn", function(e) {
		 e.preventDefault();
		if($('#old_address').is(":checked")) { 
			formObj.parsley().destroy();
			rewardNextStep();
		}
		// validate 라이브러리 사용
	 	//formObj.parsley();
		if($('#new_address').is(":checked")) {
			var result;
			formObj.parsley().on('field:validated', function() {
			    var ok = $('.parsley-error').length === 0;
			    $('.bs-callout-info').toggleClass('hidden', !ok);
			    $('.bs-callout-warning').toggleClass('hidden', ok); 
			    return true;
			 });
			// parsley의 검증 결과를 true, false로 나타냄
			 if(formObj.parsley().isValid()) {
				 rewardNextStep();
			 }
		}
	});
	
	/*배송지 목록 클릭 이벤트 */
	 $(document).on("click", "#toggle-list", function(e) {
        e.preventDefault();
        $(".toggle-data").toggle( 'slow' );
    });
	function rewardNextStep() {
			$('.reward-select').each(function(idx) {
				var rewardId = $(this).val();
				var qty = $('#qty' + rewardId).val();
				$('[role="form"]').append('<input type="hidden" name="orderList[' + idx + '].reward_id" value="' + rewardId + '" />');
                $('[role="form"]').append('<input type="hidden" name="orderList[' + idx + '].order_count" value="' + qty + '" />');
			})
		
    		$('.option_count').each(function(idx) {
    			var rewardId = $(this).closest('.reward_count').data('id');
    			// 한번에 저장하기 위해 name을 배열로 전달한다. 
    			var optionId = $(this).val();
    			var opQty = $("#opQty"+optionId).val();
    			$('[role="form"]').append('<input type="hidden" name="orderOptList[' + idx + '].reward_id" value="' + rewardId + '" />');
    			$('[role="form"]').append('<input type="hidden" name="orderOptList[' + idx + '].op_id" value="' + optionId + '" />');
    			$('[role="form"]').append('<input type="hidden" name="orderOptList[' + idx + '].op_count" value="' + opQty + '" />');
    		});
    	
        //주소지 관련 input 태그 생성
        addressCheck();
        // 결제 API
		payment();
    }
	
	function addressCheck() {
		var old_address=$('#old_address');
		var new_address=$('#new_address');
		var order_name=$("#order_name_js").val();
		var order_phone=$("#order_phone_js").val();
        var order_address1= $('#sample4_postcode').val();
        var order_address3= $('#sample4_jibunAddress').val();
        var order_address4= $('#order_address4').val();
		if(old_address.is(":checked")) {  
			$('[role="form"]').append('<input type="hidden" name="order_name" value="${orderInfo.order_name}"  />');
			$('[role="form"]').append('<input type="hidden" name="order_phone" value="${orderInfo.order_phone}"  />');
			$('[role="form"]').append('<input type="hidden" name="order_address1" value="${orderInfo.order_address1}"  />');
			$('[role="form"]').append('<input type="hidden" name="order_address3" value="${orderInfo.order_address3}" />');
			$('[role="form"]').append('<input type="hidden" name="order_address4" value="${orderInfo.order_address4}" />');
		}
		if(new_address.is(":checked")) {
			$('[role="form"]').append('<input type="hidden" name="order_name" value="' + order_name + '" />');
			$('[role="form"]').append('<input type="hidden" name="order_phone" value="' + order_phone + '" />');
			$('[role="form"]').append('<input type="hidden" name="order_address1" value="' + order_address1 + '" />');
			$('[role="form"]').append('<input type="hidden" name="order_address3" value="' + order_address3 + '" />');
			$('[role="form"]').append('<input type="hidden" name="order_address4" value="' + order_address4 + '" />');
		}
	}
	
	$(document).on("change", "[type='radio']", function(e) {
		var old_address=$('#old_address');
		var new_address=$('#new_address');
		if(old_address.is(":checked")) {  
			$('.input_address').hide();
			$(".toggle-data").show();
		}
		if(new_address.is(":checked")) {
			$('.input_address').show();
			$(".toggle-data").hide();
		}
	});
	function phoneFormat() {
		$('.phone_format_js').each(function(idx) {
	    	var str = $(this).text().trim();    
	    	var phone = str.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	    	$(this).text(phone);
		});
	}
});
</script>
<!--배송지API 스크립트  -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress; 
                document.getElementById("home_address").value = data.zonecode +" "+ roadAddr +" "+ data.jibunAddress; 
                
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
               /*  if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }
</script>
<!--결제API 스크립트  -->
<script>
function addressCheck() {
	var old_address=$('#old_address');
	var new_address=$('#new_address');
	var order_name=$("#order_name_js").val();
	var order_phone=$("#order_phone_js").val();
    var order_address1= $('#sample4_postcode').val();
    var order_address3= $('#sample4_jibunAddress').val();
    var order_address4= $('#order_address4').val();
	if(old_address.is(":checked")) {  
		$('[role="form"]').append('<input type="hidden" name="order_name" value="${orderInfo.order_name}"  />');
		$('[role="form"]').append('<input type="hidden" name="order_phone" value="${orderInfo.order_phone}"  />');
		$('[role="form"]').append('<input type="hidden" name="order_address1" value="${orderInfo.order_address1}"  />');
		$('[role="form"]').append('<input type="hidden" name="order_address3" value="${orderInfo.order_address3}" />');
		$('[role="form"]').append('<input type="hidden" name="order_address4" value="${orderInfo.order_address4}" />');
	}
	if(new_address.is(":checked")) {
		$('[role="form"]').append('<input type="hidden" name="order_name" value="' + order_name + '" />');
		$('[role="form"]').append('<input type="hidden" name="order_phone" value="' + order_phone + '" />');
		$('[role="form"]').append('<input type="hidden" name="order_address1" value="' + order_address1 + '" />');
		$('[role="form"]').append('<input type="hidden" name="order_address3" value="' + order_address3 + '" />');
		$('[role="form"]').append('<input type="hidden" name="order_address4" value="' + order_address4 + '" />');
	}
}

//결제하기
function payment() {
	var msg;
	var old_address=$('#old_address');
	var new_address=$('#new_address');
	var totalMoney = $('.totalMoney').text();
	totalMoney = totalMoney.replace(/,/gi,"");
	totalMoney = totalMoney.replace("원","");
	var formPay = $("form[role='form']");
	/*배송지 정보*/
	if(old_address.is(":checked")) {  
		var order_name="${orderInfo.order_name}";
		var order_phone="${orderInfo.order_phone}";
	    var order_address1= "${orderInfo.order_address1}";
	    var order_address3= "${orderInfo.order_address3}";
	    var order_address4= "${orderInfo.order_address4}";
	}
	if(new_address.is(":checked")) { 
		var order_name=$("#order_name_js").val();
		var order_phone=$("#order_phone_js").val();
	    var order_address1= $('#sample4_postcode').val();
	    var order_address3= $('#sample4_jibunAddress').val();
	    var order_address4= $('#order_address4').val();
	}
	IMP.request_pay({
        pg: 'kakao',
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: '${pro_name}',
        amount: totalMoney,
        buyer_email: '${pinfo.mem_email}',
        buyer_name: order_name,
        buyer_tel: order_phone,
        buyer_addr: order_address3,
        buyer_postcode: order_address1
    }, function(response) {
		//결제 후 호출되는 callback함수
		if ( response.success ) { //결제 성공
			console.log(response);
			msg = '결제가 완료되었습니다.';
            alert(msg);
            formPay.submit();
            
		} else {
			alert('결제실패 : ' + response.error_msg);
		}
	})
}
</script>

</html>