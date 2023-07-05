<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
	button_value=trim(Request.Form("alert_button"))
	if button_value="是" then
		conn.execute("delete from admin_area")
		conn.execute("delete from admin_bsort")
		conn.execute("delete from admin_department")
		conn.execute("delete from admin_shiyongdanwei")
		conn.execute("delete from admin_sort")
		conn.execute("delete from admin_yuangong")
		conn.execute("delete from bwl")
		conn.execute("delete from os")
		conn.execute("delete from pdzt")
		conn.execute("delete from sb_log")
		conn.execute("delete from sbxx")
		conn.execute("delete from user_log")
		conn.execute("delete from admin where id <> 1")
		conn.execute("update admin set admin_name='张三',admin_id='admin',admin_pw='21232F297A57A5A743894A0E4A801FC3',amwork=0,working=1,juese=1 where id=1")
		conn.execute("delete from juese where id <> 1")
   		conn.execute("update juese set mingcheng='超级管理员',datetime=Null,state=True,beizhu='超级管理员',quanxian='|101,|102,|103,|104,|105,|106,|107,|108,|109,|110,|111,|201,|202,|203,|300,|301,|302,|303,|304,|305,|306,|307,|401,|402,|403,|404,|405,|501,|502,|503,|504,|505,|506,|601,|602,|603,|604,' where id=1")
		conn.execute("delete from setting")
  		conn.execute("INSERT INTO setting (systemname,lock,pd,imgh,imgw,yuangongimgw,liebiao,biaoqian,sfhb) VALUES ('电脑固定资产系统', 5,False,80,300,120,15,24,False)")
	else
		Response.Redirect "../sysinfo.asp"
	end if
%>
<title>系统初始化完成</title>
<body>
<table border="0" width="750" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td width="100%" bgcolor="#FFFFFF" align="center"><p>　</p>
      <p><strong><font color="red" size="+2">提示：系统数据库已经被初始化！</font></strong></p>
      <p>建议<a href="../login.asp?action=out" target="_parent"><font size="+2" color="red">重新登录</font></a>后再进行操作！</p></td>
  </tr>
</table>
</body>
<%end if%>
