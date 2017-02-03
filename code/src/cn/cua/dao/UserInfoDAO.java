package cn.cua.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import cn.cua.domain.AdminInfo;
import cn.cua.domain.ThemeInfo;
import cn.cua.domain.UserInfo;
import cn.cua.utils.HibernateUtils;

/**
 * @author Catherine
 *
 */
public class UserInfoDAO {

	public UserInfo findById(int userId){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		UserInfo userInfo = (UserInfo) session.get(UserInfo.class, userId);
		
		transaction.commit();
		sessionFactory.close();
		return userInfo;
	}
	
	public List<UserInfo> findByUserName(String userName){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from UserInfo where userName='"+userName+"'";
		Query query = session.createQuery(hql);	//获得query对象
		List<UserInfo> userInfos = query.list();	//执行查询	
		
		transaction.commit();
		sessionFactory.close();
		return userInfos;
	}
	
	public List<UserInfo> findAll(int pageNum, int pageSize){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "from UserInfo";
		Query query = session.createQuery(hql);
		
		query.setFirstResult((pageNum-1)*pageSize);
		query.setMaxResults(pageSize);
		
		List<UserInfo> userInfos = query.list();
		
		transaction.commit();
		session.close();
		return userInfos;
	}
	
	public List<UserInfo> userInfoFindByHQL(String hql){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
	
		Query query = session.createQuery(hql);	

		List<UserInfo> userInfos = query.list();		

		transaction.commit();
		session.close();
		return userInfos;
	}
	
	public void add(UserInfo userInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(userInfo);
		transaction.commit();
		session.close();
	}
	
	public void delete(int userId){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		UserInfo userInfo = new UserInfo();
		userInfo.setUserId(userId);
		session.delete(userInfo);
		transaction.commit();
		session.close();
	}
	
	public void update(UserInfo userInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(userInfo);
		transaction.commit();
		session.close();
	}
	
}
