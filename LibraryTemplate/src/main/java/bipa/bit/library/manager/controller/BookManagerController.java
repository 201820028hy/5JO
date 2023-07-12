package bipa.bit.library.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.manager.service.BookManagerService;

@Controller("BookManagerController")
@RequestMapping("/manage")
public class BookManagerController {
	@Autowired
	private BookManagerService service;
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView registBook(@ModelAttribute("book") BookVO book) {
		ModelAndView mav = new ModelAndView();
		
		boolean flag = false;
		flag = service.registBook(book);
		
		mav.addObject("result", flag);
		mav.setViewName("redirect:/book/list.do");
		
		return mav;
	}
}
