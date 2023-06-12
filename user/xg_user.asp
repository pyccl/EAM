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
<title>修改用户</title>
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
if (document.addFrm.userpw.value=='')
{
alert('密码不能为空');
document.addFrm.userpw.focus();
return false;
}

if (document.addFrm.name.value=='')
{
alert('姓名不能为空');
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
      <th height=24 colspan=2><strong>修改账户</strong></th>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>用户名(ID)：</strong></div></td>
      <td class="classtd"><%=rs("admin_id")%>(<%=rs("id")%>)</td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right" ><strong><font color="red">*</font>姓&nbsp;名：</strong></div></td>
      <td class="classtd"><input name="name" type="text" class="form" value="<%=rs("admin_name")%>" size="20" style="width: 180px;"></td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong><font color="red">*</font><%if Instr(session("juese"),"|306,")<>0 then%>密&nbsp;码<% else %>旧密码<% end if %>：</strong></div></td>
      <td class="classtd"><input name="userpw" type="password" class="form"  value="<%=rs("admin_pw")%>" size="20" style="width: 180px;"><%if Instr(session("juese"),"|306,")<>0 then%>(不改密码请保持原有数据)<%end if%></td>
    </tr>
<%if Instr(session("juese"),"|306,")=0 and session("uid")<>1 then%>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>新密码：</strong></div></td>
      <td class="classtd"><input name="newpw" type="password" class="form" size="20" style="width: 180px;">
      (不改密码请保持为空）</td>
    </tr>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>确认密码：</strong></div></td>
      <td class="classtd"><input name="newpw2" type="password" class="form" size="20" style="width: 180px;">
 (不改密码请保持为空）</td>
    </tr>
<% end if
   if Instr(session("juese"),"|306,")<>0 then%>
    <tr>
      <td height=30 class="classtd"><div align="right"><strong>权&nbsp;限：</strong></div></td>
      <td class="classtd"><%
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select y_name from admin_shiyongdanwei order by y_paixu asc"
				rsc.open sqlc,conn,1,3
				if rsc.bof or rsc.eof then
					Response.Write "<font color=red>暂无公司！请<a href= " & "../information/admin_shiyongdanwei.asp" & ">添加公司" & "</a>后重试！</font>"
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
      <td height=24 class="classtd"><div align="right"><strong>角&nbsp;色：</strong></div></td>
      <td height=24 class="classtd">
	  <%
		 if rs("id") = 1 then
		 	response.write "<font color=red><b>该用户无法修改此选项！</b></font>"
		 else
			if isnull(juese) then
				response.write "<font color=red><b>原配置为空，请重新选择：</b></font>"
			else
				set rsd2=server.CreateObject("ADODB.recordset")
				sql2="select id from juese where id = " & juese
				rsd2.open sql2,conn,1,3
				if rsd2.bof or rsd2.eof then
					response.write "<font color=red><b>原配置错误，请重新选择：</b></font>"
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
		  <td height=24 class="classtd"><div align="right"><strong>状&nbsp;态：</strong></div></td>
		  <td height=24 class="classtd"><label><input name="working" type="checkbox" value="1" style="HEIGHT: 15px;WIDTH: 15px;" <%if working=1 then response.write ("checked")%>>
			选中启用，未选中禁用</label></td>
		</tr>
	<%end if
end if%>
    <tr>
      <td height=24 colspan="2" align="center" class="classtd">
          <input name="Submit" type="submit" class="button" value="修改">&nbsp;
          <input name="fhui" type="button" class="button" onclick="javascript:window.location.href='user_info.asp'" value="返回">
        </td>
    </tr>
  </table>
</form>
<%else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
</body>
</html>
