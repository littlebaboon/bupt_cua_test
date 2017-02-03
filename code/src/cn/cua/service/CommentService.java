package cn.cua.service;

import java.util.List;

import cn.cua.domain.CommentInfo;
import cn.cua.domain.ProductInfo;
import cn.cua.dao.CommentDAO;


public class CommentService {
	private CommentDAO commentDao = new CommentDAO();
	
	public List<CommentInfo> findbyProductId(Integer productId){
		return commentDao.findByProductId(productId);
	}
	
	public void add(CommentInfo commentInfo){
		commentDao.add(commentInfo);
	}
	
	public void delete(int commentId){
		commentDao.delete(commentId);
	}
	/**
	 * 返回所有评论数
	 * @return
	 */
	public int getCommentAmount() {
		return commentDao.getCommentAmount();
	}
	/**
	 * 返回所有评论
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<CommentInfo> findAll(int pageNum, int pageSize) {
		return commentDao.findAll(pageNum,pageSize);
	}
	public CommentInfo load(int commentId) {
		return commentDao.load(commentId);
	}
}

	