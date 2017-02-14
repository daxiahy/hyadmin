package com.bd.service;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.xml.sax.InputSource;





import com.bd.UserDao.UserMapper;
import com.bd.pojo.Pager;
import com.bd.pojo.User;
import com.bd.tools.DateTool;
import com.bd.tools.StringTool;
import com.bd.tools.UUIDTool;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	//修改密码
	public boolean updateUser(User user) {
		
		return userMapper.updateUser(user);
		
	}

	//用户注册
	public boolean setUser(User user) {
		
		user.setYhbh(UUIDTool.getUUID());
		user.setZcsj(DateTool.getNow());
		return userMapper.setUser(user);
	
	}

	//获取所有用户
	public List<User> getUsers(User user, Pager pager) {
		
		int totalRows = userMapper.getTotalRows(user);
		pager.setTotalPages(totalRows);
		
		List<User> list = userMapper.getUsers(user, pager);
		for (User yh : list) {
			//处理身份
			if("3".equals(yh.getSfbz())){
				yh.setSfbz("学生");
			}else if("5".equals(yh.getSfbz())){
				yh.setSfbz("老师");
			}
			//处理注册时间
			if(StringTool.isNotEmpty(yh.getZcsj())){
				String strDate = DateTool.fmtDate(yh.getZcsj(), "yyyyMMddhhmmss", "yyyy-MM-dd");
				yh.setZcsj(strDate);
			}
		}

		return list;
	}

	//更具用户编号删除用户
	public boolean deleteUser(String yhbh) {
		return userMapper.deleteUser(yhbh);
		
	}

	//判断用户名是否被注册
	public boolean checkUser(User user) {
		return userMapper.checkUser(user) != null;
		 
		
	}

	//查找用户
	public User getUser(User user) {		
	User yh=userMapper.getUser(user);
		if(null != yh){
			//处理身份
			if("3".equals(yh.getSfbz())){
				yh.setSfbz("学生");
			}else if("5".equals(yh.getSfbz())){
				yh.setSfbz("老师");
			}
			//处理注册时间
			if(StringTool.isNotEmpty(yh.getZcsj())){
				String strDate = DateTool.fmtDate(yh.getZcsj(), "yyyyMMddhhmmss", "yyyy-MM-dd");
				yh.setZcsj(strDate);
			}
		}
		return yh;
	}

}
