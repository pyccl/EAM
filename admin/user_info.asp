<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|302,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else %>
<html>
<head>
<title>�û���Ϣ</title>
<link href="../sb/css/modelcss.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <form action ="save_user.asp?action=add" method="post" name="addFrm">
    <tr class="classtop1">
      <th height="24" colspan="10" class="classtop"><%=session("companyname")%>-ϵͳ�˻�����</th>
    </tr>
    <tr class="classtop1">
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>ID</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>�ʻ���</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>����</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>Ȩ��</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>״̬</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>��ɫ</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>����½ʱ��</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>����½���</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>����½IP</strong></div></td>
      <td nowrap background="../images/th_bg.gif" height="24"><div align="center"><strong>����</strong></div></td>
    </tr>
    <%set rs=server.CreateObject("adodb.recordset")
	if Instr(session("juese"),"|306,")<>0 then
	  	if session("uid") = 1 then
			sql="select * from admin order by id"
	  	else
	  		sql="select * from admin where id <> 1 order by id"
	  	end if
	else
		sql="select * from admin where rank='"&session("rank")&"' and id=" &session("uid")
	end if
rs.open sql,conn, 1, 1
if rs.eof and rs.bof then
response.write "<font color=red>��û���˺ţ�����ӣ�</font>"
Else
if not isempty(request("page")) then   
pagecount=cint(request("page"))   
else   
pagecount=1
end if
rs.pagesize=session("liebiao")
rs.AbsolutePage=pagecount
        do while not rs.eof
%>
    <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
      <td width="4%" height=30><div align="center"><%=rs("id")%></div></td>
      <td><div align="center"><%=rs("admin_id")%></div></td>
      <td><div align="center"><%=rs("admin_name")%></div></td>
      <td title='<%=rs("rank")%>'>
		<div align="center">
			<% if isnull(rs("rank")) then
					response.write "<font color=red><b>��Ȩ�ޣ�</b></font>" 
				else
					response.write left(rs("rank"),20)
					if len(rs("rank"))>20 then
						response.write "����"
					end if
				end if %>
		</div>
	  </td>
      <td><div align="center"><%if rs("working")=1 then response.write "<image src=../images/v.png>" else response.write "<image src=../images/x.png>" end if%></div></td>
      <td><div align="center">
			<% 
			if isnull(rs("juese")) then
			   response.write "<font color=red><b>���ô���</b></font>"
			else
				set rsd=conn.execute("select * from juese where id = " & rs("juese"))
				if not rsd.eof then 
					response.write rsd("mingcheng")
				else
					response.write "<font color=red><b>���ô���</b></font>"
				end if 
				rsd.close:set rsd=nothing
			end if
  			%>
      </div></td>
      <td><div align="center"><%=rs("lastlogin_time")%></div></td>
      <td title='<%=rs("lastlogin_soft")%>'><div align="center"><%=left(rs("lastlogin_soft"),30)%><%if len(rs("lastlogin_soft"))>30 then %> ... <%end if%></div></td>
      <td><div align="center"><%=rs("lastlogin_ip")%></div></td>
      <td><div align="center">
          <input class=button type="button" value="�޸�" onClick="javascript:window.location.href='xg_user.asp?id=<%=rs("id")%>&qx=<%=rs("id")%>'"/>
          &nbsp;
       <%if Instr(session("juese"),"|306,")<>0 and rs("id")<>session("uid") and rs("id")<>1 then%>
          	<input name="Submit2" type="button" class="button" onClick="{if(confirm('ȷ��ɾ��ô?')){location.href='del_user.asp?id=<%=rs("id")%>';}return false;}" value="ɾ��" />
		<%end if%>
      </div></td>
    </tr>
    <%
rs.movenext
j=j+1                                                                     
if j>=rs.pagesize then exit do                                                           
loop
%>
  </form>
  <form action="user_info.asp" method="post">
    <tr class="botbg">
      <td height="25" align="center" colspan="10"><div align="center"> ���� <b><%=rs.recordcount%></b> ������Ա, ҳ��: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
          ��ǰ�ӵ�
          <%
           if pagecount<=1 then
           response.write "<font color=red>1</font>"
           else
           response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
           end if
          %>
          ����ʼ��
          <% if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
          <a href="?page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
          <% end if %>
          <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
          <a href="?page=1"><img src="../images/frist.png"></a><a href="?page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a>
          <%end if%>
          <% if pagecount<>1 and rs.pagecount<>pagecount then%>
          <a href="?page=1"><img src="../images/frist.png"></a><a href="?page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a> <a href="?page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
          <% end if
			 if rs.pagecount>1 then%>
          &nbsp;ֱ�ӵ���
          <%if rs.pagecount>15 then %>
          <input name="page" value="1" size="3" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
          <% else %>
          <select name="page">
            <%for i=1 to rs.pagecount%>
            <option value="<%=i%>"><%=i%></option>
            <%next%>
          </select>
          <%end if%>
          ҳ
          <input type="submit" name="go" value="��ת" class=button>
			<%end if%>
        </div></td>
  </form>
  <%End If%>
        <tr class="classfooter">
          <td colspan="10"><div>��ǰִ��SQL��䣺<font color="red"><%response.write sql%></font></div></td>
        </tr>
<%
rs.close
set rs=Nothing
%>
</table>
<%end if%>
</body>
</html>
