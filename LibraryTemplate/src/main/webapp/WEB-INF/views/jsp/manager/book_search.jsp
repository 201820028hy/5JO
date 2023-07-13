<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin BookList</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBookList.css" />

</head>

<body>
    <div id="container">
        <header class="header-container">
            <h1 class="brand-logo"><a href="">BipaLibrary</a></h1>
            <ul class="menu-container">
                <li><a href="">도서관이용안내</a></li>
                <li><a href="">자료검색·이용</a></li>

                <li><a href="">나의도서관</a></li>
            </ul>
            <ul class="account-container">
                <li><a href="">로그인</a></li>
                <li><a href="">회원가입</a></li>
            </ul>
        </header>
        <main class="main-container">
            <aside class="left-aside">
                <div class="aside-title">
                    <h1 class="title-text-h1">관리자 시스템</h1>
                </div>
                <nav class="main-menu">
                    <h2 class="title-text-h2">도서정보관리</h2>
                    <ul class="sub-menu">
                        <a href="">
                            <li>도서 정보 조회</li>
                        </a>
                        <a href="">
                            <li>도서 정보 등록</li>
                        </a>
                    </ul>
                    <h2 class="title-text-h2">회원정보관리</h2>
                    <ul class="sub-menu">
                        <a href="">
                            <li class="sub-menu-last">회원 정보 조회</li>
                        </a>
                    </ul>
                </nav>
            </aside>
            <div class="content-container">
                <h1 class="content-title">도서정보 조회</h1>
                <div class="content-main">
                    <div class="content-items">
                        <div class="left-items">
                            <button type="button" class="delete-button">삭 제</button>
                        </div>
                        <div class="right-items">
                            <select class="category-select">
                                <option value="">전체조회</option>
                                <option value="경제/경영">경제/경영</option>
                                <option value="소설">소설</option>
                                <option value="자기계발">자기계발</option>
                            </select>
                            <input type="search" class="search-input">
                            <button type="button" class="search-button">검색</button>
                        </div>
                    </div>
                    <div class="table-container">
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="delete-checkall"></th>
                                    <th>아이디</th>
                                    <th>도서코드</th>
                                    <th>도서명</th>
                                    <th>저자</th>
                                    <th>출판사</th>
                                    <th>출판일</th>
                                    <th>분류</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${list}">
	                                <tr>
	                                    <td><input type="checkbox" class="delete-checkbox"></td>
	                                    <td class="book-id">${list.bookSeq}</td>
	                                    <td>${list.bookIsbn}</td>
	                                    <td><a href="detail.do?bookSeq=${list.bookSeq }">${list.bookTitle}</a></td>
	                                    <td>${list.bookAuthor}</td>
	                                    <td>${list.bookPublisher}</td>
	                                    <td>${list.bookPublishDate}</td>
	                                    <td>${list.bookCategory}</td>
	                                    <td><a href=""><i class="fa-solid fa-square-pen"></i></a></td>
	                                </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="page-controller">
                        <a href="" class="disabled">이전</a>
                        <ul class="page-numbers">
                            <a href="">
                                <li>1</li>
                            </a>
                            <a href="">
                                <li>2</li>
                            </a>
                            <a href="">
                                <li>3</li>
                            </a>
                            <a href="">
                                <li>4</li>
                            </a>
                            <a href="">
                                <li>5</li>
                            </a>
                        </ul>
                        <a href="">다음</a>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>
