<%@page language="java" contentType="application/x-msdownload"    pageEncoding="utf-8" import="java.io.*" import="java.net.*" %><%
      //关于文件下载时采用文件流输出的方式处理：
      //加上response.reset()，并且所有的％>后面不要换行，包括最后一个；

 	  response.reset();//可以加也可以不加
      response.setContentType("application/x-download");
	  
	  
	  /*************/
	  //获取与用户ip对应的txt文件
		//获取用户 ip		
	  	String ip;
		InetAddress inet = InetAddress.getLocalHost();
		ip=inet.getHostAddress();
		//获取日期
		java.util.Date time =new java.util.Date();
		String day=Integer.toString(time.getDate());
		//用户测试结果文件以用户ip来命名
		String filename="";
		filename=ip.replace(".","");
		filename+=day+".xls";
	 /*************/
	 
      String filedownload = "..\\webapps\\NetworkMeasure\\result\\"+filename;
      String filedisplay = filename;
      filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
      response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);

      OutputStream outp = null;
      FileInputStream in = null;
      try
      {
          outp = response.getOutputStream();
          in = new FileInputStream(filedownload);

          byte[] b = new byte[1024];
          int i = 0;

          while((i = in.read(b)) > 0)
          {
              outp.write(b, 0, i);
          }
          outp.flush();
      }
      catch(Exception e)
      {
          System.out.println("Error!");
          e.printStackTrace();
      }
      finally
      {
          if(in != null)
          {
              in.close();
              in = null;
          }
          if(outp != null)
          {
              outp.close();
              outp = null;
          }
      }

%>