package yingjun.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yingjun.dao.BaseDaoI;
import yingjun.dto.DataGrid;
import yingjun.dto.RoleDTO;
import yingjun.model.Resource;
import yingjun.model.Role;
import yingjun.model.RoleResource;
import yingjun.model.User;
import yingjun.service.RoleServiceI;
@Service("roleService")
public class RoleServiceImpl implements RoleServiceI {

	
	private BaseDaoI<Role> roleDao;
	private BaseDaoI<Resource> resourceDao;
	private BaseDaoI<RoleResource> roleresourceDao;
	
	public BaseDaoI<Role> getRoleDao() {
		return roleDao;
	}
	@Autowired
	public void setRoleDao(BaseDaoI<Role> roleDao) {
		this.roleDao = roleDao;
	}
	
    public BaseDaoI<Resource> getResourceDao() {
		return resourceDao;
	}
    @Autowired
	public void setResourceDao(BaseDaoI<Resource> resourceDao) {
		this.resourceDao = resourceDao;
	}
	public BaseDaoI<RoleResource> getRoleresourceDao() {
		return roleresourceDao;
	}
	@Autowired
	public void setRoleresourceDao(BaseDaoI<RoleResource> roleresourceDao) {
		this.roleresourceDao = roleresourceDao;
	}
	
    
    public DataGrid getRole() {
    	DataGrid dg = new DataGrid();
		List<Role> rlist=roleDao.find("from Role r");
		List<RoleDTO> dtolist=new ArrayList<RoleDTO>();
		if (rlist != null && rlist.size() > 0) {
			for(Role t : rlist){
			 RoleDTO rdto = new RoleDTO();
			 BeanUtils.copyProperties(t, rdto);
			 dtolist.add(rdto);
			}
		}
		dg.setTotal(rlist.size());
		dg.setRows(dtolist);
		return dg;
    	
    }
    
	public DataGrid getRoleResource() {
		DataGrid dg = new DataGrid();
		List<Role> rlist=roleDao.find("from Role r");
		List<RoleDTO> dtolist=new ArrayList<RoleDTO>();
		if (rlist != null && rlist.size() > 0) {
			for(Role t : rlist){
				String resourceIds ="";
				String resourceNames = "";
			    Set<RoleResource> s = t.getRoleResources();
			    if(s!=null && !s.isEmpty()){
		    	    for(RoleResource rr:s){
		    	    	if(resourceIds.length()>0){
		    	    		resourceIds+=",";
		    	    		resourceNames+=",";
		    	    	}
		    	    	resourceIds+=rr.getResource().getId();
		    	    	resourceNames+=rr.getResource().getText();
		    	    }
				
		        }
				 RoleDTO rdto = new RoleDTO();
				 BeanUtils.copyProperties(t, rdto);
				 rdto.setResourceIds(resourceIds);
				 rdto.setResourceNames(resourceNames);
				 dtolist.add(rdto);
			}
		}
		dg.setTotal(rlist.size());
		dg.setRows(dtolist);
		return dg;
	}
	
	public void add(RoleDTO roledto) {
		Role r=new Role();
		BeanUtils.copyProperties(roledto, r);
        roleDao.save(r);
        if(roledto.getResourceIds()!=null){
        	String[] resourceIds=roledto.getResourceIds().replace(" ", "").split(",");
            for(String id: resourceIds){
            	Resource res=resourceDao.get(Resource.class, id);
            	if(res!=null){
            		RoleResource rr=new RoleResource();
                	rr.setRole(r);
                	rr.setResource(res);
                	roleresourceDao.save(rr);
            	}
            }
        }
        
	}
	
	public void delete(RoleDTO roledto) {
		String[] ids=roledto.getIds().split(",");
		for(String id:ids){
			Role r=roleDao.get(Role.class,id);
			roleDao.delete(r);
		}
	}
	public void update(RoleDTO roledto) {
		Role r=roleDao.get(Role.class, roledto.getId());
		if(r!=null){
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("role", r);
			roleresourceDao.executeHql("delete RoleResource t where t.role=:role", params);
			BeanUtils.copyProperties(roledto, r);
			if (roledto.getResourceIds() != null) {
				for (String id : roledto.getResourceIds().replace(" ", "").split(",")) {
					Resource res =resourceDao.get(Resource.class, id);
						if(res!=null){	
							RoleResource rore=new RoleResource();
						    rore.setRole(r);
							rore.setResource(res);
							roleresourceDao.save(rore);
						}
				  }
		    }
	  }
	}
	
    
    
    

	
}
