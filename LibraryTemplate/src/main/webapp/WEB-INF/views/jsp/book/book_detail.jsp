<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet" href="../resources/css/reset.css" />
<link rel="stylesheet" href="../resources/css/common.css" />
<link rel="stylesheet" href="../resources/css/bookDetailPost.css" />

</head>
<body>
<script>
let flag = true;

let hiddenPass;

$(document).ready(function(){
   commentLoad();
   
   $(".posted-content").click(function(){
	   alert($('.posted-content').index(this))
   });
   
});

/* function commentClick(){
   if(flag){
      $('.hidden-user-info-area').css('display', "");
   }
} */

function commentUpdate(){  
   alert("update.do?userId=" + $('#comment_id').val() + "&comment_intro=" + $('#comment_intro').text() + "&comment_intro_new=" + $('#comment_intro_update').val());
   $.ajax({
         type:"get",
         url:"update.do?cmtSeq=" + $('#cmtSeq').val() + "&comment_intro_new=" + $('#comment_intro_update').val(),
         contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
         success: function(data){
            console.log(data);
            flag = true;
            commentLoad();
         }
     })
}


function commentDelete(){
   $.ajax({
         type:"get",
         url:"delete.do?cmtSeq=" + $('#cmtSeq').val(),
         contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
         success: function(data){
         console.log(data);
         flag = true;
         commentLoad();
         }
     })
}


function commentClick(element) {
	
     let comment = element.nextElementSibling;
    
  	   let comment2 = element.nextElementSibling.innerHTML;
		let parser = new DOMParser();
		let htmlDoc = parser.parseFromString(comment2, 'text/html');
		let cmtSeqInput = htmlDoc.getElementById('cmtSeq');
	    cmtSeqValue = cmtSeqInput.value;
	    
	    let passInput = comment.querySelector('#hidden-post-password2');
	    
	    passInput.addEventListener('input', function() {
	    	  hiddenPass = passInput.value;
	    	});
	    
     
     
     if (comment.style.display === "none" && flag) {
        comment.style.display = "block";
        
     } else {
        comment.style.display = "none";
     }
     
     
     
   }

   function PWCheck() {
	   
      $.ajax({
           type:"POST",
           url:"getPW.do?cmtSeq="+cmtSeqValue,
           success: function(data){
      	   		//console.log(data);
      	   		console.log(cmtSeqValue);
      	   		console.log(hiddenPass);
        	   if(data == hiddenPass){
        		   console.log($('#cmtSeq').val());
        		   $('.hidden-user-info-area').css('display', 'none');
                  $('#updateButton').show();
                  $('#deleteButton').show();
                  $('#comment_intro_update').show();
                  $('#comment_intro').css('display', 'none');
                  flag = false;
                  
               }
           }
       })
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
                 flag=true;
              }
           },
           error:function(error){
              console.log("error")
              alert("에러가 발생했습니다.");
           }
       })
      
   }



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
        		comment.push("<input style='display:none' id='comment_id' value='"+ item.user_id +"'>");
        		comment.push("<h1 class='post-userid-area'>"+ item.user_id +"</h1>");
          		comment.push("<div class='post-story'><p id='comment_intro'>"+ item.cmt_cntn +"</p>");
        		comment.push("<input id='comment_intro_update' style='display:none' value='"+ item.cmt_cntn +"'>");
        		comment.push("<button style='display:none' id='updateButton' onclick='commentUpdate()'>수정</button>");
        		comment.push("<button style='display:none' id='deleteButton' onclick='commentDelete()'>삭제</button>");
        		comment.push("</div></div><div class='posted-right'>");
        		comment.push("<h1>"+ formatted_date +"</h1></div></div>");
        		comment.push("<div class='hidden-user-info-area' style='display: none'>");
        	 	comment.push("<form action='' method='post'>"); 
        		comment.push("<input type='hidden' id='cmtSeq' name='cmt_seq' value='"+ item.cmt_seq +"'/>");
        		comment.push("<div class='hidden-userid'>");
        	/*  comment.push("<span class='hidden-userid-title'>아이디 입력: </span>"); */
        	/* 	comment.push("<input type='text' class='hidden-post-userid' placeholder='id를 입력하세요.'>"); */
        		comment.push("</div><div class='hidden-password'>");
        		comment.push("<span class='hidden-password-title'>비밀번호 입력: </span>");
        		comment.push("<input type='text' id='hidden-post-password2' value='' class='hidden-post-password' placeholder='pwd를 입력하세요.'></div>");
        		comment.push("<div class='hidden-button'>");
        		comment.push("<button type='button' onclick='PWCheck()'>확인</button>");
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


	
	function changeStar() {
		$.ajax({
			url: "updateStar.do",
			method: "post",
			async: false,
			data: "bookStar="+(parseFloat($("#book_star").val()) + parseFloat($("input[name='starpoint']:checked").val()))+"&bookSeq="+$("#book_seq").val(),
			success: function(response) {
				if(response) {
					alert("성공적으로 반영되었습니다.")
					window.location.reload();
				} else {
					alert("반영에 실패했습니다.");
				}
			},
			error: function(error) {
				alert("에러가 발생했습니다.");
			},
			beforeSend: function() {
			}
		})
	}
	
	function updateLike() {
		$.ajax({
			url: "updateLike.do",
			method: "post",
			async: false,
			data: "bookSeq="+$("#book_seq").val(),
			success: function(response) {
				if(response) {
					//alert("성공적으로 반영되었습니다.")
					window.location.reload();
				} else {
					alert("반영에 실패했습니다.");
				}
			},
			error: function(error) {
				alert("에러가 발생했습니다.");
			}
		})
	}
	
	function updateDlike() {
		$.ajax({
			url: "updateDlike.do",
			method: "post",
			async: false,
			data: "bookSeq="+$("#book_seq").val(),
			success: function(response) {
				if(response) {
					//alert("성공적으로 반영되었습니다.")
					window.location.reload();
				} else {
					alert("반영에 실패했습니다.");
				}
			},
			error: function(error) {
				alert("에러가 발생했습니다.");
			}
		})
	}
	
