package cn.cua.service;

import java.util.List;

import cn.cua.dao.BusinessProductDAO;
import cn.cua.dao.ProductInfoDAO;
import cn.cua.domain.ProductInfo;

public class BusinessProductService {
	private BusinessProductDAO productInfoDao =new BusinessProductDAO();
	private ProductInfoDAO productDao = new ProductInfoDAO();
	private int businessId;
	
	public BusinessProductService() {
		super();
	}
	/**
	 * 返回所有产品数
	 * @return
	 */
	public int getProductAmount(int currentID) {

			return productInfoDao.getProductAmount(currentID);

	}
	
	/**
	 * 返回符合特定条件的产品数
	 * @param model
	 * @return
	 */
	public int getProductAmount(ProductInfo model,int currentID) {
		
			return productInfoDao.getProductAmount(model,currentID);

	}
	
	/**
	 * 返回所有产品
	 * @param pageNum
	 * @param pageSize
	 * @param currentID
	 * @return
	 */
	public List<ProductInfo> findAll(int pageNum, int pageSize, int currentID) {
		
			return productInfoDao.findAll(pageNum,pageSize,currentID);

	}
	/**
	 * 返回符合特定条件的所有产品
	 * @param model
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<ProductInfo> findAll(ProductInfo model, int pageNum, int pageSize, int currentID) {

			return productInfoDao.findAll(model,pageNum, pageSize,currentID);

	}
	
	/**
	 * 增加产品
	 * @param model
	 */
	public void add(ProductInfo model) {
		productInfoDao.add(model);
	}

	/**
	 * 删除产品
	 * @param productId
	 */
	public void delete(int productId) {
		productInfoDao.delete(productId);
	}

	/**
	 * 加载产品
	 * @param productId
	 * @return
	 */
	public ProductInfo load(int productId) {
		return productInfoDao.load(productId);
	}

	/**
	 * 编辑产品
	 * @param model
	 */
	public void edit(ProductInfo model) {
		productInfoDao.edit(model);
	}
	public boolean isUnique(String proName) {
		List<ProductInfo> productInfos = productDao.findAll();
		for(ProductInfo productInfo:productInfos){
			if(proName.equals(productInfo.getProductName())){
				return false;
			}
		}
		return true;
	}
	
	public boolean isUnique(ProductInfo model) {
		List<ProductInfo> productInfos = productDao.findAll();
		for(ProductInfo productInfo:productInfos){
			if(model.getProductName().equals(productInfo.getProductName())){
				if(model.getProductId()!=productInfo.getProductId()){
					return false;
				}
			}
		}
		return true;
	}
	
	
	
	
	public BusinessProductDAO getProductInfoDao() {
		return productInfoDao;
	}
	public void setProductInfoDao(BusinessProductDAO productInfoDao) {
		this.productInfoDao = productInfoDao;
	}
	public int getBusinessId() {
		return businessId;
	}
	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}
	
	
}
