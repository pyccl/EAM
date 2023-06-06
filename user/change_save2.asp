<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->

<%
page=request("page")
id=session("id")
idcard=trim(request("idcard"))
yuanidcard=session("yuanidcard")

if yuanidcard = idcard then
	chk_="ok"
else
	sql1="select * from admin_yuangong where idcard='" + idcard + "'"
	rs.open sql1,connstr,1,1
	if not(rs.eof and rs.bof) then
		response.write ("<script>alert('该身份证号已经存在！请重检查！');window.history.go(-1);</script>")
	else
		chk_="ok"
	end if
end if

if chk_ = "ok" then
	sql="select * from admin_yuangong where id=" & id
	rs.open sql,connstr,1,3
	   xingming=rs("xingming")
	   rs("xingming")=request("xingming")
	rs("idcard")=request("idcard")
		rs("company")=request("company")
		rs("department")=request("department")
		rs("position")=request("position")
		rs("ruzhi")=request("ruzhi")
		rs("education")=request("education")
		rs("phone")=request("phone")
	   rs("weixin")=request("weixin")
	   rs("qq")=request("qq")
		rs("place1")=request("jg_1")
		rs("place2")=request("jg_2")
		rs("place3")=request("jg_3")
		rs("place4")=request("zz_1")
		rs("place5")=request("zz_2")
		rs("place6")=request("zz_3")
		if trim(request("pic"))="" then
			rs("photo")=null
		else
			rs("photo")=trim(request("pic"))
		end if
	rs.update
	rs.close
	set rs=nothing

	Set rsa=Server.CreateObject("ADODB.Recordset")
	sqla="select * from user_log"
	rsa.open sqla,connstr,1,3
	rsa.addnew
	rsa("username")=session("web_admin")
	rsa("atype")="修改员工"
	rsa("alog")="修改员工<font color=blue>【"&xingming&"】</font><font color=red>【"&request("idcard")&"】</font>的信息。"
	rsa("atime")=now()
	rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
	rsa.update
	rsa.close
	set rsa=nothing
	response.write ("<script>alert('员工信息修改成功!');window.location.replace('admin_yuangong.asp?page="&page&"');</script>")
end if
%>
