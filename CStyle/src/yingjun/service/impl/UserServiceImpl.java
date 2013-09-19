package yingjun.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yingjun.dao.BaseDaoI;
import yingjun.dto.DataGrid;
import yingjun.dto.UserDTO;
import yingjun.model.Role;
import yingjun.model.RoleResource;
import yingjun.model.User;
import yingjun.model.UserRole;
import yingjun.model.Works;
import yingjun.service.UserServiceI;
import yingjun.util.Encrypt;
import yingjun.util.IpUtil;



@Service("userService")
public class UserServiceImpl implements UserServiceI {
	
	private BaseDaoI<User> userDao;
	private BaseDaoI<Role> roleDao;
	private BaseDaoI<UserRole> userRoleDao;
	private BaseDaoI<Works> worksDao;

	public BaseDaoI<User> getUserDao() {
		return userDao;
	}
	@Autowired
	public void setUserDao(BaseDaoI<User> userDao) {
		this.userDao = userDao;
	}
	public BaseDaoI<Role> getRoleDao() {
		return roleDao;
	}
	@Autowired
	public void setRoleDao(BaseDaoI<Role> roleDao) {
		this.roleDao = roleDao;
	}
	public BaseDaoI<UserRole> getUserRoleDao() {
		return userRoleDao;
	}
	@Autowired
	public void setUserRoleDao(BaseDaoI<UserRole> userRoleDao) {
		this.userRoleDao = userRoleDao;
	}
	public BaseDaoI<Works> getWorksDao() {
		return worksDao;
	}
	@Autowired
	public void setWorksDao(BaseDaoI<Works> worksDao) {
		this.worksDao = worksDao;
	}

	public UserDTO login(UserDTO userdto) {
		if(userdto.getPwd()!=null&&!userdto.getPwd().equals("")){
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("pwd",Encrypt.md5(userdto.getPwd()));
			params.put("name", userdto.getName());
			User u = userDao.get("from User u where type=0 and u.name = :name and u.pwd = :pwd", params);
			if (u != null) {
				BeanUtils.copyProperties(u, userdto,new String[]{"pwd"});
				u.setModifydatetime(new Date());
				Set<UserRole> rs=u.getUserRoles();
				String roletexts="";
				String resouseurls="";
				for(UserRole ur:rs){
					if(roletexts.length()>0){
						roletexts+=",";
					}
					roletexts+=ur.getRole().getText();
					Set<RoleResource> rrs=ur.getRole().getRoleResources();
					for(RoleResource rr:rrs){
						if(resouseurls.length()>0){
							resouseurls+=",";
						}
						resouseurls+=rr.getResource().getUrl();
					}
				}
				userdto.setRoletexts(roletexts);
				userdto.setResouseurls(resouseurls);
				return userdto;
			}
		}
		return null;
	}
	
	
	public UserDTO userlogin(UserDTO userdto) {
		if(userdto.getPwd()!=null&&!userdto.getPwd().equals("")){
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("pwd",Encrypt.md5(userdto.getPwd()));
			params.put("name", userdto.getName());
			User u = userDao.get("from User u where type=1 and u.name = :name and u.pwd = :pwd", params);
			if (u != null) {
				BeanUtils.copyProperties(u, userdto,new String[]{"pwd"});
				u.setModifydatetime(new Date());
				return userdto;
			}
		}
		return null;
	}
	
	
	public void add(UserDTO userdto) {
		User u = new User();
		BeanUtils.copyProperties(userdto, u,new String[] { "pwd" });
		u.setCreatedatetime(new Date());
		u.setModifydatetime(new Date());
		u.setPwd(Encrypt.e(userdto.getPwd()));
		if(userdto.getMail()!=null){
			u.setType(true);
		}
		userDao.save(u);
		
		if(userdto.getRoleids()!=null){
			   String roleids=userdto.getRoleids().replace(" ", "");
		       String[] alroleids=roleids.split(",");
		       for(String id:alroleids){
		    	   id=id.trim();
				   Role role=roleDao.get(Role.class, id);
				   if(role!=null){
					   UserRole ur=new UserRole();
					   ur.setRole(role);
					   ur.setUser(u);
					   userRoleDao.save(ur);
				   }
			  }
		}
	}
	
	
	public boolean frontupdateUserPwd(UserDTO userdto) {
		User u =userDao.get(User.class,userdto.getId());
		String oldpwd=Encrypt.e(userdto.getOldpwd());
		if(u.getPwd().equals(oldpwd)){
			u.setPwd(Encrypt.e(userdto.getPwd()));
			return true;
		}
		return false;
	}
	
	
	
	
	public void update(UserDTO userdto) {
		User u =userDao.get(User.class,userdto.getId());
		if(u!=null){
			if(userdto.getPwd()!=null&&!userdto.getPwd().trim().equals("")){
				u.setPwd(Encrypt.e(userdto.getPwd()));
			}else{
					BeanUtils.copyProperties(userdto, u,new String[]{"id","pwd","createdatetime","modifydatetime","type"});
					if(userdto.getMail()==null){
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("user", u);
						userRoleDao.executeHql("delete UserRole t where t.user=:user", params);
						String roleids=userdto.getRoleids().replace(" ", "");
							if(roleids!=null){
							   String[] alroleids=roleids.split(",");
						       for(String rid:alroleids){
						    		Role r = roleDao.get(Role.class, rid);
						    		if (r != null) {
						    			UserRole ur = new UserRole();
										ur.setRole(r);
										ur.setUser(u);
										userRoleDao.save(ur);
									}
							    }
							}
					}
			    }
			}
		
		
	}
	
