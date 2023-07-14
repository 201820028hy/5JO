package bipa.bit.library.book.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bipa.bit.library.book.service.BookService;
import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.book.vo.CommentVO;
import bipa.bit.library.manager.service.BookManagerService;
import bipa.bit.library.utils.PageUtil;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private BookManagerService adminService;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		ArrayList<BookVO> bookList = adminService.asdminSelectAllList();
		
		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		int pageNo = pageNoStr == null || pageNoStr.isBlank() ? 1 : Integer.parseInt(pageNoStr);
		int pageSize = pageSizeStr == null || pageSizeStr.isBlank() ? 10 : Integer.parseInt(pageSizeStr);
		
		PageUtil page = PageUtil.getInstance(pageNo, pageSize, bookList);
		ArrayList<BookVO> pagingList = page.calculatorPage();
		int[] pages = page.getViewPages();
		model.addAttribute("bookList", pagingList);
		model.addAttribute("pages", pages);
		
		ArrayList<String> categorys = adminService.selectAllCategorys();
		model.addAttribute("categorys", categorys);
		
		return "./jsp/book/book_list";
	}

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("bookSeq") String bookSeq) {
		System.out.println("bookdetail");
		ModelAndView mav = new ModelAndView();
		
		BookVO book = adminService.detailBook(Integer.parseInt(bookSeq));
		ArrayList<CommentVO> list = service.searchBookComment(bookSeq);

		mav.addObject("book",book);
		mav.addObject("bookComment",list);
		mav.setViewName("./jsp/book/book_detail");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/detailAjax.do", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<ArrayList<CommentVO>> detailAjax(@RequestParam("bookSeq") String bookSeq) {
		System.out.println("detailAjax");

		ArrayList<CommentVO> list = service.searchBookComment(bookSeq);
		
		System.out.println(list.get(0).getInput_dt());
		return new ResponseEntity<ArrayList<CommentVO>>(list, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/commentRegist.do", method = RequestMethod.POST)
	public ModelAndView commentRegist(@ModelAttribute CommentVO comment) {
		ModelAndView mav = new ModelAndView();
		System.out.println("commentRegist");
		System.out.println(comment);
		service.registComment(comment);
		
		mav.setViewName("redirect:./detail.do?bookSeq="+comment.getBook_seq());
	
		return mav;
	}
	
	@RequestMapping(value = "/commentRegistAjax.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> commentRegistAjax(@ModelAttribute CommentVO comment) {
		System.out.println("commentRegistAjax");
		System.out.println(comment);
		boolean flag = false;
		flag = service.registComment(comment);
	
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateStar.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> updateStar(@RequestParam("bookStar") double bookStar, @RequestParam("bookSeq") int bookSeq) {
		boolean flag = false;
		
		System.out.println(bookStar + " and " + bookSeq);
		
		flag = adminService.updateBookStar(bookStar, bookSeq);
	
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateLike.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> updateLike(@RequestParam("bookSeq") int bookSeq) {
		boolean flag = false;
		
		System.out.println("seq : " + bookSeq);
		
		flag = adminService.updateBookLike(bookSeq);
	
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateDlike.do", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Boolean> updateDlike(@RequestParam("bookSeq") int bookSeq) {
		boolean flag = false;
		
		System.out.println("seq : " + bookSeq);
		
		flag = adminService.updateBookDlike(bookSeq);
	
		return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
	}
}
