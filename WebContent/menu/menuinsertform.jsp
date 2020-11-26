<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h2>메뉴 추가 화면</h2>
  <form>
    <div class="menuform">
      <label for="menuname">메뉴이름</label>
      <input type="text" class="form-control" id="menuname"  name="menuname">
    </div>
    <div class="menuform">
      <label for="menuprice">가격</label>
      <input type="text" class="form-control" id="menuprice"  name="menuprice">
    </div>
    <div class="menuform">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>



</body>
</html>