<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- 탭 관련 css,js -->
<script src="${path}/resources/js/tabcontent.js" type="text/javascript"></script>
<link href="${path}/resources/css/tabcontent.css" rel="stylesheet"type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- bootstrap 적용 -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script> -->
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
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner" style="height: 300px;">
      <div class="carousel-item active">
        <c:if test="${dto.pro_video == null}">
			<img src="${path}/resources/images/${dto.pro_imageURL}" width="100%" height="360px">
		</c:if>
        <div class="carousel-caption d-none d-md-block" style="margin-bottom: 5%;">
          <h5>
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
		</h5>
          <h1>${dto.pro_name}</h1>
        </div>
      </div>
  	</div>
  </div>	
</div>
<div class="row justify-content-md-center">
<div class="col-md-auto">	
<div style="width: 1200px; height:auto; margin: 0 auto; padding: 40px 0 40px; font-family: 'Nanum Gothic', sans-serif; text-align: center;">
	<ul class="tabs" data-persist="true" style="text-align: center;">
		<li><a href="#story">스토리</a></li>
		<li><a href="#news">새소식</a></li>
		<li><a href="#support">서포터</a></li>
	</ul>
	<div class="tabcontents">
		<!-- 스토리 탭 -->
		<div id="story">
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
			
			<form role="form" id="send_pro_id" method="get" action="${path}/reward/step10/${dto.pro_id}"></form>
			<button type="button" id="fbtn">펀딩하기</button>
		</div>
		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");
				console.log(formObj);
				$("#fbtn").on("click", function() {
					if (!("${login.mem_idx}"))
						alert("로그인해주세요");
					else
						formObj.submit();
				});
			});
		</script>
		
		<!-- 새소식 탭 -->
		<div id="news">
		<c:if test="${login.mem_idx==dto.mem_idx}">
		<div style="text-align: right; position: absolute; margin-top: -15px;">
		<button type="button" class="btn btn-info" id="news_btn">새소식 등록</button>
		</div>
		</c:if>
		<script type="text/javascript">
		$("#news_btn").click(function () {
			location.href="${path}/project/news_write/${dto.pro_id}"
		});
		</script>
		<c:forEach items="${com_news}" var="news">
			<div class="blog-post" data-key="${news.news_idx}">
				<h2 class="blog-post-title">${news.news_title}</h2>
				<input type="hidden" value="${news.news_idx}" id="news_idx">
				<input type="hidden" value="${dto.pro_id}" id="pro_id">
				<p class="blog-post-meta">
					${news.news_date}
				</p>
				<hr>
				<p>
					${news.news_content}
				</p>
			</div>
			<!-- 댓글 쓰기 -->
			<div class="input-group" style="width: 100%; text-align: center;">
			  <textarea class="form-control" rows="3" cols="150" id="cmttext${news.news_idx}" name="cmt_text" placeholder="댓글을 작성하세요."></textarea>
				  <div class="input-group-append">
				  	<button type="button" id="cmt_btn${news.news_idx}" class="btn btn-info ">댓글 작성</button>
		          </div>
      	  	</div>
      	  	<!-- 댓글 리스트 -->
      	  	<div id="cmt_list">
			<c:forEach var="cmt" items="${com_cmt}">
			<c:if test="${news.news_idx==cmt.news_idx}">
				<div class="input-group" style="width: 100%; text-align: left;">
			  		<b>${cmt.mem_email}</b>
			  		(<fmt:formatDate value="${cmt.cmt_date}" pattern="yyyy-MM-dd HH:mm:ss"/>)
			  		<br>
	        	</div>
	        	<div style="text-align: left;">
			  		${cmt.cmt_content}<p>
	        		<button type="button" id="reply_btn" class="btn btn-info">답글</button>
	        	</div>
	        	<hr><hr>
        	</c:if>
			</c:forEach>
			</div><br>
      	  	</c:forEach>
			<br><hr>
		</div>
		
		<!-- 서포터 탭 -->
		<div id="support" style="width: 900px; margin: 0px auto;">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <p class="lead ">현재 <strong>${dto.pro_name}</strong> 프로젝트에 <span class="font-weight-bold" style="color: #4FC9DE;">${sup_count}명</span>이 참여했습니다.</p>
			  </div>
			</div>
			<c:forEach var="sup" items="${sup_list}">
			<div class="card">
			  <div class="card-body">
			    <blockquote class="blockquote mb-0">
			      <p style="color: #5D5D5D;"><strong style="color: black;">${sup.mem_name}</strong>님이 <strong style="color: black;">${dto.pro_name}</strong> 펀딩에 참여했습니다.</p>
			      <footer class="blockquote-footer">${sup.order_date}일 전</footer>
			    </blockquote>
			  </div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript">
		$(function() {
			$(".blog-post").each( function (idx) { 
				var new_idx = $(this).data('key');
				console.log(new_idx);
				$("#cmt_btn"+new_idx).click(function () {
					if(!("${login.mem_idx}")){
						alert("로그인 후 사용하세요.");
						if(!("#cmttext")){
							alert("댓글 내용을 입력하세요.");
						}
					} else{
						reply(new_idx);
					}
				});
			});
		function reply(new_idx) {
			var cmttext=$("#cmttext"+new_idx).val();	// 댓글 내용
			var news_idx=new_idx;	// 새소식 글 번호
			var pro_id=$("#pro_id").val();	// 프로젝트 번호
			var param={"cmt_content": cmttext, "news_idx": news_idx, "pro_id": pro_id};
			console.log(news_idx);
			console.log(cmttext);
			console.log(param);
			$.ajax({
				type: "post",
				url: "${path}/comment/cmt_insert/${login.mem_email}",
				data: param, 
				success: function() {
					alert("댓글이 등록되었습니다.");
					location.href = "${path}/project/detail/${dto.pro_id}";
				}
			});
		}
	});
</script>
</html>