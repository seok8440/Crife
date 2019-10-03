<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<title>check</title>
<style type="text/css">
label {
	font-family: Georgia;
}

.heading {
	display: block;
	margin: 20px 0;
}

input[type=radio] {
	display: none;
}

input[type=radio]+label {
	background:
		url('https://lh3.googleusercontent.com/CSygHWUdWSpIIfoPv3gwc0PctzOTVFGSCcSel4lOtxBBofmpt1QJxOF8MwrXbi0lIxxnKw2Cj6btMFTJZIGxWpkNpHZL41cOa5sgeSgtlsmat7YjkQlrU2XbmhPrxZwElMf9hucSAfEgF0VRLQy58ATRdf1mQULv5VcfnWFyus03KF8Egtg_pwW1_LRnklFEAUUZ_TyzEqFM3cp6G_aDyQpNCKxNvoLWkrcV-tgxqxQGAqC45JAkWWNXSxKgXD8TINX_xO1oml6fh_qVC32SwSQZqkk8Mkhvi2V3DSME0BzcS7wlku5tUK9ijkksro3Wp9kS7Ng4kyPDpkhZAh0kaiKXe4vUXfpZhhXuVjMwaP04HmMFJ7tjKt7bKvIHo0LcKv1zbbQsJ5ZTbI9wRabnUk9dWZtKE0w9BwiNbHuw1JrJBzmSCon9aQZD2DCD72DZEgaUchpdWKi-jShqHvrhaUYUeOUQiImDmo9NBKocQIW76p69uns8tbm1XXohE6tc-PKj8Cx66YtZLm4oUsvppee7Sw92GBFNvMPP9BGZSvxZmpV6TV5rNga1JBJOCMKw76SuYRNob9jCPmjzVMYjmFN8GknmaqOti7kh-QP7IlTUleyq=w25-h24-no')
		left top no-repeat;
	display: block;
	min-height: 25px;
	padding-left: 35px;
}

input[type=radio]:checked+label {
	background:
		url('https://lh3.googleusercontent.com/QSVgoBuOonsWKUZm6m0NKwekEvkfMOWrPFfevisISZjzeu2uQkxMOY1MUh3QgorRu2qc1kwKX4So7-mGJ-hayMAitq15L63KQNBfsOcm1qmWDU657CNl4lauYhgVz7f59IMrZBg8FWdgh26VDCvGMwUqaK6CBVv13AdKbxDMeDqiZS73EgzF5kBW5smh1nxCY5Gqk8yCmDsYh4KixdZWKGW7BqXLZn7cB2fQV4-o0DePjN69GJLXmddJ6H32CBgiFKE4smBvb1ByWpREmRYpFEUaHuQdbhHiiebI4Kipz35I6OxsVxKC6HOIQC3Xk6JVePhgudB2_-8Nyq2M9rWqIap8kAhmN-FI8iRdSLXhTV4FEeTHqokQ0qEXEZ5N9dRKoXT3al1Alcwrson_OtaALHldR9O7BO6Iq5_BV7-ERpoSYD8wGGhCcWQbjKkz5qHTa8yWRAfZaCLnK8Dzs0DPJtgMjQirittz8cpQQxQM4fhzXvG2x_Dtev4Y1YcZbzsaU6FpamC188SkjEDGOjYnf6CTk0VVbPk1DXFPIEGbOmc7b1unsq7uHOOkuRkGnTQ_d8aLNNPpeDvxP4agpI-ycfdH2ciG4sRXSKcdeAXGIHhNaI9T=w25-h24-no')
		left top no-repeat;
}

input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	background:
		url('https://lh3.googleusercontent.com/Xxv2PonyC_el80dSzxdDFkgF7gM_Ru7u9ErRZS9hJeC9V1W073WowYQIhyivqHd74mt7GQBpL8aK9Aqsv9Kf2Ku_hjmsXsAZstjM0jFW4iQ85BYM41OnftEitTSzC0VagQ0hAxAYBbvTlOztGsDf5WOTW39gixPLf7DTZ72-YKANYzf1nMSH6Pc2b4_MTf4deEku7cS_xenmFAwlO5wM9lAs2TXRbOJBmuJmlIm1f6Zv7CNQR96yldK98z9QtDkDiZib2YxdFNXK_eLec8yWy-syA3imgmBDrlCR7BGZzVN36PTJDe5yChArZ-Gn2QHZAwsMCtKys_tKjngmgnYvTyj182U3jTz1Lt0N9OLpv_N4ouK8o4QEvvGs8BOTx9jAnlHoDY8D_QsKLgf_Vo1OG_DCJj67b3MTu9BYU4o3UXQgjTx7R-fHrl8V_zSHpaJyN61dwt0wVX9kerZxfxdFLnKu2CQOBITobLfZK0Q9T4REe2goZOqX0EQHfvLWuLlw7cur_VdXJctEKYCqINzeYxFqeyh1VGRkOjaY-ke73m8KkG2EYSlym7p1sYnX53xzNG66C5vCvHRm7624WZj9a2pTXSwjLCGEcQYtZ96nPTUYmrn-=s23-no')
		left top no-repeat;
	display: block;
	min-height: 23px;
	padding-left: 50px;
}

