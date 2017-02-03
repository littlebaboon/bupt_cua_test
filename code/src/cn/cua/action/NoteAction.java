package cn.cua.action;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.cua.domain.NoteInfo;
import cn.cua.service.NoteService;


public class NoteAction {
	private List<NoteInfo> noteInfoList;
	private NoteService noteService = new NoteService();
	
	String customername;
	String telephone;
	String email;
	String note;
	String result;
	String noteIds;
	int readNoteNum;
	int unReadNoteNum;
	int noteId;
	NoteInfo noteInfo;
	
	/**
	 * 根据noteId查找Note
	 * @param noteId
	 * @return
	 */
	public String getNoteByNoteId(){
		noteInfo = noteService.getNoteByNoteId(noteId);
		return "success";
	}
	
	/**
	 * 增加一条留言
	 * @param customername
	 * @param telephone
	 * @param email
	 * @param note
	 * @param time
	 */
	public String addNote(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		NoteInfo noteInfo = new NoteInfo(businessId,customername,telephone,email,note,currenttime);
		noteService.addNote(noteInfo);	
		result = "success";
		return result;
	}
	
	/**
	 * 批量删除留言
	 * @param noteId
	 * @return
	 */
	public String deleteNotes(){
		String[] ids = noteIds.split(",");
		for(String id : ids){
			int intid = Integer.parseInt(id);
			noteService.deleteNote(intid);
		}
		result = "success";
		return "success";
	}
	
	/**
	 * 一个商家的所有未读留言
	 * @return
	 */
	public String getUnReadNote(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		noteInfoList = noteService.getUnReadNoteInfo(businessId);
		return "success";
	}
	
	/**
	 * 一个商家的所有已读留言
	 * @return
	 */
	public String getReadNote(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		noteInfoList = noteService.getReadNoteInfo(businessId);
		return "success";
	}
	
	/**
	 * 获取未读留言的数量
	 * @return
	 */
	public String getUnReadNoteNumber(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		unReadNoteNum =  noteService.getUnReadNoteNum(businessId);
		return "success";
	}
	
	/**
	 * 获取已读留言的数量
	 * @return
	 */
	public String getReadNoteNumber(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		readNoteNum = noteService.getReadNoteNum(businessId);
		return "success";
	}
	
	/**
	 * 一个商家的所有留言
	 * @return
	 */
	public String getAllNote(){
		Map session = ActionContext.getContext().getSession();
		Integer businessId = Integer.parseInt((String)session.get("businessId"));
		noteInfoList = noteService.getAllNoteInfo(businessId);
		return "success";
	}
	

	public String changeStatus(){
		noteService.changeNoteStatus(noteId);
		result = "success";
		return "success";
	}
	
	public String changeMultiStatus(){
		String[] ids = noteIds.split(",");
		for(String id : ids){
			int intid = Integer.parseInt(id);
			noteService.changeNoteStatus(intid);
		}
		return "success";
	}

	
	public List<NoteInfo> getNoteInfoList() {
		return noteInfoList;
	}

	public void setNoteInfoList(List<NoteInfo> noteInfoList) {
		this.noteInfoList = noteInfoList;
	}

	public NoteService getNoteService() {
		return noteService;
	}

	public void setNoteService(NoteService noteService) {
		this.noteService = noteService;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getReadNoteNum() {
		return readNoteNum;
	}

	public void setReadNoteNum(int readNoteNum) {
		this.readNoteNum = readNoteNum;
	}

	public int getUnReadNoteNum() {
		return unReadNoteNum;
	}

	public void setUnReadNoteNum(int unReadNoteNum) {
		this.unReadNoteNum = unReadNoteNum;
	}

	public NoteInfo getNoteInfo() {
		return noteInfo;
	}

	public void setNoteInfo(NoteInfo noteInfo) {
		this.noteInfo = noteInfo;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public String getNoteIds() {
		return noteIds;
	}

	public void setNoteIds(String noteIds) {
		this.noteIds = noteIds;
	}
	
	
}