	public void delete(String ids) {
		for (String id : ids.split(",")) {
			User t = userDao.get(User.class, id);
			if (t != null) {
				Set<UserRole> ur=t.getUserRoles();
				for(UserRole userrole:ur){
				   userRoleDao.delete(userrole);
				}
				userDao.delete(t);
			}
		}
	}
	
	
	public DataGrid userdatagrid(UserDTO userdto,int type) {
		String hql="from User u ";
		Map<String,Object> params=new HashMap<String,Object>();
		hql = addWhere(userdto, hql, params, type);
		
		String hqltotal="select count(*) "+hql;
		hql = addOrder(userdto, hql);
		
		List<User> userlist=userDao.find(hql,params,userdto.getPage(),userdto.getRows());
		Long total=userDao.count(hqltotal,params);
		
		List<UserDTO> userdtolist=new ArrayList<UserDTO>();
		changeModel(userlist,userdtolist );
		
		DataGrid dg=new DataGrid();
		dg.setTotal(total);
		dg.setRows(userdtolist);
		return dg;
	}
	
	
	private String addWhere(UserDTO userdto, String hql,Map<String, Object> params,int type) {
	     
		hql+="where u.type="+type+" ";
		if(userdto.getName()!=null&&!userdto.getName().trim().equals("")){
			hql+="and u.name like :name ";
			params.put("name", "%"+userdto.getName().trim()+"%");
		}
		if(userdto.getCreatedatetimeStart()!=null){
			hql += "and u.createdatetime >= :createdatetimeStart ";
			params.put("createdatetimeStart", userdto.getCreatedatetimeStart());
		}
		if(userdto.getCreatedatetimeEnd()!=null){
			hql += "and u.createdatetime <= :createdatetimeEnd ";
			System.out.println(userdto.getCreatedatetimeEnd());
			params.put("createdatetimeEnd", userdto.getCreatedatetimeEnd());
		}
		if(userdto.getModifydatetimeStart()!=null){
			hql += "and u.modifydatetime >= :modifydatetimeStart ";
			params.put("modifydatetimeStart", userdto.getModifydatetimeStart());
		}
		if(userdto.getModifydatetimeEnd()!=null){
			hql += "and u.modifydatetime <= :modifydatetimeEnd ";
			params.put("modifydatetimeEnd", userdto.getModifydatetimeEnd());
		}
	
		return hql;
	}
	
	
	private String addOrder(UserDTO userdto, String hql) {
		if(userdto.getSort()!=null){
			hql+="order by "+userdto.getSort()+" "+userdto.getOrder();
		}
		return hql;
	}
	
	private void changeModel( List<User> userlist,List<UserDTO> userdtolist) {
		if(userlist!=null&&userlist.size()>0){
			for(User u:userlist){
				UserDTO ud=new UserDTO();
				BeanUtils.copyProperties(u, ud);
				
				Set<UserRole> userroles=u.getUserRoles();//查出用户的角色
				if(userroles!=null&&!userroles.isEmpty()){
					String roleids="";
					String roletexts="";
					for(UserRole ur:userroles){
						if(roleids.length()>0){
							roleids += ",";
						    roletexts += ",";
						}
					    roleids+=ur.getRole().getId();
						roletexts+=ur.getRole().getText();
					}
					ud.setRoletexts(roletexts);
					ud.setRoleids(roleids);
				}
			
				userdtolist.add(ud);
			}
		}
	}
	
	
	
	public long[] getWorksAndRankingsNum(String userid){
		long a[]=new long[]{0,0};
		Map<String,Object> params=new HashMap<String,Object>();
		User u=userDao.get(User.class,userid);
		if(u!=null){
			params.put("user", u);
			a[0]=worksDao.count(" select count(*) from Works w where w.user=:user", params);
			a[1]=worksDao.count(" select count(*) from Works w where w.type.pref=2 and w.user=:user", params);
		}
		return a;
	}

	
	public boolean checkNameIsHave(String name){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", name);
		User u=userDao.get(" from User u where u.name=:name", params);
		if(u==null){
			return false;
		}
		 return true;
		
	}
	
	
	

}
