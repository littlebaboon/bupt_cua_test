package cn.cua.service;


import java.util.List;

import cn.cua.dao.BuserDAO;
import cn.cua.domain.BuserInfo;

public class BuserService {
	private BuserDAO buserDao = new BuserDAO();
	
	public BuserInfo findBuserById(Integer buserId){
		return buserDao.findById(buserId);
	}
	
	public BuserInfo login(String loginName,String buserPassword) throws BuserException{
		/**
		 * 1.通过用户名查找用户
		 */
		List<BuserInfo> buserList = buserDao.findByBuserName(loginName);
		
		/**
		 * 2.判断business是否存在，如果不存在，抛出异常
		 */
		if(buserList.size() == 0){
			throw new BuserException("用户名不存在");
		}
/*		if(business == null){
			throw new BusinessException("用户名不存在");
		}*/
		
		/**
		 * 3.如果business存在，再使用参数businessPassword，与查询到的business的我businessPassword比较
		 * 4.如果相同，说明登陆成功，返回business对象
		 * 5.如果不同，说明密码错误，抛出异常
		 */
		BuserInfo buser = buserList.get(0);
		if(buserPassword.equals(buser.getBuserPasswd())){
			return buser;
		}else{
			throw new BuserException("密码错误");
		}
	}
	
	/**
	 * 分页操作，得到管理员总数
	 * @return
	 */
	public int getBuserAmount(){
		return buserDao.getBuserAmount();
	}
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<BuserInfo> findAll(int pageNum,int pageSize, Integer businessId){
		return buserDao.findAll(pageNum, pageSize, businessId);
	}
	
	/**
	 * 增加管理员信息
	 * @param admin
	 * @throws AdminException 
	 */
	public void add(BuserInfo buser) throws BuserException{
		
		List<BuserInfo> buserList = buserDao.findByBuserName(buser.getBuserName());
		String message = null;

		if (buserList.size() != 0) {
			if(message != null){
				message = "1";//"登录名已存在，请更换登录名！" ;
			}
		}
		if (message!=null)
			throw new BuserException(message);
		buserDao.add(buser);
	}
	
	/**
	 *  修改功能的加载操作
	 * @param adminId
	 * @return
	 */
	public BuserInfo load(int buserId){
		return buserDao.findById(buserId);
	}
	

	public void edit(BuserInfo buser) throws BuserException{
		
		List<BuserInfo> buserList = buserDao.findByBuserName(buser.getBuserName());
		String message = null;
//		if(buserNumberList.size() != 0 && buserNumberList.get(0).getAdminId() != buser.getAdminId()){
//			message = "1";//"管理员编号已存在，请更换编号！";
//			//throw new AdminException("管理员编号已存在，请更换编号！");
//		}
		if (buserList.size() != 0 && buserList.get(0).getBuserId() != buser.getBuserId()) {
			if(message != null){
				message = "3";//"#登录名已存在，请更换登录名！" ;
			}
		}
		if (message!=null)
			throw new BuserException(message);
		buserDao.edit(buser);
	}
//	/**
//	 * 删除操作
//	 * @param adminId
//	 */
	public void delete(int buserId){
		buserDao.delete(buserId);
	}
//	
//	/**
//	 * 组合查询分页操作，得到管理员总数
//	 * @return
//	 */
	public int getQueryAmount(BuserInfo buserInfo){
		return buserDao.getQueryAmount(buserInfo);
	}
//	
//	/**
//	 * 组合查询功能
//	 * @param adminInfo
//	 * @return
//	 */
	public List<BuserInfo> query(BuserInfo buserInfo,int pageNum,int pageSize){
		return buserDao.query(buserInfo, pageNum, pageSize);
	}
	
}
