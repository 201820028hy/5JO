window.onload = () => {
  BookService.getInstance().loadBookList();
  BookService.getInstance().loadCategories();
  ComponentEvent.getInstance().addClickEventSearchButton();
  ComponentEvent.getInstance().addClickEventDeleteButton();
  ComponentEvent.getInstance().addClickEventDeleteCheckAll();
}

let searchObj = {
  page: 5,
  category: "",
  searchValue: "",
  order: "bookId",
  limit: "Y",
  count: 20
}

class BookSearchApi {
  static #instance = null;
  static getInstance() {
    if(this.#instance == null) {
      this.#instance = new BookSearchApi();
    }
    return this.#instance;
  }

  getBookList(searchObj) {
    let returnData = null;

    $.ajax({
      async: false,
      type: "get",
      url: "http://localhost:8000/api/admin/books",
      data: searchObj,
      dataType: "json",
      success: response => {
        console.log(response);
        returnData = response.data;
      },
      error: error => {
        console.log(error);
      }
    });
    return returnData;
  }

  getBookTotalCount(searchObj) {
    let returnData = null;

    $.ajax({
      async: false,
      type: "get",
      url: "http://localhost:8000/api/admin/books/totalcount",
      data: {
        "category": searchObj.category,
        "searchValue": searchObj.searchValue
      },
      dataType: "json",
      success: response => {
        console.log(response);
        returnData = response.data;
      },
      error: error => {
        console.log(error);
      }
    });
    return returnData;
  }

  getCategories() {
    let returnData = null;
    $.ajax({
      async: false,
      type: "get",
      url: "http://localhost:8000/api/admin/categories",
      dataType: "json",
      success: response => {
        console.log(response);
        returnData = response.data;
      },
      error: error => {
        console.log(error);
      }
    });
    return returnData;
  }

  deleteBooks(deleteArray) {
    let returnFlag = false;
    $.ajax({
      async: false,
      type: "delete",
      url: "http://localhost:8000/api/admin/books",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(
        {userIds: deleteArray}
      ),
      dataType: "json",
      success: response => {
        returnFlag = true;
      },
      error: error => {
        console.log(error);
      }
    });
    return returnFlag;
  }
}

class BookService {
  static #instance = null;
  static getInstance() {
    if(this.#instance == null) {
      this.#instance = new BookService();
    }
    return this.#instance;
  }

  loadBookList() {
    const responseData = BookSearchApi.getInstance().getBookList(searchObj);
    const checkAll = document.querySelector(".delete-checkall");
    checkAll.checked = false;

    const bookListBody = document.querySelector(".content-table tbody");
    bookListBody.innerHTML = "";

    responseData.forEach((data, index) => {
      bookListBody.innerHTML += `
        <tr>
          <td><input type="checkbox" class="delete-checkbox"></td>
          <td class="book-id">${data.bookId}</td>
          <td>${data.bookCode}</td>
          <td><a href="">${data.bookName}</a></td>
          <td>${data.author}</td>
          <td>${data.publisher}</td>
          <td>${data.publicationDate}</td>
          <td>${data.category}</td>
          <td>${data.rentalStatus == "Y" ? "대여중" : "대여가능"}</td>
          <td><a href="/templates/admin/book_modification.html?bookCode=${data.bookCode}"><i class="fa-solid fa-square-pen"></i></a></td>
        </tr>
      `;
    });
    this.loadSearchNumberList();
    ComponentEvent.getInstance().addClickEventDeleteCheckbox();
  }

