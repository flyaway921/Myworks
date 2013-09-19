package yingjun.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import yingjun.dto.Json;
import yingjun.dto.ResourceDTO;
import yingjun.dto.RoleDTO;
import yingjun.dto.UserDTO;
import yingjun.service.ResourceServiceI;
import yingjun.service.RoleServiceI;
import yingjun.service.UserServiceI;

@ParentPackage("base")
@Namespace("/")
@Action(value = "resourceAction")
public class ResourceAction extends BaseAction implements ModelDriven<ResourceDTO> {

	private static final long serialVersionUID = 1L;
	private ResourceDTO resourcedto = new ResourceDTO();
	private ResourceServiceI resourceService;
	
	public ResourceDTO getModel() {
		return resourcedto;
	}
	

	public ResourceServiceI getResourceService() {
		return resourceService;
	}

	@Autowired
	public void setResourceService(ResourceServiceI resourceService) {
		this.resourceService = resourceService;
	}

	
	
	
	
	public void getResource(){
		super.writeJson(resourceService.getResource());
	}
	
    
	
	public void addResource(){
		Json j = new Json();
		try {
			resourceService.add(resourcedto);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("添加失败！");
		}
		super.writeJson(j);
	}

	
	public void deleteResource(){
		Json j = new Json();
		try {
			resourceService.delete(resourcedto.getId());
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除失败！");
		}
		super.writeJson(j);
	}

	public void updateResource(){
		Json j = new Json();
		try {
			resourceService.update(resourcedto);
			j.setSuccess(true);
			j.setMsg("更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新失败！");
		}
		super.writeJson(j);
	}
	
	
	
	
	
}







	





	

