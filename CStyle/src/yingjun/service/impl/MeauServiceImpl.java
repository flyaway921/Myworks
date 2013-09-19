package yingjun.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yingjun.dao.BaseDaoI;
import yingjun.dto.MeauDTO;
import yingjun.model.Meau;
import yingjun.service.MeauServiceI;
@Service("meauService")
public class MeauServiceImpl implements MeauServiceI{
	private BaseDaoI<Meau> meauDao;
	
	public BaseDaoI<Meau> getMeauDao() {
		return meauDao;
	}
	@Autowired
	public void setMeauDao(BaseDaoI<Meau> meauDao) {
		this.meauDao = meauDao;
	}

	
	public List<MeauDTO> getMeauTree(String id) {
		List<MeauDTO> al=new ArrayList<MeauDTO>();
		List<Meau> l=null;
		if(id == null || id.equals("")){
			l=meauDao.find("from Meau m where m.pmenu=null order by m.seq");
		}else{
			Map<String,Object> mp=new HashMap<String,Object> ();
			mp.put("id", id);
			l=meauDao.find("from Meau m where m.pmenu.id=:id order by m.seq",mp);
		}
		if(l!=null&&l.size()>0){
		  for(Meau m:l){
			  MeauDTO md=new MeauDTO();
			  BeanUtils.copyProperties(m, md);
			  Map<String,Object> attributes=new HashMap<String,Object>() ;
			  attributes.put("url", m.getUrl());
			  md.setAttributes(attributes);
			  if(m.getCmenus()!=null&&!m.getCmenus().isEmpty()){
				  md.setState("closed");
				 
			  }else{
				  md.setState("open");
			  }
			  al.add(md);
		  }
		}
		return al;
	}
	
	public List<MeauDTO> getAllMeauTree() {
		List<MeauDTO> al=new ArrayList<MeauDTO>();
		List<Meau> l=meauDao.find("from Meau m order by m.seq ");
		if(l!=null&&l.size()>0){
			  for(Meau m:l){
				  MeauDTO md=new MeauDTO();
				  BeanUtils.copyProperties(m, md);
				  Map<String,Object> attributes=new HashMap<String,Object>() ;
				  attributes.put("url", m.getUrl());
				  md.setAttributes(attributes);
				  if(m.getPmenu()!=null){  //判断当前节点的父节点是否为空
					  md.setPid(m.getPmenu().getId());
				  }	
				  al.add(md);
			  }
			}
			return al;
	}
	
	public List<MeauDTO> getTreeGrid() {
		List<Meau> l = meauDao.find("from Meau m order by m.seq");
		List<MeauDTO> nl = new ArrayList<MeauDTO>();
		if (l != null && l.size()>0) {
			for (Meau t : l) {
				MeauDTO r = new MeauDTO();
				BeanUtils.copyProperties(t, r);
				if (t.getPmenu() != null) {
					r.setPid(t.getPmenu().getId());
					r.setPtext(t.getPmenu().getText());
				}
				
				nl.add(r);
			}
		}
		return nl;
	}
	
	
	public MeauDTO add(MeauDTO mdto) {
		Meau pm=null;
		if(mdto.getPid()!=null&&!mdto.getPid().trim().equals("")){
			 pm=meauDao.get(Meau.class, mdto.getPid());
		}
		Meau m=new Meau();
		BeanUtils.copyProperties(mdto, m);
		if(pm!=null){
			m.setPmenu(pm);
		}
		meauDao.save(m);
		BeanUtils.copyProperties(m, mdto);
		return mdto;
	}
	
	
	public void delete(String id) {
		Meau t = meauDao.get(Meau.class, id);
		this.del(t);
	}
	private void del(Meau r) {
		Set<Meau> s = r.getCmenus();
		if (s != null && !s.isEmpty()) {
			for (Meau t : s) {
				del(t);
			}
		}
		meauDao.delete(r);
	}
	
	
	public MeauDTO update(MeauDTO mdto) {
		Meau t = meauDao.get(Meau.class, mdto.getId());// 要修改的权限
		if (t != null) {
			BeanUtils.copyProperties(mdto, t);
			t.setPmenu(null);// 现将当前节点的父节点置空
			if (mdto.getPid() != null && !mdto.getPid().trim().equals("") && !mdto.getPid().equals(mdto.getId())) {
				// 如果pid不为空，并且pid不跟自己的id相同，说明要修改当前节点的父节点
				Meau pmenu = meauDao.get(Meau.class, mdto.getPid());// 要设置的上级权限
				if (pmenu != null) {
					if (isDown(t, pmenu)) {// 要将当前节点修改到当前节点的子节点中
						Set<Meau> tmenus = t.getCmenus();// 当前要修改的权限的所有下级权限
						if (tmenus != null && tmenus.size() > 0) {
							for (Meau tmenu : tmenus) {
								if (tmenu != null) {
									tmenu.setPmenu(null);
								}
							}
						}
					}
					t.setPmenu(pmenu);
				}
			}
		}
		return mdto;
	}
 
	/**
	 * 判断是否是将当前节点修改到当前节点的子节点
	 * 
	 */
	private boolean isDown(Meau t, Meau pt) {
		if (pt.getPmenu() != null) {
			if (pt.getPmenu().getId().equals(t.getId())) {
				return true;
			} else {
				return isDown(t, pt.getPmenu());
			}
		}
		return false;
	}


}

	

