<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then
   ysyz=session("ysyz")
   ydepartment=session("ydepartment")
   if ysyz="" or ydepartment="" then 
   		response.Write"<script>alert('系统错误！原所属为空，请联系管理员！');history.back()</script>"
   elseif request("xsyz")=ysyz then
   		response.Write"<script>alert('资产转移失败！现使用人不能与原使用人相同！');history.back()</script>"
   elseif request("xsyz")="" or request("xdepartment")="" then 
   		response.Write"<script>alert('资产转移失败！现使用人、现属部门不能为空！');history.back()</script>"
   else 
		page=request("page")
		id=request("id")
		sql="select * from sbxx where id=" & id
		rs.open sql,connstr,1,3
		sbbh=rs("sbbh")
   		xuser=request("xsyz")
   		xdepartment=request("xdepartment")
		rs("syz")=xuser
   		rs("department")=xdepartment
		rs("gxsj")=now()
		rs.update
		rs.close
		set rs=nothing

		Set rsa=Server.CreateObject("ADODB.Recordset")
		sqla="select * from user_log"
		rsa.open sqla,connstr,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="转移资产"
		rsa("alog")="将编号为<font color=red>【"&sbbh&"】</font>的资产由<font color=blue>【"&ydepartment&"】的【"&ysyz&"】</font>转移到<font color=red>【"&xdepartment&"】的【"&xuser&"】</font>"
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
		rsb("leixing")="转移"
		rsb("ssbm")="【"&ydepartment&"】的【"&ysyz&"】"
   		if ydepartment=xdepartment then
   			rsb("user")="【"&xuser&"】"
   		else
			rsb("user")="【"&xdepartment&"】的【"&xuser&"】"
   		end if
		rsb("datetime")=now()
		rsb.update
		rsb.close
		set rsb=nothing
		response.write ("<script>alert('资产转移成功！');window.location.replace('news_list.asp?page="&page&"');</script>")
   end if
else%>

<!--#include file="../inc/quanxian.asp"-->

<%end if%>
