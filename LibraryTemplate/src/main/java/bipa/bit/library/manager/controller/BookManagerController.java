package bipa.bit.library.manager.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bipa.bit.library.book.vo.BookVO;
import bipa.bit.library.manager.service.BookManagerService;
import bipa.bit.library.utils.PageUtil;

@Controller("BookManagerController")
@RequestMapping("/manage")
public class BookManagerController {
	@Autowired
	private BookManagerService service;
	
//	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
//	public String list(Model model) {
//		ArrayList<BookVO> list = service.asdminSelectAllList();
//		model.addAttribute("list", list);
//		
//		return "./jsp/manager/book_search";
//	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
	    ArrayList<BookVO> list = service.asdminSelectAllList();
	    
	    // PageUtil을 사용하여 페이징 처리
	    int pageSize = 12; // 한 페이지에 보여줄 항목 수
	    PageUtil pageUtil = PageUtil.getInstance(pageNo, pageSize, list);
	    ArrayList<BookVO> paginatedList = pageUtil.calculatorPage();
	    int[] viewPages = pageUtil.getViewPages();
	    int totalPage = pageUtil.getTotalPage();
	    
	    model.addAttribute("list", paginatedList);
	    model.addAttribute("viewPages", viewPages);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("currentPage", pageNo);
	    
	    return "./jsp/manager/book_search";
	}

	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView registBook(@ModelAttribute("book") BookVO book) {
		ModelAndView mav = new ModelAndView();
		
		boolean flag = false;
		flag = service.registBook(book);
		
		mav.addObject("result", flag);
		mav.setViewName("redirect:list.do");
		
		return mav;
	}
	
	@RequestMapping(value="/remove.do", method=RequestMethod.GET)
	public ModelAndView delete(String bookSeq, String bookIsbn) {
	    ModelAndView mav = new ModelAndView();
	    
	    // 빈 문자열인지 확인
	    if (bookSeq.isEmpty() || bookIsbn.isEmpty()) {
	        // 예외 처리 또는 오류 메시지 반환
	        // ...
	        return mav;
	    }
	    
	    service.removeBook(bookSeq, bookIsbn);
	    
	    System.out.println("remove book Successfully!");

	    mav.setViewName("redirect:list.do");

	    return mav;
	}

}
