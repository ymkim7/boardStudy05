package kr.co.service;

import java.util.List;

import kr.co.vo.MenuVO;

public interface menuService {
	
	public List<MenuVO> getMenuList() throws Exception;
	
	public int saveMenu(MenuVO menuVO) throws Exception;
	
	public int updateMenu(MenuVO menuVO) throws Exception;
	
	public int deleteMenu(String code) throws Exception;

}
