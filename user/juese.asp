<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
on error resume next
call admintop()
if Instr(session("juese"),"|301,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
dim action, id
id=request.QueryString("id")
mingcheng=request.QueryString("mingcheng")
action=request("action")
select case action
case "del"
conn.execute "delete from juese where id="&id
Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="删除角色"
rsa("alog")="删除名称为<font color=red>【" & mingcheng &"】</font>的角色。"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
   response.write ("<script>alert('角色删除成功!');window.location.replace('juese.asp?page="&page&"');</script>")
	if request("page")<>"" then 
	response.Redirect "juese.asp?page="&request("page")&""
	else
	response.Redirect "juese.asp"
	end if 
response.end 
end select
%>
<body>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="100%" bgcolor="#183789">
  <tr>
    <td height=25  align=left colspan=5 class=classtop1><img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6">&nbsp;<strong>角色管理</strong> <a href="admin_juese.asp?Result=Add"><img src="../images/add.png"></a></td>
  </tr>
</table>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%" style="table-layout:fixed;">
  <tr class=classtop1>
    <td nowrap background="../images/th_bg.gif" width="3%"  height="15" align="center"><strong>ID</strong></td>
    <td nowrap background="../images/th_bg.gif" width="10%"  height="15" align="center"><strong>角色名称</strong></td>
    <td nowrap background="../images/th_bg.gif" width="52%"  height="15" align="center"><strong>具体权限</strong></td>
    <td nowrap background="../images/th_bg.gif" width="13%"  height="15" align="center"><strong>更新时间</strong></td>
    <td nowrap background="../images/th_bg.gif" width="10%"  height="15" align="center"><strong>绑定用户数</strong></td>
    <td nowrap background="../images/th_bg.gif" width="12%"  height="15" align="center"><strong>操作</strong></td>
  </tr>
  <%
set rs=server.CreateObject("adodb.recordset")
sql="select * from juese order by id desc"
rs.open sql,conn, 1, 1
if rs.eof and rs.bof then
response.write "<tr><td colspan=11 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>暂无角色，请添加。</font></div></td></tr>"
Else
	if not isempty(request("page")) then   
	pagecount=cint(request("page"))
	else   
	pagecount=1
	end if
	rs.pagesize=session("liebiao")
	rs.AbsolutePage=pagecount
	do while not rs.eof%>
  <form name="form1" id="form1" method="post" action="" target="_blank">
    <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
      <td align="center"><%=rs("id")%></td>
      <td align="center"><%=rs("mingcheng")%></td>
    <td align="center" style="word-wrap:break-word;">
		<%
		if trim(rs("quanxian"))="" then
			response.write "<font color=red>暂无任何权限！</font>"
		else
			response.write rs("quanxian")
		end if
		%>
	</td>
      <td align="center"><%=rs("datetime")%></td>
      <td align="center"><%
			set rs2=server.CreateObject("adodb.recordset")
			sql2="select * from admin where juese = " & rs("id")
			rs2.open sql2,conn, 1, 1
		    if rs2.eof and rs2.bof then
				response.write "<font color = red>0</font>"
			else
				response.write "<font color = blue><strong> " & rs2.recordcount & " </strong></font>"
			end if
		%></td>
      <td align="center">
		  <%if rs("id")<>1 then %> 
		  	<input class=button type="button" value="修改" onclick="javascript:window.location.href='admin_juese.asp?Result=Modify&ID=<%=rs("ID")%>&page=<%=pagecount%>'" />
		  <% else
			 	response.write "<font color=red>无权操作！</font>"
			 end if%>
        <%if rs("id") <> 1 and rs2.recordcount = 0 then %>
        	<input name="Submit2" type="button" class="button" onclick="{if(confirm('请确认删除名称为“<%=rs("mingcheng")%>”的角色么?')){location.href='juese.asp?action=del&amp;id=<%=rs("id")%>&amp;mingcheng=<%=rs("mingcheng")%>&amp;page=<%=request("page")%>';} return false;}" value="删除"/>
        <% end if
			rs2.close
			set rs2=Nothing %></td>
    </tr>
    <%
	rs.movenext
	j=j+1
	if j>=rs.pagesize then exit do
	loop
	%>
  </form>
  <form action="juese.asp" method="post">
    <tr class=botbg>
      <td height="25" align="center" colspan=6><div align="center"> 共有<strong><%=rs.recordcount%></strong>个角色, 页次: <strong><font color=red><%=pagecount%></font>/<%=rs.pagecount%></strong>,当前从第
          <%
			   if pagecount<=1 then
			   response.write "<font color=red>1</font>"
			   else
			   response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
			   end if
			  %>
          条开始。
          <% if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
          <a href="?page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
          <% end if %>
          <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
          <a href="?page=1"><img src="../images/frist.gif"></a><a href="?page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a>
          <%end if%>
          <% if pagecount<>1 and rs.pagecount<>pagecount then%>
          <a href="?page=1"><img src="../images/frist.gif"></a><a href="?page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a> <a href="?page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
          <% end if
			if rs.pagecount>1 then%>
          &nbsp;直接到第
          <%if rs.pagecount>15 then %>
          <input name="page" value="1" size="5" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
          <% else %>
          <select name="page">
            <%for i=1 to rs.pagecount%>
            <option value="<%=i%>"><%=i%></option>
            <%next%>
          </select>
          <%end if%>
          页
          <input type="submit" name="go" value="跳转" class=button>
          <%end if%>
        </div></td>
    </tr>
  </form>
  <%
		End If 
		rs.close
		set rs=Nothing
		%>
</table>
<% end if %>
</body>
