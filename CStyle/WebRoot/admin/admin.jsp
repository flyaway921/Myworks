<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >
var  admindatagrid;
$(function() {
	    admindatagrid=$('#admin_admin_dg').datagrid({  
	    url:'userAction!getAdmin.action',  
	    fit:true,
	    border:false,
	    fitColumns:true,
	    checkOnSelect:true,
	    selectOnCheck:true,
	    nowrap : false,
	    sortName:'name',
	    sortOrder:'asc',
	    idField:'id',
	    columns:[[  
	        {   field:'id',
	            title:'编号',
	            align:'center',
	            width:25,
	            checkbox:true
	           
	        },  
	        {   field:'name',
	            title:'用户',
	            width:120,
	            sortable:true,
	            formatter:function(value,row,index){
	            	      if(value==null){return "";}
	                      return '<span title="'+value+'">'+value+'</span>';
	                }
	        },  
	        {   field:'pwd',
	            title:'密码',
	            width:60,              
	            formatter:function(value,row,index){
	                      return '******';
	                     }
	        },
	        {   field:'createdatetime',
	            title:'创建时间',
	            width:150,
	            sortable:true,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },  
	        {   field:'modifydatetime',
	            title:'最后修改时间',
	            width:150,
	            sortable:true,
	            formatter:function(value,row,index){
	                      if(value==null){return "";}
				          return '<span title="'+value+'">'+value+'</span>';
	                     }
	        },{ field:'roleids',
	            title:'角色ids',
	            width:80,
	            hidden:true
	        	
	        },{ field:'roletexts',
	            title:'角色',
	            width:150,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                }
	            
	        },{ field:'action',
	            title:'操作',
	            width:80,
	        	formatter:function(value,row,index){
	        	   if(row.name=="admin"){
	        		   return "";
		        	   }
	         		return formatString('<a href="javascript:void(0)"  title="编辑用户" onclick="admin_admin_updateFun(\'{0}\');"><img style="border:0" src="javascript/icons/user_edit.png" /></a>&nbsp;'
	    	         		+'<a href="javascript:void(0)" title="删除用户" onclick="admin_admin_removeFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>&nbsp;'
	    	         		+'<a href="javascript:void(0)" title="修改密码" onclick="admin_admin_editpwdFun(\'{2}\');"><img src="javascript/icons/lock_edit.png" style="border:0" /></a>'
	    	         		,row.id,row.id,row.id);
                    }
	        }
	    ]],  
	    toolbar: [{
		    text:'添加',
			iconCls: 'icon-add',
			handler: function(){
	    			admin_admin_addFun();
	               }
		 },'-',{
			text:'批量删除',
			iconCls: 'icon-remove',
			handler: function(){
			 		 admin_admin_deleteFun();
					}
		 },{
		    text:'取消选中',
			iconCls: 'icon-no',        
			handler: function(){admindatagrid.datagrid('unselectAll');}
		  },'-',{
				text:'刷新',    
				iconCls: 'icon-reload',
				handler: function(){
	  		              admindatagrid.datagrid('load',{});
					     }
		  	  }],
	  	  onRowContextMenu:function(e, rowIndex, rowData){
		        	e.preventDefault();
		        	admindatagrid.datagrid('unselectAll');
		        	admindatagrid.datagrid('selectRow', rowIndex);
					$('#admin_admin_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					}); 
    	  }
  }); 
});

function admin_admin_addFun(){
     var adddialog=$('<div/>').dialog({
	    	 width:300,
			 height:200,
	    	 modal:true,
	    	 title:'增加管理员',
	    	 href:'admin/admin_add.jsp',
	    	 buttons:[{
				 text:'增加',
				 iconCls: 'icon-add',
				 handler: function(){
			         $('#admin_admin_addForm').form('submit', {
						url : 'userAction!addAdmin.action',
						success : function(data) {
			        	 try{
						    var o = jQuery.parseJSON(data);
							if (o.success) {
									adddialog.dialog('close');
									admindatagrid.datagrid('unselectAll');
									admindatagrid.datagrid('reload');
							}
								$.messager.show( {
									title : '提示',
									msg : o.msg
								});

							  } catch (e) {
									$.messager.alert('提示', data);
								 }	
						}
					});
				 } 
				 }],
		        onClose:function(){
    					 adddialog.dialog('destroy');
						}

 })
}

