<!--#include file="inc/conn.asp"-->
<!--#include file="inc/mysession.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û���Ϣ</title>
<link href="images/tab.css" rel="stylesheet" type="text/css" />
</head>
<%
sqlrank="select * from admin where admin_id='"&session("web_admin")&"'"
Set rsrank=conn.execute(sqlrank)
	rank=rsrank("rank")
%>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="images/default_19.gif" style="border-left:solid 1px #aad5e6;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30"><div align="center"><img src="images/table.gif" width="16" height="14"></div></td>
        <td width="15"><img src="images/jt.gif" width="5" height="6"></td>
        <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><b>�ʻ���Ϣ</b></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#6298E1" style="table-layout:fixed;">
      <tr bgcolor='#EBF2F9'>
        <td width="12%" height="24" nowrap><div align="left">�ʻ����ƣ�</div></td>
        <td width="88%"><div align="left"><%=session("web_admin")%></div></td>
      </tr>
      <tr bgcolor='#EBF2F9'>
        <td height="24" nowrap><div align="left">�ʻ�������</div></td>
        <td><div align="left"><%=session("cname")%></div></td>
      </tr>
      <tr bgcolor='#EBF2F9'>
        <td height="24" nowrap><div align="left">�ϴε�¼ʱ�䣺</div></td>
        <td><div align="left"><%=session("lasttime")%>&nbsp;<font color="red">���Σ�<%=rsrank("lastlogin_time")%></font></div></td>
      </tr>
      <tr bgcolor='#EBF2F9'>
        <td height="24" nowrap><div align="left">�ϴε�¼IP��</div></td>
        <td><div align="left"><%=session("lastip")%>&nbsp;<font color="red">���Σ�<%=rsrank("lastlogin_ip")%></font></div></td>
      </tr>
      <tr bgcolor='#EBF2F9'>
        <td height="24" nowrap><div align="left">�ʻ�Ȩ�ޣ�</div></td>
        <td style="word-wrap:break-word;"><div align="left"><%=session("rank")%></div></td>
      </tr>
      <tr bgcolor='#EBF2F9'>
        <td height="24" nowrap><div align="left">�ʻ���ɫ��</div></td>
        <td style="word-wrap:break-word;"><%=session("juesemc")%>��<%=session("juese")%>��</td>
      </tr>
    </table>
</body>
</html>
