<!--#include file="../inc/conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
%>
<title>ϵͳ��ʼ��</title>
<body>
<form action="datainit_submit.asp" method="post">
  <table border="0" width="75%" align="center" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
      <td width="100%" align="center" height="55" bgcolor="#0000FF"><font color="#FFFFFF" size="+3"><strong>ϵ ͳ �� ʼ �� ȷ ��</strong></font></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#000066"></td>
    </tr>
    <tr>
      <td width="100%" align="center" bgcolor="#FF0000" valign="middle" height="300"><table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td class="td"><p><font color="#FFFFFF" size="+1">��ע�⣺ϵͳ������ʼ������ɾ�����ݿ��е������û���Ϣ�����ݿ�ṹ��ϵͳ���ݽ���ָ�Ĭ�ϡ���ȷ��Ҫ��ϵͳ����ʼ���������������ǡ��������������񡱣�</font></p>
              <p><font color="#FFFFFF" size="+1">���飺�ȱ������ݿ���ٽ��г�ʼ����������ڿɻָ����ݿ⣡����</font></p></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="100%" align=center height="55" bgcolor="#0000FF"><input type=submit value="  ��  " name="alert_button">
        <input type="button" value="  ��  " name="alert_button2" onClick="history.go(-1);"></td>
    </tr>
  </table>
</form>
</body>
<%end if%>
