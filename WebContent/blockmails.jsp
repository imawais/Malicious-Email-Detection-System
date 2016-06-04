<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="ISO-8859-1"%>
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
<title>blockmails.jsp</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<%
	try {
		String flag = "false";
		String ctr = "false";
		String mailto = session.getAttribute("mailto").toString();
		String sub = session.getAttribute("subject").toString();
		String mess = session.getAttribute("message").toString();
		String user = request.getParameter("user");
		System.out.println(mailto + " " + sub + " " + mess + " " + user);
		Connection con =null;
		Statement pst = con.createStatement();
		Statement pst1 = con.createStatement();
		//System.out.println("pst1:"+pst1);
		//System.out.println("pst2:"+pst2);
		Statement st = con.createStatement();
		Statement srs = con.createStatement();
		Statement st3 = con.createStatement();
		
		out.println("connection estblished");
		
		ResultSet rs = pst.executeQuery("select * from encryptedwords");
		ResultSet rs2 = st3.executeQuery("select * from swords");
		while (rs.next() && rs2.next()) {
			String query = "select * from mails where subject like '%"
					+ rs.getString(1) + "%' or subject like '%"
					+ rs2.getString(1) + "%' or message like '%"
					+ rs.getString(1) + "%' or message like '%"
					+ rs2.getString(1) + "%' and mailfrom='" + user
					+ "'";

			ResultSet rs1 = st.executeQuery(query);
			ResultSet rsr1 = srs
					.executeQuery("select * from mails where subject like '%"
							+ rs.getString(2)
							+ "%' or message like '%"
							+ rs.getString(2)
							+ "%' and mailfrom='"
							+ user + "'");
			if (rs1.next() || rsr1.next()) {
				flag = "true";
				break;
			} else
				flag = "false";
		}
		if (flag.equals("true")) {
		
			out.println("suspicious");
			
			String to = user;
			String mailfrom = "GNITS@suspiciousmail.com";
			String subject = "mail-daemon";
			String message = "The mail you had sent consists of suspicious information";
			PreparedStatement pst2 = con
					.prepareStatement("insert into inbox values(?,?,?,?)");
			pst2.setString(1, to);
			pst2.setString(2, mailfrom);
			pst2.setString(3, subject);
			pst2.setString(4, message);
			int d = pst2.executeUpdate();
			PreparedStatement pst3 = con
					.prepareStatement("insert into blocklist values(?,?,?,?)");
			pst3.setString(1, mailto);
			pst3.setString(2, user);
			pst3.setString(3, sub);
			pst3.setString(4, mess);
			int r = pst3.executeUpdate();
			System.out.println("r is:" + d);
			if (d > 0) {
				Statement st2 = con.createStatement();
				st2.executeUpdate("delete from mails");
				response.sendRedirect("inbox.jsp?user=" + to);
			}

		} else {

			Statement pss = con.createStatement();
			ResultSet sr = pss.executeQuery("select * from alertwords");
			
			out.println(sr);
			
			while (sr.next()) {
				Statement ss = con.createStatement();
				String query2 = "select * from mails where subject like '%"
						+ sr.getString(1)
						+ "%' or message like '%"
						+ sr.getString(1)
						+ "%' and mailfrom='"
						+ user
						+ "'";
				out.println("hello");
				out.println("query:" + query2);
				ResultSet sr1 = ss.executeQuery(query2);
				out.println(sr1);
				if (sr1.next()) {
					ctr = "true";
					break;
				} else
					ctr = "false";
			}
			if (ctr.equals("true")) {
				/*System.out.println("suspicious");
				String to=user;
				String mailfrom="krest@gmail.com";
				String subject="mail-daemon";
				String message="The mail you had sent consists of suspicious information";*/
				/*PreparedStatement pss1=con.prepareStatement("insert into inbox values(?,?,?,?)");
				pss1.setString(1,mailto);
				pss1.setString(2,mailfrom);
				pss1.setString(3,subject);
				pss1.setString(4,message);
				int d1=pss1.executeUpdate();*/
				PreparedStatement pss4 = con
						.prepareStatement("insert into inbox values(?,?,?,?)");
				pss4.setString(1, mailto);
				pss4.setString(2, user);
				pss4.setString(3, sub);
				pss4.setString(4, mess);
				int rk = pss4.executeUpdate();
				System.out.println("r is:" + rk);
				PreparedStatement pss3 = con
						.prepareStatement("insert into alertlist values(?,?,?,?)");
				pss3.setString(1, mailto);
				pss3.setString(2, user);
				pss3.setString(3, sub);
				pss3.setString(4, mess);
				int r1 = pss3.executeUpdate();
				/*System.out.println("r is:"+d1);
				if(d1>0)
				{
					Statement st3=con.createStatement();
					st3.executeUpdate("delete from mails");
					response.sendRedirect("inbox.jsp?user="+to);
				}*/
			} else
				System.out.println("not suspicious");
			PreparedStatement pss2 = con
					.prepareStatement("insert into inbox values(?,?,?,?)");
			pss2.setString(1, mailto);
			pss2.setString(2, user);
			pss2.setString(3, sub);
			pss2.setString(4, mess);
			int r = pss2.executeUpdate();
			System.out.println("r is:" + r);
			if (r > 0) {
				Statement st4 = con.createStatement();
				st4.executeUpdate("delete from mails");
				response.sendRedirect("user.jsp?user=" + user);
				//out.println("mail sent successfully");
			}
		}
	} catch (Exception e) {
		out.println("error occured!");
	}
%>
</body>
</html>
