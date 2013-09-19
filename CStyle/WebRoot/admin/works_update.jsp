<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<c:if test="${sessioninfo.userId== null}"><c:redirect url="login.jsp"></c:redirect></c:if>
<head>
<title>${title}【${sessioninfo.loginName}】</title>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="javascript/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$('#admin_works_update_textarea').xheditor({
		tools : 'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,Hr,|,Link,Unlink,Anchor,Img,Emot,Table,Source,Preview,Fullscreen,Print',
		html5Upload : false,
		upMultiple : 1,
		cleanPaste:2,
		upLinkUrl : 'fileAction!worksUpload.action',
		upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx,ppt,pptx',
		upImgUrl : 'fileAction!worksUpload.action',
		upImgExt : 'jpg,jpeg,gif,png'
	});
});
function admin_works_updateWorks(){
	 if( $("#admin_works_updateForm").form('validate')){
		 $.ajax({
			   type: "POST",
			   url: "worksAction!updateWorks.action",
			   data: $('#admin_works_updateForm').serialize(),
			   dataType : 'json',
			   success: function(r){
			      $.messager.alert('message',r.msg);  
			   }
			});
		 }
}
</script>
</head>
<body style="font-family:'Microsoft YaHei';">
<div  style="margin-top:15px" align="center">
	<form id="admin_works_updateForm" method="post">
		<table >
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
				<td><font >标题:&nbsp;</font><input name="title" value="${model.title}" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'" style="width: 200px"/><font color="red">*</font>
				    <input name="userid" value="${sessioninfo.userId}" type="hidden" /><input name="id" value="${id}" type="hidden" />
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
			    <td>类别:&nbsp;<input name="typeid" value="${typeid}" class="easyui-combobox"  data-options="required:true,editable:false,valueField:'id',textField:'type',url:'worksAction!getWorksType.action'" style="width:200px"/><font color="red">*</font>  
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"><strong>内容:</strong></th>
				<td ><textarea id="admin_works_update_textarea"  name="content"   style="height: 500px;width: 800px;">${model.content}</textarea>
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
				<td ><input  onclick="admin_works_updateWorks()" type="button" value="确认修改" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>