package yingjun.service;


import yingjun.dto.DataGrid;
import yingjun.dto.UserDTO;





public interface UserServiceI {
	
	/*管理员登录*/
	public UserDTO login(UserDTO userdto);
	/*用户登录*/
	public UserDTO userlogin(UserDTO userdto);
	/*增加用户*/
	public void add(UserDTO userdto);
	/*删除用户*/	
	public void delete(String ids);
	/*以datagrid的形式获取用户信息*/
	public DataGrid userdatagrid(UserDTO userdto,int type);
	/*修改用户*/	
	public void update(UserDTO userdto);
	/*前台更新密码*/
	public boolean frontupdateUserPwd(UserDTO userdto);
	
	public long[] getWorksAndRankingsNum(String userid);
	
	/*前台用户注册时验证帐号名是否存在*/
	public boolean checkNameIsHave(String name);
	
	
}
