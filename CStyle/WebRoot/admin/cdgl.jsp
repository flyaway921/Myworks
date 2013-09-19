<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">

	$(function() {
		$('#admin_cdgl_treegrid').treegrid({
			url : 'meauAction!getTreeGrid.action',
			idField : 'id',
			treeField : 'text',
			parentField : 'pid',
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
				title : '菜单名称',
				width : 200
			} ] ],
			columns : [ [ {
				field : 'url',
				title : '菜单路径',
				width : 200,
	            formatter:function(value,row,index){
				      	      if(!value){return ""}
				                return formatString('<a href="javascript:void(0)" onclick="cdgl_addTab(\'{0}\',\'{1}\');">{2}</a>' ,row.text,value,value);
						          }
			}, {
				field : 'seq',
				title : '排序',
				width : 50
			}, {
				field : 'pid',
				title : '上级菜单ID',
				width : 200,
				hidden : true
			}, {
				field : 'ptext',
				title : '上级菜单名称',
				width : 80
			} , {
				field : 'action',
				title : '操作',
				width : 80,
				formatter:function(value,row,index){
	      	         		return formatString('<a href="javascript:void(0)"  title="编辑" onclick="admin_cdgl_editFun(\'{0}\');"><img  src="javascript/icons/building_edit.png" style="border:0" /></a>&nbsp;&nbsp;<a href="javascript:void(0)" title="删除" onclick="admin_cdgl_deleteFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>',row.id,row.id);
			           }
	          
			}] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					admin_cdgl_addFun();
				}
			}, '-', {
				text : '展开全部',
				iconCls : 'icon-redo',
				handler : function() {
						$('#admin_cdgl_treegrid').treegrid('expandAll');
				}
			}, '-', {
				text : '折叠全部',
				iconCls : 'icon-undo',
				handler : function() {
						$('#admin_cdgl_treegrid').treegrid('collapseAll');
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#admin_cdgl_treegrid').treegrid('reload');
				}
			} ],
			onContextMenu : function(e, row) {
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.id);
				$('#admin_cdgl_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});

	function admin_cdgl_addFun() {
		var d=$('<div/>').dialog({
			href : 'admin/cdgl_add.jsp',
			width : 280,
			height : 230,
			modal : true,
			title : '菜单添加',
			buttons : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					$('#admin_cdgl_addForm').form('submit', {
						url : 'meauAction!addMeauTree.action',
						success : function(result) {
							
									var r = $.parseJSON(result);
									if (r.success) {
										d.dialog('close');
										$('#admin_cdgl_treegrid').treegrid('reload');
										$('#admin_west_tree').tree('reload');
									}
									$.messager.show({
										title : '提示',
										msg : r.msg
									});
							
						}
					});
				}
			} ],
			onClose : function() {
				d.dialog('destroy');
			}
		});
	}
	
	function admin_cdgl_editFun(id) {
		if(id){
			   $('#admin_cdgl_treegrid').treegrid('select',id);
			  }
		var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
        if(node){
        var d=$('<div/>').dialog({
			href : 'admin/cdgl_edit.jsp',
			width : 280,
			height : 230,
			modal : true,
			title : '菜单编辑',
			buttons : [ {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					$('#admin_cdgl_editForm').form('submit', {
						url : 'meauAction!updateMeauTree.action',
						success : function(result) {
							
								var r = $.parseJSON(result);
								if (r.success) {
									d.dialog('close');
									$('#admin_cdgl_treegrid').treegrid('reload');
									$('#admin_west_tree').tree('reload');
								}
								$.messager.show({
									title : '提示',
									msg : r.msg
								});
							
						}
					});
				}
			} ],
			onClose : function() {
				d.dialog('destroy');
			},
			onLoad : function() {
				$('#admin_cdgl_editForm').form('load', node);
			}
		});
	}
}
	function admin_cdgl_deleteFun(id) {
		if(id){
			$('#admin_cdgl_treegrid').treegrid('select',id);
		}
		var node = $('#admin_cdgl_treegrid').treegrid('getSelected');
		if (node) {
			$.messager.confirm('询问', '您确定要删除菜单【' + node.text + '】？', function(b) {
				if (b) {
					$.ajax({
						url : 'meauAction!delMeauTree.action',
						data : {
							id : node.id
						},
						cache : false,
						dataType : 'JSON',
						success : function(r) {
							if (r.success) {
								$('#admin_cdgl_treegrid').treegrid('reload');
								$('#admin_west_tree').tree('reload');
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
	
function cdgl_addTab(text,url){
	var t=$('#admin_center_tabs');
	if(t.tabs('exists',text)){
		t.tabs('select',text)
	}else{
		t.tabs('add',{ 
			 href:url,
		     title:text,
        	 closable:true
        });
	}
}
</script>
<table id="admin_cdgl_treegrid"></table>

<div id="admin_cdgl_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="admin_cdgl_addFun();" data-options="iconCls:'icon-add'">增加</div>
	<div onclick="admin_cdgl_deleteFun();" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="admin_cdgl_editFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>