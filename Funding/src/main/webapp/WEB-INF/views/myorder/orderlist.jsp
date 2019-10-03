<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Myorder 결제내역 보기</title>
<style>
.glyphicon-lg
{
    font-size:4em
}
.info-block
{
    border-right:5px solid #E6E6E6;margin-bottom:25px
}
.info-block .square-box
{
    width:100px;min-height:110px;margin-right:22px;text-align:center!important;background-color:#676767;padding:20px 0
}
.info-block.block-info
{
    border-color:#20819e
}
.info-block.block-info .square-box
{
    background-color:#20819e;color:#FFF
}    
</style>
<style>
.social-card-header{
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    height: 96px;
}
.social-card-header i {
    font-size: 32px;
    color:#FFF;
}
.bg-facebook {
    background-color:#3b5998;
}
.text-facebook {
    color:#3b5998;
}
.bg-google-plus{
    background-color:#dd4b39;
}
.text-google-plus {
    color:#dd4b39;
}
.bg-twitter {
    background-color:#1da1f2;
}
.text-twitter {
    color:#1da1f2;
}
.bg-pinterest {
    background-color:#bd081c;
}
.text-pinterest {
    color:#bd081c;
}
.share:hover {
        text-decoration: none;
    opacity: 0.8;
}
#div{
	float: left;
	width: 100%;
	margin: 0;
}
.box-footer{
	content: "";
	clear: both;
	display: flex;
	justify-content : center;
	align-items: center;
}
</style>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="container">
	<h2>리워드 결제목록</h2>
	<br>
	<c:forEach items="${rewardList}" var="rewardlist">
			<div class="col-md-4" id="div">
			   <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			      <img class="card-img-top" src="${path}/resources/images/${rewardlist.pro_imageURL}" width="290" height="180" alt="${rewardlist.pro_name}">
			      <div class="card-body">
			         <h5 class="card-title">${rewardlist.pro_name}</h5>
			         <p class="card-text">메이커 ${rewardlist.mem_name}</p>
			         <c:choose>
						<c:when test="${rewardlist.pro_category == 1}"><h5>테크·가전</h5></c:when>
						<c:when test="${rewardlist.pro_category == 2}"><h5>패션·잡화</h5></c:when>
						<c:when test="${rewardlist.pro_category == 3}"><h5>뷰티</h5></c:when>
						<c:when test="${rewardlist.pro_category == 4}"><h5>푸드</h5></c:when>
						<c:when test="${rewardlist.pro_category == 5}"><h5>홈리빙</h5></c:when>
						<c:when test="${rewardlist.pro_category == 6}"><h5>디자인소품</h5></c:when>
						<c:when test="${rewardlist.pro_category == 7}"><h5>여행·레저</h5></c:when>
						<c:when test="${rewardlist.pro_category == 8}"><h5>스포츠·모빌리티</h5></c:when>
						<c:when test="${rewardlist.pro_category == 9}"><h5>반려동물</h5></c:when>
						<c:when test="${rewardlist.pro_category == 10}"><h5>모임</h5></c:when>
						<c:when test="${rewardlist.pro_category == 11}"><h5>공연·컬쳐</h5></c:when>
						<c:when test="${rewardlist.pro_category == 12}"><h5>소셜·캠페인</h5></c:when>
						<c:when test="${rewardlist.pro_category == 13}"><h5>교육·키즈</h5></c:when>
						<c:when test="${rewardlist.pro_category == 14}"><h5>게임·취미</h5></c:when>
						<c:when test="${rewardlist.pro_category == 15}"><h5>출판</h5></c:when>
						<c:when test="${rewardlist.pro_category == 16}"><h5>기부·후원</h5></c:when>
					 </c:choose>  
	                 <small class="text-muted">${rewardlist.order_date}</small></p>
			         <a href="${path}/mypage/myorder/orderdetail/${rewardlist.order_id}" class="btn btn-outline-dark btn-sm">결제 상세보기</a>
			      </div>
			   </div>
			</div>
    </c:forEach><p>
    <div class="box-footer">
	    <form id="listPageForm">
		    <input type="hidden" name="page" value="${pageMaker.criteria.page}">
		    <input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
		</form>
	    <div class="text-center">
		    <ul class="pagination">
		        <c:if test="${pageMaker.prev}">
		        	<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
		        </c:if>
		        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		            <li <c:out value="${pageMaker.criteria.page == idx ? 'class= active' : ''}"/> class="page-item">
		            	<a class="page-link" href="${idx} ">${idx} </a>
		            </li>
		        </c:forEach>
		        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		        	<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
		        </c:if>
		    </ul>
		</div>
	</div>
</div>  
</body>
<script>
$(".pagination li a").on("click", function (event) {
    event.preventDefault();

    var targetPage = $(this).attr("href");
    var listPageForm = $("#listPageForm");
    
    listPageForm.find("[name='page']").val(targetPage);
    listPageForm.attr("action", "${path}/mypage/myorder/orderlist").attr("method", "get");
    listPageForm.submit();
});
</script>
</html>