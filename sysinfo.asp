<!--#include file="inc/mysession.asp" -->
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/const.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>系统信息</title>
<link href="images/tab.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
    	sql="select * from setting"
		set rs=conn.execute(sql)
    %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="images/default_19.gif" style="border-left:solid 1px #aad5e6;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30"><div align="center"><img src="images/table.gif" width="16" height="14"></div></td>
          <td width="15"><img src="images/jt.gif" width="5" height="6"></td>
          <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><b>系统信息</b></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#6298E1">
  <tr bgcolor='#EBF2F9'>
    <td width="100" height="24"><div align="left">系统名称：</div></td>
    <td height="24"><div align="left"><%=rs("systemname")%></div></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24"><div align="left">当前版本：</div></td>
    <td height="24"><div align="left"><%= version %></div></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24"><div align="left">程序首发：</div></td>
    <td height="24"><div align="left">火炎炏焱燚</div></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24"><div align="left">系统配置：</div></td>
    <td height="24"><div align="left">ASP + IIS + Access</div></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24"><div align="left">插件调用：</div></td>
    <td height="24"><div align="left">省市县三级联动：<a href="https://github.com/fengyuanchen/distpicker" title="2.0.8（2023-01-01）" target="_blank">Distpicker</a>；日期选择：<a href="http://www.my97.net/" title="4.8.5 Release（2021-09-18）" target="_blank">My97 DatePicker</a>；页面打印：<a href="http://www.lodop.net/" target="_blank">LODOP</a>；颜色选择：<a href="https://jscolor.com/" title="2.5.2（2023-12-2）" target="_blank">JsColor</a>。</div></td>
  </tr>
</table>
</body>
</html>
