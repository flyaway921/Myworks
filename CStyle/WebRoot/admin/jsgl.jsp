<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >

$(function(){
        $('#admin_jsgl_dg').datagrid({  
	    url:'roleAction!getRoleResource.action',  
	    fit:true,
	    border:false,
	    fitColumns:true,
	    checkOnSelect:true,
	    selectOnCheck:true,
	    idField:'id',
		nowrap : false,
	    columns:[[  
	        {   field:'id',
	            title:'编号',
	            width:25,
	            checkbox:true
	           
	        }, {  
		        field:'text',
	            title:'角色名',
	            width:70
	        }, {
		        field:'descr',
	            title:'权限',
	            width:100         
	           
	        },
	        {   field:'resourceIds',
	            title:'资源Ids',
	            width:50,
	            hidden:true
	        },  
	        {   field:'resourceNames',
	            title:'可访问资源',
	            width:200
	            
	        },{ field:'action',
	            title:'操作',
	            width:50,
	        	formatter:function(value,row,index){
	        	    if(row.text=="超级管理员"){return "";};
	         		return formatString('<a href="javascript:void(0)"  title="编辑角色" onclick="admin_jsgl_updateFun(\'{0}\');"><img style="border:0" src="javascript/icons/user_edit.png" /></a>&nbsp;'
	    	         		+'<a href="javascript:void(0)" title="删除角色" onclick="admin_jsgl_removeFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>&nbsp;'
	    	         		,row.id,row.id);
                    }
	        }
	    ]],  
	    toolbar: [{
		    text:'添加',
			iconCls: 'icon-add',
			handler: function(){
	                 admin_jsgl_addFun();
	               }
		 },'-',{
			text:'批量删除',
			iconCls: 'icon-remove',
			handler: function(){
			         admin_jsgl_deleteFun();
					}
		 },{
		    text:'取消选中',
			iconCls: 'icon-no',        
			handler: function(){
				       $('#admin_jsgl_dg').datagrid('unselectAll');
				      }
		  },'-',{
				text:'刷新',    
				iconCls: 'icon-reload',
				handler: function(){
							  $('#admin_jsgl_dg').datagrid('load',{});
					     }
		  	  }],
	  	     onRowContextMenu:function(e, rowIndex, rowData){
		        	e.preventDefault();
		        	$('#admin_jsgl_dg').datagrid('unselectAll');
		        	$('#admin_jsgl_dg').datagrid('selectRow', rowIndex);
					$('#admin_jsgl_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					}); 
    	  }
  }); 
});

function admin_jsgl_addFun(){
     var d=$('<div/>').dialog({
	    	 width:400,
			 height:200,
	    	 modal:true,
	    	 title:'增加角色',
	    	 href:'admin/jsgl_add.jsp',
	    	 buttons:[{
				 text:'增加角色',
				 iconCls: 'icon-add',
				 handler: function(){
			         $('#admin_jsgl_addForm').form('submit', {
						url : 'roleAction!addRole.action',
						success : function(data) {
							try{
						    var o = $.parseJSON(data);
							if (o.success) {
								$('#admin_jsgl_dg').datagrid('unselectAll');
								$('#admin_jsgl_dg').datagrid('load');
							}   
						     	d.dialog('close');
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
    	 					d.dialog('destroy');
						}

 })
}

function admin_jsgl_updateFun(id){
	if(!id){
		var frow = $('#admin_jsgl_dg').datagrid('getSelected');
		if(frow.text=="超级管理员"){alert("无法编辑超级管理员");return;}
		id=frow.id
		}
	$('#admin_jsgl_dg').datagrid('unselectAll');
	var d=$('<div/>').dialog({
		 width:400,
		 height:200,
		 cache:false,
		 title:'修改角色',
		 modal:true,
		 href:'admin/jsgl_update.jsp',
		 buttons:[{
			  text:'编辑',
		      iconCls: 'icon-add',
			  handler: function(){
					 $('#admin_jsgl_updateForm').form('submit',{
							url : 'roleAction!updateRole.action',
							success : function(r) {
							try{
									var obj = jQuery.parseJSON(r);
									if (obj.success) {
										 $('#admin_jsgl_dg').datagrid('load');
									}
									d.dialog('close');
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
				var index = $('#admin_jsgl_dg').datagrid('getRowIndex', id);
				var rows = $('#admin_jsgl_dg').datagrid('getRows');
				var obb = rows[index];
				if(obb.resourceIds){
					obb.resourceIds = stringToList(obb.resourceIds);
				}
		        $('#admin_jsgl_updateForm').form('load',obb);
			},
		onClose:function(){
				d.dialog('destroy');
			}
	});
	

}
function admin_jsgl_deleteFun(){
	var rows = $('#admin_jsgl_dg').datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '您是否要删除当前选中的【'+rows.length+'】项？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
                    if(rows[i].text=="超级管理员"){alert("无法删除超级管理员");return;}
					ids.push(rows[i].id);
				}
				$.ajax({
					url : 'roleAction!deleteRole.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(r) {
						$('#admin_jsgl_dg').datagrid('load');
						$('#admin_jsgl_dg').datagrid('unselectAll');
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

function admin_jsgl_removeFun(id){
	if(!id){
		var frow = $('#admin_jsgl_dg').datagrid('getSelected');
		if(frow.text=="超级管理员"){alert("无法删除超级管理员");return;}
		id=frow.id
		}
	$('#admin_jsgl_dg').datagrid('unselectAll');
	var index = $('#admin_jsgl_dg').datagrid('getRowIndex', id);
	var rows = $('#admin_jsgl_dg').datagrid('getRows');
	var obb = rows[index];
	if(obb.text=="超级管理员"){alert("无法删除超级管理员");return; }
	$.messager.confirm('确认', '您是否要删除用户名为【'+obb.text+'】的这一项？', function(r) {
		 if (r) {
			$.ajax({
				url : 'roleAction!deleteRole.action',
				data : {
					ids : obb.id
				},
				dataType : 'json',
				success : function(r) {
					$('#admin_jsgl_dg').datagrid('load');
					$('#admin_jsgl_dg').datagrid('unselectAll');
					$.messager.show({
						title : '提示',
						msg : r.msg
					});
				}
			});
		 }
	});
}


</script >
<table id="admin_jsgl_dg"></table> 
<div id="admin_jsgl_menu" class="easyui-menu" style="width:120px;display:none;">
		<div onclick="admin_jsgl_addFun();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="admin_jsgl_removeFun();" data-options="iconCls:'icon-remove'">删除</div>
     	<div onclick="admin_jsgl_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>


			

