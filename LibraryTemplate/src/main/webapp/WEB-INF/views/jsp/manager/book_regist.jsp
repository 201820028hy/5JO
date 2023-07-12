<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
<link rel="stylesheet" href="${path }/resources/css/reset.css" />
<link rel="stylesheet" href="${path }/resources/css/common.css" />
<link rel="stylesheet" href="${path }/resources/css/header.css" />
<link rel="stylesheet" href="${path }/resources/css/admin/admin_common.css" />
<link rel="stylesheet" href="${path }/resources/css/admin/left_aside.css" />
<link rel="stylesheet" href="${path }/resources/css/admin/book_register.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path }/resources/js/admin/book_register.js"></script>
</head>
<body>
	<div id="container">
		<header class="header-container">
			<h1 class="brand-logo">
				<a href="/index">시립 도서관</a>
			</h1>
			<%-- <ul class="menu-container">
				<li><a href="">도서관이용안내</a></li>
				<li><a href="">자료검색·이용</a></li>
				<li><a href="">참여마당</a></li>
				<li><a href="">독서공감</a></li>
				<li><a href="">책으로 행복한 청주</a></li>
				<li><a href="">도서관소개</a></li>
				<li><a href="">작은도서관</a></li>
				<li><a href="">나의도서관</a></li>
			</ul>
			<ul class="account-container">
				<li><a href="/account/login">로그인</a></li>
				<li><a href="/account/register">회원가입</a></li>
			</ul> --%>
		</header>
		<main class="main-container">
			<aside class="left-aside">
				<div class="aside-title">
					<h1 class="title-text-h1">관리자 시스템</h1>
				</div>
				<nav class="main-menu">
					<h2 class="title-text-h2">도서정보관리</h2>
					<ul class="sub-menu">
						<a href="./list.do"><li>도서 목록</li></a>
						<a href="./regist_view.do"><li>도서 정보 등록</li></a>
					</ul>
					<%-- <h2 class="title-text-h2">회원정보관리</h2>
					<ul class="sub-menu">
						<a href=""><li class="sub-menu-last">회원 정보 조회</li></a>
					</ul> --%>
				</nav>
			</aside>
			<div class="content-container">
				<h1 class="content-title">도서 정보 등록</h1>
				<div class="content-main">
					<div class="content-left">
						<div class="item-group">
							<label class="register-label">도서코드</label>
							<input type="text" class="register-input">
							<div class="error-message"></div>
						</div>
						<div class="item-group">
							<label class="register-label">도서명</label>
							<input type="text" class="register-input">
							<div class="error-message"></div>
						</div>
						<div class="item-group">
							<label class="register-label">저자</label>
							<input type="text" class="register-input">
							<div class="error-message"></div>
						</div>
						<div class="item-group">
							<label class="register-label">출판사</label>
							<input type="text" class="register-input">
							<div class="error-message"></div>
						</div>
						<div class="item-group">
							<label class="register-label">출판일</label>
							<input type="date" class="register-input">
							<div class="error-message"></div>
						</div>
						<div class="item-group">
							<label class="register-label">분류</label>
							<select class="register-input category-select">
							</select>
							<div class="error-message"></div>
						</div>
						<button class="register-button">등록하기</button>
					</div>
					<div class="content-right">
						<form class="img-form">
							<input type="file" name="file" class="img-file">
							<button type="button" class="img-add-button" disabled>+</button>
							<div class="img-container">
								<img src="${path }/resources/images/no_image.png" class="book-img">
							</div>
							<div class="button-group">
								<button type="button" class="img-register-button" disabled>이미지 등록</button>
								<button type="button" class="img-cancel-button" disabled>취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>