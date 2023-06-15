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

if Instr(session("juese"),"|403,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else
dim action,s_id,s_paixu,s_color
s_id=request.QueryString("s_id")
action=request("action")
s_paixu=cint(request("s_paixu"))
s_color=request("s_color")

select case action
case "add"
if trim(request("s_name"))<>"" then
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from admin_bsort", conn, 1, 3
rs.AddNew
rs("s_name")=trim(request("s_name"))
rs("s_paixu")=trim(request("s_paixu"))
rs("s_color")=trim(request("s_color"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "admin_bsort.asp"
response.end
end if
'----------------------------------------
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from admin_bsort where s_id=" &s_id, conn, 1, 3
rs("s_name")=request("s_name")
rs("s_paixu")=cint(request("s_paixu"))
rs("s_color")=request("s_color")
rs.update
rs.close
response.Redirect "admin_bsort.asp"
response.end
set rs=nothing
'--------------------------------
case "del"
conn.execute "delete from admin_bsort where s_id="&s_id
response.Redirect "admin_bsort.asp"
response
end select
%>
  <table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
      <%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from admin_bsort order by s_paixu asc", conn, 1, 1
dim i
i=rs.recordcount%>
      <tr class=classtop1>
        <td  height="15" colspan="5" align="center"><strong>大类管理</strong></td>
      </tr>
      <tr class=classtop1>
        <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>ID</strong></td>
        <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>类别名</strong></td>
        <td nowrap background="../images/th_bg.gif" align="center"><strong>颜色</strong></td>
        <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>排序</strong></td>
        <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>操作</strong></td>
      </tr>
      <%if rs.eof and rs.bof then
response.write ""
else
        do while not rs.eof%>
      <tr>
        <form name="form1" method="post" action="admin_bsort.asp?action=edit&s_id=<%=rs("s_id")%>">
          <td class="classtd"><div align="center">
              <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="<%=trim(rs("s_id"))%>" size="5">
            </div></td>
          <td class="classtd"><div align="center">
              <input name="s_name" type="text" class="form" id="s_name" value="<%=trim(rs("s_name"))%>" size="25">
            </div></td>
          <td class="classtd"><div align="center">
            <input name="s_color" type="text" id="s_color" value="<%=trim(rs("s_color"))%>" class="form" data-jscolor="">
          </div></td>
          <td class="classtd"><div align="center">
              <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=<%=rs("s_paixu")%> size="3">
            </div></td>
          <td class="classtd"><div align="center">
              <input name="Submit" type="submit" class="button" value="修 改">
              <input name="Submit2" type="button" class="button" onclick="{if(confirm('确认删除么?')){location.href='admin_bsort.asp?action=del&s_id=<%=rs("s_id")%>';}return false;}" value="删 除">
            </div></td>
        </form>
      </tr>
      <%rs.movenext
loop
end if
rs.close
set rs=nothing
%>
      <form name="form2" method="post" action="admin_bsort.asp?action=add">
        <tr>
          <td height="15" class="classtd"><div align="center">
              <input name="s_id" type="text" disabled="disabled" class="form" id="s_id" value="新建" size="5">
          </div></td>
          <td height="15" class="classtd"><div align="center">
              <input name="s_name" type="text" class="form" id="s_name" size="25">
          </div></td>
          <td class="classtd"><div align="center">
            <input name="s_color" type="text" class="form" id="s_color" value="#ABCDEF" data-jscolor="">
          </div></td>
          <td class="classtd"><div align="center">
              <input name="s_paixu" type="text" class="form" id="s_paixu" onkeyup="value=value.replace(/[^\d\.]/g,'');" value=0 size="3">
          </div></td>
          <td class="classtd"><div align="center">
              <input name="Submit2" type="submit" class="button" value="添 加">
          </div></td></tr>
      </form>
        <tr class="classtop1">
          <td height="15" colspan="5" class="classtop1">颜色：用于在统计中显示；排序：数值越小越靠上。</td>
        </tr>
    </table>
<%end if%>
