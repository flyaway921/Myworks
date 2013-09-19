package yingjun.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.ModelDriven;
import yingjun.dto.AdviceDTO;
import yingjun.dto.DataGrid;
import yingjun.dto.Json;
import yingjun.service.AdviceServiceI;

@ParentPackage("base")
@Namespace("/")
@Action(value = "adviceAction")
public class AdviceAction extends BaseAction implements ModelDriven<AdviceDTO> {
	private AdviceDTO advicedto=new AdviceDTO();
	public AdviceDTO getModel() {
		return advicedto;
	}
	private AdviceServiceI adviceService;
	public AdviceServiceI getAdviceService() {
		return adviceService;
	}
	@Autowired
	public void setAdviceService(AdviceServiceI adviceService) {
		this.adviceService = adviceService;
	}
	
	
    public void getAdvice(){
    	DataGrid d = adviceService.getAdvice();
        super.writeJson(d);
    }
    public void noAuth_addAdvice(){
    	Json j = new Json();
		try {
			adviceService.add(advicedto);
			j.setSuccess(true);
			j.setMsg("添加留言成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("添加留言失败！");
		}
		super.writeJson(j);
	}
    public void deleteAdvice(){
    	Json j = new Json();
		try {
			adviceService.delete(advicedto.getIds());
			j.setSuccess(true);
			j.setMsg("删除留言成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除留言失败！");
		}
		super.writeJson(j);
	}
    	
    public void updateAdvice(){
    	Json j = new Json();
		try {
			adviceService.update(advicedto);
			j.setSuccess(true);
			j.setMsg("更新留言成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新留言失败！");
		}
		super.writeJson(j);
    }
    
   

    
	
}
