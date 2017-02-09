package cn.cua.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.cua.dao.ProductPageDAO;
import cn.cua.domain.ProductInfo;
import cn.cua.domain.ThemeInfo;

public class ProductPageService {
	
	private ProductPageDAO ppDao = new ProductPageDAO();
	
	/**
	 * 产品推荐首页-主题目的地推荐
	 * @return
	 */
	public LinkedHashMap<ThemeInfo,List<String>> findThemeTypeList(){
		return ppDao.findThemeTypeList();
	}
	
	/**
	 * 产品下载首页-国内目的地推荐
	 * @return
	 */
	public LinkedHashMap<String,List<String>> findHomeTD(){
		return ppDao.findHomeTD();
	}
	
	/**
	 * 产品下载首页-所有产品总数
	 * @return
	 */
	public int getAmountOfIsTop(){
		return ppDao.getAmountOfIsTop();
	}
	
	/**
	 * 产品下载首页-所有产品默认热门排序
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findIsTop(int pageNum,int pageSize){
		return ppDao.findIsTop(pageNum, pageSize);
	}
	
	/**
	 * 产品下载首页-所有产品价格排序
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findPrice(int pageNum,int pageSize){
		return ppDao.findPrice(pageNum, pageSize);
	}
	
	/**
	 * 产品推荐首页-搜索产品-分页
	 * @param productName
	 * @return
	 */
	public int getAmountOfSearch(String search){
		return ppDao.getAmountOfSearch(search);
	}
	/**
	 * 标签搜索-分页
	 * @param tag
	 * @return
	 */
	public int getAmountOfTag(String tag){
		return ppDao.getAmountOfTag(tag);
	}
	
	/**
	 * 产品推荐首页-搜索价格排序
	 * @param search
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findSearchPrice(String search,int pageNum,int pageSize){
		return ppDao.findSearchPrice(search, pageNum, pageSize);
	}
	
	/**
	 * 产品推荐首页-搜索热门产品
	 * @param search
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findSearchIsTop(String search,int pageNum,int pageSize){
		return ppDao.findSearchIsTop(search, pageNum, pageSize);
	}
	/**
	 * 产品推荐首页-搜索相应标签产品
	 * @param tag
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findSearchTag(String tag,int pageNum,int pageSize){
		return ppDao.findSearchTag(tag, pageNum, pageSize);
	}
}
