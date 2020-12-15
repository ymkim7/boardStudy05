package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.MenuVO;

@Repository
public class menuDAOImpl implements menuDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<MenuVO> getMenuList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("menu.getMenuList");
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert("menu.insertMenu", menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.update("menu.updateMenu", menuVO);
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		// TODO Auto-generated method stub
		return sql.delete("menu.deleteMenu", code);
	}

}
