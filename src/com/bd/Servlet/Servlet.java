package com.bd.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.interceptor.SpringBeanAutowiringInterceptor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.bd.service.UserService;
import com.bd.pojo.Pager;
import com.bd.pojo.ResultMsg;
import com.bd.pojo.User;
import com.bd.tools.StringTool;
import com.google.gson.Gson;
import com.sun.org.glassfish.external.statistics.annotations.Reset;


@Controller
@RequestMapping("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService service;

	// 判断用户名是否存在
	@RequestMapping("checkUser.do")
	@ResponseBody
	private boolean checkUser(User user){
			return service.checkUser(user);			
	}

	/**
	 * 改密码
	 * @return 
	 * */
	@RequestMapping("updateUser.do")
	private String updateUser(User user){
	
		boolean up = service.updateUser(user);
		if (up) {
			return "redirect:/Servlet/getUsers.do";
		} else {
			return "demo/fail";
		}
	}

	// 删除用户
	@RequestMapping("deleteUser.do")
	@ResponseBody
	private ResultMsg deleteUser(String yhbh){
		boolean ret = service.deleteUser(yhbh);
		return this.getJsonResultMsg(ret);
	}

	/**
	 * 登录
	 *
	 */
	@RequestMapping("login.do")
	protected String login(Model model,User user){
		// 判断用户是否合法
		user = service.getUser(user);

		if (null != user) {
			model.addAttribute("user", user);

			// 如果是管理员登录admin
			if ("admin".equals(user.getUsername()) && "admin".equals(user.getPwd())) {
				return "redirect:/Servlet/getUsers.do";
			} else {
				// 如果是普通 进入normal
				return "demo/normal";
			}

		} else {
			// 用户名密码不合法
			System.out.println("nook");
			model.addAttribute("msg", "用户名或密码输入有误！");
			return "demo/login";
		}
	}

	// 获取用户
	@RequestMapping("getUsers.do")
	private String getUsers(User user,Pager pager,Model model){
		List<User> list = service.getUsers(user, pager);
		model.addAttribute("listUsers", list);
		model.addAttribute("pager", pager);
		return "demo/admin";
	}

	/**
	 * 注册
	 * @return 
	 */
	@RequestMapping("regester.do")
	@ResponseBody
	protected ResultMsg register(User user,Model model){
		boolean set = service.setUser(user);
		return this.getJsonResultMsg(set);
	}

	/**
	 * 功能描述：获取用于封装操作结果的消息对象
	 */
	private ResultMsg getJsonResultMsg(boolean ret) {
		ResultMsg resultMsg = null;
		if(ret){
			resultMsg = new ResultMsg(1,ResultMsg.MSG_SUCC);
		}else{
			resultMsg = new ResultMsg(0,ResultMsg.MSG_FAIL);
		}
		return resultMsg;
	}
}
