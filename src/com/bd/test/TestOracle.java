package com.bd.test;

import java.sql.*;

import com.bd.pojo.User;

public class TestOracle {
	// 成员变量
	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet res = null;

	// 加载驱动
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("驱动加载成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 连接数据库
	private Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl11";
		String user = "scott";
		String pwd = "tiger";
		conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("数据库连接成功");
		return conn;
		

	}
	//关闭数据库
	private void closeSjk(Connection conn,PreparedStatement pre,ResultSet res){
		try {
			if (null != res) {
				res.close();
			}
			if (null != pre) {
				pre.close();
			}
			if (null != conn) {
				conn.close();
			}
			System.out.println("数据库关闭");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 数据库查询
	public void sqlSelect(String sql,String[] arr) {
		
		try {
			conn = getConnection();
			
			pre = conn.prepareStatement(sql);
			
			if(null!=arr){
				for(int i=0;i<arr.length;i++){
					pre.setObject(i+1, arr[i]);
				}
			}
			res = pre.executeQuery();
			while(res.next()) {
				System.out.print(res.getString(1)+"/t");
				System.out.print(res.getString(2)+"/t");
				System.out.print(res.getString(3)+"/t");
				System.out.println(res.getString(4)+"/t");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeSjk(conn,pre,res);
		}
	}
	
	//增加（往数据库添加数据）
	public boolean setUser(String sql,String arr[]) {
		try {
			conn=getConnection();
			pre=conn.prepareStatement(sql);
			if(null!=arr){
				for(int i=0;i<arr.length;i++){
					pre.setObject(i+1, arr[i]);
				}
			}
			int ins=pre.executeUpdate();
			if(0==ins){
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
	}
}
