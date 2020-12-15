package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<UserVO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("user.getUserList");
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("user.getUserInfo", uid);
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert("user.insertUser", userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.update("user.updateUser", userVO);
	}

	@Override
	public int deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sql.delete("user.deleteUser", uid);
	}

}
