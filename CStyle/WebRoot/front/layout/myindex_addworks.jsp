<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;height:672px;padding: 12px">
	            	<div class="backmyworks"><a href="javascript:history.go(-1);">返回</a></div><hr>
	            	    <form id="myindex_addworks"   action="worksAction!front_addworks.action" method="post">
						  <table width="100%" border="0">
						    <tr>
						      <td  height="30px" align="center">分类:&nbsp;
						           <input type="hidden" name="userid" value="${usersessioninfo.userId}" /><input type="hidden" name="username" value="${usersessioninfo.loginName}" />
						           <select id="myindex_pref" style="width:100px;" >  
								    <option value="1">学术</option>  
								    <option value="2">图片</option>
								    <option value="3">视频</option>  
								    </select>  
								   <select id="myindex_type"   name="typeid" style="width:200px;">  
								   </select><font size="3px" color="red">*</font>
								</td>
						    </tr>
						    <tr>
						      <td height="30px"   align="center" align="center">标题:&nbsp;<input id="addworks_title"  maxlength="100"  name="title" style="width:300px" /><font size="3px" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td  align="center"><textarea id="myindex_addworks_textarea" name="content" style="height: 510px;width: 630px;"></textarea></td>

						    </tr>
						    <tr>
						      <td align="center"><input type="submit" onclick="return myindex_addworks_validate()" value="确认提交" /></td>
						    </tr>
						  </table>
						  </form>
	         </div>

<script type="text/javascript" >
var xueshu={tools : 'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,Hr,|,Link,Img,Emot,Table,Source,Preview',
			html5Upload : false,
			upMultiple : 1,
			cleanPaste:2,
			upLinkUrl : 'fileAction!front_worksUpload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx,ppt,pptx',
			upImgUrl : 'fileAction!front_worksUpload.action',
			upImgExt : 'jpg,jpeg,gif,png'
}
var picture={tools : 'Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Align,List,Outdent,Indent,Hr,|,Emot,Link,Img,|,Source,Preview',
		html5Upload : false,
		upMultiple : 1,
		cleanPaste:2,
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
	if(${param.type==null}){
		 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c400001'>学术论文</option><option value='402881e63e44e178013e44e17c520002'>科研报告</option><option value='402881e63e44e178013e44e17c520003'>经验教程</option><option value='402881e63e44e178013e44e17c520005'>软/硬件作品</option>"); 
		$('#myindex_addworks_textarea').xheditor(xueshu);
	}else if(${param.type=='picture'}){
		 $("#myindex_pref option[value='2']").attr("selected","selected");
		 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c520004'>摄影/图片/海报</option>");
         $('#myindex_addworks_textarea').xheditor(picture);
	}else{
		 $("#myindex_pref option[value='3']").attr("selected","selected");
		 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c520006'>教程视频</option><option value='402881e63e44e178013e44e17c520007'>原创视频/动画</option><option value='402881e63e44e178013e44e17c520008'>其他视频</option>");
         $('#myindex_addworks_textarea').xheditor(video);
	}
});







function myindex_addworks_validate(){
      var length1=$('#addworks_title').val().trim().length;
      var length2=$('#myindex_addworks_textarea').val().trim().length;
      if(length1>0&&length2>0){
    	  return true;
      }
      alert("请输入标题和内容！");
       return false;
	}


$("#myindex_pref").change(function(){
	 var select=$("#myindex_pref").val()
     if(select==1){
    	 $("#myindex_type option").remove(); 
    	 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c400001'>学术论文</option><option value='402881e63e44e178013e44e17c520002'>科研报告</option><option value='402881e63e44e178013e44e17c520003'>经验教程</option><option value='402881e63e44e178013e44e17c520005'>软/硬件作品</option>"); 
    	 $('#myindex_addworks_textarea').xheditor(false);
    	 $('#myindex_addworks_textarea').xheditor(xueshu);
     }
	 if(select==2){
		 $("#myindex_type option").remove(); 
    	 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c520004'>摄影/图片/海报</option>");
		 $('#myindex_addworks_textarea').xheditor(false);
		 $('#myindex_addworks_textarea').xheditor(picture);
     }
	 if(select==3){
		 $("#myindex_type option").remove();
    	 $("#myindex_type").append("<option value='402881e63e44e178013e44e17c520006'>教程视频</option><option value='402881e63e44e178013e44e17c520007'>原创视频/动画</option><option value='402881e63e44e178013e44e17c520008'>其他视频</option>");
		 $('#myindex_addworks_textarea').xheditor(false);
		 $('#myindex_addworks_textarea').xheditor(video);
     }
}); 




</script>