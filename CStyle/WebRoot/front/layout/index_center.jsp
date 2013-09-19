 <%@ page language="java" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div  class="easyui-panel" title="优秀成果展示"  style="width:673px;height:340px;"  data-options="  
	                tools:[{  
	                    iconCls:'front-more',  
	                    handler:function(){  
	                        window.open('${pageContext.request.contextPath}/worksAction!front_getWorks.action','_blank');
	                    }  
	                }]  
	            ">  
		         <div style="height: 98%; width: 50%;  float: left;margin:2px">
		         	<!-- 图片轮播 -->
		         	<div id="banner"> 
						<div id="banner_bg"></div><!--标题背景-->
						<div id="banner_info"></div><!--标题-->
						<ul>
						<li class="on">1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						</ul>
						<div id="banner_list">
						<a href="worksAction!front_Preview.action?id=402881e93ee392c5013ee414b0fd000d" target="_blank"><img src="images/front/center/4.jpg" title="那些年我们一起拍过的毕业照 " alt="那些年我们一起拍过的毕业照 "/></a>
						<a href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0d323a1000d" target="_blank"><img src="images/front/center/1.jpg" title="flash小游戏 " alt="flash小游戏"/></a>
						<a href="fileAction!noSession_pricturesList.action" target="_blank"><img src="images/front/center/2.jpg" title="照片墙 " alt="照片墙"/></a>
						<a href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0e38a75000e" target="_blank"><img src="images/front/center/3.jpg" title="大学生摄影作品" alt="大学生摄影作品"/></a>
						</div>
					</div>
		         </div>
		         <div id="index_talent_works">
		         	<ul>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3b4b7960002">关于IE 10 你应该知道的6件事<i>5-27</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3a533000000">响应式设计时代，我们该如何设计？<i>5-27</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3cce3df0005">10 个免费超棒的编程用等宽字体<i>5-27</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee10962a80014">基于Android移动端的云存储笔记<i>5-27</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0b3f9a00007">HTML5语义标签兼容IE6的方法分析<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3dc1dac0006">论微信取消推送功能的可能性<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3e577be0009">Bloom Filter 算法简介<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee392c5013ee3eb21cf000b">23种java的代码设计模式<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0e38a75000e"><img align="middle" src="images/front/picture.png" />&nbsp;落英の美—美不胜收的月季花瓣<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0e64265000f"><img align="middle" src="images/front/picture.png" />&nbsp;摄影作品—“撒”的婚俗<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0a33a620003"><img align="middle" src="images/front/videoNewsLeft.gif" />&nbsp;今晚80后脱口秀(王自健)<i>5-26</i></a></li>
			         	<li><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ed9654d013ed9b174df0008"><img align="middle" src="images/front/videoNewsLeft.gif" />&nbsp;10分钟找到初恋的感觉<i>5-26</i></a></li>
		         	</ul>
		         </div>
                   
                   

	          </div>
	          
	           <div style="height:10px;"></div>
	           <div  class="easyui-panel" title="视频/动画/教程"  style="padding-left:10px;width:673px;height:350px;"  data-options="  
	                tools:[{  
	                    iconCls:'front-more',  
	                    handler:function(){  
	                      window.open('${pageContext.request.contextPath}/worksAction!front_getWorks.action','_blank');
	                    }  
	                }]  
	            ">  
	               <div  style="position:absolute;left:5px;width:264px;height:318px;"  >
					     <div style="padding-top:5px;border-bottom:1px dotted #05ACFF;height: 20px;background-color: #DCF3FF;">
					     &nbsp;jsp/servlet视频教程
					     </div>
					     <div style="height: 180px;">
					     <div class="index_center_videos" align="center"><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee1021b1a0012"><img width="108px"  height="60px" src="images/front/center/jsp1.jpg"/>JSP基础教程(一)</a></div>
					     <div class="index_center_videos" align="center"><a target="_blank"  href="worksAction!front_Preview.action?id=402881e93ee0840e013ee12711de0017"><img width="108px"  height="60px" src="images/front/center/jsp2.jpg"/>JSP基础教程(二)</a></div>
					     <div class="index_center_videos" align="center"><a target="_blank"  href="worksAction!front_Preview.action?id=402881e93ee0840e013ee129e0d30018"><img width="108px"  height="60px" src="images/front/center/jsp3.jpg"/>JSP基础教程(三)</a></div>
					     <div class="index_center_videos" align="center"><a target="_blank"  href="worksAction!front_Preview.action?id=402881e93ee0840e013ee12ab2ba0019"><img width="108px"  height="60px" src="images/front/center/jsp4.jpg"/>JSP基础教程(四)</a></div>
					     </div>
					     
					     <div style="padding-top:5px;border-bottom:1px dotted #05ACFF;height: 20px;background-color: #DCF3FF">
					     &nbsp;优秀动画
					     </div>
					     <div style="height: 88px;">
					      <div class="index_center_videos" align="center"><a target="_blank"  href="worksAction!front_Preview.action?id=402881e93ee392c5013ee4ad5e090031"><img width="108px"  height="60px" src="images/front/center/jsp5.jpg"/>我叫MT特别篇</a></div>
					     <div class="index_center_videos" align="center"><a target="_blank"  href="worksAction!front_Preview.action?id=402881e93ee392c5013ee4b0a8ea0032"><img width="108px"  height="60px" src="images/front/center/jsp6.jpg"/>海贼王597预告</a></div>
					     </div>
					</div>
	            
					
					 <div  style="border-left: 2px dotted #05ACFF;position:absolute;left:272px;width:395px;height:318px;"  >
					   <div id="index_VideoList" >
						 	<table  cellspacing="2px" cellpadding="3px;">
								 <tr><td rowspan="3" class="title"><a href="javascript:void(0)">flash游戏 |</a></td>
								  <td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee11c34090015" class="color_bar">FLASH动画制作教程 flash画轴</a><i>05-24</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee0d323a1000d" class="color_bar">经典的黄金矿工flash小游戏</a><i>06-01</i></td></tr>
								<tr> <td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=8ad891cd3edabe07013edaca5b810000" class="color_bar">超经典的雷电flash小游戏</a><i>06-12</i></td></tr>
								 
								 <tr><td rowspan="3" class="title"><a  href="javascript:void(0)">原创动画 |</a></td>
								 <td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee13a5608001b" class="color_bar">【原创】动画—破蛋而生</a><i>06-24</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee1393e90001a" class="color_bar">【原创】特效—图片轮播</a><i>05-14</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee14300e6001e" class="color_bar">【原创】效果—基于flash实现</a><i>05-14</i></td></tr>
								 
								 <tr><td  rowspan="5" class="title"><a  href="javascript:void(0)">视频教程 |</a></td>
								 <td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ed9654d013ed98ba48c0000" class="color_bar">炒股教程 技巧 分时高抛低吸</a><i>02-11</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee1021b1a0012" class="color_bar">JSP/Servlet基础视频教程(一)</a><i>05-14</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee12711de0017" class="color_bar">JSP/Servlet基础视频教程(二)</a><i>03-14</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee129e0d30018" class="color_bar">JSP/Servlet基础视频教程(三)</a><i>02-11</i></td></tr>
								 <tr><td class="color_bar"><span class="index_Tops_pic"></span><a target="_blank" href="worksAction!front_Preview.action?id=402881e93ee0840e013ee12ab2ba0019" class="color_bar">JSP/Servlet基础视频教程(四)</a><i>02-11</i></td></tr>
						 	</table>
					   </div>
					</div>
</div>
 <script type="text/javascript">
var t = n =0, count;
$(document).ready(function(){ 
count=$("#banner_list a").length;
$("#banner_list a:not(:first-child)").hide();
$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
$("#banner li").click(function() {
var i = $(this).text() -1;//获取Li元素内的值，即1，2，3，4
n = i;
if (i >= count) return;
$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
document.getElementById("banner").style.background="";
$(this).toggleClass("on");
$(this).siblings().removeAttr("class");
});
t = setInterval("showAuto()", 4000);
$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
})

function showAuto()
{
n = n >=(count -1) ?0 : ++n;
$("#banner li").eq(n).trigger('click');
}
</script>	         
	          
	          
	          
	          