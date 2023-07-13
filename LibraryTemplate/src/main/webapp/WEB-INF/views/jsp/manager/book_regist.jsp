<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
<link rel="stylesheet" href="../resources/css/reset.css" />
<link rel="stylesheet" href="../resources/css/common.css" />
<link rel="stylesheet" href="../resources/css/adminBookModification.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function registBook() {
		$.ajax({
			url: "regist.do",
			method: "post",
			async: false,
			data: $("#fm_regist").serialize(),
			success: function(response) {
				if(response) {
					alert("성공적으로 저장했습니다.");
					window.location.href = "list.do";
				}
			},
			error: function(error) {
				console.log(error);
				alert("저장에 실패했습니다.");
			},
			beforeSend: function( xhr ) {
				$("#book_published_date").val($("#book_published_date").val() + " 00:00:00.0");
			}
		});
	}
	
	function addImage(ele) {
		$("#book_img").val("");
		$("#book_thumb").attr("src", "");
		let file = ele.files[0];
		let reader = new FileReader();
		reader.onloadend = () => {
			$("#book_img").val(reader.result);
			$("#book_thumb").attr("src", reader.result);
		};
		reader.readAsDataURL(file);
	}
</script>
</head>
<body>
	<div id="container">
        <header class="header-container">
            <h1 class="brand-logo"><a href="">BipaLibrary</a></h1>
        </header>
      <main class="main-container">
        <aside class="left-aside">
          <div class="aside-title">
            <h1 class="title-text-h1">관리자 시스템</h1>
          </div>
          <nav class="main-menu">
            <h2 class="title-text-h2">도서정보관리</h2>
            <ul class="sub-menu">
              <a href="list.do"><li>도서 목록</li></a>
              <a href="#"><li>도서 정보 등록</li></a>
            </ul>
          </nav>
        </aside>
        <div class="content-container">
          <h1 class="content-title">도서 정보 등록</h1>
          <div class="content-main">
          	<form id="fm_regist" style="width: 100%; display: flex; height: 100%;">
	            <div class="content-left">
	              <div class="item-group">
	                <label class="modification-label">도서코드</label>
	                <input type="text" class="modification-input" id="book_isbn" name="bookIsbn">
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">도서명</label>
	                <input type="text" class="modification-input" id="book_title" name="bookTitle">
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">저자</label>
	                <input type="text" class="modification-input" id="book_author" name="bookAuthor">
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">출판사</label>
	                <input type="text" class="modification-input" id="book_publisher" name="bookPublisher">
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">출판일</label>
	                <input type="date" class="modification-input" id="book_published_date" name="bookPublishDate">
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">분류</label>
	                <select class="modification-input category-select" id="book_category" name="bookCategory">
	                	<c:forEach items="${categorys }" var="cate">
	                		<option value="${cate }">${cate }</option>
	                	</c:forEach>
	                </select>
	                <div class="error-message"></div>
	              </div>
	              <div class="item-group">
	                <label class="modification-label">줄거리</label>
	                <textarea rows="10" cols="" id="book_content" name="bookContent"></textarea>
	                <div class="error-message"></div>
	              </div>
	              <button class="modification-button" type="button" onclick="registBook()">등록</button>
	            </div>
	            <div class="content-right">
	              	<input type="hidden" id="book_img" name="bookImg"/>
	                <input type="file" class="img-file" id="book_file" accept=".png, .PNG, .jpg, .JPG, .jpeg, .JPEG" onchange="addImage(this)">
	                <button type="button" class="img-add-button" onclick="$('#book_file').click()">+도서 이미지 추가</button>
	                <div class="img-container">
	                  <img src="../resources/images/no_image.png" class="book-img" id="book_thumb">
	                </div>
	                <%-- <div class="button-group">
	                  <button type="button" class="img-modification-button">이미지 수정</button>
	                  <button type="button" class="img-cancel-button">취소</button>
	                </div> --%>
	            </div>
	           </form>
          </div>
        </div>
      </main>
    </div>
</body>
</html>