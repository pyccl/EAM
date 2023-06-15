<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
On Error Resume next
response.charset="GB2312"
session.codepage=936
call admintop()

if Instr(session("juese"),"|402,")=0 then %>
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
if trim(request("department"))<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from admin_department", conn, 1, 3
rs.AddNew
rs("company")=trim(request("company"))
rs("department")=trim(request("department"))
rs("s_paixu")=trim(request("s_paixu"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "admin_department.asp"
response.end
end if
'----------------------------------------
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from admin_department where s_id=" &s_id, conn, 1, 3
rs("department")=request("department")
rs("s_paixu")=cint(request("s_paixu"))
rs.update
rs.close
response.Redirect "admin_department.asp"
response.end
set rs=nothing
'--------------------------------
case "del"
conn.execute "delete from admin_department where s_id="&s_id
response.Redirect "admin_department.asp"
response
end select
%>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <tr>
    <td align="center" colspan="4" class="classtop"><B>部门管理</b>
      <select name=company id="company"  onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
        <option value="">请选择公司</option>
        <%
		   
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "y_name = '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"
			sqlg="select y_id,y_name from [admin_shiyongdanwei] where " & rk & " ORDER BY y_paixu"
			set rs=conn.execute(sqlg)
           if not rs.eof then
           do while not rs.eof 
          %>
        <option value="?company1=<%=server.urlencode(Trim(rs("y_name")))%>"><%=rs("y_name")%></option>
        <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
      </select></td>
  </tr>
  <%
company1=replace(request("company1"),"'","’")
set rs=server.CreateObject("adodb.recordset")
sql="select * from admin_department where company='"&company1&"' order by s_paixu desc"
rs.open sql, conn, 1, 1
dim i
i=rs.recordcount%>
  <tr class=classtop1>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>ID</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>部门名</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>排序</strong></td>
    <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>操作</strong></td>
  </tr>
  <tr>
    <td colspan="4" class="classtd">当前公司：<font color=red><%=company1%></font></td>
  </tr>
  <%if rs.eof and rs.bof then
response.write ""
else
	do while not rs.eof%>
  <tr>
    <form name="form1" method="post" action="admin_department.asp?action=edit&s_id=<%=rs("s_id")%>">
      <td class="classtd"><div align="center">
          <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="<%=trim(rs("s_id"))%>" size="5">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="department" type="text" class="form" id="department" value="<%=trim(rs("department"))%>" size="25">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=<%=rs("s_paixu")%> size="3">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="Submit" type="submit" class="button" value="修 改">
          <input name="Submit2" type="button" class="button" onclick="{if(confirm('确认删除么?')){location.href='admin_department.asp?action=del&s_id=<%=rs("s_id")%>';}return false;}" value="删 除">
        </div></td>
    </form>
  </tr>
  <%rs.movenext
loop
end if
rs.close
set rs=nothing
if company1<>"" then
%>
  <form name="form2" method="post" action="admin_department.asp?action=add">
    <tr>
      <td height="15" class="classtd"><div align="center">
          <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="新建" size="5">
        </div></td>
      <td height="15" class="classtd"><div align="center">
          <input name="department" type="text" class="form" id="department" size="25">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=0 size="3">
        </div></td>
      <td class="classtd"><div align="center">
          <input name="company" value=<%=company1%> type=hidden>
          <input name="Submit2" type="submit" class="button" value="添 加">
        </div></td>
    </tr>
  </form>
  <tr class=classtop1>
    <td height="15" colspan="4" class="classtop1">排序决定显示位置：序号越小越在上，排序号码相同则按照ID号码排序。</td>
  </tr>
</table>
<%
end if 
end if
%>
