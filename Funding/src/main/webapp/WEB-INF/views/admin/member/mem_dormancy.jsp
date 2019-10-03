<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<br>
<br>
<style> 

.mem_table1 {width: 70%; float: right;}
.mem_table2 {width: 30%; float: left; }
</style>

<div class="mem_table1">
    <form name="memForm" id="memForm" method="post" action="${path}/admin/memDormancy.do">
    <select name="memSearch" id="memSearch">

 <option value="mem_name" <c:if test="${map.memSearch=='mem_name'}">selected</c:if> >이름</option>
 <option value="mem_email" <c:if test="${map.memSearch=='mem_email'}">selected</c:if> >이메일</option>
 <option value="mem_phone" <c:if test="${map.memSearch=='mem_phone'}">selected</c:if> >연락처</option>
 <option value="last_login" <c:if test="${map.memSearch=='mem_lastlogin_datetime'}">selected</c:if> >마지막 접속일</option>
 </select>
 <input name="keyword" value="${map.keyword}">
 <input type="submit" value="조회">
 </form>
 <br>
<!--  레코드의 갯수를 출력 -->
[휴면회원 ${memTotCount_3}명] 검색결과:<c:choose>
							<c:when test="${map.count == null}">0</c:when>
							<c:when test="${map.count != '0'}">${map.count}</c:when>
							</c:choose>
							명이 조회되었습니다.<p>

<table border="1">
<tr>
<td>이름</td>
<td>이메일</td>
<td>연락처</td>

<td>마지막 접속일</td>
</tr>

<c:forEach var="row" items="${map.list}">
<c:if test="${row.mem_type=='3'}">
<tr>

<td><a href="${path}/admin/member/mem_view/${row.mem_idx}">
    ${row.mem_name}</a></td>
<td>${row.mem_email}</td>
<td>${row.mem_phone}</td>
<td><fmt:formatDate value="${row.mem_lastlogin_datetime}"
                    pattern="yyyy-MM-dd" /></td>
</tr>
</c:if>
</c:forEach>


<%-- <tr>
<td colspan="5">
<c:if test="${map.pager.curBlock> 1}">
           <a href="#" onclick="list('1')">[처음]</a>
           </c:if>
<c:if test="${map.pager.curBlock> 1}">
           <a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
           </c:if>
<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
<c:choose><c:when test="${num==map.curPage }">
<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
<span style="color:red;">${nem}</span>
</c:when>
</c:choose></c:forEach> --%>
</table>
</div>

<div class="mem_table2">
<table border="1">
<tr>
<td><button><a href="${path}/admin/memListGET.do">회원조회</a></button></td>
</tr>
<tr>
<td><button><a href="${path}/admin/memDormancyGET.do">휴면회원</a></button></td>
</tr>
<tr>
<td><button><a href="${path}/admin/memDormancyGET.do">탈퇴신청</a></button></td>
</tr>
</table>
</div>
</body>

</html>