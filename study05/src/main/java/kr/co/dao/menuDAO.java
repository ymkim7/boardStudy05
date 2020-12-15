package kr.co.dao;

import java.util.List;

import kr.co.vo.MenuVO;

public interface menuDAO {
	
	public List<MenuVO> getMenuList() throws Exception;
	
	public int saveMenu(MenuVO menuVO) throws Exception;
	
	public int updateMenu(MenuVO menuVO) throws Exception;
	
	public int deleteMenu(String code) throws Exception;

}
