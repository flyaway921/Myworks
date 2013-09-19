package yingjun.service.impl;

import java.io.File;
import java.util.UUID;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import yingjun.service.FileServiceI;

@Service("fileService")
public class FileServiceImpl implements FileServiceI {
	
	
   //文件上传，上传成功后返回文件路径
	public String uploadfile(String savePath, File filedata,String fileExt) throws Exception {
		  String newFileName="";
		  if (filedata != null) {  
	    	   // 为文件建立唯一的名字
			  newFileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;// 新的文件名称
	          System.out.println(savePath);
			  File savefile = new File(new File(savePath),newFileName);   
	          if (!savefile.getParentFile().exists()) {
	        	  savefile.getParentFile().mkdirs();
	          }
				  FileUtils.copyFile(filedata, savefile);
	      }  
		  return newFileName;
	}
   

	
	
}
