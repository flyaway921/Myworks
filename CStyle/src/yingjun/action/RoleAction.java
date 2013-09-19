package yingjun.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import yingjun.dto.Json;
import yingjun.dto.RoleDTO;
import yingjun.dto.UserDTO;
import yingjun.service.RoleServiceI;
import yingjun.service.UserServiceI;

@ParentPackage("base")
@Namespace("/")
@Action(value = "roleAction")
public class RoleAction extends BaseAction implements ModelDriven<RoleDTO> {
	
	private RoleDTO roledto = new RoleDTO();
	private RoleServiceI roleService;
	
	public RoleDTO getModel() {
		return roledto;
	}
	public RoleServiceI getRoleService() {
		return roleService;
	}
	@Autowired
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}
	
	
	
	//获取角色combogrid
	public void getRole(){
		super.writeJson(roleService.getRole());
	}
	
    //获取角色资源dategrid
    public void  getRoleResource(){
    	super.writeJson(roleService.getRoleResource());
    }
    //增加角色
    public void addRole(){
    	Json j = new Json();
		try {
			roleService.add(roledto);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("添加失败！存在该用户！");
		}
		super.writeJson(j);
    	
    }
    //删除角色
    public void deleteRole(){
    	Json j = new Json();
		try {
			roleService.delete(roledto);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除失败！");
		}
		super.writeJson(j);
    	
    }
    
  //更新角色
    public void updateRole(){
    	Json j = new Json();
		try {
			roleService.update(roledto);
			j.setSuccess(true);
			j.setMsg("更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新失败！");
		}
		super.writeJson(j);
    	
    }


	
}
