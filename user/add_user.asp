<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<%if Instr(session("juese"),"|305,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else %>
<html>
<head>
<title>��ӹ���Ա</title>
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
if (document.addFrm.userid.value=='')
{
alert('�û�������Ϊ��');
document.addFrm.userid.focus();
return false;
}

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
<body>
<table border="0" cellspacing="1" cellpadding="4" align="center" bgcolor="#6298E1" width="100%">
 <form action ="save_user.asp?action=add" method="post" name="addFrm" onSubmit="return checkform()">
<tr class=classtop1>
<th height=24 colspan="2"><strong>����˻�</strong></th>
</tr>
<tr> 
<td width="16%" height=30 class="classtd"><div align="right"><font color="#ff0033">*</font><strong>�û�����</strong></div></td>
<td width="84%" class="classtd"> 
<input name="userid" type="text" class="form" size="20" style="width: 180px;"></td>
</tr>
<tr> 
<td height=30 class="classtd"><div align="right"><font color="#ff0033">*</font><strong>��&nbsp;�룺</strong></div></td>
<td class="classtd"> 
<input name="userpw" type="password" class="form" size="20" style="width: 180px;"></td>
</tr>
<tr> 
<td height=30 class="classtd"><div align="right"><font color="#ff0033">*</font><strong>��&nbsp;����</strong></div></td>
<td class="classtd"> 
<input name="name" type="text" class="form" size="20" style="width: 180px;"></td>
</tr>
<tr> 
<td height=30 class="classtd"><div align="right"><font color="#ff0033">*</font><strong>Ȩ&nbsp;�ޣ�</strong></div></td>
	<td class="classtd">
		<%
			set rsc=server.CreateObject("ADODB.recordset")
			sqlc="select y_id,y_name from admin_shiyongdanwei order by y_paixu asc"
			rsc.open sqlc,conn,1,3
			if rsc.bof or rsc.eof then
				Response.Write "<font color=red>���޹�˾����<a href= " & "../information/admin_shiyongdanwei.asp" & ">��ӹ�˾" & "</a>�����ԣ�</font>"
			else
				do while not rsc.eof
					Response.Write"<label><input name='y_name' type='checkbox'  style='HEIGHT: 15px;WIDTH: 15px;' value='"&rsc("y_name")&"'"
					Response.Write" >"&rsc("y_name")&"</label>"
					rsc.movenext
				loop
			end if
			rsc.close
			set rsc=nothing 
		%>
	</td>
</tr>
<tr>
  <td height=24 class="classtd"><div align="right"><font color="#ff0033">*</font><strong>��&nbsp;ɫ��</strong></div></td>
  <td height=24 class="classtd"><select name="juese" class="form" id="juese" style="width: 180px;">
    <%set rs=conn.execute("select id,mingcheng from juese")
    	if not rs.eof then
    		do while not rs.eof 
    %>
    			<option value="<%=Trim(rs("id"))%>"><%=rs("mingcheng")%></option>
    		<%rs.movenext
            loop
		else
			response.write "<font color=red>���޽�ɫ����" & "<a href=" & "admin_juese.asp?Result=Add" & ">��ӽ�ɫ</a>" & "�����ԣ�</font>"
        end if 
        rs.close:set rs=nothing
  %>
  </select></td>
</tr>
<tr>
  <td height=24 class="classtd"><div align="right"><strong>״&nbsp;̬��</strong></div></td>
  <td height=24 class="classtd">
    <label><input name="working" type="checkbox" style="HEIGHT: 15px;WIDTH: 15px;" value="1" checked="checked">
    ��ѡ���ã�δ��ѡ����</label></td>
</tr>
<tr> 
<td height=24 colspan="2" class="classtd"> 
  <div align="left"  style="margin-left: 130px;">
    <input type="submit" name="Submit" value="���" class="button">�� <input type="reset" name="Submit2" value="����" class="button">
  </div></td>
</tr>
</form>
</table>
<%end if%>
	 
</body>
</html>
