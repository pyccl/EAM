<!--#include file="inc/mysession_default.asp" -->
<!--#include file="inc/conn.asp"-->
<!DOCTYPE asp PUBLIC "-//W3C//DTD Xasp 1.0 Frameset//EN" "http://www.w3.org/TR/xasp1/DTD/xasp1-frameset.dtd">
<head>
<meta http-equiv="Content-Type" content="text/asp; charset=gb2312" />
    <%
    	sql="select * from setting"
		set rs=conn.execute(sql)
       titles=rs("companyname") & rs("systemname")
    %>
<title><%=titles%></title>
<link rel="shortcut icon" href="/favicon.ico"/>
<link rel="bookmark" href="/favicon.ico"/>
</head>

<frameset rows="73,*,28" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="top.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset rows="*" cols="195,*" >
    <frame src="left.asp" name="left" id="left" />
    <frame src="right.asp" name="mainframe" id="mainframe" />
  </frameset>
  
  <frame src="down.asp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
<body>
您的浏览器不支持框架，无法使用本系统。
</body>
</noframes>
