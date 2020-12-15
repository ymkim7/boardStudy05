package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.menuService;
import kr.co.vo.MenuVO;

@Controller
@RequestMapping("/menu")
public class menuController {
	
	private static final Logger logger = LoggerFactory.getLogger(menuController.class);
	
	@Autowired
	private menuService service;
	
	@RequestMapping(value = "/getMenu", method = RequestMethod.GET)
	public String getMenuList(Model model) throws Exception {
		logger.info("getMenuList");
		
		model.addAttribute("menuVO", new MenuVO());
		
		return "menu/menu";
	}

}
