<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<script src="../js/jscolor/jscolor.js"></script>
<!--#include file="../inc/defaultcolor.asp"-->
<%
On Error Resume next
response.charset="GB2312"
session.codepage=936
call admintop()
if Instr(session("juese"),"|401,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
else
call admintop()
if session("web_admin")="" then
	adminflag()	
else
dim action, s_id,s_paixu
s_id=request.QueryString("s_id")
action=request("action")
s_paixu=cint(request("s_paixu"))

select case action
case "add"
if trim(request("s_name"))<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from admin_shiyongdanwei", conn, 1, 3
rs.AddNew
rs("y_name")=trim(request("s_name"))
rs("y_color")=trim(request("color"))
rs("y_paixu")=trim(request("s_paixu"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "admin_shiyongdanwei.asp"
response.end
end if
'----------------------------------------
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from admin_shiyongdanwei where y_id=" &s_id, conn, 1, 3
rs("y_name")=request("s_name")
rs("y_color")=request("color")
rs("y_paixu")=cint(request("s_paixu"))
rs.update
rs.close
response.Redirect "admin_shiyongdanwei.asp"
response.end
set rs=nothing
'--------------------------------
case "del"
conn.execute "delete from admin_shiyongdanwei where y_id="&s_id
response.Redirect "admin_shiyongdanwei.asp"
response
end select
%>
    
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <form name=form2 method=post action=admin_shiyongdanwei.asp>
    <tr>
      <td class=classtop1 align="center"><strong><%=session("companyname")%>公司管理</strong></td>
    </tr>
    <tr>
      <td class="classtd" align="right">查找公司名称：
        <input name="gjc" size="25" class=form>
        &nbsp;&nbsp;
<input type=submit name=tiaojian value=" 查 询 " class=button></td>
    </tr>
  </form>
</table>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <%
gjc=replace(request("gjc"),"'","’")
set rs=server.CreateObject("adodb.recordset")
sql="select * from [admin_shiyongdanwei] where y_name<>''"
If gjc<>"" Then sql=sql&" and y_name like '%"&gjc&"%'"
sql=sql&" order by y_id desc"
rs.open sql,conn, 1, 1
%>
  <tr class=classtop1>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>ID</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>公司名称</strong></td>
	<td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>颜色</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>排序</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>操作</strong></td>
  </tr>
  <form name="form2" method="post" action="admin_shiyongdanwei.asp?action=add">
    <tr>
      <td height="15" class="classtd"><div align="center">
          <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="新建" size="5">
      </div></td>
      <td height="15" class="classtd"><div align="center">
          <input name="s_name" type="text" class="form" id="s_name" size="25">
      </div></td>
	  <td height="15" class="classtd"><div align="center">
		  <input name="color" type="text" data-jscolor="" id="color" value='#ABCDEF'>
	  </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=0 size="3">
      </div></td>
      <td class="classtd"><div align="center">
          <input name="Submit2" type="submit" class="button" value="添 加">
      </div></td>
  </form>
  <%if rs.eof and rs.bof then
response.write "<center><img src=../images/note.gif><font color=red>没有任何记录！有需要请在下方添加！</font></center>"
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
    <form name="form1" method="post" action="admin_shiyongdanwei.asp?action=edit&s_id=<%=rs("y_id")%>">
      <td class="classtd"><div align="center">
          <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="<%=trim(rs("y_id"))%>" size="5">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_name" type="text" class="form" id="s_name" value="<%=trim(rs("y_name"))%>" size="25">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="color" data-jscolor="" type="text" id="color" value=<%=rs("y_color")%>>
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=<%=rs("y_paixu")%> size="3">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="Submit" type="submit" class="button" value="修 改">
          <%if rs.recordcount >1 then%>
              <input name="Submit2" type="button" class="button" onclick="{if(confirm('确认删除么?')){location.href='admin_shiyongdanwei.asp?action=del&s_id=<%=rs("y_id")%>';}return false;}" value="删 除">
         <%end if%>
        </div></td>
    </form>
  </tr>
  <%
rs.movenext
i=i+1                                                                     
if i>=rs.pagesize then exit do                                                           
loop
%>
  <form action="admin_shiyongdanwei.asp?gjc=<%=gjc%>" method="post">
    <tr class=botbg>
      <td height="25" align="center" colspan="5"><div align="center"> 共有 <b><%=rs.recordcount%></b> 条记录, 页次: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
          当前从第
          <%
           if pagecount<=1 then
           response.write "<font color=red>1</font>"
           else
           response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
           end if
          %>
          条开始。
          <% if rs.pagecount > 1 then
			 if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
          <a href="?page=<%=cstr(pagecount+1)%>&gjc=<%=gjc%>"><img src="../images/next.gif"></a><a href="?page=<%=rs.pagecount%>&gjc=<%=gjc%>"><img src="../images/last.gif"></a>
          <% end if %>
          <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
          <a href="?page=1&gjc=<%=gjc%>"><img src="../images/frist.gif"></a><a href="?page=<%=cstr(pagecount-1)%>&gjc=<%=gjc%>"><img src="../images/previous.gif"></a>
          <%end if%>
          <% if pagecount<>1 and rs.pagecount<>pagecount then%>
          <a href="?page=1&gjc=<%=gjc%>"><img src="../images/frist.gif"></a><a href="?page=<%=cstr(pagecount-1)%>&gjc=<%=gjc%>"><img src="../images/previous.gif"></a><a href="?page=<%=cstr(pagecount+1)%>&gjc=<%=gjc%>"><img src="../images/next.gif"></a><a href="?page=<%=rs.pagecount%>&gjc=<%=gjc%>"><img src="../images/last.gif"></a>
          <% end if%>
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
		<% end if %>
        </div></td>
  </form>
  <%
End If 
rs.close
set rs=Nothing
%>
  <tr class=classtop1>
    <td height="15" colspan="5" class="classtop1">颜色：用于在统计中显示；排序：数值越小越靠上。</td>
  </tr>
</table>
<%end if
end if%>
