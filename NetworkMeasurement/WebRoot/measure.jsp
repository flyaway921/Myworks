<%@ page contentType="text/html; charset=UTF-8;" pageEncoding="utf-8"
	language="java"
	import="java.util.Date,java.io.*,java.util.*,java.net.InetAddress,java.net.UnknownHostException,jxl.Workbook,jxl.write.Label,jxl.write.WritableSheet,jxl.write.WritableWorkbook"%>
<%@page import="jxl.Cell"%>
<%@page import="jxl.LabelCell"%>
<%@page import="jxl.write.WritableFont"%>
<%@page import="jxl.write.DateTime"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title></title>



	</head>

	<body>
		<%
			String ip;
			String item;
			String command = "";
			String hops;
			String size;
			String dest;

			//获取目的地址
			dest = request.getParameter("dest");
			//获取ping包大小(Byte)
			size = request.getParameter("size");
			//获取tracert最大跳数
			hops = request.getParameter("hops");
			//获取测量项目，ping or tracert
			item = request.getParameter("item");

			//System.out.println("dest:"+dest+"size:"+size+"hops:"+hops+"item:"+item);
			/***
			获取用户ip地址和操作时间，测量结果将存放在名字为"ip+day".xls的文件中
			 如果用户在同一天内用同一个ip地址使用该工具，其结果将存放在统一个xls文件中
			 ***/
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			String day = Integer.toString(new java.util.Date().getDate());
			//用户测试结果文件以用户ip+日期(日) 来命名
			String filename = "";
			filename = ip.replace(".", "");
			filename += day + ".xls";

			try {

				if (item.equals("ping")) {
					command = "ping " + "-l " + size + " ";
				} else if (item.equals("tracert")) {
					command = "tracert " + "-h " + hops + " ";
				}

				if (dest != null) {
					command += dest;
					Runtime rt = Runtime.getRuntime();
					Process proc = rt.exec(command);

					InputStream stdin = proc.getInputStream();
					InputStreamReader isr = new InputStreamReader(stdin);
					BufferedReader br = new BufferedReader(isr);
					//content用来存放一行
					String line = "";
					//content用来存放整个结果字符串
					String content = "";

					WritableWorkbook wwb = null;
					WritableSheet sheet1 = null;
					WritableSheet sheet2 = null;
					jxl.write.DateFormat df = new jxl.write.DateFormat(
							"yyyy MM dd HH:mm");
					jxl.write.WritableCellFormat wcfDF = new jxl.write.WritableCellFormat(
							df);
					//记录上次编辑到第几行列，从这里继续添加内容，startRow的值从标志符end处获取
					int startRow1 = 0;
					int startRow2 = 0;

					File xlsFile = new File(
							"../webapps/NetworkMeasure/result/", filename);

					//判断是否存在该xls文件
					if (xlsFile.exists()) {
						//存在该文件

						Workbook wb = Workbook.getWorkbook(xlsFile);
						wwb = Workbook.createWorkbook(xlsFile, wb);
						sheet1 = wwb.getSheet(0);
						sheet2 = wwb.getSheet(1);

						System.out.println("exist");

					} else {
						//不存在,创建一个新的 
						wwb = Workbook.createWorkbook(xlsFile);
						sheet1 = wwb.createSheet("ping", 0);
						sheet2 = wwb.createSheet("tracert", 1);
						//设置列宽
						sheet1.setColumnView(0, 30);
						sheet1.setColumnView(1, 30);
						sheet1.setColumnView(2, 30);
						sheet1.setColumnView(3, 30);
						sheet1.setColumnView(4, 30);
						sheet1.setColumnView(5, 30);

						sheet2.setColumnView(0, 30);
						sheet2.setColumnView(1, 30);
						sheet2.setColumnView(2, 15);
						sheet2.setColumnView(3, 30);

						jxl.write.WritableFont wf = new jxl.write.WritableFont(
								WritableFont.TIMES, 14, WritableFont.BOLD, true);
						jxl.write.WritableCellFormat wcfF = new jxl.write.WritableCellFormat(
								wf);
						sheet1.addCell(new Label(0, 0, "源地址", wcfF));
						sheet1.addCell(new Label(1, 0, "目的地址", wcfF));
						sheet1.addCell(new Label(2, 0, "包大小(Byte)", wcfF));
						sheet1.addCell(new Label(3, 0, "平均时延(ms)", wcfF));
						sheet1.addCell(new Label(4, 0, "丢包率(%)", wcfF));
						sheet1.addCell(new Label(5, 0, "测量时间", wcfF));
						sheet1.addCell(new Label(0, 1, "end"));

						sheet2.addCell(new Label(0, 0, "源地址", wcfF));
						sheet2.addCell(new Label(1, 0, "目的地址", wcfF));
						sheet2.addCell(new Label(2, 0, "Max-hops", wcfF));
						sheet2.addCell(new Label(3, 0, "测量时间", wcfF));
						sheet2.addCell(new Label(0, 1, "end"));
						System.out.println("not exist");

					}
					//更新结束标志符,end
					if (item.equals("ping")) {
						//输出到前台
						out.write("<pre>");
						while ((line = br.readLine()) != null) {
							content += line;
							out.println(line);
							out.flush();
						}
						out.write("</pre>");

						//截取需要的字符
						String average = "";
						String lost = "";
						if (!content.contains("Ping 请求找不到主机")) {
							//检验是否因为无法达到目的主机而没有average这个值
							if(content.indexOf("平均")>0){
								average = content.substring(
										content.indexOf("平均") + 4, content
												.lastIndexOf("ms"));
							}
						
							average = average.replaceAll(" ", "");
							lost = content.substring(content.indexOf("丢失") + 8,
									content.lastIndexOf("丢失") - 2);
							lost = lost.replaceAll(" ", "");

							//找到结束标志符，写入内容
							Cell c = sheet1.findCell("end");
							startRow1 = c.getRow();
							sheet1.addCell(new Label(0, startRow1, ip));
							sheet1.addCell(new Label(1, startRow1, dest));
							jxl.write.Number number0 = new jxl.write.Number(2,
									startRow1, Integer.parseInt(size));
							if(average.equals("")){
								sheet1.addCell(new Label(3, startRow1, "无法访问目标主机"));
							}else{
								jxl.write.Number number1 = new jxl.write.Number(3,startRow1, Integer.parseInt(average));
								sheet1.addCell(number1);
							}
							
							jxl.write.Number number2 = new jxl.write.Number(4,
									startRow1, Integer.parseInt(lost));

							sheet1.addCell(number0);
							
							sheet1.addCell(number2);
							jxl.write.DateTime labelDTF = new jxl.write.DateTime(
									5, startRow1, new java.util.Date(), wcfDF);
							sheet1.addCell(labelDTF);

							startRow1++;
							Label label = new Label(0, startRow1, "end");
							sheet1.addCell(label);
						} else {
							//找到结束标志符，写入内容
							Cell c = sheet1.findCell("end");
							startRow1 = c.getRow();
							sheet1.addCell(new Label(0, startRow1, ip));
							sheet1.addCell(new Label(1, startRow1, dest));
							sheet1.addCell(new Label(2, startRow1,
									"Ping 请求找不到主机" + dest + "请检查该名称，然后重试。"));
							jxl.write.DateTime dateTime1 = new jxl.write.DateTime(
									5, startRow1, new java.util.Date(), wcfDF);
							sheet1.addCell(dateTime1);

							startRow1++;
							Label label = new Label(0, startRow1, "end");
							sheet1.addCell(label);
						}

					} else if (item.equals("tracert")) {

						//找到结束标志符........
						Cell c = sheet2.findCell("end");
						startRow2 = c.getRow();
						//把ip dest hops插入表格中
						sheet2.addCell(new Label(0, startRow2, ip));
						sheet2.addCell(new Label(1, startRow2, dest));
						jxl.write.Number number0 = new jxl.write.Number(2,
								startRow2, Integer.parseInt(hops));
						//4.添加DateTime对象 
						jxl.write.DateTime labelDTF = new jxl.write.DateTime(3,
								startRow2, new java.util.Date(), wcfDF);
						sheet2.addCell(labelDTF);
						sheet2.addCell(number0);
						startRow2 += 1;

						//输出到前台，并且去掉前面三行没用的内容
						int i = 0;
						out.write("<pre>");
						while ((line = br.readLine()) != null) {
							content += line;
							out.println(line);
							out.flush();
							if (content.contains("无法解析目标系统名称")) {
								sheet2.addCell(new Label(0, startRow2,
										"无法解析目标系统名称" + dest));
								startRow2++;
							}
							if (i > 3) {
								sheet2.addCell(new Label(0, startRow2, line));
								startRow2++;
							}
							i++;
						}
						out.write("</pre>");
						sheet2.addCell(new Label(0, startRow2 + 1, "end"));
					}

					// 写入数据并关闭文件
					wwb.write();
					wwb.close();
				}
			} catch (Exception e) {
				System.out.println(e);

				out.write("some errors occured , please try again or contact the Administrator");
			}
		%>
	</body>
</html>
