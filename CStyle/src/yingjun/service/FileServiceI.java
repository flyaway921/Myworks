package yingjun.service;

import java.io.File;


public interface FileServiceI {
  
	public String uploadfile(String savePath,File filedata,String filedataFileName) throws Exception;
}