input[type=checkbox]:checked+label {
	background:
		url('https://lh3.googleusercontent.com/HtfShMuTVS5ellcvc4pNootlL8UKbR93Q6XHDDhcXmlxB6ImLN_A5WpYZSGDT_NJjPIK7MUl2jlwdFnD6RNYKak6bEYJ0X453PgqaNS_TEWp8Ck4fysY6Rx08jfENtWmpPETSqOeB3BoSLVuD8ZUdXlJ37ArYTmDbsCQA41zTuD1lT2m59ze9odMF2PB8FEQimdJtkyq1572ywgIdZwlimHTn3fgLK2OHza42kl22Wr4_JX1Ih1yEaqjQQTYS-5uGyiZat0SqRNoxdoYilsqcgQ0fLGiKjaPQb7gGbVjl1NFzfP5Mbyu7sOIQQ8sbRAZx63rNbD-fhvG5bLFuYulqyO6VBTBJ82KtumHkUV1ejR0sRn6hK-eFWJ7jvl1wnoqM3Ps6yFh7Jsl67r_9Yr5WF-nTwGYX979k0R7ZGmeL82tg2PGdzUlfiez6iuE6jByvEMsLC3QCLbUhA8-IY9pX-bi3b1YHq4jPk1Up5o1m15i1QuQk0fE4QuRNPBrd8L54bSjFF7mqmAdDwvC5y8wuj8O3GPYF5KA9AupDJIsE5C5-DcbkIhjvcBDaLHSpDq8KLI5BRUE9PunQl9GUrW3BdFagrJ1l79MmysIwewy_yGHRbnI=s23-no')
		left top no-repeat;
	padding-left: 50px;
}

.check_form {
	width: 800px;
	margin: 0 auto;
	position: relative;
}
</style>

<!-- parsley 유효성 검사 js.css -->
<script src="${path}/resources/js/parsley.min.js"></script>
<script src="${path}/resources/js/ko.js"></script>
<link href="${path}/resources/css/parsley.css" rel="stylesheet"type="text/css" />

</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="check_form">
	<form method="post" action="${path}/project/add" name="check_form" id="check_form" data-parsley-validate="" data-parsley-errors-messages-disabled="">
	
		<label class="heading">몇 가지 세부사항을 미리 확인하고, 프로젝트를 시작하세요.</label><br />
		
		<input type="checkbox" name="all_check" value="html" id="all_check">
		<label class="choice1" for="all_check">모두 동의하기</label><br />

		<input type="checkbox" name="check" value="1" id="1" data-parsley-mincheck="5"/>
		<label class="choice" for="1">펀딩 진행 중에는 제공할 리워드를 다른 온∙오프라인에서 펀딩하거나 판매하지 않습니다.</label><br />
		
		<input type="checkbox" name="check" value="2" id="2" data-parsley-required="true"/>
		<label class="choice" for="2">제공할 리워드는 현금, 지분 등의 수익이 아닌 제품 또는 서비스입니다.</label><br />
		
		<input type="checkbox" name="check" value="3" id="3" data-parsley-required="true"/>
		<label class="choice" for="3">진행할 프로젝트가 지적 재산권을 침해하지 않습니다.</label><br />
		
		<input type="checkbox" name="check" value="4" id="4" data-parsley-required="true"/>
		<label class="choice" for="4">서포터에게 프로젝트 진행 과정을 안내하고, 배송 약속을 지킬 수 있습니다.</label><br />
		
		<input type="checkbox" name="check" value="5" id="5" data-parsley-required="true"/>
		<label class="choice" for="5">서포터와의 신뢰를 위해 펀딩 진행∙제품 제작∙ 배송 등 모든 과정에서 겪는 어려움들을 서포터에게 진솔하게 전달하고 문제를 해결합니다.</label><br />
		
		<input type="hidden" name="mem_idx" value="${login.mem_idx}">
		<input type="submit"class="btn btn-default" value="다음으로">
	</form>
</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#check_form').parsley().on('field:validated', function() {
			var ok = $('.parsley-error').length === 0;
			$('.bs-callout-info').toggleClass('hidden', !ok);
			$('.bs-callout-warning').toggleClass('hidden', ok);
		}).on('form:submit', function() {
			return true;
		});
	});
	
	$("#all_check").click(function(){
        if($("#all_check").prop("checked")){
            $("input[name=check]:checkbox").prop("checked", "checked");
        }else{
            $("input[name=check]:checkbox").removeProp("checked");
        }
    });
</script>
</html>