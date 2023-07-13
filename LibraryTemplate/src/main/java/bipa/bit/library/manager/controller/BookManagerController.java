package bipa.bit.library.manager.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.manager.service.BookManagerService;

@Controller("BookManagerController")
@RequestMapping("/manage")
public class BookManagerController {
	@Autowired
	private BookManagerService service;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		ArrayList<BookVO> list = service.asdminSelectAllList();
		model.addAttribute("list", list);
		
		return "./jsp/manager/book_search";
	}
	
	/* 혜윤 개발 시작 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detailView(Model model, @RequestParam("bookSeq") int bookSeq) {
		BookVO book = new BookVO();
		
		book = service.detailBook(bookSeq);
		System.out.println("detail book info : " + book.toString());
		book.setBookContent(book.getBookContent().replaceAll("\r\n", "<br/>"));
		model.addAttribute("book", book);
		
		return "./jsp/manager/book_detail";
	}
	
	@RequestMapping(value = "/regist_view.do", method = RequestMethod.GET)
	public String registView(Model model) {
		ArrayList<String> list = service.selectAllCategorys();
		model.addAttribute("categorys", list);
		return "./jsp/manager/book_regist";
	}
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> registBook(BookVO book) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("regist book info : " + book.toString());
		
		boolean flag = false;
		
		BookVO findBook = service.detailBook(book.getBookIsbn());
		if(findBook != null) {
			return new ResponseEntity<Boolean>(flag, HttpStatus.FOUND);
		}
		
		flag = service.registBook(book);
		mav.addObject("result", flag);
		
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/update_view.do", method = RequestMethod.GET)
	public String updateView(Model model, @RequestParam("bookSeq") int bookSeq) {
		BookVO book = new BookVO();
		
		book = service.detailBook(bookSeq);
		System.out.println("detail book info : " + book.toString());
		//book.setBookContent(book.getBookContent().replaceAll("\r\n", "<br/>"));
		model.addAttribute("book", book);
		
		ArrayList<String> list = service.selectAllCategorys();
		model.addAttribute("categorys", list);
		
		return "./jsp/manager/book_update";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> updateBook(BookVO book) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("update book info : " + book.toString());
		
		boolean flag = false;
		
		flag = service.updateBook(book);
		mav.addObject("result", flag);
		
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
}
