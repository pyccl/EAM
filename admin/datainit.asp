<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
%>
<title>系统初始化</title>
<body>
<form action="datainit_submit.asp" method="post">
  <table border="0" width="75%" align="center" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
      <td width="100%" align="center" height="55" bgcolor="#0000FF"><font color="#FFFFFF" size="+3"><strong>系 统 初 始 化 确 认</strong></font></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#000066"></td>
    </tr>
    <tr>
      <td width="100%" align="center" bgcolor="#FF0000" valign="middle" height="300"><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td class="td"><p><font color="#FFFFFF" size="+1">请注意：系统将被初始化，会删除数据库中的所有用户信息，数据库结构、系统数据将会恢复默认。如确认要对系统做初始化操作，请点击“是”，否则请点击“否”！</font></p>
              <p><font color="#FFFFFF" size="+1">建议：先备份数据库后再进行初始化，如若后悔可恢复数据库！！！</font></p></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="100%" align=center height="55" bgcolor="#0000FF"><input type=submit value="  是  " name="alert_button">
        <input type="button" value="  否  " name="alert_button2" onClick="history.go(-1);"></td>
    </tr>
  </table>
</form>
</body>
<%end if%>
