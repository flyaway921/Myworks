<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" >
$(function(){
	$('#admin_west_tree').tree({
				lines:true,
		        url:'meauAction!getAllMeauTree.action',
		        //url:'data/MenuData.json',
		        parentField:'pid',
		        animate:true,
		        onLoadSuccess:function(node,data){
		             $(this).tree('collapseAll');
		        },
		        onClick:function(node){
			        if(node.state=='closed'){
			            	$(this).tree('expand',node.target);
			            	return;
				     }
			        if(node.state=='open'){
		            	$(this).tree('collapse',node.target);
		            	return;
			        }
		        	if(node.attributes.url){
		        		addTab({ 
		        				 href:node.attributes.url,
			        		     title:node.text,
					        	 closable:true
					        });
		        	}else{
			        	    alert('【'+node.text+'】暂无内容');
			        	}  
		       }
		})
	
})	
</script>
<div  class="easyui-panel" title="功能导航"  data-options="border:false,fit:true" >  
      <div  class="easyui-accordion" data-options="fit:true,border:false" >  
			     <div title="后台管理" data-options="isonCls:'icon-save',tools : [{
												iconCls : 'icon-reload',
												handler : function() {
													    $('#admin_west_tree').tree('reload');
												        }
											}, {
												iconCls : 'icon-redo',
												handler : function() {
														$('#admin_west_tree').tree('expandAll');
											            }
											},{
												iconCls : 'icon-undo',
												handler : function() {
														$('#admin_west_tree').tree('collapseAll');
												        }
											}]">  
			         <ul id="admin_west_tree" > </ul>  
			     </div> 
			      	      
			     <div title="大学生风姿网" > 
			     <a href="worksAction!front_toindex.action" target="_blank"><font size="5px">网站前台</font></a><br>
			    <a href="admin/login.jsp" ><font size="5px">重修登陆</font></a>
			     </div>  		 
      </div>  
</div>  