function admin_admin_updateFun(id){
	if(!id){
		var frow = admindatagrid.datagrid('getSelected');
		if(frow.name=="admin"){alert("无法编辑admin");return;}
		id=frow.id
		}
	admindatagrid.datagrid('unselectAll');
	var d=$('<div/>').dialog({
		 width:300,
		 height:150,
		 cache:false,
		 title:'修改管理员',
		 modal:true,
		 href:'admin/admin_update.jsp',
		 buttons:[{
			  text:'编辑',
		      iconCls: 'icon-edit',
			  handler: function(){
					 $('#admin_admin_updateForm').form('submit',{
							url : 'userAction!updateAdmin.action',
							success : function(r) {
						    try{
									var obj = jQuery.parseJSON(r);
									if (obj.success) {
										 d.dialog('close');
										 admindatagrid.datagrid('reload');
									}
									$.messager.show({
										title : '提示',
										msg : obj.msg
									});
						      } catch (e) {
								$.messager.alert('提示', r);
							 }	
						   }
					});
		    }
		 }],
		onLoad:function(){
				var index = admindatagrid.datagrid('getRowIndex', id);
				var rows = admindatagrid.datagrid('getRows');
				var obb = rows[index];
				if(obb.roleids){
					obb.roleids = stringToList(obb.roleids);
				}
		        $('#admin_admin_updateForm').form('load',obb);
			},
		onClose:function(){
				d.dialog('destroy');
			}
	});
	

}
function admin_admin_deleteFun(){
	var rows = admindatagrid.datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '您是否要删除当前选中的【'+rows.length+'】项？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					if(rows[i].name=="admin"){alert('admin无法删除！');return;}
					ids.push(rows[i].id);
				}
				$.ajax({
					url : 'userAction!deleteAdmin.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(r) {
						admindatagrid.datagrid('load');
						admindatagrid.datagrid('unselectAll');
						$.messager.show({
							title : '提示',
							msg : r.msg
						});
					}
				});
			}
		});
	} else {
		$.messager.alert('提示', '请勾选要删除的记录。','error');
	}
}

function admin_admin_removeFun(id){
	if(!id){
		var frow = admindatagrid.datagrid('getSelected');
		id=frow.id
		}
	admindatagrid.datagrid('unselectAll');
	var index = admindatagrid.datagrid('getRowIndex', id);
	var rows = admindatagrid.datagrid('getRows');
	var obb = rows[index];
	if(obb.name=="admin"){alert('admin无法删除！');return;}
	$.messager.confirm('确认', '您是否要删除用户名为【'+obb.name+'】的这一项？', function(r) {
		 if (r) {
			$.ajax({
				url : 'userAction!deleteAdmin.action',
				data : {
					ids : obb.id
				},
				dataType : 'json',
				success : function(r) {
					admindatagrid.datagrid('load');
					admindatagrid.datagrid('unselectAll');
					$.messager.show({
						title : '提示',
						msg : r.msg
					});
				}
			});
		 }
	});
}
function admin_admin_editpwdFun(id){
	if(!id){
		var frow = admindatagrid.datagrid('getSelected');
		if(frow.name=="admin"){alert("无法修改admin");return;}
		id=frow.id
		}
	admindatagrid.datagrid('unselectAll');
	$('#admin_admin_cpdialog').dialog('open');
	$('#admin_admin_cpForm').form('clear');
	$('#admin_admin_cpForm').form('load',{
		id:id
	});
}
</script >

<table id="admin_admin_dg"></table> 

<div id="admin_admin_menu" class="easyui-menu" style="width:120px;display:none;">
		<div onclick="admin_admin_addFun();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="admin_admin_removeFun();" data-options="iconCls:'icon-remove'">删除</div>
     	<div onclick="admin_admin_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
     	<div onclick="admin_admin_editpwdFun();" data-options="iconCls:'icon-lock_edit'">修改密码</div>
</div>

<div id="admin_admin_cpdialog" class="easyui-dialog" style="padding-top:10px;" 
 data-options=" modal:true,
				width:300,
				title:'修改管理员密码',
				height:150,
				closed:true,
				buttons:[{
					text:'确认修改',
					iconCls:'icon-edit',
					handler:function(){
					      $('#admin_yhgl_cpForm').form('submit', {
		              	         url : 'userAction!updateAdminPwd.action',
		                		 success : function(r) {
		                		try{
			                		 var obj = jQuery.parseJSON(r);
			                		 if(obj.success){
			                		     $('#admin_yhgl_cpdialog').dialog('close')
			                		 }
				                		 $.messager.show({
										title : '提示',
										msg : obj.msg
									    });
							    } catch (e) {
									$.messager.alert('提示', r);
								 }
						      }
				         });
				   }
				  }]">
			
<form id="admin_admin_cpForm"  method="post">
		<table >
			<tr>
				<th style="width: 100px;" align="right">新密码：</th>
				<td><input id="admin_pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'" /><input name="id"  type="hidden" />
				</td>
			</tr>
			<tr>
				<th style="width: 100px;" align="right">确认密码：</th>
				<td><input name="rpwd" type="password" class="easyui-validatebox" data-options="required:true" validType="equals['#admin_pwd']"/>
				</td>
			</tr>
			
			
		</table>
	</form>
</div>
