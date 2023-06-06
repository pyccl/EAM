<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
   idcard=trim(request("idcard"))
   gh=trim(request("gh"))
sql1="select * from admin_yuangong where idcard='" + idcard + "' or gh='" + gh +"'"
rs.open sql1,connstr,1,1
if not rs.eof then
    response.write ("<script>alert('该身份证号或工号已经存在！请重检查！');window.location.replace('add_yuangong.asp');</script>")
else
	chk_="ok"
end if
rs.close

if chk_="ok" Then
	filename=now()
	filename=replace(filename,"-","")
	filename=replace(filename,":","")
	filename=replace(filename," ","")
	sql="select * from admin_yuangong"
	rs.open sql,connstr,1,3
	rs.addnew
	rs("xingming")=trim(request("xingming"))
	rs("company")=request("company")
	rs("department")=trim(request("department"))
	rs("position")=trim(request("position"))
	rs("ruzhi")=cdate(request("ruzhi"))
	rs("phone")=trim(request("phone"))
	rs("weixin")=trim(request("weixin"))
	rs("qq")=trim(request("qq"))
	rs("idcard")=trim(idcard)
	rs("gh")=trim(gh)

	rs("education")=trim(request("education"))
   	if len(request("jg_1"))=0 then
   		rs("place1")=null
    else
    rs("place1")=request("jg_1")
    end if
   	if len(request("jg_2"))=0 then
   		rs("place2")=null
    else
    rs("place2")=request("jg_2")
    end if
   	if len(request("jg_3"))=0 then
   		rs("place3")=null
    else
    rs("place3")=request("jg_3")
    end if
   	if len(request("zz_1"))=0 then
   		rs("place4")=null
    else
    rs("place4")=request("zz_1")
    end if
   	if len(request("zz_2"))=0 then
   		rs("place5")=null
    else
    rs("place5")=request("zz_2")
    end if
   	if len(request("zz_3"))=0 then
   		rs("place6")=null
    else
    rs("place6")=request("zz_3")
    end if
	if trim(request("pic"))<>"" then
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
	rsa("atype")="添加员工"
	rsa("alog")="姓名："&trim(request("xingming"))&"，身份证号："&trim(idcard)
	rsa("atime")=now()
	rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
	rsa.update
	rsa.close
	set rsa=nothing
	response.write ("<script>alert('员工添加成功!');window.location.replace('admin_yuangong.asp');</script>")
end If

%>
