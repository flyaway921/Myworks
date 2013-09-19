package yingjun.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import yingjun.dto.Json;
import yingjun.dto.MeauDTO;
import yingjun.service.MeauServiceI;

import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("base")
@Namespace("/")
@Action("meauAction")
public class MeauAction extends BaseAction implements ModelDriven<MeauDTO> {
	private MeauDTO meaudto=new MeauDTO();
	private MeauServiceI meauService;

	public MeauDTO getModel() {
		return meaudto;
	}
	public MeauServiceI getMeauService() {
		return meauService;
	}
	@Autowired
	public void setMeauService(MeauServiceI meauService) {
		this.meauService = meauService;
	}
	
	/*获取meau树（异步）*/
	public void getMeauTree(){
		super.writeJson(meauService.getMeauTree(meaudto.getId()));
	}
	/*获取全部meau树*/
	public void getAllMeauTree(){
		super.writeJson(meauService.getAllMeauTree());
	}
	
	/*获取meautreegrid*/
	public void getTreeGrid(){
		super.writeJson(meauService.getTreeGrid());
	}
	/*增加meau树*/
	public void addMeauTree(){
		Json j = new Json();
		try {
			j.setObj(meauService.add(meaudto));
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("添加失败！");
		}
		super.writeJson(j);
	}

	/*删除meau树*/
	public void delMeauTree(){
		Json j = new Json();
		try {
			meauService.delete(meaudto.getId());
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除失败！");
		}
		super.writeJson(j);
	}
	/*编辑meau树*/
	public void updateMeauTree(){
		Json j = new Json();
		try {
			meauService.update(meaudto);
			j.setSuccess(true);
			j.setMsg("更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新失败！");
		}
		super.writeJson(j);
	}
	
}
