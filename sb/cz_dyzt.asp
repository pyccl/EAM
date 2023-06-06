<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
if Instr(session("juese"),"|201,")=0 then %>
	   <!--#include file="../inc/quanxian.asp"-->
	  <%
	  response.end
	else %>
	<script  charset="utf-8" language="javascript">

	function ale()

	{
	alert('÷ÿ÷√≥…π¶!');
	window.location.replace('news_list_lb.asp');

	}
	</script>
	<%
	zt=request("zt")
	if zt="cz" then

		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
			rk = "ssbm= '" & mystr(i) & "' or " + rk
		next
		rk = rk & " False"

		sql="select dyzt from sbxx where " & rk
		rs.open sql,connstr,1,3
		do while not rs.eof
			rs("dyzt")=0
			rs.update
			rs.movenext
		loop
		rs.close
		set rs=nothing

		response.write ("<script>ale()</script>")
	end if%>

<%end if%>
