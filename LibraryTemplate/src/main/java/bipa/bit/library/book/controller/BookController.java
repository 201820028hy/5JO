package bipa.bit.library.book.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bipa.bit.library.book.service.BookService;
import bipa.bit.library.book.vo.BookVO;

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
	public ModelAndView detail(@RequestParam String bookSeq) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("./jsp/book/book_detail");
		
		return mav;
	}
}
