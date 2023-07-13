package bipa.bit.library.book.controller;

import java.util.ArrayList;

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

import com.fasterxml.jackson.annotation.JsonFormat;

import bipa.bit.library.book.service.BookService;
import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.book.vo.CommentVO;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService service;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		ArrayList<BookVO> list = service.selectAllList();
		model.addAttribute("list", list);
		
		return "./jsp/book/book_list";
	}

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("bookSeq") String bookSeq) {
		System.out.println("bookdetail");
		ModelAndView mav = new ModelAndView();
		ArrayList<CommentVO> list = service.searchBookComment(bookSeq);
		
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
}
