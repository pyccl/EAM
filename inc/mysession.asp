
<%
'------------------------判断是否登陆--------------------------------------'
if session("web_admin") = "" then
	response.write ("<script>alert('请先登陆系统');window.open('../login.asp','_parent');</script>")
end if
%>