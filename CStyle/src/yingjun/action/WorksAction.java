package yingjun.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ModelDriven;
import yingjun.dto.DataGrid;
import yingjun.dto.Json;
import yingjun.dto.WorksDTO;
import yingjun.model.Works;
import yingjun.service.WorksServiceI;

@ParentPackage("base")
@Namespace("/")
@ResultPath("/")
@Action(value = "worksAction")
@Results({
	      @Result(name="preview" ,location="admin/preview.jsp"),
	      @Result(name="addworks",location="admin/works_add.jsp"),
	      @Result(name="updateworks",location="admin/works_update.jsp"),
	      @Result(name="addvideos",location="admin/videos_add.jsp"),
	      @Result(name="updatevideos",location="admin/videos_update.jsp"),
	      @Result(name="index" ,type="redirect",location="front/index.jsp"),
	      @Result(name="myindex",location="front/myindex.jsp")
	    })
public class WorksAction extends BaseAction implements ModelDriven<WorksDTO> {
	private static final long serialVersionUID = 1L;
	private WorksDTO worksdto=new WorksDTO();
	private WorksServiceI worksService;
	private List<Works> wlist=new ArrayList<Works>();
	public HttpServletRequest request=ServletActionContext.getRequest();
	public HttpSession session=ServletActionContext.getRequest().getSession();
	
	
	
	/*前往成果页面*/
	public String front_toMyworks(){
		if(worksdto.getPage()==0){
			worksdto.setPage(1);
		}
		wlist=worksService.getworksById(worksdto.getUserid(), worksdto.getPage(), 16,worksdto.getTitle(),worksdto.getTypeid());
		Long allnums=worksService.getWorksCounts(worksdto.getUserid(),worksdto.getTitle(),worksdto.getTypeid());
		long pageCount=allnums/16+1;;
		if(allnums%16==0){
			pageCount=allnums/16;
	    }
		worksdto.setPageCount(pageCount);
		this.addActionMessage("tomyworks");
		return "myindex";
	}
	
	/*查看具体某个成果*/
	public String front_Preview(){
		worksdto=worksService.previewById(worksdto.getId());
    	this.addActionMessage("fpreview");
    	return "myindex";
    }
	
	/*前台添加成果*/
	public String front_addworks(){
		worksService.add(worksdto);
		worksdto=worksService.getNewWorks(worksdto.getUserid());
		this.addActionMessage("fpreview");
		return "myindex";
	}
	/*前台删除成果*/
	public String front_deleteworks(){
		worksService.frontdelete(worksdto.getId());
		return this.front_toMyworks();
	}
	/*前台更新成果*/
	public String front_updateworks(){
		worksService.update(worksdto);
		return this.front_Preview();
	}
	/*前台跳转到更新页面*/
	public String front_toupdateworks(){
		worksdto=worksService.previewforupdate(worksdto.getId());
		this.addActionMessage("toupdateworks");
		return "myindex";
	}
	/*获取榜单排名*/
	public String front_getRankings(){
	    wlist=worksService.getRankings(worksdto.getTypeid(),15);
		this.addActionMessage("rankings");
		return "myindex";
		
	}
	/*获取成果列表*/
	public String front_getWorks(){
		if(worksdto.getPage()==0){
			worksdto.setPage(1);
		}
		wlist=worksService.getworks(worksdto.getPage(), 16,worksdto.getTitle(),worksdto.getTypeid());
		Long allnums=worksService.getWorksCounts(null,worksdto.getTitle(),worksdto.getTypeid());
		long pageCount=allnums/16+1;;
		if(allnums%16==0){
			pageCount=allnums/16;
	    }
		worksdto.setPageCount(pageCount);
		this.addActionMessage("works");
		return "myindex";
	}
	
	/*获取最新12个作品*/
	public void front_getEastNewWorks(){
		session.setAttribute("new12works", worksService.getworks(1, 12,null,null));
	}
	
	/*获取前10作品*/
	public void front_getEastTopWorks(){
		session.setAttribute("top10works", worksService.getRankings(null,10));
	}
	
	public String front_getIndexAction(){
		front_getEastNewWorks();
		front_getEastTopWorks();
		session.setAttribute("T_flag", "123"); 
		return "index";
	}
	public String front_toindex(){
		return "index";
	}
    
	public String noAuth_Preview(){
		worksdto=worksService.previewById(worksdto.getId());
    	return "preview";
    }
	
	public String  noAuth_addWorksRedirect(){
    	return "addworks";
	}
	public String  noAuth_addVideosRedirect(){
		return "addvideos";
	}
	public String  noAuth_updateWorksRedirect(){
		worksdto=worksService.previewById(worksdto.getId());
    	return "updateworks";
	}
	public String  noAuth_updateVideosRedirect(){
		worksdto=worksService.previewById(worksdto.getId());
    	return "updatevideos";
	}
	
    public void getRankings(){
    	DataGrid d = worksService.getRankings(worksdto);
        super.writeJson(d);
    }
    
    public void getWorks(){
    	DataGrid d = worksService.getworks(worksdto,1);
        super.writeJson(d);
    }
    
    public void getVideos(){
    	DataGrid d = worksService.getworks(worksdto,2);
        super.writeJson(d);
    }
   
    public void getWorksType(){
    	super.writeJson(worksService.getWorksType(1));
    }
    public void  getVideosType(){
    	super.writeJson(worksService.getWorksType(2));
    }
    
  
	
    
    
    public void addWorks(){
    	Json j=new Json();
		try {
			worksService.add(worksdto);
			j.setSuccess(true);
			j.setMsg("添加成功");
		} catch (Exception e) {
			j.setMsg("添加失败") ;
		}
		super.writeJson(j);
	}
    
    public void addVideos(){
    	this.addWorks();
    }
    
    public void deleteWorks(){
    	Json j = new Json();
		try {
			worksService.delete(worksdto.getIds());
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除失败！");
		}
		super.writeJson(j);
	}
    
    public void deleteVideos(){
    	this.deleteWorks();
    }
    
    public void updateWorks(){
    	Json j = new Json();
		try {
			worksService.update(worksdto);
			j.setSuccess(true);
			j.setMsg("更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新失败！");
		}
		super.writeJson(j);
    }
    
    public void updateVideos(){
    	this.updateWorks();
    }
    
   
	
	
	
	
	
	
	//get and set
    public WorksDTO getModel() {
		return worksdto;
	}
	
	public WorksServiceI getWorksService() {
		return worksService;
	}
	@Autowired
	public void setWorksService(WorksServiceI worksService) {
		this.worksService = worksService;
	}
	public List<Works> getWlist() {
		return wlist;
	}
	public void setWlist(List<Works> wlist) {
		this.wlist = wlist;
	}
    
	
}
