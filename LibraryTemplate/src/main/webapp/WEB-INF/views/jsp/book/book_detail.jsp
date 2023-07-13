<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${path }/resources/css/reset.css" />
<link rel="stylesheet" href="${path }/resources/css/common.css" />
<link rel="stylesheet" href="${path }/resources/css/bookDetailPost.css" />

</head>
<body>
<script>
$(document).ready(function(){
	commentLoad();
});

function commentLoad(){
	
	$.ajax({
        url:'detailAjax.do?bookSeq='+$('#book_seq').val(),
        method:'GET',
        success: function(response){
        	let comment = [];
        	console.log(response)
        	$.each(response,function(i,item){
        		
        		let input_dt = item.input_dt;
        		let date = new Date(input_dt);
        		let formatted_date = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2) + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2) + ':' + ('0' + date.getSeconds()).slice(-2);
        		
        		comment.push("<div class='posted-content' onclick='commentClick(this)'>");
        		comment.push("<div class='posted-left'>");
        		comment.push("<h1 class='post-userid-area'>"+ item.user_id +"</h1>");
        		comment.push("<div class='post-story'>"+ item.cmt_cntn +"</div></div>");
        		comment.push("<div class='posted-right'>");
        		comment.push("<h1>"+ formatted_date +"</h1></div></div>");
        		comment.push("<div class='hidden-user-info-area' style='display: none'>");
        		comment.push("<form action='' method='post'>");
        		comment.push("<input type='hidden' name='cmt_seq' value='"+ item.cmt_seq +"'/>");
        		comment.push("<div class='hidden-userid'>");
        		comment.push("<span class='hidden-userid-title'>아이디 입력: </span>");
        		comment.push("<input type='text' class='hidden-post-userid' placeholder='id를 입력하세요.'></div>");
        		comment.push("<div class='hidden-password'>");
        		comment.push("<span class='hidden-password-title'>비밀번호 입력: </span>");
        		comment.push("<input type='text' class='hidden-post-password' placeholder='pwd를 입력하세요.'></div>");
        		comment.push("<div class='hidden-button'>");
        		comment.push("<button>확인</button>");
        		comment.push("</div></form></div>");
        		
        	})
        	
        	$("#comment_area").html(comment.join(""));
        },
        error:function(error){
        	console.log("error")
        	alert("에러가 발생했습니다.");
        }
    })
	
	
}


function commentClick(element) {

	  let comment = element.nextElementSibling;
	  
	  if (comment.style.display === "none") {
		  comment.style.display = "block";
	  } else {
		  comment.style.display = "none";
	  }
	}

	function PWCheck() {
		console.log($('.hidden-post-password').val());
	}
	
	function registComment(){
		
		$.ajax({
	        url:'commentRegistAjax.do',
	        method:'POST',
	        data:$("#post-create-form").serialize(),
	        success: function(response){
	        	if(response) {
	        		alert("성공적으로 저장되었습니다.");
	        		commentLoad();
	        	}
	        },
	        error:function(error){
	        	console.log("error")
	        	alert("에러가 발생했습니다.");
	        }
	    })
		
	}
	
