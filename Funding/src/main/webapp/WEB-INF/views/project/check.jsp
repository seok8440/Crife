<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<title>check</title>
<script>
function check() {
	document.check_form.submit();
}
</script>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
	<form method="post" action="${path}/project/add" name="check_form">
		<!-- 프로젝트 제목 : <input type="text" name="pro_name"><br> -->
		<input type="checkbox" name="chk_info" value="1">펀딩 진행 중에는 제공할 리워드를 다른 온∙오프라인에서 펀딩하거나 판매하지 않습니다.<br>
		<input type="checkbox" name="chk_info" value="1">제공할 리워드는 현금, 지분 등의 수익이 아닌 제품 또는 서비스입니다.<br>
		<input type="checkbox" name="chk_info" value="1">진행할 프로젝트가 지적 재산권을 침해하지 않습니다.<br>
		<input type="checkbox" name="chk_info" value="1">서포터에게 프로젝트 진행 과정을 안내하고, 배송 약속을 지킬 수 있습니다.<br>
		<input type="checkbox" name="chk_info" value="1">서포터와의 신뢰를 위해 펀딩 진행∙제품 제작∙ 배송 등 모든 과정에서 겪는 어려움들을 서포터에게 진솔하게 전달하고 문제를 해결합니다.<br>
		<input type="hidden" name="mem_idx" value="${login.mem_idx}">
		<button type="button" onclick="check()">다음으로</button>
	</form>
	
</body>
</html>