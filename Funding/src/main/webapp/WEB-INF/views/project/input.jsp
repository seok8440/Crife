<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>크라우디 : 내 프로젝트 수정</title>
<%@ include file="../include/header.jsp"%>
<!-- 탭 관련 css,js -->
<script src="${path}/resources/js/tabcontent.js" type="text/javascript"></script>
<link href="${path}/resources/css/tabcontent.css" rel="stylesheet"type="text/css" />

<!-- parsley 유효성 검사 js.css -->
<script src="${path}/resources/js/parsley.min.js"></script>
<script src="${path}/resources/js/ko.js"></script>
<link href="${path}/resources/css/parsley.css" rel="stylesheet"type="text/css" />

<!-- 달력관련 css-->
<link rel="stylesheet" href="${path}/resources/pickadate/lib/themes/default.css">
<link rel="stylesheet" href="${path}/resources/pickadate/lib/themes/default.date.css">
<!-- 달력관련 js-->
<script src="${path}/resources/pickadate/lib/picker.js"></script>
<script src="${path}/resources/pickadate/lib/picker.date.js"></script>
<script src="${path}/resources/pickadate/lib/legacy.js"></script>
<script type="text/javascript">
	var pk = jQuery.noConflict();
</script>

<!-- summernote관련 css/js -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- summernote관련 css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!--리워드 삽입 css  -->
<style>
	.option_js.showing {
	    visibility: visible;
	    display: block;
	}
	.option_js {
	    visibility: hidden;
	    display: none;
	}
	#option_input{
	    min-height: 60px;
	}
</style>
<!--부트스트랩 row 가운데정렬 -->
<style>
.row {
    margin: 0 auto;
}
.row div {
    margin: 0px 20px;
    padding: 5px;
}
</style>
</head>

<body style="font-family: 'Nanum Gothic', sans-serif;">
<%@ include file="../include/navbar.jsp"%>
<!-- 미리보기 버튼 폼 -->
	<form id="miri" name="miri" action="${path}/project/detail/${detail.pro_id}" method="post">
		<input type="hidden" name="pro_id" value="${detail.pro_id}">
		<div class="miri">
			<button id="btn_miri" class="btn btn-primary">미리보기</button>
		</div>
	</form>
	
	<!-- 승인요청 버튼 폼 -->
	<form id="ok" name="ok" action="${path}/project/request" method="post">
		<input type="hidden" name="pro_id" value="${detail.pro_id}">
		<div class="ok">
			<button id="btn_ok" type="button" class="btn btn-primary">승인요청</button>
		</div>
	</form>
