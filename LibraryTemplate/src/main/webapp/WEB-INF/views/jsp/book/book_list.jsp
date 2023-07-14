<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
  integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
/>
<link rel="stylesheet" href="../resources/css/reset.css" />
<link rel="stylesheet" href="../resources/css/common.css" />
<link rel="stylesheet" href="../resources/css/header.css" />
<link rel="stylesheet" href="../resources/css/userSearch.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- <script src="${path }/resources/js/account/principal.js"></script>
<script src="${path }/resources/js/component/header.js"></script>
<script src="${path }/resources/js/search/search.js"></script> --%>
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
						<c:forEach items="${categorys }" var="page">
							<div class="category-item">
								<input type="checkbox" class="category-checkbox" id="${page }" value="${page }">
								<label for="${page }">${page }</label>
							</div>
						</c:forEach>
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
					<c:forEach items="${list }" var="book">
						<div class="info-container">
							<div class="book-desc">
								<div class="img-container" onclick="window.location.href = 'detail.do?bookSeq=${book.bookSeq }'" style="cursor: pointer;">
									<c:choose>
										<c:when test="${empty book.bookImg }">
											<img src="../resources/images/no_image.png" class="book-img">
										</c:when>
										<c:otherwise>
											<img src="${book.bookImg }" class="book-img">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="like-info">
									<i class="fa-regular fa-thumbs-up"></i><span class="like-count">${book.bookLike }</span>
								</div>
							</div>
							<div class="book-info">
								<div class="book-code">${book.bookIsbn }</div>
								<a href="detail.do?bookSeq=${book.bookSeq }"><h3 class="book-name">${book.bookTitle }</h3></a>
								<div class="info-text book-author">
									<b>저자: </b>${book.bookAuthor }
								</div>
								<div class="info-text book-publisher">
									<b>출판사: </b>${book.bookPublisher }
								</div>
								<div class="info-text book-publicationdate">
									<b>출판일: </b>${book.bookPublishDate }
								</div>
								<div class="info-text book-category">
									<b>카테고리: </b>${book.bookCategory }
								</div>
								<div class="info-text book-category">
									<b>별점: </b>
									<c:choose>
										<c:when test="${book.bookStar > 0 }">
											<fmt:formatNumber value="${book.bookStartCnt}" pattern="#.#" var="starCnt"/>
											<c:set value="${book.bookStar / starCnt }" var="calStar"/>
											<c:forEach begin="1" end="5" step="1" var="star">
												<c:choose>
													<c:when test="${star <= calStar }">
														<i class="fa-solid fa-star"></i>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${calStar % (star-1) < 1.0 && calStar % (star-1) != 0.0 }"><!--  || star - (calStar % star) <= 0.5 -->
															<i class="fa-solid fa-star-half-stroke"></i>
															</c:when>
															<c:otherwise>
																<i class="fa-regular fa-star"></i>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<i class="fa-regular fa-star"></i>
											<i class="fa-regular fa-star"></i>
											<i class="fa-regular fa-star"></i>
											<i class="fa-regular fa-star"></i>
											<i class="fa-regular fa-star"></i>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="page-controller">
                    <a href="list.do?pageNo=${currentPage > 1 ? currentPage - 1 : 1 }&pageSize=${param.pageSize}" <c:if test="${currentPage <= 1 }">class="disabled"</c:if>>이전</a>
                    <ul class="page-numbers">
						    <c:forEach var="pageNumber" begin="1" end="${totalPage}">
								<li><a href="list.do?pageNo=${pageNumber }&pageSize=${param.pageSize}" <c:if test="${pageNumber == currentPage }">class="selected"</c:if>>${pageNumber }</a></li> 
							</c:forEach>
                    </ul>
                    <a href="list.do?pageNo=${currentPage < totalPage ? param.pageNo + 1 : param.pageNo }&pageSize=${param.pageSize}" <c:if test="${pages[param.pageNo + 1] < 1 }">class="disabled" disabled</c:if>>다음</a>
                </div>
			</div>
		</main>
	</div>
</body>
</html>