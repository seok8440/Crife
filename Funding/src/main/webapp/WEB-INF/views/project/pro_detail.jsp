<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
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
	<h1>${dto.pro_name}</h1>
	<c:choose>
		<c:when test="${dto.pro_video != null}">
			<iframe width="640" height="360" src="${dto.pro_video}"
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br>
		</c:when>
		<c:when test="${dto.pro_video == null}">
			<img src="${path}/resources/images/${dto.pro_imageURL}" width="640" height="360">
		</c:when>
	</c:choose>
	${dto.pro_summary}<br>
	목표금액&nbsp;${dto.pro_price}&nbsp;&nbsp;펀딩기간&nbsp;${dto.pro_start}~${dto.pro_end}<br> 
	${dto.day}일 남음<br>
	${dto.pro_content}
	
	<div id="maker">
		<li>${maker_detail.maker_name}</li>
		<li><img src="${path}/resources/images/${maker_detail.maker_photo}" width="100" height="100"></li>
		<li>${maker_detail.maker_intro}</li>
	</div>


</body>
</html>