<div class="container">
	<div style="width: 800px; height:800px; margin: 0 auto; padding: 120px 0 40px; font-family: 'Nanum Gothic', sans-serif;">
		<ul class="tabs" data-persist="true">
			<li><a href="#view1">기본정보</a></li>
			<li><a href="#view2">리워드</a></li>
			<li><a href="#view3">스토리</a></li>
			<li><a href="#view4">메이커</a></li>
		</ul>
		<div class="tabcontents">
				<div id="view1">
					<form name="input_form" enctype="multipart/form-data" method="post" class="input_form" action="${path}/project/save1" data-parsley-validate>
						<div class="row">
							<div class="col-md-6">
							<label for="categori">카테고리</label>
								<select id="pro_category" name="pro_category" class="form-control form-control-sm">
									<option value="" <c:out value="${detail.pro_category == null ? 'selected' : ''}" />>프로젝트카테고리</option>
									<option value="1" <c:out value="${detail.pro_category eq '1' ? 'selected' : ''}" />>테크·가전</option>
									<option value="2" <c:out value="${detail.pro_category eq '2' ? 'selected' : ''}" />>패션·잡화</option>
									<option value="3" <c:out value="${detail.pro_category eq '3' ? 'selected' : ''}" />>뷰티</option>
									<option value="4" <c:out value="${detail.pro_category eq '4' ? 'selected' : ''}" />>푸드</option>
									<option value="5" <c:out value="${detail.pro_category eq '5' ? 'selected' : ''}" />>홈리빙</option>
									<option value="6" <c:out value="${detail.pro_category eq '6' ? 'selected' : ''}" />>디자인소품</option>
									<option value="7" <c:out value="${detail.pro_category eq '7' ? 'selected' : ''}" />>여행·레저</option>
									<option value="8" <c:out value="${detail.pro_category eq '8' ? 'selected' : ''}" />>스포츠·모빌리티</option>
									<option value="9" <c:out value="${detail.pro_category eq '9' ? 'selected' : ''}" />>반려동물</option>
									<option value="10" <c:out value="${detail.pro_category eq '10' ? 'selected' : ''}" />>모임</option>
									<option value="11" <c:out value="${detail.pro_category eq '11' ? 'selected' : ''}" />>공연·컬쳐</option>
									<option value="12" <c:out value="${detail.pro_category eq '12' ? 'selected' : ''}" />>소셜·캠페인</option>
									<option value="13" <c:out value="${detail.pro_category eq '13' ? 'selected' : ''}" />>교육·키즈</option>
									<option value="14" <c:out value="${detail.pro_category eq '14' ? 'selected' : ''}" />>게임·취미</option>
									<option value="15" <c:out value="${detail.pro_category eq '15' ? 'selected' : ''}" />>출판</option>
									<option value="16" <c:out value="${detail.pro_category eq '16' ? 'selected' : ''}" />>기부·후원</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label for="pro_name">프로젝트 제목</label>
								<input type="text" id="pro_name" name="pro_name" class="form-control form-control-sm" value="${detail.pro_name}"
									placeholder="프로젝트 제목을 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
							<label for="pro_keyword">프로젝트 키워드</label>
								<input type="text" name="pro_keyword1" id="pro_keyword1" value="${detail.pro_keyword1}" class="form-control"
									data-parsley-length="[0, 5]" placeholder="검색에 필요한">
							</div>
							<div class="col-md-3">
							<label for="pro_keyword">&nbsp;</label>
								<input type="text" name="pro_keyword2" id="pro_keyword2" value="${detail.pro_keyword2}" class="form-control"
									data-parsley-length="[0, 5]" placeholder="키워드를">
							</div>
							<div class="col-md-3">
							<label for="pro_keyword">&nbsp;</label>
								<input type="text" name="pro_keyword3" id="pro_keyword3" value="${detail.pro_keyword3}" class="form-control"
									data-parsley-length="[0, 5]" placeholder="입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
							<label for="pro_price">목표금액</label>
							<input type="text" name="pro_price" id="pro_price" class="form-control" value="${detail.pro_price}"
								data-parsley-type="digits" data-parsley-trigger="change">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">	
							<label for="pro_start">프로젝트 시작일</label>
							<input type="text" name="pro_start" id="datepicker1" class="form-control" value="${detail.pro_start}">
							</div>
							<div class="col-md-6">	
							<label for="pro_end">프로젝트 종료일</label>
							<input type="text" name="pro_end" id="datepicker2" class="form-control" value="${detail.pro_end}">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">	
							<label for="pro_imageURL">프로젝트 대표 이미지</label>
							<input type="file" name="file1" id="file1" accept=".jpg,.png" class="custom-file-input" size="50" data-parsley-max-file-size="3072">
							</div>
						</div>
						현재 파일 :
						<c:choose> 
							<c:when test="${detail.pro_imageURL != null}">
								<img src="${path}/resources/images/${detail.pro_imageURL}" width="100px" height="100px"><br>
							</c:when>
							<c:when test="${detail.pro_imageURL == null}">
								없음<br>
							</c:when>
						</c:choose>
						<input type="hidden" name="pro_id" value="${detail.pro_id}">
						<br><input type="button" value="저장하기" id='save1'>
					</form>
				</div>
				<div id="view2">
				    <div id="section">
					 	<form id="form-main" role="form">
						 	<h2 class="heading">리워드</h2>
							<div class="row">
						    	<h4 style="cursor:pointer; color: dodgerblue"><span class="thick template-button">리워드 생성하기</span></h4>
						    </div>
							<c:forEach items="${rewards}" var="reward">
						 	<div class="form-block-check">
						 		<input type="hidden" id="input_key" value="${reward.reward_id}">
								<div class="form-group-reward row" style="border:2px solid dodgerblue">
									<div class="row"> <!--Start row-->
										<input type="button" class="delBtn btn pull-right" value="제거하기" />
										<div class="col-md-4">
											<p class="info-text">리워드 명</p>
											<input type="text" name="reward_title${reward.reward_id}" class="input_js form-control" value="${reward.reward_title}">
										</div>
										<div class="col-md-4">
											<p>발송시작일</p>
											<input type="text" name="shipment_start${reward.reward_id}" class="input_js reward_date form-control" value="${reward.shipment_start}">
						             		<input type="hidden" name="pro_id" class="input_js" value="${detail.pro_id}">
										</div>
									</div> <!--End row-->
									<div class="row"> <!--Start row-->
										<div class="col-md-4">
											<p>금액 (단위: 원)</p>
											<input type="text" name="reward_price${reward.reward_id}" class="input_js form-control" value="${reward.reward_price}">
										</div>
									</div> <!--End row-->
						            <div class="row"> <!--Start row-->
								        <p class="info-text">옵션 조건</p>
										<div class="col-md-4">
											<input type="radio" name="op_val${reward.reward_id}" class="radio_ck" value="0">
											<span> 옵션입력이 필요없는 리워드입니다. </span>
										</div>
										<div class="col-md-4">
											<input type="radio" name="op_val${reward.reward_id}" class="radio_ck" value="1">
									        <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
										</div>
									</div>	
									<div class="row option_js">
										<input type="button" class="option_add_btn btn-secondary btn-sm btn-block" value="추가하기" />
										<div class="col-md-12">
								        <c:forEach items="${options}" var="option">
								        	<c:if test="${option.reward_id eq reward.reward_id}">
							                <div class="option_add mb-3">
							                	<div class="option_wrap">
							                		<p>옵션 명</p>
							                		<input type="text" name="op_name${reward.reward_id}" class="input_js op_js form-control" value="${option.op_name}"> 
							                		<p>옵션 제한 수량</p>
							                		<input type="text" name="op_limit_qty${reward.reward_id}" class="input_js op_js form-control" value="${option.op_limit_qty}">
							                		<input type="button" class="option_del_btn btn" value="제거하기" />
							                	</div>	
							                </div>    
							                </c:if>
								        </c:forEach>
								        </div>
									</div> <!--End row-->
									<div class="row"> <!--Start Grid-->
										<div class="col-md-4">
											<p class="info-text">배송료 (단위: 원)</p>
											<input type="text" name="delivery_fee${reward.reward_id}" class="input_js form-control" value="${reward.delivery_fee}">
										</div>
										<div class="col-md-4">
											<p class="info-text">제한수량</p>
											<input type="number" name="reward_sell_count${reward.reward_id}" class="input_js form-control" value="${reward.reward_sell_count}">
										</div>
									</div> <!--End row-->
									<div class="row"> <!--Start row-->
							            <div class="col-md-8">
							            	<p> 리워드 상세내역</p>
							            	<textarea name="reward_description${reward.reward_id}" class="input_js form-control">${reward.reward_description}</textarea>
							            </div>
						            </div> <!--End row-->
								</div> 
								<!-- form-group-reward -->
						 	</div>
						 	<!-- form-block-check -->
						 	</c:forEach>
					  	</form>
					 	<template>
						 	<div class="form-block-pass">
						 		<input type="hidden" id="input_key" value="">
								<div class="form-group-reward row" style="border:2px solid dodgerblue">
									<div class="row"> <!--Start row-->
										<input type="button" class="delBtn btn pull-right" value="제거하기" />
										<div class="col-md-4">
											<p class="info-text">리워드 명</p>
											<input type="text" name="reward_title" class="input_js form-control" value="">
										</div>
										<div class="col-md-4">
											<p>발송시작일</p>
											<input type="text" name="shipment_start" class="input_js reward_date form-control" value="">
										</div>
									</div> <!--End row-->
									<div class="row"> <!--Start row-->
										<div class="col-md-4">
											<p>금액 (단위: 원)</p>
											<input type="text" name="reward_price" class="input_js form-control" value="">
										</div>
									</div> <!--End row-->
						            <div class="row"> <!--Start row-->
										<p class="info-text">옵션 조건</p>
										<div class="col-md-4">
											<input type="radio" name="op_val" class="radio_ck input_js" value="0">
											<span> 옵션입력이 필요없는 리워드입니다. </span>
										</div>
										<div class="col-md-4">
											<input type="radio" name="op_val" class="radio_ck input_js" value="1">
									        <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
										</div>
									</div>	
									<div class="row option_js">
										<input type="button" class="option_add_btn btn-secondary btn-sm btn-block" value="추가하기" />
										<div class="col-md-12">
							                <div class="option_add mb-3">
							                	<div class="option_wrap">
							                		<p>옵션 명</p>
							                		<input type="text" name="op_name" class="input_js op_js form-control" value=""> 
							                		<p>옵션 제한 수량</p>
							                		<input type="text" name="op_limit_qty" class="input_js op_js form-control" value="">
							                		<input type="button" class="option_del_btn btn" value="제거하기" />
							                	</div>	
							                </div> 
								        </div>
									</div> <!--End row-->
									<div class="row"> <!--Start Grid-->
										<div class="col-md-4">
											<p class="info-text">배송료 (단위: 원)</p>
											<input type="text" name="delivery_fee" class="input_js form-control" value="">
										</div>
										<div class="col-md-4">
											<p class="info-text">제한수량</p>
											<input type="number" name="reward_sell_count" class="input_js form-control" value="">
										</div>
									</div> <!--End row-->
									<div class="row"> <!--Start row-->
							            <div class="col-md-8">
							            	<p> 리워드 상세내역</p>
							            	<textarea name="reward_description" class="input_js form-control"></textarea>
							            </div>
						            </div> <!--End row-->
						            <input type="hidden" name="pro_id" class="input_js" value="${detail.pro_id}">
								</div> 
								<!-- form-group-reward -->
						 	</div>
						 	<!-- form-block-pass -->
					 	</template>
					 	<input type="button" class="btn ins-btn" value="저장하기" />
					</div> 
				</div>
				<div id="view3">
					    <form id="story_form" name="story_form" method="post"
						action="${path}/project/save3" data-parsley-validate>
							<h4>소개 영상</h4>
							유튜브 동영상 주소를 적어주세요<br>
							동영상을 등록하지 않으면 메인사진이 올라갑니다<br>
							<div class="row">	
								<input type="text" name="pro_video" class="form-control" value="${detail.pro_video}" size="50"><br>	
							</div>
							<h4>스토리</h4>
							<textarea rows="10" cols="30" id="summernote" name="pro_content" style="width:766px; height:500px;">
							${detail.pro_content}</textarea>
							<br>
							<h4>간단설명</h4>
							프로젝트에 대한 간단한 설명을 해주세요.(최소 20글자, 최대 100글자)<br>
							<div class="row">
								<textarea id="pro_summary" name="pro_summary" style="width:735px; height:200px;"
								data-parsley-trigger="keyup" class="form-control" data-parsley-minlength="20" data-parsley-maxlength="100"
								>${detail.pro_summary}</textarea>
							</div>
							<input type="hidden" name="pro_id" value="${detail.pro_id}">
							<input type="button" class="btn btn-primary" value="저장하기" style='margin: 10px;' id='save3'>
						</form>
				</div>
				<div id="view4">
					<form id="maker_form" action="${path}/maker/save4"
						method="post" enctype="multipart/form-data" >
						<div class="row">
	   						<div class="col-md-8">
	   							<div class="form-group">
					        		<label class="control-label col-sm-5">Maker 이름</label>
						            <div class="col-md-12 col-sm-12">
							            <div class="input-group">
								            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							            	<input name="maker_name" class="form-control" id="maker_name" type="text" value="${maker_detail.maker_name}">
							            </div>
						            	<small>프로젝트의 메이커 이름을 입력해주세요 </small> 
						            </div>
					        	</div>
					        	<!-- form-group -->
					        	<div class="form-group">
							        <label class="control-label col-sm-5">메이커 전화번호</label>
							        <div class="col-md-12 col-sm-12">
							        	<div class="input-group">
							        	<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
							        	<input name="maker_phone" class="form-control" id="maker_phone" type="text" value="${maker_detail.maker_phone}">
							       		</div>
							       		<small>프로젝트의 메이커 전화번호를 입력해주세요 </small> 
							        </div>
						        </div>
						        <!-- form-group -->
						        <div class="form-group">
							        <label class="control-label col-sm-5">메이커 주소</label>
							        <div class="col-md-12 col-sm-12">
							        	<div class="input-group">
							        	<span class="input-group-addon"><i class="glyphicon glyphicon-signal"></i></span>
							        	나중에 추가
							       		</div>
							       		<small>프로젝트의 주소정보를 입력해주세요 </small> 
							        </div>
						        </div>
						        <!-- form-group -->
						        <div class="form-group">
							        <label class="control-label col-sm-5">메이커 소개</label>
							        <div class="col-md-12 col-sm-12">
							        	<div class="input-group">
							        		<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
							        		<input name="maker_intro" class="form-control" id="maker_intro" type="text" value="${maker_detail.maker_intro}">
							       		</div>
							       		<small>메이커에 대한 정보를 입력해주세요 </small> 
							        </div>
						        </div>
						        <!-- form-group -->
						        <div class="form-group">
							        <label class="control-label col-sm-5">메이커 사진 <br></label>
								    <div class="col-md-12 col-sm-12">
								        <div class="input-group"> 
									        <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
									        <input type="file" class="form-control upload" id="file_nm" name="file3" id="file3" size="50">
								        </div>
							        </div>
	                            </div>
	                            <!-- form-group -->
	                            <div class="form-group">
	                            	<div class="col-md-12 col-sm-12">
	                    	        	<p>현재 파일 : ${maker_detail.maker_photo}</p> 
	                    	    	</div>
	                            </div>
	   						</div>
	   					</div>	
						<input type="hidden" name="mem_idx" value="${login.mem_idx}">
						<input type="hidden" name="maker_idx" value="${maker_detail.maker_idx}">
						<input type="hidden" name="pro_id" value="${detail.pro_id}">
						<button id="save4">저장하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	pk('#datepicker1').pickadate({
		format : 'yyyy-mm-dd',
		formatSubmit : 'yyyy-mm-dd'
	});
	pk('#datepicker2').pickadate({
		format : 'yyyy-mm-dd',
		formatSubmit : 'yyyy-mm-dd'
	});
	$(document).on("click", '.reward_date', function(e) {
		pk('.reward_date').pickadate({
			format : 'yyyy-mm-dd',
			formatSubmit : 'yyyy-mm-dd'
		});
	})

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 400
		});
	});