</script>
	<div id="container">
		<header class="header-container">
			<h1 class="brand-logo">
				<a href="list.do?pageNo=1&pageSize=10">BipaLibrary</a>
			</h1>
			<!-- <ul class="menu-container">
				<li><a href="">도서관이용안내</a></li>
				<li><a href="">자료검색·이용</a></li>
				<li><a href="">나의도서관</a></li>
			</ul>
			<ul class="account-container">
				<li><a href="/login">로그인</a></li>
				<li><a href="/register">회원가입</a></li>
			</ul> -->
		</header>
		<main class="main-container">
			<!-- COMMIT TEST 15:12 -->
			<div class="content-container">
				<div class="content-up">
					<h1 class="content-title">상세 페이지</h1>
					<div class="info-container">
						<div class="img-container">
							<c:choose>
								<c:when test="${empty book.bookImg }">
									<img src="../resources/images/no_image.png" class="book-img">
								</c:when>
								<c:otherwise>
									<img src="${book.bookImg }" class="book-img">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="right-contents">
							<div class="right-contents-upside">
								<div class="book-info">
									<div class="info-text book-title">
										<b>책 제목: </b>${book.bookTitle }
									</div>
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
									<div class="info-text book-star">
										<b>별점: </b>
										<div class="star-icon-area">
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
											<%-- <fmt:formatNumber type="number" var="fmtStar" pattern="0.0" value="${ ((calStar*10) - ((calStar*10)%1)) * (1/10)   } " /> --%>
											<c:if test="${book.bookStar > 0 }">
												${fn:substring(calStar, 0,4) }점
											</c:if>
										</div>
									</div>
								</div>
								<div class="like-and-dislike">
									<i class="fa-solid fa-thumbs-up"></i><span>${book.bookLike }</span>
									<i class="fa-solid fa-thumbs-down"></i><span>${book.bookDlike }</span>
								</div>
							</div>
							<div class="right-contents-bottomside">
								<div class="bottom-title">
									<p>책 소개: </p>
								</div>
								<div class="bottom-story">
									<p>${book.bookContent }</p>
								</div>
							</div>
						</div>
					</div>
					<div class="favorite-area">
						<div class="favorite-box">
							<div class="favorite-star">
								<span class="favorite-star-title">별점 주기: </span>
								<div class="favorite-star-flex">
									  	<input type="hidden" id="book_star" name="bookStar" value="${book.bookStar }"/>
									  	<input type="hidden" id="book_star_cnt" name="bookStartCnt" value="${book.bookStartCnt }"/>
										<!-- <i class="fa-solid fa-star" id="star1" onmouseover="changeStart(this, 'in')" onmouseleave="changeStart(this, 'out')"></i>
										<i class="fa-solid fa-star" id="star1" onmouseover="changeStart(this, 'in')" onmouseleave="changeStart(this, 'out')"></i>
										<i class="fa-solid fa-star" id="star1" onmouseover="changeStart(this, 'in')" onmouseleave="changeStart(this, 'out')"></i>
										<i class="fa-solid fa-star" id="star1" onmouseover="changeStart(this, 'in')" onmouseleave="changeStart(this, 'out')"></i>
										<i class="fa-solid fa-star" id="star1" onmouseover="changeStart(this, 'in')" onmouseleave="changeStart(this, 'out')"></i> -->
										<div class="starpoint_wrap">
										  <div class="starpoint_box">
										    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
										    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
										    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
										    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
										    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
										    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
										    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
										    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
										    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
										    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
										    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio" value="0.5" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value="1.0" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value="1.5" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value="2.0" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value="2.5" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value="3.0" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio" value="3.5" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value="4.0" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value="4.5" onclick="changeStar()">
										    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value="5.0" onclick="changeStar()">
										    <span class="starpoint_bg"></span>
										  </div>
										</div>
								</div>
							</div>
							<div class="favorite-like-dislike-area">
								<i class="fa-solid fa-thumbs-up" id="favorite-thumbs-up" onclick="updateLike()"></i><span>${book.bookLike }</span>
								<i class="fa-solid fa-thumbs-down" id="favorite-thumbs-down" onclick="updateDlike()"></i><span>${book.bookDlike }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="content-down">
					<h1 class="content-title">댓글</h1>
					<div class="post-create-area">
						<form action="" method="post" id="post-create-form">
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