<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
if Instr(session("juese"),"|307,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else %>
<script  charset="utf-8" language="javascript">
 
function ale()
 
{
alert('重置成功!');
window.location.replace('../admin/setting.asp');
}
</script>
<%
zt=request("zt")
if zt="cz" then
sql="select * from sbxx where zt<>'报废'" 
rs.open sql,connstr,1,3
do while not rs.eof
rs("pdzt")=0
rs("pdsj")=null
rs.update
rs.movenext
loop
rs.close
set rs=nothing

response.write ("<script>ale()</script>")
end if
end if%>
