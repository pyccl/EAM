<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">

<%
On Error Resume next
response.charset="GB2312"
session.codepage=936
call admintop()

if Instr(session("juese"),"|405,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else
dim action, s_id,s_paixu
s_id=request.QueryString("s_id")
action=request("action")
s_paixu=cint(request("s_paixu"))

select case action
case "add"
if trim(request("s_name"))<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from os", conn, 1, 3
rs.AddNew
rs("os")=trim(request("s_name"))
rs("paixu")=trim(request("s_paixu"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "admin_os.asp"
response.end
end if
'----------------------------------------
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from os where id=" &s_id, conn, 1, 3
rs("os")=request("s_name")
rs("paixu")=cint(request("s_paixu"))
rs.update
rs.close
response.Redirect "admin_os.asp"
response.end
set rs=nothing
'--------------------------------
case "del"
conn.execute "delete from os where id="&s_id
response.Redirect "admin_os.asp"
response
end select
%>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <form name="form2" method="post" action="admin_os.asp">
    <tr>
      <td class="classtop1" align=center><B>����ϵͳ����</b></td>
    </tr>
    <tr>
      <td class="classtd" align=right>�����ؼ��ʣ�
        <input name="gjc" size="25" class=form>
        &nbsp;&nbsp;
        <input type="submit" name="tiaojian" value=" �� ѯ " class=button>&nbsp;</td>
    </tr>
  </form>
</table>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <%
        gjc=replace(request("gjc"),"'","��")
        set rs=server.CreateObject("adodb.recordset")
        sql="select * from os where os<>''"
        If gjc<>"" Then sql=sql&" and os like '%"&gjc&"%'"
        sql=sql&" order by id desc"
        rs.open sql,conn, 1, 1
        %>
  <tr class=classtop1>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>ID</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>�ͺ�</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>����</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>����</strong></td>
  </tr>
  <form name="form2" method="post" action="admin_os.asp?action=add">
    <tr>
      <td height="15" class="classtd"><div align="center">
          <input name="s_name" type="text" disabled="disabled" class="form" id="s_name" value="�½�" size="5">
        </div></td>
      <td height="15" class="classtd"><div align="center">
          <input name="s_name" type="text" id="s_name" size="25" class="form">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" id="s_paixu" value=0 onkeyup="value=value.replace(/[^\d\.]/g,'');" size="3" class="form">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="Submit2" type="submit" class="button" value="�� ��">
      </div></td>
  </form>
  <%if rs.eof and rs.bof then
        response.write "<center><font color=red>û���κμ�¼������Ҫ�����·���ӣ�</font></center>"
        Else
        if not isempty(request("page")) then   
        pagecount=cint(request("page"))   
        else   
        pagecount=1
        end if
        rs.pagesize=session("liebiao")
        rs.AbsolutePage=pagecount
        do while not rs.eof%>
  <tr>
    <form name="form1" method="post" action="admin_os.asp?action=edit&s_id=<%=rs("id")%>">
      <td class="classtd"><div align="center">
          <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="<%=trim(rs("id"))%>" size="5">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_name" type="text" id="s_name" value="<%=trim(rs("os"))%>" size="25" class="form">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=<%=rs("paixu")%> size="3">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="Submit" type="submit" class="button" value="�� ��">
          <input name="Submit2" type="button" class="button" onclick="{if(confirm('ȷ��ɾ��ô?')){location.href='admin_os.asp?action=del&s_id=<%=rs("id")%>';}return false;}" value="ɾ ��">
        </div></td>
    </form>
  </tr>
  <%
rs.movenext
i=i+1                                                                     
if i>=rs.pagesize then exit do                                                           
loop
%>
  <form action="admin_os.asp" method="post">
    <tr class=botbg>
      <td height="15" align="center" colspan="4"><div align="center"> ���� <b><%=rs.recordcount%></b> ����¼, ҳ��: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
        ��ǰ�ӵ�
        <%
           if pagecount<=1 then
           response.write "<font color=red>1</font>"
           else
           response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
           end if
          %>
        ����ʼ��
  <% if rs.pagecount > 1 then
			 if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
  <a href="?page=<%=cstr(pagecount+1)%>&gjc=<%=gjc%>"><img src="../images/next.png"></a><a href="?page=<%=rs.pagecount%>&gjc=<%=gjc%>"><img src="../images/last.png"></a>
  <% end if %>
  <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
  <a href="?page=1&gjc=<%=gjc%>"><img src="../images/frist.png"></a><a href="?page=<%=cstr(pagecount-1)%>&gjc=<%=gjc%>"><img src="../images/previous.png"></a>
  <%end if%>
  <% if pagecount<>1 and rs.pagecount<>pagecount then%>
  <a href="?page=1&gjc=<%=gjc%>"><img src="../images/frist.png"></a><a href="?page=<%=cstr(pagecount-1)%>&gjc=<%=gjc%>"><img src="../images/previous.png"></a><a href="?page=<%=cstr(pagecount+1)%>&gjc=<%=gjc%>"><img src="../images/next.png"></a><a href="?page=<%=rs.pagecount%>&gjc=<%=gjc%>"><img src="../images/last.png"></a>
  <% end if%>
  &nbsp;ֱ�ӵ���
  <%if rs.pagecount>15 then %>
  <input name="page" value="1" size="5" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
  <% else %>
  <select name="page">
    <%for i=1 to rs.pagecount%>
    <option value="<%=i%>"><%=i%></option>
    <%next%>
  </select>
  <%end if%>
        ҳ
  <input type="submit" name="go" value="��ת" class=button>
  <% end if %>
      </div></td>
  </form>
  <%
End If 
rs.close
set rs=Nothing
%>
  <tr class=classtop1>
    <td height="15" colspan="4" class="classtop1">�����Ž�Ӱ��������ֵԽСԽ��ǰ��</td>
  </tr>
</table>
<%
end if%>
