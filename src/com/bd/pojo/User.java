package com.bd.pojo;

import java.io.Serializable;

public class User implements Serializable{
	/**用户编号*/
	private String yhbh;
	/**用户名*/
	private String username;
	/**密码*/
	private String pwd;
	/**身份标识*/
	private String sfbz;
	/**注册时间*/
	private String zcsj;
	
	public User(){}
	
	public User(String yhbh, String username, String pwd, String sfbz,
			String zcsj) {
		super();
		this.yhbh = yhbh;
		this.username = username;
		this.pwd = pwd;
		this.sfbz = sfbz;
		this.zcsj = zcsj;
	}

	/**
	 * 获取用户编号 
	 * @return yhbh 用户编号
	 */
	public String getYhbh() {
		return yhbh;
	}

	/**
	 * 设置用户编号 
	 * @param yhbh 用户编号 
	 */
	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}

	/**
	 * 获取用户名 
	 * @return username 用户名
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * 设置用户名 
	 * @param username 用户名 
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 获取密码 
	 * @return pwd 密码
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * 设置密码 
	 * @param pwd 密码 
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * 获取身份标识 
	 * @return sfbz 身份标识
	 */
	public String getSfbz() {
		return sfbz;
	}

	/**
	 * 设置身份标识 
	 * @param sfbz 身份标识 
	 */
	public void setSfbz(String sfbz) {
		this.sfbz = sfbz;
	}

	/**
	 * 获取注册时间 
	 * @return zcsj 注册时间
	 */
	public String getZcsj() {
		return zcsj;
	}

	/**
	 * 设置注册时间 
	 * @param zcsj 注册时间 
	 */
	public void setZcsj(String zcsj) {
		this.zcsj = zcsj;
	}

	@Override
	public String toString() {
		return "User [yhbh=" + yhbh + ", username=" + username + ", pwd=" + pwd
				+ ", sfbz=" + sfbz + ", zcsj=" + zcsj + "]";
	}
	
}