  loadSearchNumberList() { 
    
    const pageController = document.querySelector(".page-controller");
    pageController.innerHTML = "";
    
    const totalCount = BookSearchApi.getInstance().getBookTotalCount(searchObj);
    const maxPageNumber = totalCount % searchObj.count == 0
                        ? Math.floor(totalCount / searchObj.count) 
                        : Math.floor(totalCount / searchObj.count) + 1;

    
    
    pageController.innerHTML = `
        <a href="javascript:void(0)" class="pre-button disabled">이전</a>
        <ul class="page-numbers">
        </ul>
        <a href="javascript:void(0)" class="next-button disabled">다음</a>
    `;

    if(searchObj.page != 1) {
      const preButton = pageController.querySelector(".pre-button");
      preButton.classList.remove("disabled");

      preButton.onclick = () => {
        searchObj.page--;
        this.loadBookList();
      }
    }

    if(searchObj.page != maxPageNumber) {
      const nextButton = pageController.querySelector(".next-button");
      nextButton.classList.remove("disabled");

      nextButton.onclick = () => {
        searchObj.page++;
        this.loadBookList();
      }
    }

    const startIndex = searchObj.page % 5 == 0 ? searchObj.page - 4 : searchObj.page - (searchObj.page % 5) + 1;
    const endIndex = startIndex + 4 <= maxPageNumber ? startIndex + 4 : maxPageNumber;
    const pageNumbers = document.querySelector(".page-numbers");

    for(let i = startIndex; i <= endIndex; i++) {
      pageNumbers.innerHTML += `
      <a href="javascript:void(0)" class="page-button ${i == searchObj.page ? "disabled" : ""}"><li>${i}</li></a>
      `;
    }

    const pageButtons = document.querySelectorAll(".page-button");
    pageButtons.forEach(button => {
      const pageNumber = button.textContent;
      if(pageNumber != searchObj.page) {
        button.onclick = () => {
          searchObj.page = pageNumber;
          this.loadBookList();
        }
      }
    });
  }

  loadCategories() {
    const responseData = BookSearchApi.getInstance().getCategories();
    const categorySelect = document.querySelector(".category-select");
    categorySelect.innerHTML = `<option value="">전체조회</option>`;

    responseData.forEach(data => {
      categorySelect.innerHTML += `
        <option value="${data.category}">${data.category}</option>
      `;
    });
  }

  removeBooks(deleteArray) {
    let successFlag = BookSearchApi.getInstance().deleteBooks(deleteArray);

    if(successFlag) {
      searchObj.page = 1;
      this.loadBookList();
    }
  }
}

class ComponentEvent {
  static #instance = null;
  static getInstance() {
    if(this.#instance == null) {
      this.#instance = new ComponentEvent();
    }
    return this.#instance;
  }

  addClickEventSearchButton() {
    const categorySelect = document.querySelector(".category-select");
    const searchInput = document.querySelector(".search-input");
    const searchButton = document.querySelector(".search-button");

    searchButton.onclick = () => {
      searchObj.category = categorySelect.value;
      searchObj.searchValue = searchInput.value;

      searchObj.page = 1;

      BookService.getInstance().loadBookList();
    }

    searchInput.onkeyup = () => {
      if(window.event.keyCode == 13) {
        searchButton.click();
      }
    }
  }

  addClickEventDeleteButton() {
    const deleteButton = document.querySelector(".delete-button");
    deleteButton.onclick = () => {
      if(confirm("정말로 삭제하시겠습니까?")) {
        const deleteArray = new Array();
  
        const deleteCheckboxes = document.querySelectorAll(".delete-checkbox");
        deleteCheckboxes.forEach((deleteCheckbox, index) => {
          if(deleteCheckbox.checked) {
            console.log(deleteCheckbox.checked + ": index -> " + index);
  
            const bookIds = document.querySelectorAll(".book-id");
            console.log("bookId: " + bookIds[index].textContent);
  
            deleteArray.push(bookIds[index].textContent);
          }
        });
  
        BookService.getInstance().removeBooks(deleteArray);
      }
    }
  }

  addClickEventDeleteCheckAll() {
    const checkAll = document.querySelector(".delete-checkall");
    checkAll.onclick = () => {
      const deleteCheckboxes = document.querySelectorAll(".delete-checkbox");
      deleteCheckboxes.forEach(deleteCheckbox => {
        deleteCheckbox.checked = checkAll.checked;
      });
    }
  }

  addClickEventDeleteCheckbox() {
    const deleteCheckboxes = document.querySelectorAll(".delete-checkbox");
    const checkAll = document.querySelector(".delete-checkall");

    deleteCheckboxes.forEach(deleteCheckbox => {
      deleteCheckbox.onclick = () => {
        const deleteCheckedCheckboxes = document.querySelectorAll('.delete-checkbox:checked');
        console.log("선택: " + deleteCheckedCheckboxes.length);
        console.log("해제: " + deleteCheckboxes.length);
        if(deleteCheckedCheckboxes.length == deleteCheckboxes.length) {
          checkAll.checked = true;
        } else {
          checkAll.checked = false;
        }
      }
    })

  }
}
