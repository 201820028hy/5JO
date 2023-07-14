<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 조회</title>
<link rel="stylesheet" href="../resources/css/reset.css" />
<link rel="stylesheet" href="../resources/css/common.css" />
<link rel="stylesheet" href="../resources/css/adminBookModification.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div id="container">
        <header class="header-container">
            <h1 class="brand-logo"><a href="../book/list.do?pageNo=1&pageSize=12">BipaLibrary</a></h1>
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
              <a href="regist_view.do"><li>도서 정보 등록</li></a>
            </ul>
          </nav>
        </aside>
        <div class="content-container">
          <h1 class="content-title">도서 정보</h1>
          <div class="content-main">
          	<form id="fm_regist" style="width: 100%; display: flex; height: 100%;">
	            <div class="content-left">
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">도서코드</label>
	                <p>${book.bookIsbn }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">도서명</label>
	                <p>${book.bookTitle }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">저자</label>
	                <p>${book.bookAuthor }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">출판사</label>
	                <p>${book.bookPublisher }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">출판일</label>
	                <p>${book.bookPublishDate }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">분류</label>
	                <p>${book.bookCategory }</p>
	              </div>
	              <div class="item-group item-group-dashed">
	                <label class="modification-label">줄거리</label>
	                <p>${book.bookContent }</p>
	              </div>
	              <button class="modification-button" type="button" onclick="window.location.href = 'update_view.do?bookSeq=${book.bookSeq}'">수정하기</button>
	            </div>
	            <div class="content-right">
	                <div class="img-container">
	                	<c:choose>
	                		<c:when test="${not empty book.bookImg }">
	                			<img src="${book.bookImg }" class="book-img" id="book_thumb">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="../resources/images/no_image.png" class="book-img" id="book_thumb">
	                		</c:otherwise>
	                	</c:choose>
	                </div>
	            </div>
	           </form>
          </div>
        </div>
      </main>
    </div>
</body>
</html>