</script>
<script>
	$(document).ready(function() {
		//프로젝트등록 유효성검사
		$("#save1").click(function() {
			document.input_form.submit();
			alert("저장되었습니다");
		});
		
		$("#save3").click(function() {
			document.story_form.submit();
			alert("저장되었습니다");
		});
		
		$('#save4').click(function() {
			document.maker_form.submit();
			alert("저장되었습니다");
		});
		
		$("#btn_ok").click(function() {
			alert("승인요청이 되었습니다. 2주 안에 처리됩니다");
			document.getElementById('ok').submit();
		});
	});
</script>
<!--리워드 삽입 스크립트  -->
<script>
      const SHOWING_ON = "showing";
      $(document).on("change", '.radio_ck', function(e) {
          $('.radio_ck').each(function() {
              if($(this).is(":checked")) {
                  optionShow($(this).closest('.form-group-reward').children('.option_js'));
                  $(this).addClass('input_js');
                  console.log("check");
                  console.log($(this).closest('.form-group-reward').children('.option_js'));
              }
              else {
                  optionHidden($(this).closest('.form-group-reward').children('.option_js'));
                  $(this).removeClass('input_js');
                  console.log("uncheck");
              }
          });    
      });
       // 체크박스 유무 확인 후 클래스 추가, 제거	      
      function optionShow(chose) {
          chose.addClass(SHOWING_ON);
      }
      function optionHidden(chose) {
          chose.removeClass(SHOWING_ON);    
      }
      $("textarea#option_input").on('keydown keyup', function () {
          $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
      });
      $("textarea#option_input").on('change keyup', function () {	
          var newOptions = {
              '' : '옵션선택'
          }
          var selectedOption = '';
          var select = $('#option_view_js');
          var optionItem = $(this).val().split("\n");
          for (var count = 0; count < optionItem.length; count++) {
              newOptions[count] = optionItem[count];
              //newOptions 객체에 값이 제대로 들어갔는지 확인
              //console.log(newOptions);
          }
          // 옵션 값을 textarea에 입력 후 지우면 0번째count에 ''가 남는 경우가 생겨서 처리함
          if (!newOptions['0']){
              delete(newOptions['0']);
          } 
          if(select.prop) {
              var options = select.prop('options');
          }
          else {
              var options = select.attr('options');
          }           
          $('option', select).remove();
          $.each(newOptions, function(val, text) {
              options[options.length] = new Option(text, val);
          });
          select.val(selectedOption);
      });
      // 옵션 추가 버튼
      $(document).on("click", '.option_add_btn', function(e) {
    	  e.preventDefault();
    	 /*  var clone = $(this).parent().find('.option_wrap').clone();
    	  var parent = $(this).closest('.option_add');
    	  clone.appendTo(parent); */
    	  $(this).parent().find('.option_add').append(
	        `<div class="option_wrap">
                                   옵션 명:
                 <input type="text" name="op_name" class="input_js op_js form-control"> 
                                   옵션 제한 수량:
                 <input type="text" name="op_limit_qty" class="input_js op_js form-control">
                 <input type="button" class="option_del_btn btn" value="제거하기" />
             </div>`)
      });
      // 옵션 제거 버튼
      $(document).on("click", '.option_del_btn', function(e) {
    	  e.preventDefault();
    	  $(this).parent('.option_wrap').remove();
      });
      // Ajax 데이터 저장처리
      function to_ajax() {
      	//const serializedValues2 = $('form[role="form"]').serializeObject();
      	//const serializedValues2 = $('form[role="form"]').serializeJSON();
      	//const serializedValues2 = $('form[role="form"]').serialize();
      	// Json 값 삽입
      	const serializedValues2 = createInputJson();
      	//const serializedValues2 = createOptionJson();
      	console.log(JSON.stringify(serializedValues2));

  		//'${path}/reward/rewardInput'
      	$.ajax({
      		type : 'POST',
      		url : "${path}/project/rewardInput",
      		data : JSON.stringify(serializedValues2),
      		//data: serializedValues2,
      		dataType : 'json',
      		contentType: "application/json; charset=utf-8;",
      		error: function(){
                  alert("저장에 실패하였습니다.");
              },
      		success : function(json) {
      			alert('저장되었습니다.');
      		}
      	});
      }
      $('.ins-btn').click(function(e) {
      	e.preventDefault();
      	to_ajax();
      });

      /*리워드 생성  */
      var section = document.querySelector("#section");
	  var templateButton = section.querySelector(".template-button");
	  var formMain = document.querySelector("#form-main");
      
      $(".template-button").on('click', function () {
    	let template = section.querySelector("template");
        //importNode -> cloneNode와 비슷한 역할 
        let cloneNode = document.importNode(template.content, true);
        formMain.appendChild(cloneNode); 
       $(".form-block-pass").each(function(idx) {
    	     //var newId = $(".form-block-pass #input_key").val(newId);
        	 var newId = new Date().getTime();
        	 $(".form-block-pass .input_js").each(function(idx) {
             	//$(this).val("리워드 #"+idx); text같은거로 하면 되겟네innerText
             	var id = $(this).attr('id');
         		var name = $(this).attr('name');
             	$(this).attr('name',name+''+newId);  
             	//console.log(name);
        	 });
        	 $(".form-block-pass #input_key").val(newId);
        	 $(this).attr('class',"form-block-check");
        	console.log(newId);
        }); 
      });
      
      /*리워드 삭제 버튼 */
      //remove()
      $(document).on("click", ".delBtn", function(e) {
        	e.preventDefault();
        	$(this).closest(".form-block-check").remove();
      });
      
      
      /*저장하기 클릭시 Ajax로 보내는 Json 데이터 처리  */
      function createInputJson() {
      	    var totalList = new Object();
		    var testArray = new Array();
		    $('.form-group-reward').each(function(idx) { 
			 	var fileData = new Array();
			 	fileData = $(this).find('.input_js');
			 	var data = new Object() ;
			    console.log(idx);
			    var newKey = ""+$(this).parent().find('#input_key').val();
			    //console.log("newkey:"+newKey);
			 	/*find 사용시 바닐라자바스크립트를 사용해야하는구나  */
			     for(var i=0; i< $(this).find('.input_js').length; i++){    
			          // input_js 클래스에 해당하는 name 과 value 값 object생성
			          var input_name;
				      input_name =  fileData[i].getAttribute('name').replace(newKey,'');
			          data[input_name] = fileData[i].value;
			     }
			 	//concat을 사용하여 overwrite를 피함
			 	data['optionlist'] = createOptionJson($(this));
			    testArray = testArray.concat(data);
			});	
      	totalList.list = testArray;
		return totalList;
     }
      
      // 옵션 데이터 처리
      function createOptionJson(obj) {
		  var testArray = new Array();
	      obj.find('.option_wrap').each(function(idx) {
			  console.log($(this).find('.op_js'));
			  //var newKey = ""+$(this).parent().parent().parent().parent().find('#input_key').val();
			  var newKey = ""+obj.parent().find('#input_key').val();
			  //closest('#input_key')
	    	  var opData = new Array();
	    	  opData = $(this).find('.op_js');
	    	  var data = new Object() ;
	    	  for(var j=0; j < $(this).find('.op_js').length; j++){    
		          // input_js 클래스에 해당하는 name 과 value 값 object생성
		          var input_name = opData[j].getAttribute('name').replace(newKey,'');
		          data[input_name] = opData[j].value;
		      }
	    	  console.log(newKey);
	    	  testArray = testArray.concat(data);
	      });
		  
		  //totalList.orderlist = testArray;
		  
	  return testArray;
  	  }
  </script>
</html>
