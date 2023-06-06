<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then
   if request("syz")="" or request("department")="" or request("cfdd")="" or request("ssbm")="" then 
   		response.Write"<script>alert('借出失败！使用者、所属公司、所属部门、存放地点不能为空！');history.back()</script>"
   else
		page=request("page")
		id=request("id")
		sql="select * from sbxx where id=" & id
		rs.open sql,connstr,1,3
		zileii=rs("zilei")
		sbbh=rs("sbbh")
   		user=request("syz")
		rs("syz")=user
		rs("zt")="正常使用"
		rs("cfdd")=request("cfdd")
   		rs("ssbm")=request("ssbm")
   		rs("department")=request("department")
		rs("gxsj")=now()
		rs.update
		rs.close
		set rs=nothing

		Set rsa=Server.CreateObject("ADODB.Recordset")
		sqla="select * from user_log"
		rsa.open sqla,connstr,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="借出资产"
		rsa("alog")="<font color=red>【"&user&"】</font>借出<font color=blue>【"&zileii&"】</font>下编号为<font color=red>【"&sbbh&"】</font>的资产"
		rsa("atime")=now()
		rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
		rsa.update
		rsa.close
		set rsa=nothing

		Set rsb=Server.CreateObject("ADODB.Recordset")
		sqlb="select * from sb_log"
		rsb.open sqlb,connstr,1,3
		rsb.addnew
		rsb("username")=session("web_admin")
		rsb("zcid")=sbbh
		rsb("leixing")="借出"
		rsb("ssbm")=request("ssbm")
		rsb("user")=request("syz")
		rsb("datetime")=now()
		rsb.update
		rsb.close
		set rsb=nothing
		response.write ("<script>alert('资产借出成功!');window.location.replace('news_list.asp?page="&page&"');</script>")
   end if
else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
