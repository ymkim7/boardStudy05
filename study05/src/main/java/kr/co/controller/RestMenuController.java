package kr.co.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.menuService;
import kr.co.vo.MenuVO;

@RestController
@RequestMapping("/restMenu")
public class RestMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestMenuController.class);
	
	@Autowired
	private menuService service;
	
	@RequestMapping(value = "/getMenuList", method = RequestMethod.POST)
	public Map<String, Object> getMenuList() throws Exception {
		logger.info("getMenuList");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			result.put("menuList", service.getMenuList());
			result.put("status", "OK");
		} catch(Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping(value = "/saveMenu", method = RequestMethod.POST)
	public Map<String, Object> saveMenu(MenuVO menuVO) throws Exception {
		logger.info("saveMenu");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			service.saveMenu(menuVO);
			result.put("status", "OK");
		} catch(Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
	public Map<String, Object> updateMenu(MenuVO menuVO) throws Exception {
		logger.info("updateMenu");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			service.updateMenu(menuVO);
			result.put("status", "OK");
		} catch(Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
	public Map<String, Object> deleteMenu(@RequestParam("code") String code) throws Exception {
		logger.info("deleteMenu");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			service.deleteMenu(code);
			result.put("status", "OK");
		} catch(Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		
		return result;
	}

}
