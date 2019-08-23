<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <!-- include summernote css/js -->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</head>

<body>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-3 col-md-2" style="">
          <ul class="nav nav-pills flex-column">
            <li class="nav-item"> <a href="" class="nav-link" data-toggle="pill" data-target="#tabone">기본 정보</a> </li>
            <li class="nav-item" style=""> <a class="nav-link" href="" data-toggle="pill" data-target="#tabtwo">리워드</a> </li>
            <li class="nav-item" > <a href="" class="nav-link" data-toggle="pill" data-target="#tabthree">스토리</a> </li>
            <li class="nav-item"> <a href="" class="nav-link active" data-toggle="pill" data-target="#tabfour">메이커</a> </li>
          </ul>
        </div>
        <div class="col-9 col-md-9" style="">
          <div class="tab-content">
            <div class="tab-pane fade" id="tabone" role="tabpanel">
              <form class="text-left">
                <div class="form-group"> <label for="form16">Your Name</label> <input type="text" class="form-control" id="form16" placeholder="Johann W. Goethe"> </div>
                <div class="form-group"> <label for="form17">Your Company</label> <input type="text" class="form-control" id="form17" placeholder="Werther Inc."> </div>
                <div class="form-group"> <label for="form18">Your email</label> <input type="email" class="form-control" id="form18" placeholder="j.goethe@werther.com"> </div>
                <div class="form-row">
                  <div class="form-group col-md-6"> <label for="form19">Password</label> <input type="password" class="form-control" id="form19" placeholder="••••"> </div>
                  <div class="form-group col-md-6"> <label for="form20">Confirm Password</label> <input type="password" class="form-control" id="form20" placeholder="••••"> </div>
                </div>
                <div class="form-group">
                  <div class="form-check"> <input class="form-check-input" type="checkbox" id="form21" value="on"> <label class="form-check-label" for="form21"> I Agree with <a href="#">Term and Conditions</a> of the service </label> </div>
                </div> <button type="submit" class="btn btn-primary">저장하기</button>
              </form>
            </div>
            <div class="tab-pane fade" id="tabtwo" role="tabpanel">
              <form class="text-left">
                <div class="form-group"> <label for="form16">Your Name</label> <input type="text" class="form-control" id="form16" placeholder="Johann W. Goethe"> </div>
                <div class="form-group"> <label for="form17">Your Company</label> <input type="text" class="form-control" id="form17" placeholder="Werther Inc."> </div>
                <div class="form-group"> <label for="form18">Your email</label> <input type="email" class="form-control" id="form18" placeholder="j.goethe@werther.com"> </div>
                <div class="form-row">
                  <div class="form-group col-md-6"> <label for="form19">Password</label> <input type="password" class="form-control" id="form19" placeholder="••••"> </div>
                  <div class="form-group col-md-6"> <label for="form20">Confirm Password</label> <input type="password" class="form-control" id="form20" placeholder="••••"> </div>
                </div>
                <div class="form-group">
                  <div class="form-check"> <input class="form-check-input" type="checkbox" id="form21" value="on"> <label class="form-check-label" for="form21"> I Agree with <a href="#">Term and Conditions</a> of the service </label> </div>
                </div> <button type="submit" class="btn btn-primary">저장하기</button>
              </form>
            </div>
            <div class="tab-pane fade active show" id="tabthree" role="tabpanel">
              <form class="text-left">
                <div class="form-group"> <label for="form16">YouTube 동영상 링크</label> <input type="text" class="form-control" id="form16" placeholder="동영상을 등록하지 않으면 메인사진이 올라갑니다"> </div>
                <div class="form-group"> <label for="form17">간단한 설명</label> <input type="text" class="form-control" id="form17" placeholder="프로젝트에 대한 간단한 설명을 해주세요"> </div>
                <div class="form-group" style=""> 스토리<br>
                  <textarea cols="30" id="summernote" name="pro_content" rows="10" style="width:825px; height:400px;"></textarea><br>
                </div>
                <button type="submit" class="btn btn-primary">저장하기</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-1" style=""><a class="btn btn-outline-primary" href="#">Outline</a></div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
</body>

</html>