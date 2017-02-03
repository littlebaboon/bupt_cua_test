package cn.cua.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import cn.cua.domain.CommentInfo;
import cn.cua.domain.ProductInfo;
import cn.cua.utils.HibernateUtils;

public class CommentDAO {
	private int commentAmount;
	public CommentInfo findById(Integer commentId){
				//通过id查找操作
				Configuration configuration = new Configuration().configure();
				SessionFactory sessionFactory = configuration.buildSessionFactory();
					
				Session session = sessionFactory.openSession();
				Transaction transaction = session.beginTransaction(); 
				
				CommentInfo commentInfo = (CommentInfo) session.get(CommentInfo.class,commentId);

				transaction.commit();
				session.close();
				return commentInfo;
	}
	
	public List<CommentInfo> findByUserName(String userName){
		//通过HQL查找操作
		try{
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from CommentInfo where userName=" + userName;
		Query query = session.createQuery(hql);	//获得query对象

		List<CommentInfo> commentInfos = query.list();	//执行查询		
		
		transaction.commit();
		session.close();
		return commentInfos;
		
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	
	public List<CommentInfo> findByProductId(Integer productId){
		//通过HQL查找操作
		try{
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		String hql="from CommentInfo where productId=" + productId;
		Query query = session.createQuery(hql);	//获得query对象

		List<CommentInfo> commentInfos = query.list();	//执行查询		

		transaction.commit();
		session.close();
		return commentInfos;
		
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	@Test
	public List<CommentInfo> commentInfoFindByHQL(String hql){
		//通过HQL查找操作
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
	

		Query query = session.createQuery(hql);	//获得query对象

		List<CommentInfo> commentInfos = query.list();	//执行查询		

		transaction.commit();
		session.close();
		return commentInfos;
	}
	

	public void add(CommentInfo commentInfo){
		//增加操作
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		session.save(commentInfo);
		transaction.commit();
		session.close();
	}
	
	
	/**
	 * 删除产品
	 * @param productId
	 */
	public void delete(int commentId) {
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			CommentInfo commentInfo = new CommentInfo();
			commentInfo.setCommentId(commentId);
			session.delete(commentInfo);
			tx.commit();
			session.close();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
	}
	@Test
	public void edit(CommentInfo commentInfo){
		//修改操作
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		session.update(commentInfo);
		transaction.commit();
		session.close();
	}
	/**
	 * 返回所有评论的数目
	 * @return
	 */
	public int getCommentAmount() {
		
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			
			String hql="from CommentInfo order by commentId";
			Query query = session.createQuery(hql);
			
			this.commentAmount = query.list().size();
			
			tx.commit();
			session.close();
			
			return this.commentAmount;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	/**
	 * 分页操作下返回所有评论
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<CommentInfo> findAll(int pageNum, int pageSize) {
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			
			String hql="from CommentInfo  order by commentId";
			Query query = session.createQuery(hql);
			query.setFirstResult((pageNum-1) * pageSize);
			query.setMaxResults(pageSize);
			List<CommentInfo> commentInfos= query.list();
			tx.commit();
			session.close();
			return commentInfos;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
	}
	/**
	 * 加载评论
	 * @param productId
	 * @return
	 */
	public CommentInfo load(int commentId) {
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			
			String hql = "from CommentInfo where commentId="+commentId;
			Query query = session.createQuery(hql);
			
			CommentInfo commentInfo = (CommentInfo)query.list().get(0);
			
			tx.commit();
			session.close();
			
			return commentInfo;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
	}
}
