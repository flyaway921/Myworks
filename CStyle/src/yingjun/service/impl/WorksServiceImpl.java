package yingjun.service.impl;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.corba.se.spi.orbutil.threadpool.Work;

import yingjun.dao.BaseDaoI;
import yingjun.dto.DataGrid;
import yingjun.dto.WorksDTO;
import yingjun.model.Type;
import yingjun.model.User;
import yingjun.model.Works;
import yingjun.service.WorksServiceI;

@Service("worksService")
public class WorksServiceImpl implements WorksServiceI {

	
	private BaseDaoI<Works> worksDao;
	private BaseDaoI<Type> typeDao;
	private BaseDaoI<User> userDao;
	
	public BaseDaoI<Works> getWorksDao() {
		return worksDao;
	}
	@Autowired
	public void setWorksDao(BaseDaoI<Works> worksDao) {
		this.worksDao = worksDao;
	}
	public BaseDaoI<Type> getTypeDao() {
		return typeDao;
	}
	@Autowired
	public void setTypeDao(BaseDaoI<Type> typeDao) {
		this.typeDao = typeDao;
	}
	public BaseDaoI<User> getUserDao() {
		return userDao;
	}
	@Autowired
	public void setUserDao(BaseDaoI<User> userDao) {
		this.userDao = userDao;
	}
	
	
	public void add(WorksDTO dto) {
		Works w=new Works();
		BeanUtils.copyProperties(dto, w);
		Type t=typeDao.get(Type.class, dto.getTypeid());
		User u=userDao.get(User.class, dto.getUserid());
		w.setUser(u);
		w.setType(t);
		w.setCtime(new Date());
		w.setMtime(new Date());
		worksDao.save(w);
	}
	
	public void delete(String ids) {
		for(String id:ids.split(",")){
			Works w= worksDao.get(Works.class, id);
			if(w!=null){
			worksDao.delete(w);
		 }
	  }
		
	}
	public void frontdelete(String id){
		Works w= worksDao.get(Works.class, id);
		if(w!=null){
			worksDao.delete(w);
		}
	}
	
	
	public void update(WorksDTO dto) {
		Works w= worksDao.get(Works.class, dto.getId()); 
		BeanUtils.copyProperties(dto, w, new String[]{"ctime","viewnums"});
		w.setMtime(new Date());
		if(dto.getTypeid()!=null){
			Type t=typeDao.get(Type.class, dto.getTypeid());
			if(t!=null){
				w.setType(t);
			}
		}
	}
	public DataGrid getworks(WorksDTO worksdto,int i) {
		String hql="from Works w ";
		Map<String,Object> params=new HashMap<String,Object>();
		hql = addWhere(worksdto, hql, params,i);
		hql = addOrder(worksdto, hql);
		List<Works> workslist=worksDao.find(hql,params);
		List<WorksDTO> worksdtolist=new ArrayList<WorksDTO>();
		changeModel(workslist,worksdtolist );
		DataGrid dg=new DataGrid();
		dg.setTotal(worksdtolist.size());
		dg.setRows(worksdtolist);
		return dg;
	}
	
	
	
	
	private String addWhere(WorksDTO worksdto, String hql, Map<String, Object> params,int i) {
	     
		hql+="where w.type.pref=:pref ";
		params.put("pref", i);
		if(worksdto.getTitle()!=null&&!worksdto.getTitle().trim().equals("")){
			hql+="and  w.title like :title ";
			params.put("title", "%"+worksdto.getTitle().trim()+"%");
		}
		if(worksdto.getWorkstype()!=null&&!worksdto.getWorkstype().trim().equals("")){
			if(!worksdto.getWorkstype().trim().equals("全部")){
				hql+="and w.type.type like :type ";
				params.put("type", worksdto.getWorkstype());
			}
		}
		return hql;
	}
	
	private String addOrder(WorksDTO worksdto, String hql) {
		if(worksdto.getSort()!=null){
			if(worksdto.getSort().equals("workstype")){
				hql+="order by typeid "+worksdto.getOrder();
				return hql;
			}
			if(worksdto.getSort().equals("uesrname")){
				hql+="order by userid "+worksdto.getOrder();
				return hql;
			}
			
			hql+="order by "+worksdto.getSort()+" "+worksdto.getOrder();
		}
		return hql;
		
	}
	
    
	private void changeModel( List<Works> workslist,List<WorksDTO> worksdtolist) {
		if(workslist!=null&&workslist.size()>0){
			for(Works w:workslist){
				WorksDTO wd=new WorksDTO();
				BeanUtils.copyProperties(w, wd);
				wd.setUserid(w.getUser().getId());
				wd.setUsername(w.getUser().getName());
				wd.setTypeid(w.getType().getId());
				wd.setWorkstype(w.getType().getType());
				worksdtolist.add(wd);
			}
		}
	}
	public WorksDTO previewById(String id) {
		WorksDTO wdto=new WorksDTO();
		Works w=worksDao.get(Works.class, id);
		if(w!=null){
			w.setViewnums(w.getViewnums()+1);
			BeanUtils.copyProperties(w, wdto);
			wdto.setUsername(w.getUser().getName());
		}
		return wdto;
	}
	public WorksDTO previewforupdate(String id){
		WorksDTO wdto=new WorksDTO();
		Works w=worksDao.get(Works.class, id);
		if(w!=null){
			BeanUtils.copyProperties(w, wdto);
			wdto.setWorkstype(w.getType().getPref()+"");
			return wdto;
		}
		return null;
	}
	
	
	
	
	
