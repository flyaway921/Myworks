// JavaScript Document


function validate_note(){
   
	var title=document.getElementById("textfield");
	var content=document.getElementById("textarea2");
	if(title.value==null||title.value==''){
		alert("标题不能为空");
 		return false;
		}
	else if(content.value==null||content.value==''){
		alert("内容不能为空");
		return false;
	}
		else{
			return true;
		}
}

function removed(){
	return confirm("是否删除该笔记？");
}
function exit_verify(){
	return confirm("是否退出？");
}
function jump(pagenum){
	var page=document.getElementById("forjump").value;
	if ((/^\d+$/.test(page))&&(page<=pagenum)&&(page!=0)){
		
			location.href="aboutnote!listnote?page="+page;
	
	}else{
	   alert('请输入正确的页数!');
	}
	
	 
 }

