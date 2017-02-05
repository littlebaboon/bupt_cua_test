package cn.cua.service;

import java.util.List;

import cn.cua.dao.NoteDAO;
import cn.cua.domain.NoteInfo;

public class NoteService {
	private NoteDAO noteDao = new NoteDAO();
	
	/**
	 * 根据noteId查找Note
	 * @param noteId
	 * @return
	 */
	public NoteInfo getNoteByNoteId(int noteId){
		return noteDao.findByNoteId(noteId);
	}
	/**
	 * 增加一条留言
	 * @param businessId
	 * @param customerName
	 * @param telephone
	 * @param email
	 * @param note
	 */
	public void addNote(NoteInfo noteInfo){
		noteDao.addNoteInfo(noteInfo);
	}
	
	/**
	 * 找到商家ID为businessID的所有未读的留言
	 * @param businessId
	 * @return
	 */
	public List<NoteInfo> getUnReadNoteInfo(int businessId){
		return noteDao.findUnReadNoteByBusinessId(businessId);
	}
	
	/**
	 * 找到商家ID为businessID的所有未读的留言
	 * @param businessId
	 * @return
	 */	
	public List<NoteInfo> getReadNoteInfo(int businessId){
		return noteDao.findReadNoteByBusinessId(businessId);
	}
	
	/**
	 * 获取未读留言的数量
	 * @param businessId
	 * @return
	 */
	public int getUnReadNoteNum(int businessId){
		return noteDao.findUnReadNoteByBusinessId(businessId).size();
	}
	
	/**
	 * 获取已读留言的数量
	 * @param businessId
	 * @return
	 */
	public int getReadNoteNum(int businessId){
		return noteDao.findReadNoteByBusinessId(businessId).size();
	}
	
	/**
	 * 找到商家ID为businessID的所有留言
	 * @param businessId
	 * @return
	 */
	public List<NoteInfo> getAllNoteInfo(int businessId){
		return noteDao.findAllNoteByBusinessId(businessId);
	}
	
	/**
	 * 删除一条留言
	 * @param noteInfo
	 */
	public void deleteNote(int noteId){
		noteDao.deleteNoteInfo(noteDao.findByNoteId(noteId));
		
	}
	
	/**
	 * 把留言的状态由未读变为已读
	 * @param noteId
	 */
	public void changeNoteStatus(int noteId){
		noteDao.changeNoteStatusToRead(noteId);
		
	}
	public NoteDAO getNoteDao() {
		return noteDao;
	}
	public void setNoteDao(NoteDAO noteDao) {
		this.noteDao = noteDao;
	}

}
