<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

button_value=trim(Request.Form("alert_button"))
if button_value="��" then
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
else
Response.Redirect "../sysinfo.asp"
end if
%>
<title>ϵͳ��ʼ�����</title>
<body>
<table border="0" width="750" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td width="100%" bgcolor="#FFFFFF" align="center"><p>��</p>
      <p><b>ϵͳ�Ѿ�����ʼ��</b></p>
      <p>��</p></td>
  </tr>
</table>
</body>
<%end if%>
