
package cloudnote;

import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.InputStream;  
import java.io.UnsupportedEncodingException;  
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;
  
import com.opensymphony.xwork2.ActionSupport;  

  
@SuppressWarnings("serial")
public class DownloadAction extends ActionSupport {  
    private String filepath="download/cloudnote.apk";
    private String fileName="cloudnote.apk";
    
 


	public String execute() throws SQLException {  
		return SUCCESS;  
    }  
  
    // 此方法对应的是struts.xml文件中的： <param* name="inputName">downloadFile</param> 返回下载文件的流
    public InputStream getDownloadFile() {  
        InputStream is = null;  
        System.out.println(filepath);
        System.out.println(fileName);
        String realpath = ServletActionContext.getServletContext().getRealPath("/");
        try {  
            is = new FileInputStream(realpath +filepath);  
        } catch (FileNotFoundException e) {  
            e.printStackTrace();  
        }  
        return is;  
    }




	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



   
    
	 
	 
   
}  