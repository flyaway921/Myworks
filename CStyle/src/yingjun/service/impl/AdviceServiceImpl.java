package yingjun.service.impl;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yingjun.dao.BaseDaoI;
import yingjun.dto.AdviceDTO;
import yingjun.dto.DataGrid;
import yingjun.model.Advice;
import yingjun.model.User;
import yingjun.service.AdviceServiceI;

@Service("adviceService")
public class AdviceServiceImpl implements AdviceServiceI {

	
	private BaseDaoI<Advice> adviceDao;
	private BaseDaoI<User> userDao;

	public BaseDaoI<Advice> getAdviceDao() {
		return adviceDao;
	}
	@Autowired
	public void setAdviceDao(BaseDaoI<Advice> adviceDao) {
		this.adviceDao = adviceDao;
	}
	public BaseDaoI<User> getUserDao() {
		return userDao;
	}
	@Autowired
	public void setUserDao(BaseDaoI<User> userDao) {
		this.userDao = userDao;
	}
	
	
	
	public void add(AdviceDTO dto) {
		Advice ad=new Advice();
		BeanUtils.copyProperties(dto, ad);
		ad.setCreatetime(new Date());
		User u=userDao.get(User.class, dto.getUserid());
		if(u!=null){
			ad.setUser(u);
		}
		adviceDao.save(ad);
	}
	
	public void delete(String ids) {
		for (String id : ids.split(",")) {
		   Advice ad=adviceDao.get(Advice.class, id);
		   adviceDao.delete(ad);
		}
	}
	
	public void update(AdviceDTO dto){
		Advice ad=adviceDao.get(Advice.class,dto.getId());
		ad.setTitle(dto.getTitle());
		ad.setContent(dto.getContent());
	}
	
	public DataGrid getAdvice() {
		List<Advice> la=adviceDao.find("from Advice a order by createtime desc");
		List<AdviceDTO> ladto=new ArrayList<AdviceDTO>();
		for(Advice a:la){
			AdviceDTO adto=new AdviceDTO();
			BeanUtils.copyProperties(a, adto);
			if(a.getUser()!=null){
				adto.setUserid(a.getUser().getId());
				adto.setUsername(a.getUser().getName());
			}
			ladto.add(adto);
		}
		DataGrid dg=new DataGrid();
		dg.setRows(ladto);
		dg.setTotal(la.size());
		return dg;
	}
	

	
    
    
    

	
}
