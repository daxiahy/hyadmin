package com.bd.pojo;

public class Pager {
	/**页码*/
	private int pageNo = 1;
	
	/**每一页显示的记录条数*/
	private int pageSize = 8;
	
	/**总页数*/
	private int totalPages;
	
	/**当前页的第一行行号*/
	private int minNum ;
	
	/**当前页的最后一行行号*/
	private int maxNum;
	
	public Pager(){}
	
	public Pager(int pageNo){
		this.pageNo = pageNo;
	}
	
	public Pager(int pageNo, int pageSize){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * 功能描述：通过查询出的数据行数获取页数
	 * @param totalRows
	 */
	public void setTotalPages(int totalRows) {
		if(totalRows%pageSize==0){
			this.totalPages = totalRows / pageSize;
		}else{
			this.totalPages = totalRows / pageSize + 1;
		}
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setMinNum(int minNum) {
		this.minNum = minNum;
	}
	public int getMinNum() {
		this.minNum =  (pageNo-1)*pageSize;
		return this.minNum;
	}
	
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getMaxNum() {
		this.maxNum = pageNo*pageSize;
		return this.maxNum;
	}
	
}
