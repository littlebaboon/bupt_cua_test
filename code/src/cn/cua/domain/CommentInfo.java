package cn.cua.domain;

import java.util.Date;

public class CommentInfo {
	private Integer commentId;
	private Integer replayId;
	private String userName;
	private Integer productId;
	private String content;
	private Date date;

	

	public CommentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CommentInfo(Integer commentId, String userName, Integer productId,
			String content, Date date, Integer replayId) {
		super();
		this.commentId = commentId;
		this.userName = userName;
		this.productId = productId;
		this.content = content;
		this.date = date;
		this.replayId = replayId;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getReplayId() {
		return replayId;
	}
	public void setReplayId(Integer replayId) {
		this.replayId = replayId;
	}
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "CommentInfo [commentId=" + commentId + ", userName=" + userName
				+ ", productId=" + productId + ", content=" + content
				+ ", date=" + date + ", replayId=" + replayId + "]";
	}
	
}
