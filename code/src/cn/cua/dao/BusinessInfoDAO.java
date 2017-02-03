package cn.cua.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import cn.cua.domain.UserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.utils.HibernateUtils;

/**
 * @author GILC
 *
 */
public class BusinessInfoDAO {

	public BusinessInfo findById(int businessId){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		BusinessInfo businessInfo = (BusinessInfo) session.get(BusinessInfo.class, businessId);
		
		transaction.commit();
		sessionFactory.close();
		return businessInfo;
	}
	
	public List<BusinessInfo> findByBusinessName(String businessName){
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from BusinessInfo where businessName='"+businessName+"'";
		Query query = session.createQuery(hql);	//获得query对象
		List<BusinessInfo> businessInfos = query.list();	//执行查询	
		
		transaction.commit();
		sessionFactory.close();
		return businessInfos;
	}
	
	public List<BusinessInfo> findAll(int pageNum, int pageSize){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		
		String hql = "from BusinessInfo";
		Query query = session.createQuery(hql);
		
		query.setFirstResult((pageNum-1)*pageSize);
		query.setMaxResults(pageSize);
		
		List<BusinessInfo> businessInfos = query.list();
		
		transaction.commit();
		session.close();
		return businessInfos;
	}
	
	public List<BusinessInfo> businessInfoFindByHQL(String hql){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
	
		Query query = session.createQuery(hql);	

		List<BusinessInfo> businessInfos = query.list();		

		transaction.commit();
		session.close();
		return businessInfos;
	}
	
	public Integer add(BusinessInfo businessInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		Integer businessId = (Integer) session.save(businessInfo);
		transaction.commit();
		session.close();
		return businessId;
	}
	
	public void delete(int businessId){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		BusinessInfo businessInfo = new BusinessInfo();
		businessInfo.setBusinessId(businessId);
		session.delete(businessInfo);
		transaction.commit();
		session.close();
	}
	
	public void update(BusinessInfo businessInfo){
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(businessInfo);
		transaction.commit();
		session.close();
	}
	
}
