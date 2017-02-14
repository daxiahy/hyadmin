package com.bd.tools;

import com.bd.pojo.*;

public class PagerTool {
	/**
	 * 功能描述：获取Oracle分页SQL
	 * @param sql 待分页sql
	 * @param pager 分页信息
	 * @return 分页SQL
	 */
	public static String getPagerSql(String sql,Pager pager){
//		StringBuffer sb = new StringBuffer();
//		sb.append("select * from(select tb.*,rownum rn from(");
//		sb.append(sql);
//		sb.append(")tb where rownum <= "+pager.getMaxNum()+")where rn >= "+pager.getMinNum());
//		return sb.toString();
		
		
//		StringBuffer sb = new StringBuffer();
//		sb.append(sql+" limit");
//		sb.append(" "+pager.getMinNum()+",");
//		sb.append(pager.getPageSize());
//		return sb.toString();
		
		return sql+" limit "+(pager.getMinNum()-1)+","+pager.getPageSize();
	}
}
