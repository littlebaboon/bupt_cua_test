package cn.cua.service;


import java.util.List;
import cn.cua.dao.UserInfoDAO;
import cn.cua.domain.UserInfo;

public class UserService {
	private UserInfoDAO userDao = new UserInfoDAO();
	
	public UserInfo findUserById(Integer userId){
		return userDao.findById(userId);
	}
	
	public UserInfo login(String loginName,String userPassword) throws UserException{
		/**
		 * 1.通过用户名查找用户
		 */
		List<UserInfo> userList = userDao.findByUserName(loginName);
		
		/**
		 * 2.判断user是否存在，如果不存在，抛出异常
		 */
		if(userList.size() == 0){
			throw new UserException("用户名不存在");
		}
/*		if(user == null){
			throw new UserException("用户名不存在");
		}*/
		
		/**
		 * 3.如果user存在，再使用参数userPassword，与查询到的user的我userPassword比较
		 * 4.如果相同，说明登陆成功，返回user对象
		 * 5.如果不同，说明密码错误，抛出异常
		 */
		UserInfo user = userList.get(0);
		if(userPassword.equals(user.getUserPasswd())){
			return user;
		}else{
			throw new UserException("密码错误");
		}
	}
}
