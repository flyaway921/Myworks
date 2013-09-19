<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >
var  advicedatagrid;
$(function() {
	    advicedatagrid=$('#admin_advice_dg').datagrid({  
	    url:'adviceAction!getAdvice.action',  
	    fit:true,
	    border:false,
	    fitColumns:true,
	    checkOnSelect:true,
	    selectOnCheck:true,
	    idField:'id',
	    columns:[[  
	        {   field:'id',
	            title:'编号',
	            width:20,
	            checkbox:true
	           
	        },  
	        {   field:'title',
	            title:'标题',
	            width:100,
	            formatter:function(value,row,index){
	            	      if(value==null){return "";}
	                      return '<span title="'+value+'">'+value+'</span>';
	                }
	        },{ field:'content',
	            title:'描述',
	            width:130,
	            formatter : function(value, row, index) {
					return formatString('<span class="icon-search" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a href="javascript:void(0);" onclick="admin_advice_showFun(\'{0}\');">查看详细</a>', index);
				}
	        },{ field:'userid',
	            title:'姓名',
	            width:100,
	            hidden:true
	        },{
		         field:'username',
	            title:'留言者',
	            width:100
	        },{ 
		        field:'createtime',
	            title:'创建时间',
	            width:120,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },{ field:'action',
	            title:'操作',
	            width:60,
	        	formatter:function(value,row,index){
	         		return formatString('<a href="javascript:void(0)"  title="编辑留言" onclick="admin_advice_updateFun(\'{0}\');"><img style="border:0" src="javascript/icons/building_edit.png" /></a>&nbsp;'
	    	         		+'<a href="javascript:void(0)" title="删除留言" onclick="admin_advice_removeFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>&nbsp;'
	    	         		,row.id,row.id,row.id);
                    }
	        }
	    ]],  
	    toolbar: [{
		    text:'添加',
			iconCls: 'icon-add',
			handler: function(){
	    			admin_advice_addFun();
	               }
		 },'-',{
			text:'批量删除',
			iconCls: 'icon-remove',
			handler: function(){
			 		 admin_advice_deleteFun();
					}
		 },{
		    text:'取消选中',
			iconCls: 'icon-no',        
			handler: function(){advicedatagrid.datagrid('unselectAll');}
		  },{
				text:'刷新',    
				iconCls: 'icon-reload',
				handler: function(){
	  						advicedatagrid.datagrid('load',{});
					     }
		  	  }],
	  	  onRowContextMenu:function(e, rowIndex, rowData){
		        	e.preventDefault();
		        	advicedatagrid.datagrid('clearChecked').datagrid('clearSelections');
		        	advicedatagrid.datagrid('selectRow', rowIndex);
					$('#admin_advice_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					}); 
    	  }
  }); 
});

function admin_advice_addFun(){
     var adddialog=$('<div/>').dialog({
	    	 width:580,
			 height:550,
	    	 modal:true,
	    	 title:'增加留言',
	    	 href:'admin/advice_add.jsp',
	    	 buttons:[{
				 text:'增加',
				 iconCls: 'icon-add',
				 handler: function(){
	    		     $('#admin_advice_add_textarea').val();
			         $('#admin_advice_addForm').form('submit', {
						url : 'adviceAction!noAuth_addAdvice.action',
						success : function(data) {

							try{
						    var o = jQuery.parseJSON(data);
							if (o.success) {
									adddialog.dialog('close');
									advicedatagrid.datagrid('clearChecked').datagrid('clearSelections');
									advicedatagrid.datagrid('reload');
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

function admin_advice_updateFun(id){
	if(!id){
		var frow = advicedatagrid.datagrid('getSelected');
		id=frow.id
		}
	advicedatagrid.datagrid('unselectAll');
	var d=$('<div/>').dialog({
		 width:580,
		 height:550,
		 cache:false,
		 title:'修改留言',
		 modal:true,
		 href:'admin/advice_update.jsp',
		 buttons:[{
			  text:'编辑',
		      iconCls: 'icon-edit',
			  handler: function(){
			         $('#admin_advice_update_textarea').val();
					 $('#admin_advice_updateForm').form('submit',{
							url : 'adviceAction!updateAdvice.action',
							success : function(r) {
							try{
									var obj = jQuery.parseJSON(r);
									if (obj.success) {
										 d.dialog('close');
										 advicedatagrid.datagrid('load');
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
				var index = advicedatagrid.datagrid('getRowIndex', id);
				var rows = advicedatagrid.datagrid('getRows');
				var obb = rows[index];
		        $('#admin_advice_updateForm').form('load',obb);
			},
		onClose:function(){
				d.dialog('destroy');
			}
	});
	

}
function admin_advice_deleteFun(){
	var rows = advicedatagrid.datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '您是否要删除当前选中的【'+rows.length+'】项？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.ajax({
					url : 'adviceAction!deleteAdvice.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(r) {
						advicedatagrid.datagrid('load');
						advicedatagrid.datagrid('unselectAll');
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

function admin_advice_removeFun(id){
	if(!id){
		var frow = advicedatagrid.datagrid('getSelected');
		id=frow.id
		}
	advicedatagrid.datagrid('unselectAll');
	var index = advicedatagrid.datagrid('getRowIndex', id);
	var rows = advicedatagrid.datagrid('getRows');
	var obb = rows[index];
	$.messager.confirm('确认', '您是否要删除标题为【'+obb.title+'】的这一项？', function(r) {
		 if (r) {
			$.ajax({
				url : 'adviceAction!deleteAdvice.action',
				data : {
					ids : obb.id
				},
				dataType : 'json',
				success : function(r) {
					advicedatagrid.datagrid('load');
					advicedatagrid.datagrid('unselectAll');
					$.messager.show({
						title : '提示',
						msg : r.msg
					});
				}
			});
		 }
	});
}

function admin_advice_showFun(rowIndex) {
	
	var rows = advicedatagrid.datagrid('getRows');
	var row = rows[rowIndex];
		$('<div/>').dialog({  
		    title: row.title+'【'+row.username+'】',  
		    width: 600,  
		    height: 400,  
		    resizable:true,
		    closed: false,  
		    cache: false,  
			content : row.content,
		    modal: true ,
		    onClose:function(){
				$(this).dialog('destroy');
			}
	   });  

	advicedatagrid.datagrid('unselectAll');
}
</script >
        
		 <table id="admin_advice_dg"></table> 
     

<div id="admin_advice_menu" class="easyui-menu" style="width:120px;display:none;">
		<div onclick="admin_advice_addFun();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="admin_advice_removeFun();" data-options="iconCls:'icon-remove'">删除</div>
     	<div onclick="admin_advice_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>


