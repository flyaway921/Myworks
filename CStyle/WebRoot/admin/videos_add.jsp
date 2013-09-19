<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<c:if test="${sessioninfo.userId== null}"><c:redirect url="login.jsp"></c:redirect></c:if>
<head>
<title>【${sessioninfo.loginName}】添加视频</title>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="javascript/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" charset="utf-8"></script>
<script type="text/javascript">

  $(function() {
		    $('#admin_videos_add_textarea').xheditor({
			tools : 'Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Align,List,Outdent,Indent,Hr,|,Emot,Link,Flash,Media,|,Source,Preview',
			html5Upload : false,
			upMultiple : 1,
			cleanPaste:2,
			upFlashUrl:"fileAction!videosUpload.action",
			upFlashExt:"swf",
			upMediaUrl:"fileAction!videosUpload.action",
			upMediaExt:"wmv,avi,wma,mp3,mid"
		});
	});
	
function admin_videos_addVideos(){
	 if( $("#admin_videos_addForm").form('validate')){
		 $.ajax({
			   type: "POST",
			   url: "worksAction!addVideos.action",
			   data: $('#admin_videos_addForm').serialize(),
			   dataType : 'json',
			   success: function(r){
			      $("input[type=reset]").trigger("click");
			      $.messager.alert('message',r.msg);  
			   }
			});
		 }
}
  
</script>
</head>
<body style="font-family:'Microsoft YaHei';">
<div  style="margin-top:15px" align="center">
	<form id="admin_videos_addForm" method="post">
		
			<table >
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
				<td><font >标题:&nbsp;</font><input name="title" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'" style="width: 200px"/><font color="red">*</font>
				    <input name="userid" value="${sessioninfo.userId}" type="hidden" />
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
			    <td>类别:&nbsp;<input name="typeid" class="easyui-combobox"  data-options="required:true,editable:false,valueField:'id',textField:'type',url:'worksAction!getVideosType.action'" style="width:200px"/><font color="red">*</font>  
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"><strong>内容:</strong></th>
				<td ><textarea id="admin_videos_add_textarea" name="content" style="height: 500px;width: 800px;"></textarea>
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right"></th>
				<td ><input  onclick="admin_videos_addVideos()" type="button" value="添加视频" /><input type="reset" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>