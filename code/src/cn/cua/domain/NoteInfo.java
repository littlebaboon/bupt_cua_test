package cn.cua.domain;

import java.sql.Timestamp;

public class NoteInfo {
	private int businessId;
	private int noteId;
	private String customername;
	private String telephone;
	private String email;
	private String note;
	private int status;
	private Timestamp time;

	public NoteInfo() {
		super();
	}

	public NoteInfo(int businessId, String customername, String telephone,
			String email, String note, Timestamp time) {
		super();
		this.businessId = businessId;
		this.customername = customername;
		this.telephone = telephone;
		this.email = email;
		this.note = note;
		this.status = 0;
		this.time = time;
	}

	public int getBusinessId() {
		return businessId;
	}

	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}
