<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >
var  userdatagrid;
$(function() {
	    userdatagrid=$('#admin_yhgl_dg').datagrid({  
	    url:'userAction!getUser.action',  
	    fit:true,
	    border:false,
	    pagination:true,
	    fitColumns:true,
	    checkOnSelect:true,
	    selectOnCheck:true,
	    sortName:'createdatetime',
	    sortOrder:'asc',
	    pageSize:10,
	    pageList:[10,20,30,40,50],
	    idField:'id',
	    columns:[[{ title:'账户信息',
				    colspan:4
	            },{ title:'用户信息',
		  	      	colspan:5
		  	    },{ field:'createdatetime',
	  	            title:'创建时间',
	  	            align:'center',
	  	            width:120,
	  	            sortable:true,
	  	            rowspan:2,
	  	            formatter:function(value,row,index){
	  	        	          if(value==null){return "";}
	  	        			  return '<span title="'+value+'">'+value+'</span>';
	  	                      }
	  	         },  
	  	         {   field:'modifydatetime',
	  	            title:'最后登录时间',
	  	            align:'center',
	  	            width:120,
	  	            sortable:true,
	  	            rowspan:2,
	  	            formatter:function(value,row,index){
	  	                      if(value==null){return "";}
	  				          return '<span title="'+value+'">'+value+'</span>';
	  	                     }
	  	         },{ field:'action',
	  	            title:'操作',
	  	            align:'center',
	  	            width:60,
	  	            rowspan:2,
	  	        	formatter:function(value,row,index){
	  	         		return formatString('<a href="javascript:void(0)"  title="编辑用户" onclick="admin_yhgl_updateFun(\'{0}\');"><img style="border:0" src="javascript/icons/user_edit.png" /></a>&nbsp;'
	  	    	         		+'<a href="javascript:void(0)" title="删除用户" onclick="admin_yhgl_removeFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>&nbsp;'
	  	    	         		+'<a href="javascript:void(0)" title="修改密码" onclick="admin_yhgl_editpwdFun(\'{2}\');"><img src="javascript/icons/lock_edit.png" style="border:0" /></a>'
	  	    	         		,row.id,row.id,row.id);
	                      }
	  	        
	  	         }  
	       ],[
		     {  field:'id',
	            title:'编号',
	            width:20,
	            rowspan:2,
	            checkbox:true
	           
	        },  
	        {   field:'name',
	            title:'用户',
	            width:100,
	            sortable:true,
	            rowspan:2,
	            formatter:function(value,row,index){
	            	      if(value==null){return "";}
	                      return '<span title="'+value+'">'+value+'</span>';
	                }
	        },  
	        {   field:'pwd',
	            title:'密码',
	            width:50,      
	            rowspan:2,  
	            formatter:function(value,row,index){
	                      return '******';
	                     }
	        }, { field:'mail',
	            title:'邮箱',
	            width:130,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        },{ field:'realname',
	            title:'姓名',
	            width:100,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        },{ field:'sex',
	            title:'性别',
	            width:40,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        },{ field:'college',
	            title:'所在院校',
	            width:110,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        },{ field:'birthday',
	            title:'生日',
	            width:70,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        },{ field:'qq',
	            title:'qq',
	            width:70,
	            rowspan:2,
	            formatter:function(value,row,index){
                if(value==null){return "";}
		          return '<span title="'+value+'">'+value+'</span>';
                 }
	        }
	    ]],  
	    toolbar: [{
		    text:'添加',
			iconCls: 'icon-add',
			handler: function(){
	    			admin_yhgl_addFun();
	               }
		 },'-',{
			text:'批量删除',
			iconCls: 'icon-remove',
			handler: function(){
			 		 admin_yhgl_deleteFun();
					}
		 },{
		    text:'取消当页选中',
			iconCls: 'icon-cross',        
			handler: function(){userdatagrid.datagrid('unselectAll');}
		  },'-',{
			text:'取消全部选中',    
			iconCls: 'icon-no',
			handler: function(){
			            userdatagrid.datagrid('clearChecked');
			            userdatagrid.datagrid('clearSelections');
				     }
	  	  },'-',{
				text:'刷新',    
				iconCls: 'icon-reload',
				handler: function(){
	  						userdatagrid.datagrid('load',{});
					     }
		  	  }],
	  	  onRowContextMenu:function(e, rowIndex, rowData){
		        	e.preventDefault();
		        	userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
		        	userdatagrid.datagrid('selectRow', rowIndex);
					$('#admin_yhgl_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					}); 
    	  }
  }); 
});
function gosearch(){
	userdatagrid.datagrid('load', serializeObject($('#admin_yhgl_searchForm')));  
}
function goclear(){
	$('#admin_yhgl_searchForm input').val('');
}
function admin_yhgl_addFun(){
     var adddialog=$('<div/>').dialog({
	    	 width:350,
			 height:360,
	    	 modal:true,
	    	 title:'增加用户',
	    	 href:'admin/yhgl_add.jsp',
	    	 buttons:[{
				 text:'增加用户',
				 iconCls: 'icon-add',
				 handler: function(){
			         $('#admin_yhgl_addForm').form('submit', {
						url : 'userAction!addUser.action',
						success : function(data) {
			        	 try {
						    var o = jQuery.parseJSON(data);
							if (o.success) {
									adddialog.dialog('close');
									userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
									userdatagrid.datagrid('reload');
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

function admin_yhgl_updateFun(id){
	if(!id){
		var frow = userdatagrid.datagrid('getSelected');
		id=frow.id;
		}
	userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
	var d=$('<div/>').dialog({
		 width:350,
		 height:300,
		 cache:false,
		 title:'修改用户',
		 modal:true,
		 href:'admin/yhgl_update.jsp',
		 buttons:[{
			  text:'编辑',
		      iconCls: 'icon-edit',
			  handler: function(){
					 $('#admin_yhgl_updateForm').form('submit',{
							url : 'userAction!updateUser.action',
							success : function(r) {
						    try {
									var obj = jQuery.parseJSON(r);
									if (obj.success) {
										 d.dialog('close');
										 userdatagrid.datagrid('reload');
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
				var index = userdatagrid.datagrid('getRowIndex', id);
				var rows = userdatagrid.datagrid('getRows');
				var obb = rows[index];
		        $('#admin_yhgl_updateForm').form('load',obb);
			},
		onClose:function(){
				d.dialog('destroy');
			}
	});
	

}
function admin_yhgl_deleteFun(){
	var rows = userdatagrid.datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '您是否要删除当前选中的【'+rows.length+'】项？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.ajax({
					url : 'userAction!deleteUser.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(r) {
						userdatagrid.datagrid('reload');
						userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
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

function admin_yhgl_removeFun(id){
	if(!id){
		var frow = userdatagrid.datagrid('getSelected');
		id=frow.id
		}
	userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
	var index = userdatagrid.datagrid('getRowIndex', id);
	var rows = userdatagrid.datagrid('getRows');
	var obb = rows[index];
	$.messager.confirm('确认', '您是否要删除用户名为【'+obb.name+'】的这一项？', function(r) {
		 if (r) {
			$.ajax({
				url : 'userAction!deleteAdmin.action',
				data : {
					ids : obb.id
				},
				dataType : 'json',
				success : function(r) {
					userdatagrid.datagrid('load');
					userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
					$.messager.show({
						title : '提示',
						msg : r.msg
					});
				}
			});
		 }
	});
}
function admin_yhgl_editpwdFun(id){
	if(!id){
		var frow = userdatagrid.datagrid('getSelected');
		id=frow.id
		}
	userdatagrid.datagrid('clearChecked').datagrid('clearSelections');
	$('#admin_yhgl_cpdialog').dialog('open');
	$('#admin_yhgl_cpForm').form('clear');
	$('#admin_yhgl_cpForm').form('load',{
		id:id
	});
}
</script >
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',border:false" style="height:125px;overflow:hidden;padding-top:3px;padding-left:5px;padding-right:5px;background-color:#F4F4F4" align="center">
	  <form id="admin_yhgl_searchForm">
	    <p>创建时间查询：<input name=createdatetimeStart   class="easyui-datebox" /> 到 <input name="createdatetimeEnd"  class="easyui-datebox" /></p>
	    <p> 修改时间查询：<input name="modifydatetimeStsrt" class="easyui-datebox" /> 到 <input name="modifydatetimeEnd"  class="easyui-datebox" /> </p>
		   &nbsp;&nbsp;&nbsp;用户查询：<input  name="name"/>&nbsp;&nbsp;&nbsp;
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="gosearch()" data-options="iconCls:'icon-search',plain:true">开始查询</a>
	  	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="goclear()" data-options="iconCls:'icon-cross',plain:true">全部清空</a>
	  </form>  
    </div>
    
	<div data-options="region:'center',border:false"  >
		 <table id="admin_yhgl_dg"></table> 
	</div>
</div>


<div id="admin_yhgl_menu" class="easyui-menu" style="width:120px;display:none;">
		<div onclick="admin_yhgl_addFun();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="admin_yhgl_removeFun();" data-options="iconCls:'icon-remove'">删除</div>
     	<div onclick="admin_yhgl_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
     	<div onclick="admin_yhgl_editpwdFun();" data-options="iconCls:'icon-lock_edit'">修改密码</div>
</div>

<div id="admin_yhgl_cpdialog" class="easyui-dialog" style="padding-top:10px;" 
 data-options=" modal:true,
				width:300,
				title:'修改用户密码',
				height:160,
				closed:true,
				buttons:[{
					text:'确认修改',
					iconCls:'icon-edit',
					handler:function(){
					      $('#admin_yhgl_cpForm').form('submit', {
		              	         url : 'userAction!updateUserPwd.action',
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
			
<form id="admin_yhgl_cpForm"  method="post">
		<table >
			<tr>
				<th style="width: 100px;" align="right">新密码：</th>
				<td><input id="yhgl_pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'" /><input name="id"  type="hidden" />
				</td>
			</tr>
			<tr>
				<th style="width: 100px;" align="right">确认密码：</th>
				<td><input name="rpwd" type="password" class="easyui-validatebox" data-options="required:true" validType="equals['#yhgl_pwd']"/>
				</td>
			</tr>
			
			
		</table>
	</form>
</div>