	public List<Type> getWorksType(int i) {
		return typeDao.find("from Type t where t.pref="+i);
	}
	
	public DataGrid getRankings(WorksDTO wwdto) {
		DataGrid dg=new DataGrid();
		String hql="from Works w ";
		if(wwdto.getRankingid()!=0){
			hql+="where w.type.pref="+wwdto.getRankingid();
		}
		hql+=" order by viewnums desc";
		List<Works> al=worksDao.find(hql);
		List<WorksDTO> adto=new ArrayList<WorksDTO>();
		for(Works w:al){
			WorksDTO dto =new WorksDTO();
			BeanUtils.copyProperties(w, dto);
			dto.setUsername(w.getUser().getName());
			dto.setWorkstype(w.getType().getType());
			adto.add(dto);
		}
		dg.setRows(adto);
		dg.setTotal(adto.size());
		return dg;
		 
	}
	public List<Works> getworksById(String id,int page,int rows,String title,String typeid) {
		User u=userDao.get(User.class, id);
		if(u!=null){
			String hql="from Works w where w.user=:user ";
			Map<String, Object> params =new HashMap<String, Object>();
			params.put("user", u);
			if(title!=null&&title.length()>0){
				hql+="and w.title like :title ";
				params.put("title", "%"+title+"%");
			}
			if(typeid!=null&&typeid.length()>0){
				hql+="and w.type.id=:typeid ";
				params.put("typeid", typeid);
			}
			hql+="order by ctime desc";
			List<Works> w=worksDao.find(hql, params, page, rows);
			return w;
		}
		return null;
	}
	
	
	
	
	public List<Works> getworks(int page,int rows,String title,String typeid){
		String hql="from Works w where 1=1 ";
		Map<String, Object> params =new HashMap<String, Object>();
		if(title!=null&&title.length()>0){
			hql+="and w.title like :title ";
			params.put("title", "%"+title+"%");
		}
		if(typeid!=null&&typeid.length()>0){
			hql+="and w.type.id=:typeid ";
			params.put("typeid", typeid);
		}
		hql+="order by ctime desc";
		List<Works> w=worksDao.find(hql, params, page, rows);
		return w;
	
	}
	
	
	public List<Works> getRankings(String typeid,int topnum){
		Map<String, Object> params =new HashMap<String, Object>();
		String hql="from Works w ";
		if(typeid!=null&&typeid.length()>0){
			hql+="where w.type.id=:typeid ";
			params.put("typeid", typeid);
		}
		hql+="order by viewnums desc";
		List<Works> wlist=worksDao.find(hql,params,1, topnum);
		return wlist;
	}
	
	
	
	
	public WorksDTO getNewWorks(String userid) {
		User u=userDao.get(User.class, userid);
		if(u!=null){
			Works w=worksDao.find("from Works w where w.user=? order by ctime desc ", u, 0, 1).get(0);
			if(w!=null){
				WorksDTO wdto=new WorksDTO();
				BeanUtils.copyProperties(w, wdto);
				wdto.setUsername(w.getUser().getName());
				return wdto;
			}
		}
		return null;
	}
	
	public long getWorksCounts(String userid,String title,String typeid) {
		long num=0;
		User u=null;
		Map<String,Object> params=new HashMap<String,Object>();
		if(userid!=null&&userid.length()>0){
			 u=userDao.get(User.class,userid);
		}
		String hql="select count(*) from Works w where 1=1 ";
		if(title!=null&&title.length()>0){
			hql+="and w.title like :title ";
			params.put("title", "%"+title+"%");
		}
		if(typeid!=null&&typeid.length()>0){
			hql+="and w.type.id=:typeid ";
			params.put("typeid", typeid);
		}
		if(u!=null){
			hql+="and w.user=:user ";
			params.put("user", u);
		}
		num=worksDao.count(hql, params);
		return num;
	}
    

	
}
