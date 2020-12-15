package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImple implements UserService {
	
	@Autowired
	private UserDAO dao;

	@Override
	public List<UserVO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserList();
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserInfo(uid);
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateUser(userVO);
	}

	@Override
	public int deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteUser(uid);
	}

}
