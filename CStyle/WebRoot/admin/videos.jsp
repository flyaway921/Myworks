<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >
var  wokesdatagrid;
$(function() {
	    videosdatagrid=$('#admin_videos_dg').datagrid({  
	    url:'worksAction!getVideos.action',  
	    fit:true,
	    border:false,
	    fitColumns:true,
	    checkOnSelect:true,
	    selectOnCheck:true,
	    sortName:'ctime',
	    sortOrder:'desc',
	    idField:'id',
	    columns:[[  
	        {   field:'id',
	            title:'编号',
	            width:20,
	            checkbox:true
	           
	        },  
	        {   field:'title',
	            title:'视频标题',
	            width:100,
	            sortable:true,
	            formatter:function(value,row,index){
	            	      if(value==null){return "";}
	                      return '<span title="'+value+'">'+value+'</span>';
	                }
	        },{ field:'content',
	            title:'视频内容',
	            width:130,
	            formatter : function(value, row, index) {
	        	    return '<span class="icon-search" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a target="_blank" href="worksAction!noAuth_Preview.action?id='+row.id+'">查看详情</a>';
				}
	        },{ field:'userid',
	            title:'userid',
	            width:10,
	            hidden:true
	        },{
		         field:'username',
	            title:'作者',
	            width:100
	        },{ 
		        field:'ctime',
	            title:'创建时间',
	            sortable:true,
	            width:120,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },{ 
		        field:'mtime',
	            title:'最后修改时间',
	            sortable:true,
	            width:120,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },{ 
		        field:'typeid',
	            title:'typeid',
	            hidden:true,
	            width:10
	        },{ 
		        field:'workstype',
	            title:'视频类型',
	            sortable:true,
	            width:120
	        },{ 
		        field:'viewnums',
	            title:'浏览数',
	            sortable:true,
	            width:90,
	            formatter:function(value,row,index){
   	               if(value>500){ return '<span title="'+value+'">'+value+'</span>&nbsp;<span class="icon-hot"  style="display:inline-block;width:16px;height:16px;"></span>';}
                   return '<span title="'+value+'">'+value+'</span>';
              }
	        },{ 
		        field:'action',
	            title:'操作',
	            width:90,
	        	formatter:function(value,row,index){
	         		return formatString('<a href="javascript:void(0)"  title="编辑视频" onclick="admin_videos_updateFun(\'{0}\');"><img style="border:0" src="javascript/icons/building_edit.png" /></a>&nbsp;'
	    	         		+'<a href="javascript:void(0)" title="删除视频" onclick="admin_videos_removeFun(\'{1}\');"><img src="javascript/icons/cancel.png" style="border:0" /></a>&nbsp;'
	    	         		,row.id,row.id,row.id);
                    }
	        }
	    ]],  
	    toolbar: '#admin_videos_toolbar',
	  	  onRowContextMenu:function(e, rowIndex, rowData){
		        	e.preventDefault();
		        	videosdatagrid.datagrid('unselectAll');
		        	videosdatagrid.datagrid('selectRow', rowIndex);
					$('#admin_videos_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					}); 
    	  }
  }); 
});

function admin_videos_addFun(){
	window.open('${pageContext.request.contextPath}/worksAction!noAuth_addVideosRedirect.action','_blank');
}

function admin_videos_updateFun(id){
	if(!id){
		var frow = videosdatagrid.datagrid('getSelected');
		id=frow.id
		}
	videosdatagrid.datagrid('unselectAll');
	var index = videosdatagrid.datagrid('getRowIndex', id);
	var rows = videosdatagrid.datagrid('getRows');
	var obb = rows[index];
	var passto="?id="+id+"&typeid="+obb.typeid;
	window.open('${pageContext.request.contextPath}/worksAction!noAuth_updateVideosRedirect.action'+passto,'_blank');

}
function admin_videos_deleteFun(){
	var rows = videosdatagrid.datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '您是否要删除当前选中的【'+rows.length+'】项？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.ajax({
					url : 'worksAction!deleteVideos.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(r) {
						videosdatagrid.datagrid('load');
						videosdatagrid.datagrid('unselectAll');
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

function admin_videos_removeFun(id){
	if(!id){
		var frow = videosdatagrid.datagrid('getSelected');
		id=frow.id
		}
	videosdatagrid.datagrid('unselectAll');
	var index = videosdatagrid.datagrid('getRowIndex', id);
	var rows = videosdatagrid.datagrid('getRows');
	var obb = rows[index];
	$.messager.confirm('确认', '您是否要删除标题为【'+obb.title+'】的这一项？', function(r) {
		 if (r) {
			$.ajax({
				url : 'worksAction!deleteVideos.action',
				data : {
					ids : obb.id
				},
				dataType : 'json',
				success : function(r) {
					videosdatagrid.datagrid('load');
					videosdatagrid.datagrid('unselectAll');
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
        
		 <table id="admin_videos_dg"></table> 
     

<div id="admin_videos_menu" class="easyui-menu" style="width:120px;display:none;">
		<div onclick="admin_videos_addFun();" data-options="iconCls:'icon-add'">增加</div>
		<div onclick="admin_videos_removeFun();" data-options="iconCls:'icon-remove'">删除</div>
     	<div onclick="admin_videos_updateFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>

<div id="admin_videos_toolbar" style="display: none;">
	<a href="javascript:void(0);" onclick="admin_videos_addFun();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" style="float: left;">增加</a>
	<div class="datagrid-btn-separator"></div>
	<a href="javascript:void(0);" onclick="admin_videos_deleteFun();" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" style="float: left;">批量删除</a>
	<div class="datagrid-btn-separator"></div>
	<a href="javascript:void(0);" onclick="videosdatagrid.datagrid('unselectAll');" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" style="float: left;">取消选中</a>
	<div class="datagrid-btn-separator"></div>
	<a href="javascript:void(0);" onclick="videosdatagrid.datagrid('load',{})" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" style="float: left;">刷新</a>
	<div class="datagrid-btn-separator"></div>
	<div style="height:24px;margin-top:3px"><input id="admin_videos_searchbox" class="easyui-searchbox"  style="width:250px;" data-options="menu:'#admin_videos_searchbox_menu',height:22,searcher:admin_videos_search,prompt:'可按视频标题模糊查询'"></input></div>
</div>

<div id="admin_videos_searchbox_menu"  style="display:none;width:120px" >  
    <div data-options="name:'全部',iconCls:'icon-ok'">全部视频</div>  
    <div data-options="name:'教程视频'">教程视频</div>  
    <div data-options="name:'原创视频/动画'">原创视频/动画</div>  
    <div data-options="name:'其他视频'">其他视频</div>  

</div>  

<script type="text/javascript">  
    function admin_videos_search(value,name){  
        videosdatagrid.datagrid('load',{title:value,workstype:name})
    }  
</script> 