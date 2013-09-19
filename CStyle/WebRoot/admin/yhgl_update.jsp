<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="admin_yhgl_adduser" style="margin-top: 10px" >
	<form id="admin_yhgl_updateForm"  method="post">
		<table >
			<tr>	
				<th style="width: 100px;" align="right" >账号名：</th>
				<td><input name="name" class="easyui-validatebox" style="width:150px" data-options="required:true,validType:'length[1,50]'" /><input name="id"  type="hidden" /><font color="red">*</font>
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;" align="right" >邮箱：</th>
				<td><input name="mail" class="easyui-validatebox" style="width:150px" data-options="required:true,validType:'email'" /><font color="red">*</font>
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;" align="right" >姓名：</th>
				<td><input name="realname" style="width:150px" />
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;" align="right" >性别：</th>
				<td><select  class="easyui-combobox" name="sex" style="width:50px">  
                    <option value="男" selected="selected">男</option>  
                    <option value="女">女</option>  
                    </select>  
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;" align="right" >院校：</th>
				<td><input name="college" style="width:150px"  />
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;"  align="right" >生日：</th>
				<td><input name="birthday" class="easyui-datebox"  data-options="editable:false" style="width:155px"/>
				</td>
			</tr>
			<tr>	
				<th style="width: 100px;" align="right" >qq号：</th>
				<td><input name="qq" style="width:150px" />
				</td>
			</tr>
		</table>
	</form>
</div>