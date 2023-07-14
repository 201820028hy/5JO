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
                                    <!-- <th>출판사</th> -->
                                    <th>출판일</th>
                                    <th>분류</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${list}">
	                                <tr>
	                                    <td class="content-td-area"><input type="checkbox" class="delete-checkbox" name=""></td>
	                                    <td class="content-td-area book-id">${list.bookSeq}</td>
	                                    <td class="content-td-area">${list.bookIsbn}</td>
	                                    <td class="content-td-area"><a href="detail.do?bookSeq=${list.bookSeq }">${list.bookTitle}</a></td>
	                                    <td class="content-td-area">${list.bookAuthor}</td>
	                                    <!-- <td>${list.bookPublisher}</td> -->
										<td class="content-td-area"><fmt:formatDate value="${list.bookPublishDate}" pattern="yyyy-MM-dd"/> </td>
	                                    <td class="content-td-area">${list.bookCategory}</td>
	                                    <td class="content-td-area"><a href=""><i class="fa-solid fa-square-pen"></i></a></td>
	                                </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- <div class="page-controller">
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
                    </div> -->
                    <div class="page-controller">
					    <c:if test="${currentPage > 1}">
					        <a href="?pageNo=${currentPage - 1}">이전</a>
					    </c:if>
					    <ul class="page-numbers">
						    <c:forEach var="pageNumber" begin="1" end="${totalPage}">
						        <c:choose>
						            <c:when test="${pageNumber == currentPage}">
						                <li class="active" data-page="${pageNumber}"><a href="javascript:void(0)">${pageNumber}</a></li>
						            </c:when>
						            <c:otherwise>
						                <li data-page="${pageNumber}"><a href="javascript:void(0)" onclick="showPage(${pageNumber})">${pageNumber}</a></li>
						            </c:otherwise>
						        </c:choose>
						    </c:forEach>
						</ul>

					    <c:if test="${currentPage < totalPage}">
					        <a href="?pageNo=${currentPage + 1}">다음</a>
					    </c:if>
					</div>

                </div>
            </div>
        </main>
    </div>
    <script>
	    window.onload = () => {
	    	  DeleteApi.getInstance().deleteBookButtonOnclickEvent();
	    }
	    
	    function showPage(pageNumber) {
	        // 서버에서 해당 페이지 번호에 해당하는 데이터를 가져와서 페이지에 표시하는 로직을 구현
	        // 필요한 경우 AJAX 요청을 사용하여 비동기적으로 데이터를 가져올 수 있음
	        // 예시:
	        location.href = "?pageNo=" + pageNumber; // 페이지 이동 방식으로 구현하는 예시
	    }
	    
	    class DeleteApi {
	    	  static #instance = null;
	    	  static getInstance() {
	    	    if(this.#instance == null) {
	    	      this.#instance = new DeleteApi();
	    	    }
	    	    return this.#instance;
	    	  }
	    	  
	    	  deleteBookButtonOnclickEvent() {
	    		    const deleteButtonBox = document.querySelector('.delete-button');
	    		    
	    		    deleteButtonBox.onclick = () => {
	    		        const confirmMessage = "정말 삭제하시겠습니까?";
	    		        if (confirm(confirmMessage)) {
	    		            const deleteCheckboxes = document.querySelectorAll('.delete-checkbox:checked');
	    		            const deleteParams = [];
	    		            
	    		            
	    		            deleteCheckboxes.forEach((checkbox) => {
	    		                const row = checkbox.closest('tr');
	    		                const bookSeq = row.querySelector('.book-id').textContent;
	    		                const bookIsbn = row.querySelector('td:nth-child(3)').textContent;
	    		                deleteParams.push({ bookSeq, bookIsbn });
	    		                console.log("deleteParams: " + JSON.stringify(deleteParams));
	    		            });
	    		            
	    		            deleteParams.forEach((params) => {
	    		            	console.log("params: " + JSON.stringify(params));
	    		                const url = "remove.do?bookSeq=" + params.bookSeq+"&bookIsbn=" + params.bookIsbn;
	    		                location.href = url;
	    		            });
	    		        }
	    		    }
	    		}


	    }
    </script>
</body>

</html>
