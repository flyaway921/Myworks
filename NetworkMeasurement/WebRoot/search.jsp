<%@ page contentType="text/html; charset=UTF-8;" pageEncoding="utf-8"
	language="java"
	import="java.sql.*,java.io.*,java.util.*,java.net.InetAddress,java.net.UnknownHostException,jxl.Workbook,jxl.write.Label,jxl.write.WritableSheet,jxl.write.WritableWorkbook"%>
<%@page import="jxl.Cell"%>
<%@page import="jxl.Sheet"%>
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
			String item = request.getParameter("item");
			String dest = request.getParameter("dest");

			System.out.println(item);
			System.out.println(dest);
			String ip;
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			java.util.Date time = new java.util.Date();
			String day = Integer.toString(time.getDate());
			//用户测试结果文件以用户ip+日期(日) 来命名
			String filename = "";
			filename = ip.replace(".", "");
			filename += day + ".xls";
			File xlsFile = new File("../webapps/NetworkMeasure/result/",
					filename);

			Workbook wb = Workbook.getWorkbook(xlsFile);
			Sheet sheet1 = wb.getSheet(0);
			Sheet sheet2 = wb.getSheet(1);
			//结束标志符
			int endRow = 1;
			ArrayList<Cell> cells;
			ArrayList<Integer> rows;
			if (item.equals("ping")) {
				//获取结束标志符
				endRow = sheet1.findCell("end").getRow();
				cells = new ArrayList<Cell>();
				rows = new ArrayList<Integer>();

				for (int i = 1; i < endRow; i++) {
					Cell cell = sheet1.getCell(1, i);
					if (cell.getContents().equals(dest)) {
						cells.add(cell);
						rows.add(cell.getRow());
					}

				}

				if (rows.size() > 0) {
					out.write("<center>");
					out.write("<table border=\"1\"  width=\"100%\">");
					out.write("<tr>");
					out.write("<th>");
					out.write(sheet1.getCell(0, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet1.getCell(1, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet1.getCell(2, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet1.getCell(3, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet1.getCell(4, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet1.getCell(5, 0).getContents());
					out.write("</th>");
					out.write("</tr>");
					for (int i = 0; i < rows.size(); i++) {
						out.write("<tr>");
						out.write("<td>");
						out.write(sheet1.getCell(0, rows.get(i)).getContents());
						out.write("</td>");

						out.write("<td>");
						out.write(sheet1.getCell(1, rows.get(i)).getContents());
						out.write("</td>");

						out.write("<td>");
						out.write(sheet1.getCell(2, rows.get(i)).getContents());
						out.write("</td>");

						out.write("<td>");
						out.write(sheet1.getCell(3, rows.get(i)).getContents());
						out.write("</td>");

						out.write("<td>");
						out.write(sheet1.getCell(4, rows.get(i)).getContents());
						out.write("</td>");

						out.write("<td>");
						out.write(sheet1.getCell(5, rows.get(i)).getContents());
						out.write("</td>");

						out.write("</tr>");

					}
					out.write("</table>");
					out.write("</center>");
				} else {
					out.write("<script>alert(\"没有匹配的查询结果\");</script>");

				}
			} else if (item.equals("tracert")) {
				//获取结束标志符
				endRow = sheet2.findCell("end").getRow();
				cells = new ArrayList<Cell>();
				rows = new ArrayList<Integer>();
				for (int i = 1; i < endRow; i++) {
					Cell cell = sheet2.getCell(1, i);
					if (cell.getContents().equals(dest)) {
						cells.add(cell);
						rows.add(cell.getRow());
					}

				}
				System.out.println(rows.toString());

				if (rows.size() > 0) {
					out.write("<center>");
					out.write("<table border=\"1\"  width=\"100%\">");

					out.write("<tr>");
					out.write("<th>");
					out.write(sheet2.getCell(0, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet2.getCell(1, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet2.getCell(2, 0).getContents());
					out.write("</th>");
					out.write("<th>");
					out.write(sheet2.getCell(3, 0).getContents());
					out.write("</th>");
					out.write("</tr>");
					//...........待完成
					if (true) {
						for (int i = 0; i < rows.size(); i++) {
							out.write("<tr>");
							out.write("<td>");
							out.write(sheet2.getCell(0, rows.get(i))
									.getContents());
							out.write("</td>");

							out.write("<td>");
							out.write(sheet2.getCell(1, rows.get(i))
									.getContents());
							out.write("</td>");

							out.write("<td>");
							out.write(sheet2.getCell(2, rows.get(i))
									.getContents());
							out.write("</td>");

							out.write("<td>");
							out.write(sheet2.getCell(3, rows.get(i))
									.getContents());
							out.write("</td>");

							out.write("</tr>");
							if (!sheet2.getCell(0, rows.get(i) + 1)
									.getContents().contains("无法解析目标系统名称")) {
								//这里需要一个max-hops值
								
								
								int tracertEnd=sheet2.findCell("跟踪完成。",0,rows.get(i),0,endRow,false).getRow();
								for (int j = 0; j < tracertEnd-rows.get(i); j++) {
									out.write("<tr>");
									out.write("<td colspan='4'>");
									//out.write("xxx");
									out.write(sheet2.getCell(0,
											rows.get(i) + 1 + j).getContents());
									out.write("</td>");
									out.write("</tr>");
								}
							} else {
								out.write("<tr>");
								out.write("<td colspan='4'>");
								out.write(sheet2.getCell(0, rows.get(i) + 1)
										.getContents());
								out.write("</td>");
								out.write("</tr>");
							}

						}
					}
					out.write("</table>");
					out.write("</center>");
				} else {
					out.write("<script>alert(\"没有匹配的查询结果\");</script>");

				}
			}
			out.flush();
		%>
	</body>
</html>
