<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
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
</head>
<%@ include file="../../include/admin_menu.jsp"%>

<body>
	<style>
.search_table {
	width: 100%;
	float: right;
}

.menu_table {
	width: 30%;
	float: left;
}
</style>
<br><br>
<div class="search_table">
		<!-- 프로젝트 검색창 -->
 <form name="proSearch" id="proSearch" method="post" action="${path}/admin/proSearch.do">
 <table border="1" style="margin: 0 auto;">
 
 <tr>
 <td>검색구분</td>
 <td>
 <select name="searchOption" id="searchOption">
 <option value="pro_all" <c:if test="${map.searchOption=='pro_all'}">selected</c:if> >검색조건</option>
 <option value="pro_name" <c:if test="${map.searchOption=='pro_name'}">selected</c:if> >프로젝트 제목</option>
 <option value="pro_id" <c:if test="${map.searchOption=='pro_id'}">selected</c:if> >프로젝트 번호</option>
 <option value="maker_name"<c:if test="${map.searchOption=='maker_name'}">selected</c:if> >메이커명</option>
 <option value="maker_idx" <c:if test="${map.searchOption=='maker_idx'}">selected</c:if> >메이커 번호</option>
 </select>
 <input name="keyword" value="${map.keyword}">
 <input id="searchBtn" type="submit" value="조회">
 </td> 
<tr>
 <td>프로젝트 구분</td>
 <!-- input name 속성을 넣고 속성값을 동일하게 넣어주면 같은 카테고리내에서 선택할 때 중복선택이 되지 않도록 만들어 줄 수 있다. -->
 <td colspan="2">
                 <input type="radio" name="status" id="status_2" value="2">
                                <label for="status_2">승인대기</label>
                 <input type="radio" name="status" id="status_3" value="3">
                                <label for="status_3">오픈예정</label>
                 <input type="radio" name="status" id="status_4" value="4">
                                <label for="status_4">진행중</label>
                 <input type="radio" name="status" id="status_5" value="5">
                                <label for="status_5">종료</label>
 </td>

</tr>
 


 </table>
 

 
 </form>

		<br>
		<!--  ===========  레코드의 갯수를 출력  ==========  -->
		신청 ${map.proCount2} 건 | 예정  ${map.proCount3}건 | 진행중 ${map.proCount4} 건 | 마감예정  ${map.proCount5} 건 
		<p>
		
		
		
		
		<!-- =========================== -->
		<table align="center" border="1">
			<tr>
			    <td>${map.status }</td>
				<td>No</td>
				<td colspan="2">프로젝트명</td>
				<td>메이커</td>
				<td>프로젝트 시작일</td>
				<td>상태</td>
			</tr>
			
<c:if test="${map.list==null}">
			<tr>
				<td colspan="6"> 조회된 프로젝트가 없습니다.</td>
			</tr>
</c:if>
<c:if test="${map.list!=null}">
			<c:forEach var="ad" items="${map.list}">
				<tr>
				    <td><input type="checkbox" name="typeCheck" id="typeCheck" onclick=""></td>
					<td>${ad.pro_id}</td>
					<td><img src="${path}/images/${ad.pro_imageURL}" width="100px"
						height="100px"></td>
					<td><a href="${path}/admin/project/pro_detail/${ad.pro_id}">
							${ad.pro_name}</a></td>
					<td><a href="${path}/admin/mem_view/${ad.maker_idx}">
							${ad.maker_name}</td>
					<td><fmt:parseDate var="parseDate" value="${ad.pro_start}"
							pattern="yyyy-MM-dd" /> <fmt:formatDate value="${parseDate}"
							pattern="yyyy-MM-dd" /></td>
					<td><c:choose>
							<c:when test="${ad.pro_status == '2'}">승인대기</c:when>
							<c:when test="${ad.pro_status == '3'}">오픈예정</c:when>
							<c:when test="${ad.pro_status == '4'}">진행</c:when>
							<c:when test="${ad.pro_status == '5'}">마감</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
</c:if>
		</table>
	</div>
</body>

</html>