package com.productPicture.model;

import java.util.List;

public class ProductpicService {

	private ProductpicDAO_interface dao;
	
	public ProductpicService() {
		dao = new ProductpicDAO();
		
	}
	//新增圖片
	public ProductpicVO insert(byte[] pdpic) {
		
		ProductpicVO productpicVO = new ProductpicVO();
		productpicVO.setPdPic(pdpic);
		dao.insert(productpicVO);	
		return productpicVO;
	}
	//舊商品上傳新圖
	public ProductpicVO existedInsert(Integer pdid, byte[] pdpic) {
		ProductpicVO productpicVO = new ProductpicVO();
		productpicVO.setPdid(pdid);
		productpicVO.setPdPic(pdpic);
		dao.existedInsert(productpicVO);
		return productpicVO;
	}
	
	public void deletePicture(Integer pdPicid) {
		
		
			dao.delete(pdPicid);
	}

	
	public ProductpicVO getOneproductpic(Integer pdPicid) {
		return dao.findByPrimaryKey(pdPicid);
	}

	public List<ProductpicVO> getAll() {
		return dao.getAll();
	}
	
	public List<ProductpicVO> productAllPics(Integer pdid){
		return dao.getOneProductPics(pdid);
	}
	
	public ProductpicVO onePicByPicNo(Integer pdPicid) {
		return dao.GetOnePicBypdPicid(pdPicid);
	}

	
}
