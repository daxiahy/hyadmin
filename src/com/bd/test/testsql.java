package com.bd.test;

public class testsql {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestOracle ts=new TestOracle();
		String sql="select *  from yhxxb where yhm=?";
		String arr[]={"admin"};
		ts.sqlSelect(sql,arr);
	}

}
