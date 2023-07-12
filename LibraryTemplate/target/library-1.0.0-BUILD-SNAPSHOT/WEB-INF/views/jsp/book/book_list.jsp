<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<link rel="stylesheet" href="../../css/reset.css" />
<link rel="stylesheet" href="/views/css/common.css" />
<link rel="stylesheet" href="/views/css/header.css" />
<link rel="stylesheet" href="/views/css/search/search.css" />


<script src="../../js/account/principal.js"></script>
<script src="../../js/component/header.js"></script>
<script src="../../js/search/search.js"></script>
</head>
<body>
	<div id="container">
		<header class="header-container"> </header>
		<main class="main-container">
			<h1 class="main-title">자료검색·이용</h1>
			<div class="option-container">
				<div class="category-group">
					<h2 class="category-title">카테고리</h2>
					<div class="category-list">
						<div class="category-item">
							<input type="checkbox" class="category-checkbox" id="소설"
								value="소설"> <label for="소설">소설</label>
						</div>
						<div class="category-item">
							<input type="checkbox" class="category-checkbox" id="아동"
								value="아동"> <label for="아동">아동</label>
						</div>
						<div class="category-item">
							<input type="checkbox" class="category-checkbox" id="경영/경제"
								value="경영/경제"> <label for="경영/경제">경영/경제</label>
						</div>
					</div>
				</div>

				<div class="search-container">
					<input type="search" class="search-input">
					<button type="button" class="search-button">검색</button>
				</div>
			</div>
			<div class="content-container">
				<h1 class="content-title">검색 결과</h1>
				<div class="content-flex">
					<div class="info-container">
						<div class="book-desc">
							<div class="img-container">
								<img src="/static/images/sample.jpg" class="book-img">
							</div>
							<div class="like-info">
								<i class="fa-regular fa-thumbs-up"></i><span class="like-count">999</span>
							</div>
						</div>
						<div class="book-info">
							<div class="book-code">소록-990</div>
							<h3 class="book-name">스프링 부트와 AWS로 혼자 구현하는 웹 서비스</h3>
							<div class="info-text book-author">
								<b>저자: </b>이동욱
							</div>
							<div class="info-text book-publisher">
								<b>출판사: </b>프리렉
							</div>
							<div class="info-text book-publicationdate">
								<b>출판일: </b>2023-01-31
							</div>
							<div class="info-text book-category">
								<b>카테고리: </b>기술/공학
							</div>
							<div class="book-buttons">
								<button type="button" class="rental-button">대여하기</button>
								<button type="button" class="like-button">추천하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>