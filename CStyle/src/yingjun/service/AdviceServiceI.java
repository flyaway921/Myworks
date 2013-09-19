package yingjun.service;

import yingjun.dto.AdviceDTO;
import yingjun.dto.DataGrid;

public interface AdviceServiceI {
  
	public DataGrid getAdvice();
	public void add(AdviceDTO dto);
	public void delete(String ids);
	public void update(AdviceDTO dto);
	
}
