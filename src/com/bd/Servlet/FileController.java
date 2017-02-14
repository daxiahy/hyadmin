package com.bd.Servlet;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("FileController")
public class FileController {
	
	@RequestMapping("fileUpload.do")
	public String upload(MultipartFile file,Model model,HttpServletRequest request){
		//找到本机upload的路径
		String path  = request.getSession().getServletContext().getRealPath("upload");

		System.out.println(path);
		
		//获取文件名
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		//new一个文件对象
		File targetFile = new File(path,fileName);
		System.out.println(targetFile.toString());
		
		if(!targetFile.exists()){
			//建立一个新的子目录
			targetFile.mkdir();
		}
		try {
			//文件写入服务器
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		model.addAttribute("url",request.getContextPath()+"/upload/"+fileName);
		return "demo/fileUpload";
	}
}