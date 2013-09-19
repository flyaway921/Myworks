<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" >
function addTab(opts){
	var t=$('#admin_center_tabs');
	if(t.tabs('exists',opts.title)){
		t.tabs('select',opts.title)
	}else{
		t.tabs('add',opts);
	}
}
</script>

<div id="admin_center_tabs" class="easyui-tabs"  data-options="border:false,fit:true" style="overflow: hidden;"> 
	 <div title="首页" style="background: url('images/front/admin_index.jpg')" data-options="iconCls:'icon-home',fit:true" > <marquee behavior="alternate"  onMouseOver="this.stop()" onMouseOut="this.start()">
	 <font  style="font-size: 25px;font-weight: bold" color="red">欢迎登陆大学生风姿网后台管理系统</font>
	 </marquee>
	  </div> 
</div>