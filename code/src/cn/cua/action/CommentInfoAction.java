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
import com.opensymphony.xwork2.ModelDriven;

public class CommentInfoAction extends ActionSupport implements ModelDriven<CommentInfo>{
	private CommentService commentService = new CommentService();
	private UserService userService = new UserService();
	private CommentInfo model = new CommentInfo();//手动实例化
	private List<CommentInfo> commentList = new ArrayList<CommentInfo>();
	private String content;
	private Integer productId;
	private Integer replayId;
	private Integer commentId;
	private int totalPage;//总页数
	private int pageNum;//当前页数
	private int pageSize;//每页产品数
	private int ps = 30;//设置pageSize
	
	public CommentInfo getModel() {
		return model;
	}
	
	public Integer getCommentId() {
		return commentId;
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

	public Integer getReplayId() {
		return replayId;
	}

	public void setReplayId(Integer replayId) {
		this.replayId = replayId;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPs() {
		return ps;
	}

	public void setPs(int ps) {
		this.ps = ps;
	}

	public void setModel(CommentInfo model) {
		this.model = model;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String deleteComment() throws Exception {
		model = (CommentInfo)commentService.load(model.getCommentId());
		//删除数据库表中的信息
		commentService.delete(model.getCommentId());
		return "delete_succ";
	}

	/**
	 * 查看评论信息
	 * @return
	 * @throws Exception
	 */
	public String view() throws Exception {
		model = commentService.load(model.getCommentId());
		return "view";
	}



	/**
	 * 分页操作
	 * @return
	 * @throws Exception
	 */
	public String page() throws Exception {
		int commentAmount = commentService.getCommentAmount();
		if(commentAmount==0){
			return "queryList";
		}
		this.pageSize = this.ps;
		this.totalPage = (commentAmount % pageSize==0)?(commentAmount/pageSize):(commentAmount/pageSize +1);
		if(this.pageNum <= 0){
			this.pageNum = 1;
		}
		if(this.pageNum > totalPage ){
			this.pageNum = totalPage;
		}
		return "page";
	}

	
	public String findAll() throws Exception {
		ActionContext.getContext().getValueStack().push(commentService.findAll(pageNum,pageSize));
		return "list";
	}
	
	
}
