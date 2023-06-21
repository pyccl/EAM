<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
%>
<title>系统初始化</title>
<body>
<form action=datainit_submit.asp method=post>
  <table border="0" width="750" align=center cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
      <td width="100%" align="center" height="55" bgcolor="#0000FF" valign="middle"><br>
        <h2><b><font color="#FFFFFF">系 统 初 始 化 确 认</font></b></h2></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#000066"></td>
    </tr>
    <tr>
      <td width="100%" align=center bgcolor="#FF0000" valign="middle"><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td height="150"><br>
              <h2><b><font color="#FFFFFF">系统将被初始化，会删除数据库中的所有信息，但仍会保留<br>
                <br>
                数据库</font></b><b><font color="#FFFFFF">结</font></b><b><font color="#FFFFFF">构，确认要对系统做初始化操作，请按“是”，否<br>
                <br>
                则请按“否”！强烈建议先备份数据库！！！</font></b></h2></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="100%"align=center height="55" bgcolor="#0000FF" ><input type=submit value="  是  " name="alert_button">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="  否  " name="alert_button2" onClick="history.go(-1);"></td>
    </tr>
  </table>
</form>
</body>
<%end if%>
