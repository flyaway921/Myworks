// JavaScript Document
function jump_reg()
{
	location.href="register.jsp";
}

function jump_cloud_note()
{
	location.href="cloud_note.jsp";
}

function onfo(subject){
	subject.style.background="#AA9FAA";
	
	
}
function onbl(subject){
	subject.style.background="#FFFFFF";
	
}

function validate_required(field,alerttxt)
{
	with (field)
	  {
	  if (value==null||value=="")
		{alert(alerttxt);return false}
	  else {return true}
	  }
	}

function validate_email(field,alerttxt)
{
	with (field)
	{
		apos=value.indexOf("@")
		dotpos=value.lastIndexOf(".")
		if (apos<1||dotpos-apos<2) 
		  {alert(alerttxt);return false}
		else {return true}
	}
}

function validate_password(field1,field2,alertxt) 
{
		if (field1.value!=field2.value){
			alert(alertxt); 
			return false ;
		}
		else
			return true
}


function validate_form(thisform)
{
with (thisform)
  {
  if ((validate_required(username,"用户名项不能为空!")&&validate_required(mail,"邮箱不能为空!")&&validate_required(password,"密码项不能为空!")&&validate_required(repassword,"密码不能为空!"))==false)
    {return false}
  else if(validate_email(mail,"请输入正确的邮箱地址")==false)
  	{return false}
  else if(validate_password(password,repassword,"密码输入不一致")==false)
  	{return false}
  else
  	{return true}
		
  }
}



function validate_login(){
	var user=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	if(user==null||user=="") {
		alert("用户名不能为空");
	}
	else if(pass==null||pass==""){
		alert("密码不能为空");
	}else{
		document.getElementById("formlogin").submit();
		
	}
}

function  checkadvice(){
	var ad=document.getElementById("advice").value;
	if(ad==""){
		alert("请输入建议!!!");
	}else{
		document.getElementById("adviceform").submit();
	}
}
