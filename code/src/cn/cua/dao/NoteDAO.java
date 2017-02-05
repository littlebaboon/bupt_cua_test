package cn.cua.dao;

import java.util.List;

import org.hibernate.Session;

import cn.cua.domain.NoteInfo;
import cn.cua.domain.UserInfo;
import cn.cua.utils.HibernateUtils;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class NoteDAO {
	
	public NoteInfo findByNoteId(int noteId){

		try{
			Configuration configuration = new Configuration().configure();
			SessionFactory sessionFactory = configuration.buildSessionFactory();
				
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction(); 
			NoteInfo noteInfo = (NoteInfo)session.get(NoteInfo.class, noteId);
			transaction.commit();
			sessionFactory.close();
			return noteInfo;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查询所有商家的ID为businessId的未读留言
	 * @param businessId
	 * @return
	 */
	public List<NoteInfo> findUnReadNoteByBusinessId(int businessId){
		try{	
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			StringBuilder hql = new StringBuilder("from NoteInfo where businessId='"+ businessId+"'");
			hql.append("and status = 0");
			Query query  = session.createQuery(hql.toString());
			List<NoteInfo> noteInfo = query.list(); 
			tx.commit();
			session.close();
			return noteInfo;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询所有商家的ID为businessId的已读留言
	 * @param businessId
	 * @return
	 */	
	public List<NoteInfo> findReadNoteByBusinessId(int businessId){
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			StringBuilder hql = new StringBuilder("from NoteInfo where businessId='"+ businessId+"'");
			hql.append("and status = 1");
			Query query = session.createQuery(hql.toString());
			List<NoteInfo> noteInfo = query.list();
			tx.commit();
			session.close();
			return noteInfo;
			
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	

	
	/**
	 * 查询所有商家的ID为businessId的所有留言
	 * @param businessId
	 * @return
	 */
	public List<NoteInfo> findAllNoteByBusinessId(int businessId){
		try{	
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			StringBuilder hql = new StringBuilder("from NoteInfo where businessId='"+ businessId+"'");
			Query query  = session.createQuery(hql.toString());
			List<NoteInfo> noteInfo = query.list(); 
			tx.commit();
			session.close();
			return noteInfo;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 增加一条留言
	 * @param noteInfo
	 */
	public void addNoteInfo(NoteInfo noteInfo){
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			session.save(noteInfo);
			tx.commit();
			session.close();	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除一条留言
	 * @param noteId
	 */
	public void deleteNoteInfo(NoteInfo noteInfo){
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			session.delete(noteInfo);
			tx.commit();
			session.close();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	/**
	 * 把留言的状态由未读变为已读
	 * @param noteId
	 */
	public void changeNoteStatusToRead(int noteId){
		try{
			Session session = HibernateUtils.openSession();
			Transaction tx = session.beginTransaction();
			NoteInfo noteInfo = new NoteInfo();
			noteInfo  = findByNoteId(noteId);
			noteInfo.setStatus(1);
			session.update(noteInfo);
			tx.commit();
			session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
