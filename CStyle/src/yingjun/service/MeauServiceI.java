package yingjun.service;

import java.util.List;

import yingjun.dto.MeauDTO;
import yingjun.dto.UserDTO;
import yingjun.model.Meau;

public interface MeauServiceI {

	/*获取meau树*/
	public List<MeauDTO> getMeauTree(String id);
	/*获取全部meau树*/
	public List<MeauDTO> getAllMeauTree();
	/*获取meautreegrid*/
	public List<MeauDTO> getTreeGrid(); 
	/*增加meau*/
	public MeauDTO add(MeauDTO mdto);
	/*删除meau*/	
	public void delete(String id);
	/*修改meau*/
	public MeauDTO update(MeauDTO mdto);
}
