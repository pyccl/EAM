
<%
'------------------------ÅÐ¶ÏÊÇ·ñµÇÂ½--------------------------------------
if session("web_admin") = "" then
	response.write ("<script>window.open('login.asp','_parent');</script>")
end if
%>