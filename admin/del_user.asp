<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%if Instr(session("juese"),"|306,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end 
else
  id=Request.Querystring("id")
  if id="" or isnull(id) then
     Response.Redirect("login.asp")
  end If
  conn.execute("delete * from admin where ID=" & id)
  response.write ("<script>alert('É¾³ý³É¹¦');location.href='user_info.asp';</script>")
end if
%>
