package com.bd.UserDao;
import java.util.List;

import org.apache.ibatis.*;

import com.bd.pojo.*;

public interface UserMapper {
	//@ResultMap("com.bd.UserDao.UserMapper.UserResult")
	//@Select("select * from yhxxb where yhm=#{username} and pwd = #{pwd}")
	User getUser(User user);
	
	//@ResultMap("com.bd.UserDao.UserMapper.UserResult")
	//@SelectProvider(type=UserProvider.class,method="getUsersSql")
	List<User> getUsers(User user, Pager pager);
	
	//@SelectProvider(type=UserProvider.class,method="getTotalRowsSql")
	int getTotalRows(User user);

	
	//@Insert("insert into yhxxb(yhbh,yhm,pwd,sfbz,zcsj) values(#{yhbh},#{username},#{pwd},#{sfbz},#{zcsj})")
	boolean setUser(User user);
	
	//@ResultMap("com.bd.UserDao.UserMapper.UserResult")
	//@Select("select yhbh,yhm,pwd,sfbz,zcsj from yhxxb where yhm=#{username}")
	User checkUser(User user);
	
	//@Delete("delete from yhxxb where yhbh = #{yhbh}")
	boolean deleteUser(String yhbh);
	
	
	//@Update("update  yhxxb set pwd=#{pwd} where yhm=#{username}")
	 boolean updateUser(User user);
	
	
	
}
