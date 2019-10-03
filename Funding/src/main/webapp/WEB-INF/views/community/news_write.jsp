<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식 등록</title>
<%@ include file="../include/header.jsp"%>
<!-- 탭 관련 css,js -->
<script src="${path}/resources/js/tabcontent.js" type="text/javascript"></script>
<link href="${path}/resources/css/tabcontent.css" rel="stylesheet"type="text/css" />
<!-- bootstrap 적용 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
<!-- 스마트 에디터 적용 -->
<script src="${path}/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
$(function () {
	$("#btn_cancel").click(function () {
		location.href="${path}/project/detail/${dto.pro_id}";
	});
});
$(function () {
	$("#btn_ok").click(function() {
		document.write_form.submit();
	});
});
</script>


</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
<div class="row justify-content-md-center">
<div class="col-md-auto">
	<c:choose>
		<c:when test="${dto.pro_category == 1}"><h5>테크·가전</h5></c:when>
		<c:when test="${dto.pro_category == 2}"><h5>패션·잡화</h5></c:when>
		<c:when test="${dto.pro_category == 3}"><h5>뷰티</h5></c:when>
		<c:when test="${dto.pro_category == 4}"><h5>푸드</h5></c:when>
		<c:when test="${dto.pro_category == 5}"><h5>홈리빙</h5></c:when>
		<c:when test="${dto.pro_category == 6}"><h5>디자인소품</h5></c:when>
		<c:when test="${dto.pro_category == 7}"><h5>여행·레저</h5></c:when>
		<c:when test="${dto.pro_category == 8}"><h5>스포츠·모빌리티</h5></c:when>
		<c:when test="${dto.pro_category == 9}"><h5>반려동물</h5></c:when>
		<c:when test="${dto.pro_category == 10}"><h5>모임</h5></c:when>
		<c:when test="${dto.pro_category == 11}"><h5>공연·컬쳐</h5></c:when>
		<c:when test="${dto.pro_category == 12}"><h5>소셜·캠페인</h5></c:when>
		<c:when test="${dto.pro_category == 13}"><h5>교육·키즈</h5></c:when>
		<c:when test="${dto.pro_category == 14}"><h5>게임·취미</h5></c:when>
		<c:when test="${dto.pro_category == 15}"><h5>출판</h5></c:when>
		<c:when test="${dto.pro_category == 16}"><h5>기부·후원</h5></c:when>
	</c:choose>
	<h1>${dto.pro_name}</h1>${news_dto.pro_id},${login.mem_idx},${news_dto.maker_idx}
<div style="width: 1200px; height:auto; margin: 0 auto; padding: 40px 0 40px; font-family: 'Nanum Gothic', sans-serif; text-align: center;">
	<ul class="tabs" data-persist="true" style="text-align: center;">
		<li><a href="#news">새소식</a></li>
	</ul>
	<div class="tabcontents">
		<!-- 새소식 탭 -->
		<div id="news">
			<div class="blog-post">
				<h2 class="blog-post-title">새소식 등록</h2>
				<hr>
				<p>
					<form name="write_form" method="post" action="${path}/project/news_insert/${news_dto.pro_id}&${news_dto.maker_idx}" style="text-align: left;">
					  <input type="hidden" value="${news_dto.pro_id}">
					  <input type="hidden" value="${login.mem_idx}">
					  <input type="hidden" name="maker_idx" value="${news_dto.maker_idx}">
					  <div class="form-group">
					    <label for="exampleFormControlInput1">제목</label>
					    <input type="text" class="form-control" name="news_title" placeholder="제목을 입력하세요.">
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlInput1">작성자</label>
					    <input type="text" class="form-control" name="mem_name" value="${login.mem_name}">
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlTextarea1">내용</label>
					    <textarea class="form-control" name="news_content" rows="10" placeholder="내용을 입력하세요."></textarea>
					  <script>
					  // 스마트 에디터 적용
					  // id가 description인 태그에 ckditor 적용.
					  CKEDITOR.replace("news_content");
					  </script>
					  </div>
					</form>
					<div align="right">
					<button type="button" class="btn btn-info" id="btn_ok">완료</button>
					<button type="button" class="btn btn-info" id="btn_cancel">취소</button>
				</p>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>