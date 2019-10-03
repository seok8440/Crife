<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my_project</title>
<!-- bootstrap 적용 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
	
<style>
/* 1줄에 프로젝트 3개씩 정렬 */
#div{
	float: left;
	width: 33%;
	margin: 0;
}
.col-md-4{
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}
#div:after{
	content: "";
	display: block;
	clear: both;
}
</style>
	
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<h2>내 프로젝트 목록</h2>
	<c:forEach items="${my_pro}" var="dto">
	<div class="col-md-4" id="div">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">
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
          </strong>
           <h6 class="mb-0">
          <c:choose> 
				<c:when test="${dto.pro_name != null}">
				<td><a href="${path}/project/detail/${dto.pro_id}">${dto.pro_name}</a></td>
				</c:when>
				<c:when test="${dto.pro_name == null}">
				<td><a href="${path}/project/detail/${dto.pro_id}">이름 없음</a></td>
				</c:when>
		  </c:choose>
          </h6>
          <div class="mb-1 text-muted">
          <c:choose>
				<c:when test="${dto.pro_status == 1}">
					<td>제작중</td>
				</c:when>
				<c:when test="${dto.pro_status == 2}">
					<td>요청 대기중</td>
				</c:when>
				<c:when test="${dto.pro_status == 3}">
					<td>펀딩 진행중</td>
				</c:when>
				<c:when test="${dto.pro_status == 4}">
					<td>종료된 펀딩</td>
				</c:when>
			</c:choose>
          </div>
          <p class="card-text mb-auto">
          목표금액 : <fmt:formatNumber value="${dto.pro_price}"/>원&nbsp;
			<form name="my_form" method="post" action="${path}/project/update_page" id="my_form">
				<input type="hidden" name="pro_id" value="${dto.pro_id}">
				<input type="hidden" name="maker_idx" value="${dto.maker_idx}">
				<input type="hidden" name="mem_idx" value="${login.mem_idx}">
				<c:if test="${dto.pro_status == 1}">
				<input type="button" value="수정하기" class="btn btn-primary update" >
				<input type="button" value="삭제하기" class="btn btn-primary delete" >
				</c:if>
			</form>
          </p>
        </div>
        
        <a href="${path}/project/detail/${dto.pro_id}">
        <c:choose>
        <c:when test="${dto.pro_imageURL != null}">
        <div class="col-auto d-none d-lg-block">
        	<img src="${path}/resources/images/${dto.pro_imageURL}" width="200px" height="250px">
        </div>
        </c:when>
        <c:when test="${dto.pro_imageURL == null}">
        <div class="col-auto d-none d-lg-block">
					<img src="${path}/resources/images/no_image.png" width="200px" height="250px">
		</div>
		</c:when>
        </c:choose>
        </a>
      </div>
    </div>
    </c:forEach>
<script>
$(document).ready(function() {
	var form = $('#my_form');
	$(".update").click(function(e) {
		e.preventDefault(); // 버튼 기본 이벤트를 막음
		$(this).parent().submit();
	});
	$(".delete").click(function(e) {
		e.preventDefault(); // 버튼 기본 이벤트를 막음
		var result = confirm('정말 삭제하시겠습니까?');
		if(result) { 
			$(this).parent().attr('action','${path}/project/my_delete').submit();
			alert("삭제되었습니다");
		}
	});
});
</script>
</body>
</html>