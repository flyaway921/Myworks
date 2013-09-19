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
import org.springframework.transaction.annotation.Transactional;

import yingjun.dao.BaseDaoI;
import yingjun.dto.MeauDTO;
import yingjun.dto.ResourceDTO;
import yingjun.model.Meau;
import yingjun.model.Resource;
import yingjun.service.MeauServiceI;
import yingjun.service.ResourceServiceI;
@Service("resourceService")
@Transactional()
public class ResourceServiceImpl implements ResourceServiceI{
	private BaseDaoI<Resource> resourceDao;

	public BaseDaoI<Resource> getResourceDao() {
		return resourceDao;
	}
	@Autowired
	public void setResourceDao(BaseDaoI<Resource> resourceDao) {
		this.resourceDao = resourceDao;
	}
	
	
	
	

	
	
	
	public List<ResourceDTO> getResource() {
		List<Resource> l = resourceDao.find("from Resource r order by r.seq");
		List<ResourceDTO> nl = new ArrayList<ResourceDTO>();
			for (Resource r : l) {
				ResourceDTO lr = new ResourceDTO();
				BeanUtils.copyProperties(r, lr);
				if (r.getResource()!= null) {
					lr.setPid(r.getResource().getId());
					lr.setPtext(r.getResource().getText());
				}
				
				nl.add(lr);
			}
		
		return nl;
	}
	
	public ResourceDTO add(ResourceDTO rdto) {
		Resource r=new Resource();
		BeanUtils.copyProperties(rdto, r);	
		if(rdto.getPid()!=null&&!rdto.getPid().trim().equals("")){
			Resource rs=resourceDao.get(Resource.class, rdto.getPid());
			if(rs!=null){
				r.setResource(rs);
			}
		}
		resourceDao.save(r);
		return rdto;
	}
	
	
	
	public void delete(String id) {
		Resource t = resourceDao.get(Resource.class, id);
		this.del(t);
	}
	private void del(Resource r) {
		Set<Resource> s = r.getResources();
		if (s != null && !s.isEmpty()) {
			for (Resource t : s) {
				del(t);
			}
		}
		resourceDao.delete(r);
	}
	
	
	public ResourceDTO update(ResourceDTO mdto) {
		Resource r = resourceDao.get(Resource.class, mdto.getId());// 要修改的权限
		if (r != null) {
			BeanUtils.copyProperties(mdto, r);
	    	r.setResource(null);// 现将当前节点的父节点置空
			if (mdto.getPid() != null && !mdto.getPid().trim().equals("") && !mdto.getPid().equals(mdto.getId())) {
				// 如果pid不为空，并且pid不跟自己的id相同，说明要修改当前节点的父节点
				Resource presource = resourceDao.get(Resource.class, mdto.getPid());// 要设置的上级权限
				if (presource != null) {
					if (isDown(r, presource)) {// 要将当前节点修改到当前节点的子节点中
						Set<Resource> tresource = r.getResources();// 当前要修改的权限的所有下级权限
						if (tresource != null && tresource.size() > 0) {
							for (Resource tmenu : tresource) {
								if (tmenu != null) {
									tmenu.setResource(null);
								}
							}
						}
					}
					r.setResource(presource);
				}
			}
		}
		return mdto;
	}
 
	/**
	 * 判断是否是将当前节点修改到当前节点的子节点
	 * 
	 */
	private boolean isDown(Resource r, Resource pr) {
		if (pr.getResource() != null) {
			if (pr.getResource().getId().equals(r.getId())) {
				return true;
			} else {
				return isDown(r, pr.getResource());
			}
		}
		return false;
	}



	

}

	

