<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
%>
<title>ϵͳ��ʼ��</title>
<body>
<form action=datainit_submit.asp method=post>
  <table border="0" width="750" align=center cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
      <td width="100%" align="center" height="55" bgcolor="#0000FF" valign="middle"><br>
        <h2><b><font color="#FFFFFF">ϵ ͳ �� ʼ �� ȷ ��</font></b></h2></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#000066"></td>
    </tr>
    <tr>
      <td width="100%" align=center bgcolor="#FF0000" valign="middle"><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td height="150"><br>
              <h2><b><font color="#FFFFFF">ϵͳ������ʼ������ɾ�����ݿ��е�������Ϣ�����Իᱣ��<br>
                <br>
                ���ݿ�</font></b><b><font color="#FFFFFF">��</font></b><b><font color="#FFFFFF">����ȷ��Ҫ��ϵͳ����ʼ���������밴���ǡ�����<br>
                <br>
                ���밴���񡱣�ǿ�ҽ����ȱ������ݿ⣡����</font></b></h2></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="100%"align=center height="55" bgcolor="#0000FF" ><input type=submit value="  ��  " name="alert_button">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="  ��  " name="alert_button2" onClick="history.go(-1);"></td>
    </tr>
  </table>
</form>
</body>
<%end if%>
