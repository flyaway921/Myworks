package yingjun.service;

import java.util.List;

import yingjun.dto.MeauDTO;
import yingjun.dto.ResourceDTO;
import yingjun.dto.UserDTO;
import yingjun.model.Meau;

public interface ResourceServiceI {

	
	/*获取treegrid*/
	public List<ResourceDTO> getResource(); 
	/*增加resource*/
	public ResourceDTO add(ResourceDTO mdto);
	/*删除resource*/	
	public void delete(String id);
	/*修改resource*/
	public ResourceDTO update(ResourceDTO mdto);

		
	
}