</script>
	<div id="container">
		<header class="header-container">
			<h1 class="brand-logo">
				<a href="list.do">BipaLibrary</a>
			</h1>
			<ul class="menu-container">
				<li><a href="">도서관이용안내</a></li>
				<li><a href="">자료검색·이용</a></li>

				<li><a href="">나의도서관</a></li>
			</ul>
			<ul class="account-container">
				<li><a href="/login">로그인</a></li>
				<li><a href="/register">회원가입</a></li>
			</ul>
		</header>
		<main class="main-container">
			<!-- COMMIT TEST 15:12 -->
			<div class="content-container">
				<div class="content-up">
					<h1 class="content-title">상세 페이지</h1>
					<div class="info-container">
						<div class="img-container">
							<img src="${path }/resources/images/springboot_and_aws.jpg"
								class="book-img">
						</div>
						<div class="right-contents">
							<div class="right-contents-upside">
								<div class="book-info">
									<div class="info-text book-title">
										<b>책 제목: </b>스프링 부트와 AWS로 혼자 구현하는 웹 서비스
									</div>
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
									<div class="info-text book-star">
										<b>별점: </b>
										<div class="star-icon-area">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</div>
									</div>
								</div>
								<div class="like-and-dislike">
									<i class="fa-solid fa-thumbs-up"></i><span>906</span> <i
										class="fa-solid fa-thumbs-down"></i><span>3</span>
								</div>
							</div>
							<div class="right-contents-bottomside">
								<div class="bottom-title">
									<p>책 소개</p>
								</div>
								<div class="bottom-story">
									<p>: 가장 빠르고 쉽게 웹 서비스의 모든 과정을 경험한다.경험이 실력이 되는 순간!이 책은 제목 그대로
										스프링 부트와 AWS로 웹 서비스를 구현한다. JPA와 JUnit 테스트, 그레이들, 머스테치, 스프링
										시큐리티를 활용한 소셜 로그인 등으로 애플리케이션을 개발하고, 뒤이어 AWS 인프라의 기본 사용법과 AWS
										EC2와 RDS를 사용해 서비스가 가능하도록 한다. 이렇게 점진적으로 스프링 부트 프로젝트를 개선해서 배포
										자동화하고 무중단 배포까지 경험한다. 실무 현장에서의 노하우와 테스트 방법, 객체지향 프로그래밍 등을 소개하고
										다룬다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="favorite-area">
						<div class="favorite-box">
							<div class="favorite-star">
								<span class="favorite-star-title">별점 주기: </span>
								<div class="favorite-star-flex">
									<i class="fa-solid fa-star" id="star1"></i> <i
										class="fa-solid fa-star" id="star1"></i> <i
										class="fa-solid fa-star" id="star1"></i> <i
										class="fa-solid fa-star" id="star1"></i> <i
										class="fa-solid fa-star" id="star1"></i>
								</div>
							</div>
							<div class="favorite-like-dislike-area">
								<i class="fa-solid fa-thumbs-up" id="favorite-thumbs-up"></i> <i
									class="fa-solid fa-thumbs-down" id="favorite-thumbs-down"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="content-down">
					<h1 class="content-title">댓글</h1>
					<div class="post-create-area">
						<form action="commentRegist.do" method="post" id="post-create-form">
							<div id="post-create-login">
							
							<input type="hidden" id="book_seq" name="book_seq" value="${param.bookSeq}"/>
						
								<div class="hidden-userid">
									<span class="hidden-userid-title">아이디 입력: </span> <input id="user_id" name="user_id"
										type="text" class="hidden-post-userid"
										placeholder="id를 입력하세요.">
								</div>
								<div class="hidden-password">
									<span class="hidden-password-title">비밀번호 입력: </span> <input id="pwd" name="pwd"
										type="text" class="hidden-post-password"
										placeholder="pwd를 입력하세요.">
								</div>
							</div>
							<div class="post-create">
								<div class="post-create-title">
									<p>댓글 작성:</p>
								</div>
								<input id="cmt_cntn" name="cmt_cntn" type="text" class="post-input-box" id="post-input"
									placeholder="...내용을 입력해주세요">
								<div class="review-area">
								<!-- 	<button type="submit" class="post-create-button">댓글 등록</button> -->
									<button onclick="registComment()" type="button" class="post-create-button">댓글 등록2</button>
								</div>
							</div>
						</form>
					</div>

					<div id="comment_area" class="posted-user-content-area">

						<%-- <c:forEach var="comment" items="${bookComment}">
							<div class="posted-content" onclick='commentClick(this)'>
								<div class="posted-left">
									<h1 class="post-userid-area">${comment.user_id}</h1>
									<div class="post-story">${comment.cmt_cntn}</div>
								</div>
								<div class="posted-right">
									<h1>${comment.input_dt}</h1>
								</div>
							</div>
							<div class="hidden-user-info-area" style="display: none">
							<form action="" method="post"> 
							<input type="hidden" name="cmt_seq" value="${comment.cmt_seq}" />
									<div class="hidden-userid">
										<span class="hidden-userid-title">아이디 입력: </span> <input
											type="text" class="hidden-post-userid"
											placeholder="id를 입력하세요.">
									</div>
									<div class="hidden-password">
										<span class="hidden-password-title">비밀번호 입력: </span> <input
											type="text" class="hidden-post-password"
											placeholder="pwd를 입력하세요.">
									</div>
									<div class="hidden-button">
										<button>확인</button>
									</div>
								</form> 
							</div>
							
						</c:forEach> --%>

					</div>


				</div>
			</div>
	</main>
</div>
	
</body>
</html>