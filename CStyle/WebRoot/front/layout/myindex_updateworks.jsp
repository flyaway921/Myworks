<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;height:672px;padding: 12px">
	            	<div class="backmyworks"><a href="javascript:history.go(-1);">返回</a></div><hr>
	            	    <form id="myindex_updateworks"   action="worksAction!front_updateworks.action" method="post">
						  <table width="100%" border="0">
						    <tr>
						      <td height="30px"   align="center" align="center">标题:&nbsp;<input  type="hidden" name="id" value="${model.id}" /><input  maxlength="100" name="title"  value="${model.title}" id="upworks_title"   style="width: 400px" /><font size="3px" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td  align="center"><textarea  id="myindex_updateworks_textarea" name="content" style="height: 510px;width: 630px;" >${model.content}</textarea></td>

						    </tr>
						    <tr>
						      <td align="center"><input type="submit" onclick="return myindex_updateworks_validate()" value="确认修改" /></td>
						    </tr>
						  </table>
						  </form>
	         </div>

<script type="text/javascript" >
var xueshu={tools : 'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,Hr,|,Link,Img,Emot,Table,Source,Preview',
			html5Upload : false,
			cleanPaste:2,
			upMultiple : 1,
			upLinkUrl : 'fileAction!front_worksUpload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx,ppt,pptx',
			upImgUrl : 'fileAction!front_worksUpload.action',
			upImgExt : 'jpg,jpeg,gif,png'
}
var video={tools : 'Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Align,List,Outdent,Indent,Hr,|,Emot,Link,Flash,Media,|,Source,Preview',
		html5Upload : false,
		upMultiple : 1,
		cleanPaste:2,
		upFlashUrl:"fileAction!front_videosUpload.action",
		upFlashExt:"swf",
		upMediaUrl:"fileAction!front_videosUpload.action",
		upMediaExt:"wmv,avi,wma,mp3,mid"
}
$(function() {
	if(${model.workstype==1}){
		 $('#myindex_updateworks_textarea').xheditor(xueshu);
	}else{
         $('#myindex_updateworks_textarea').xheditor(video);
	}
});


function myindex_updateworks_validate(){
	 var length1=$('#upworks_title').val().trim().length;
     var length2=$('#myindex_updateworks_textarea').val().trim().length;
     if(length1>0&&length2>0){
   	  return true;
     }
     alert("请输入标题和内容！")
      return false;
	}






</script>