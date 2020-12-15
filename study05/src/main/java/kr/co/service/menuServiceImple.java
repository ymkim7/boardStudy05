package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.menuDAO;
import kr.co.vo.MenuVO;

@Service
public class menuServiceImple implements menuService {
	
	@Autowired
	private menuDAO dao;

	@Override
	public List<MenuVO> getMenuList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getMenuList();
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.saveMenu(menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateMenu(menuVO);
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteMenu(code);
	}

}
