package yingjun.service;

import yingjun.dto.DataGrid;
import yingjun.dto.RoleDTO;

public interface RoleServiceI {
  
	public DataGrid getRole();
	public DataGrid getRoleResource();
	public void add(RoleDTO roledto);
	public void delete(RoleDTO roledto);
	public void update(RoleDTO roledto);
}
