<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%if Instr(session("juese"),"|306,")<>0 or Cint(request("id"))=Cint(request("qx")) then %>
<%id=Cint(request("id"))
	sql="select * from admin where id="& id
	rs.open sql,connstr,1,1
    working=rs("working")
	rank=rs("rank")
	juese=rs("juese")
%>
<html>
<head>
<title>�޸��û�</title>
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
if (document.addFrm.userpw.value=='')
{
alert('���벻��Ϊ��');
document.addFrm.userpw.focus();
return false;
}

if (document.addFrm.name.value=='')
{
alert('��������Ϊ��');
document.addFrm.name.focus();
return false;
}

}
</script>
    <link href="../css.css" rel="stylesheet" type="text/css">
<body>
<form action ="save_user.asp?action=xg&id=<%=id%>&qx=<%=id%>" method="post" name="addFrm" onSubmit="return checkform()">
  <table border="0" cellspacing="1" cellpadding="4" align="center" width="100%">
    <tr class="classtop1">
      <th height=24 colspan=2><strong>�޸��˻�</strong></th>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>�û���(ID)��</strong></div></td>
      <td class="classtd"><%=rs("admin_id")%>(<%=rs("id")%>)</td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right" ><strong><font color="red">*</font>��&nbsp;����</strong></div></td>
      <td class="classtd"><input name="name" type="text" class="form" value="<%=rs("admin_name")%>" size="20" style="width: 180px;"></td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong><font color="red">*</font><%if Instr(session("juese"),"|306,")<>0 then%>��&nbsp;��<% else %>������<% end if %>��</strong></div></td>
      <td class="classtd"><input name="userpw" type="password" class="form"  value="<%=rs("admin_pw")%>" size="20" style="width: 180px;"><%if Instr(session("juese"),"|306,")<>0 then%>(���������뱣��ԭ������)<%end if%></td>
    </tr>
<%if Instr(session("juese"),"|306,")=0 and session("uid")<>1 then%>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>�����룺</strong></div></td>
      <td class="classtd"><input name="newpw" type="password" class="form" size="20" style="width: 180px;">
      (���������뱣��Ϊ�գ�</td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>ȷ�����룺</strong></div></td>
      <td class="classtd"><input name="newpw2" type="password" class="form" size="20" style="width: 180px;">
 (���������뱣��Ϊ�գ�</td>
    </tr>
<% end if
   if Instr(session("juese"),"|306,")<>0 then%>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>Ȩ&nbsp;�ޣ�</strong></div></td>
      <td class="classtd"><%
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select y_name from admin_shiyongdanwei order by y_paixu asc"
				rsc.open sqlc,conn,1,3
				if rsc.bof or rsc.eof then
					Response.Write "<font color=red>���޹�˾����<a href= " & "../information/admin_shiyongdanwei.asp" & ">��ӹ�˾" & "</a>�����ԣ�</font>"
				else
					do while not rsc.eof
						Response.Write"<label><input name='y_name' type='checkbox'  style='HEIGHT: 15px;WIDTH: 15px;' value='"&rsc("y_name")&"'"
							if Instr(rank,""&rsc("y_name")&"")>0  then 
								response.write " checked "
							End if
						Response.Write" >"&rsc("y_name")&"</label>"
						rsc.movenext
					loop
		  		end if
				rsc.close
				set rsc=nothing 
		%></td>
    </tr>
    <tr>
      <td height=24 class="classtd"><div align="right"><strong>��&nbsp;ɫ��</strong></div></td>
      <td height=24 class="classtd">
	  <%
		 if rs("id") = 1 then
		 	response.write "<font color=red><b>���û��޷��޸Ĵ�ѡ�</b></font>"
		 else
			if isnull(juese) then
				response.write "<font color=red><b>ԭ����Ϊ�գ�������ѡ��</b></font>"
			else
				set rsd2=server.CreateObject("ADODB.recordset")
				sql2="select id from juese where id = " & juese
				rsd2.open sql2,conn,1,3
				if rsd2.bof or rsd2.eof then
					response.write "<font color=red><b>ԭ���ô���������ѡ��</b></font>"
				end if
				rsd2.close
				set rsd2=nothing
			end if

			set rsd=server.CreateObject("ADODB.recordset")
			sqld="select id,mingcheng from juese order by id asc"
			rsd.open sqld,conn,1,3
			Response.Write "<select name='juese' class='form'  style='width: 180px;'>"
			do while not rsd.eof
				Response.Write"<option value='"&rsd("id")&"'"
				if not isnull(juese) and rsd("id")=juese then 
					response.write " selected='selected' "
				End if
				Response.Write" >"&rsd("mingcheng")&"</option>"
				rsd.movenext
			loop
			rsd.close
			set rsd=nothing 
			Response.Write"</select> "
		 end if
		%></td>
    </tr>
    <%if Instr(session("juese"),"|306,")<>0 then%>
		<tr>
		  <td height=24 class="classtd"><div align="right"><strong>״&nbsp;̬��</strong></div></td>
		  <td height=24 class="classtd"><label><input name="working" type="checkbox" value="1" style="HEIGHT: 15px;WIDTH: 15px;" <%if working=1 then response.write ("checked")%>>
			ѡ�����ã�δѡ�н���</label></td>
		</tr>
	<%end if
end if%>
    <tr>
      <td height=24 colspan="2" align="center" class="classtd">
          <input name="Submit" type="submit" class="button" value="�޸�">&nbsp;
          <input name="fhui" type="button" class="button" onclick="javascript:window.location.href='user_info.asp'" value="����">
        </td>
    </tr>
  </table>
</form>
<%else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
</body>
</html>
