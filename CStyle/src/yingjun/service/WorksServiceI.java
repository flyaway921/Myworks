package yingjun.service;

import java.util.List;

import yingjun.dto.DataGrid;
import yingjun.dto.UserDTO;
import yingjun.dto.WorksDTO;
import yingjun.model.Type;
import yingjun.model.Works;

public interface WorksServiceI {
  
	public DataGrid getworks(WorksDTO worksdto,int i);
	public List<Works> getworksById(String id,int page,int rows,String title,String typeid);
	public List<Works> getworks(int page,int rows,String title,String typeid);
	public void add(WorksDTO dto);
	public void delete(String ids);
	public void frontdelete(String id);
	public void update(WorksDTO dto);
	public WorksDTO previewById(String id);
	public List<Type> getWorksType(int i);
	public DataGrid getRankings(WorksDTO wwdto);
	
	public List<Works> getRankings(String typeid,int topnum);
	
	public WorksDTO getNewWorks(String userid);
	public long getWorksCounts(String userid,String title,String typeid);
	public WorksDTO previewforupdate(String id);
}
