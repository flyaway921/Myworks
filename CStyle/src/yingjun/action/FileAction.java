package yingjun.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import yingjun.service.FileServiceI;
import yingjun.util.ResourceUtil;

@ParentPackage("base")
@Namespace("/")
@ResultPath("/")
@Action(value = "fileAction")
@Results({@Result(name="filelist" ,location="front/pictures.jsp"),
	    })
public class FileAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private File filedata;
	private String filedataContentType;
	private String filedataFileName;
	private HttpSession session=ServletActionContext.getRequest().getSession();
	List<String> filelist = new ArrayList<String>();
	private FileServiceI fileService;
	public FileServiceI getFileService() {
		return fileService;
	}
    @Autowired
	public void setFileService(FileServiceI fileService) {
		this.fileService = fileService;
	}
    
    public void front_worksUpload() {
    	this.worksUpload();
    }
    
    public void front_videosUpload() {
    	this.worksUpload();
    }
    
    
	public void videosUpload() {
		this.worksUpload();
	}
	
	public void worksUpload() {
		  SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		  String datePath=date.format(new Date());
		  String savePath ="";
		  System.out.println(filedata.length()+"------"+ResourceUtil.getUploadFileMaxSize());
		  //检查文件大小
		  if (filedata.length()> ResourceUtil.getUploadFileMaxSize()) {
			  super.writeJson("上传的文件不能超过"+ResourceUtil.getUploadFileMaxSize()/1024/1024+"M");
			  return;
			}
			// 检查文件扩展名
			String fileExt = filedataFileName.substring(filedataFileName.lastIndexOf(".") + 1).toLowerCase();
			if (!Arrays.<String> asList(ResourceUtil.getUploadFileExts().split(",")).contains(fileExt)) {
				this.writeJson("上传文件扩展名是不允许的扩展名。\n只允许" + ResourceUtil.getUploadFileExts() + "格式！");
				return;
			}
			if(Arrays.<String> asList(ResourceUtil.getImagesFileExts().split(",")).contains(fileExt)){
				savePath =session.getServletContext().getRealPath("/") +ResourceUtil.getUploadDirectory() + "/images/"+datePath+"/";
		    }else{
		    	savePath =session.getServletContext().getRealPath("/") +ResourceUtil.getUploadDirectory() + "/attachment/"+datePath+"/";
		    }
		  try {
		    String newfilename= fileService.uploadfile(savePath, filedata, fileExt);
		    String saveUrl="";
		    if(Arrays.<String> asList(ResourceUtil.getImagesFileExts().split(",")).contains(fileExt)){
		    	 saveUrl =session.getServletContext().getContextPath()+"/"+ResourceUtil.getUploadDirectory()+"/images/"+datePath+"/"+newfilename;// 要返回给xhEditor的文件保存目录URL
		    }else{
		    	 saveUrl =session.getServletContext().getContextPath()+"/"+ResourceUtil.getUploadDirectory()+"/attachment/"+datePath+"/"+newfilename;
		    }
		    
		    Map<String, Object> back = new HashMap<String, Object>();
		    back.put("err", "");
			back.put("msg", "!"+saveUrl);
			super.writeJson(back);
			
		 } catch (Exception e) {
			super.writeJson("上传出错了！");
		 }

	}

     //图片墙
	public String noSession_pricturesList() {
		String pp= session.getServletContext().getRealPath("/")+ResourceUtil.getUploadDirectory()+"\\images";
		System.out.println("开始扫描文件"+pp);
		refreshFileList(pp);
		return "filelist"; 
	}
	
	private  void refreshFileList(String strPath) {
		   
		File dir = new File(strPath);
		File[] files = dir.listFiles();

		if (files == null){
			return;
		}
			
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				refreshFileList(files[i].getAbsolutePath());
			} else {
				 String webroot=session.getServletContext().getContextPath().substring(1);
				 int begin=files[i].getAbsolutePath().indexOf(webroot);
				 filelist.add("/"+files[i].getAbsolutePath().substring(begin).replace("\\", "/"));
			}
		}
	 }
	
	
	
	

	public File getFiledata() {
		return filedata;
	}



	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}



	public String getFiledataContentType() {
		return filedataContentType;
	}



	public void setFiledataContentType(String filedataContentType) {
		this.filedataContentType = filedataContentType;
	}



	public String getFiledataFileName() {
		return filedataFileName;
	}



	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	public List<String> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<String> filelist) {
		this.filelist = filelist;
	}



	
	
}
