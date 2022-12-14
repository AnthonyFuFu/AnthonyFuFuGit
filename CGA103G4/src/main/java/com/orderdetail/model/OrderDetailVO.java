package com.orderdetail.model;

import java.io.Serializable;

public class OrderDetailVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer ordid;
	private Integer pdid;
	private Integer detailNumber;
	private Integer detailPrice;
	private Integer detailGoodPrice;
	
	public OrderDetailVO() {
		
	}
	
	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	public Integer getPdid() {
		return pdid;
	}
	public void setPdid(Integer pdid) {
		this.pdid = pdid;
	}
	public Integer getDetailNumber() {
		return detailNumber;
	}
	public void setDetailNumber(Integer detailNumber) {
		this.detailNumber = detailNumber;
	}
	public Integer getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(Integer detailPrice) {
		this.detailPrice = detailPrice;
	}
	public Integer getDetailGoodPrice() {
		return detailGoodPrice;
	}
	public void setDetailGoodPrice(Integer detailGoodPrice) {
		this.detailGoodPrice = detailGoodPrice;
	}
	//=========================================冠銓新增==========================================	
		//join商品名稱到訂單明細
		public com.product.model.ProductVO getProductVO() {
			com.product.model.ProductService productService = new com.product.model.ProductService();
			com.product.model.ProductVO productVO = productService.getOneproduct(pdid);
//			System.out.println(productService.GetOne(productNo).getProductName());
			return productVO;
		}
	
	
	
}
