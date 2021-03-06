package kr.co.service;

import java.util.List;

import kr.co.vo.UserVO;

public interface UserService {
	
	public List<UserVO> getUserList() throws Exception;
	
	public UserVO getUserInfo(String uid) throws Exception;
	
	public int insertUser(UserVO userVO) throws Exception;
	
	public int updateUser(UserVO userVO) throws Exception;
	
	public int deleteUser(String uid) throws Exception;

}
