<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">

$(function() {
		$('#admin_zygl_treegrid').treegrid({
			url : 'resourceAction!getResource.action',
			idField : 'id',
			treeField : 'text',
			parentField : 'pid',
			//showHeader:false,
			animate:true,
			fit : true,
			fitColumns : true,
			border : false,
	    	frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 50,
				hidden:true
			}, {
				field : 'text',
				title : '资源名',
				width : 200
			} ] ],
			columns : [ [ {
				field : 'url',
				title : '后台路径',
				width : 200
			}, {
				field : 'seq',
				title : '排序',
				width : 50
			}, {
				field : 'pid',
				title : '上级资源ID',
				width : 200,
				hidden : true
			}, {
				field : 'ptext',
				title : '上级资源名称',
				width : 80
			} , {
				field : 'action',
				title : '操作',
				width : 80,
				formatter:function(value,row,index){
	      	         		return formatString('<a href="javascript:void(0)"  title="编辑" onclick="admin_zygl_updateFun(\'{0}\');"><img  src="javascript/icons/building_edit.png" style="border:0" /></a>&nbsp;&nbsp;<a href="javascript:void(0)" title="删除" onclick="admin_zygl_deleteFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>',row.id,row.id);
			           }
	          
			}] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					admin_zygl_addFun();
				}
			}, '-', {
				text : '展开全部',
				iconCls : 'icon-redo',
				handler : function() {
						$('#admin_zygl_treegrid').treegrid('expandAll');
				}
			}, '-', {
				text : '折叠全部',
				iconCls : 'icon-undo',
				handler : function() {
						$('#admin_zygl_treegrid').treegrid('collapseAll');
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#admin_zygl_treegrid').treegrid('reload');
				}
			} ],
			onContextMenu : function(e, row) {
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.id);
				$('#admin_zygl_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});

	function admin_zygl_addFun() {
		var d=$('<div/>').dialog({
			href : 'admin/zygl_add.jsp',
			width : 300,
			height : 220,
			modal : true,
			title : '添加资源',
			buttons : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					$('#admin_zygl_addForm').form('submit', {
						url : 'resourceAction!addResource.action',
						success : function(result) {
						     try{
									var r = $.parseJSON(result);
									if (r.success) {
										d.dialog('close');
									    $('#admin_zygl_treegrid').treegrid('reload');
									}
									$.messager.show({
										title : '提示',
										msg : r.msg
									});
								} catch (e) {
									$.messager.alert('提示', result);
								 }	
						}
					});
				}
			} ],
			onClose : function() {
				d.dialog('destroy');
			}
		});
	}
	
	function admin_zygl_updateFun(id) {
		if(id){
			   $('#admin_zygl_treegrid').treegrid('select',id);
			  }
		var node = $('#admin_zygl_treegrid').treegrid('getSelected');
        if(node){
        var d=$('<div/>').dialog({
			href : 'admin/zygl_update.jsp',
			width : 300,
			height : 220,
			modal : true,
			title : '编辑资源',
			buttons : [ {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					$('#admin_zygl_updateForm').form('submit', {
						url : 'resourceAction!updateResource.action',
						success : function(result) {
						  try{
								var r = $.parseJSON(result);
								if (r.success) {
									d.dialog('close');
									$('#admin_zygl_treegrid').treegrid('reload');
								}
								$.messager.show({
									title : '提示',
									msg : r.msg
								});
							} catch (e) {
								$.messager.alert('提示', result);
							 }	
							
						}
					});
				}
			} ],
			onClose : function() {
				d.dialog('destroy');
			},
			onLoad : function() {
				$('#admin_zygl_updateForm').form('load', node);
			}
		});
	}
}
	function admin_zygl_deleteFun(id) {
		if(id){
			$('#admin_zygl_treegrid').treegrid('select',id);
		}
		var node = $('#admin_zygl_treegrid').treegrid('getSelected');
		if (node) {
			$.messager.confirm('询问', '您确定要删除资源【' + node.text + '】？', function(b) {
				if (b) {
					$.ajax({
						url : 'resourceAction!deleteResource.action',
						data : {
							id : node.id
						},
						cache : false,
						dataType : 'JSON',
						success : function(r) {
							if (r.success) {
								$('#admin_zygl_treegrid').treegrid('reload');
							}
							$.messager.show({
								msg : r.msg,
								title : '提示'
							});
						}
					});
				}
			});
		}
	}
	

</script>
<table id="admin_zygl_treegrid"></table>

<div id="admin_zygl_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="admin_zygl_addFun();" data-options="iconCls:'icon-add'">增加</div>
	<div onclick="admin_zygl_deleteFun();" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="admin_zygl_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>