package cn.cua.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import cn.cua.domain.AdminInfo;
import cn.cua.domain.BuserInfo;
import cn.cua.utils.HibernateUtils;

/**
 * @author GILC
 *
 */
public class BuserDAO {

	public BuserInfo findById(int buserId){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		BuserInfo buserInfo = (BuserInfo) session.get(BuserInfo.class, buserId);
		
		transaction.commit();
		sessionFactory.close();
		return buserInfo;
	}
	
	public List<BuserInfo> findByBusinessId(int businessId){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from BuserInfo where businessId='"+businessId+"'";
		Query query = session.createQuery(hql);	//获得query对象
		List<BuserInfo> buserInfos = query.list();	//执行查询	
		
		transaction.commit();
		sessionFactory.close();
		return buserInfos;
	}
	
	public List<BuserInfo> findByBuserName(String buserName){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from BuserInfo where buserName='"+buserName+"'";
		Query query = session.createQuery(hql);	//获得query对象
		List<BuserInfo> buserInfos = query.list();	//执行查询	
		
		transaction.commit();
		sessionFactory.close();
		return buserInfos;
	}
	
	public List<BuserInfo> findAll(int pageNum, int pageSize){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "from BuserInfo";
		Query query = session.createQuery(hql);
		
		query.setFirstResult((pageNum-1)*pageSize);
		query.setMaxResults(pageSize);
		
		List<BuserInfo> buserInfos = query.list();
		
		transaction.commit();
		session.close();
		return buserInfos;
	}
	
	public List<BuserInfo> findAll(int pageNum, int pageSize,int businessId){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "from BuserInfo where businessId="+businessId;
		Query query = session.createQuery(hql);
		
		query.setFirstResult((pageNum-1)*pageSize);
		query.setMaxResults(pageSize);
		
		List<BuserInfo> buserInfos = query.list();
		
		transaction.commit();
		session.close();
		return buserInfos;
	}
	
	public List<BuserInfo> buserInfoFindByHQL(String hql){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
	
		Query query = session.createQuery(hql);	

		List<BuserInfo> buserInfos = query.list();		

		transaction.commit();
		session.close();
		return buserInfos;
	}
	
	public void add(BuserInfo buserInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(buserInfo);
		transaction.commit();
		session.close();
	}
	
	public void delete(int buserId){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		BuserInfo buserInfo = new BuserInfo();
		buserInfo.setBuserId(buserId);
		session.delete(buserInfo);
		transaction.commit();
		session.close();
	}
	
	public void update(BuserInfo buserInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(buserInfo);
		transaction.commit();
		session.close();
	}
	
	
	
	//与admin info类似的DAO实现
	public BuserInfo load(int buserId){
		//通过id查找操作
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		//int id=adminId;
		BuserInfo buserInfo = (BuserInfo) session.get(BuserInfo.class,buserId);
		
		

		transaction.commit();
		session.close();
		return buserInfo;
	}
	
	
	//获取数量
	public int getBuserAmount(){
		//通过HQL查找操作
			try{
			Session session = HibernateUtils.openSession();
			Transaction transaction = session.beginTransaction(); 
			
			String hql="from BuserInfo";
			Query query = session.createQuery(hql);	//获得query对象	

			List<BuserInfo> buserInfos = query.list();	//执行查询		
			
			transaction.commit();
			session.close();
			return buserInfos.size();
			
			}catch(Exception e){
				throw new RuntimeException(e);
			}
	}
	
	
	
	public void edit(BuserInfo buser){
		//修改操作
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		session.update(buser);
		transaction.commit();
		session.close();
	}
	
	
	public int getQueryAmount(BuserInfo buserInfo){
		//组合查询	
			Session session = HibernateUtils.openSession();
			Transaction transaction = session.beginTransaction(); 
			
			Criteria criteria = session.createCriteria(BuserInfo.class);
			
			//int buserId = buserInfo.getBuserId();
			
			String buserName = buserInfo.getBuserName();
			
			
			if(buserName != null && !buserName.trim().isEmpty()){
				criteria.add(Restrictions.eq("buserName", buserName));
			}
			

			
			List<BuserInfo> buserInfos = criteria.list();
			
			
			for(int i=0;i<buserInfos.size();i++){
			}
			
			transaction.commit();
			session.close();
			
			return buserInfos.size();
	}
	
	
	public List<BuserInfo> query(BuserInfo buserInfo,int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(BuserInfo.class);
			
		String buserName = buserInfo.getBuserName();
		
		if(buserName != null && !buserName.trim().isEmpty()){
			criteria.add(Restrictions.eq("buserName", buserName));
		}
		
		
		criteria.setFirstResult((pageNum-1)*pageSize);
		criteria.setMaxResults(pageSize);
		
		List<BuserInfo> buserInfos = criteria.list();
		
		
		for(int i=0;i<buserInfos.size();i++){
		}
		
		transaction.commit();
		session.close();
		
		return buserInfos;
	}
	
	
	
}
