
<%
'------------------------�ж��Ƿ��½--------------------------------------'
if session("web_admin") = "" then
	response.write ("<script>alert('���ȵ�½ϵͳ');window.open('../login.asp','_parent');</script>")
end if
%>