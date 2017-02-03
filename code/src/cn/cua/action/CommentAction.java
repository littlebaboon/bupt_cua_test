package cn.cua.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.cua.domain.CommentInfo;
import cn.cua.domain.ProductInfo;
import cn.cua.domain.UserInfo;
import cn.cua.service.CommentService;
import cn.cua.service.ProductDescriptionPageService;
import cn.cua.service.ProductService;
import cn.cua.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {

	private CommentService commentService = new CommentService();
	private ProductDescriptionPageService pdpService = new ProductDescriptionPageService();
	private UserService userService = new UserService();
	private List<CommentInfo> commentList = new ArrayList<CommentInfo>();
	private String content;
	private Integer productId;
	private Integer replayId;
	private Integer commentId;
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	

	public Integer getReplayId() {
		return replayId;
	}

	public void setReplayId(Integer replayId) {
		this.replayId = replayId;
	}

	public String loadComment(){
		//model = pdpService.getProduct(model.getProductId());
		//Integer productId = model.getProductId();
		//ActionContext.getContext().getValueStack().push(model);
		commentList = commentService.findbyProductId(productId);
		return "loadSucc";
	}
	
	public String addComment(){
		//session userId,得到username
		Map session = ActionContext.getContext().getSession();
		String userName  = (String) session.get("name");
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setContent(content);
		commentInfo.setDate(new Timestamp(System.currentTimeMillis()));
		commentInfo.setUserName(userName);
		commentInfo.setReplayId(replayId);
		commentInfo.setProductId(productId);
		commentService.add(commentInfo);
		return "addSucc";
	}
	

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public ProductDescriptionPageService getPdpService() {
		return pdpService;
	}

	public void setPdpService(ProductDescriptionPageService pdpService) {
		this.pdpService = pdpService;
	}

	public List<CommentInfo> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentInfo> commentList) {
		this.commentList = commentList;
	}


	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	
}
