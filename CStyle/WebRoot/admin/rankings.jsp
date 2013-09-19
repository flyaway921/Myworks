<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript"  >
var  rankingsdatagrid;
$(function() {
	    rankingsdatagrid=$('#admin_rankings_dg').datagrid({  
	    url:'worksAction!getRankings.action',  
	    fit:true,
	    border:false,
	    fitColumns:true,
	    singleSelect:true,
	    rownumbers:true,
	    columns:[[  
			{   
				field:'title',
	            title:'标题',
	            width:100,
	            formatter:function(value,row,index){
  	         	 if(value==null){return "";}
  			 	 return '<span title="'+value+'">'+value+'</span>';
                }
	        },{
		        field:'username',
	            title:'作者',
	            width:100
	        },{ 
		        field:'ctime',
	            title:'创建时间',
	            width:120,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },{ 
		        field:'mtime',
	            title:'最后修改时间',
	            width:120,
	            formatter:function(value,row,index){
	        	          if(value==null){return "";}
	        			  return '<span title="'+value+'">'+value+'</span>';
	                      }
	        },{ 
		        field:'workstype',
	            title:'成果类型',
	            width:120
	        },{ 
		        field:'viewnums',
	            title:'浏览数',
	            width:90,
	            formatter:function(value,row,index){
	      	           if(value>500){ return '<span title="'+value+'">'+value+'</span>&nbsp;<span class="icon-hot"  style="display:inline-block;;width:16px;height:16px;"></span>';}
	                   return '<span title="'+value+'">'+value+'</span>';
                     }
	        },{ 
		        field:'content',
	            title:'内容查看',
	            width:90,
	            formatter : function(value, row, index) {
	        	    return '<span class="icon-search" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a target="_blank" href="worksAction!noAuth_Preview.action?id='+row.id+'">查看详情</a>';
				}
	           }
	    ]],
	    toolbar:'#admin_rankings_toolbar'
  }); 
	 
});

</script >

<table id="admin_rankings_dg"></table> 

<div id="admin_rankings_toolbar" style="display: none;">
	<div style="height:25px;margin-top:2px">
		<select onchange="admin_rankings_search(this.value)" style="width:200px;float:left;" >  
	    <option value="0" selected="selected"  onclick="admin_rankings_search(this.value)">全部</option>  
	    <option  value="1" >学术榜单</option>  
	    <option value="2" >视频榜单</option>  
		</select>  
		<a href="javascript:void(0);" onclick="rankingsdatagrid.datagrid('reload')" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" style="float: right;">刷新</a>
	</div>
</div>

<script type="text/javascript">  
    function admin_rankings_search(value){  
    	rankingsdatagrid.datagrid('load',{rankingid:value})
    }  
</script> 


