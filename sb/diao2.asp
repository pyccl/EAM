<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then
   yssbm=session("yssbm")
   ysyz=session("ysyz")
   if ysyz<>"" or yssbm="" then 
   		response.Write"<script>alert('系统错误！原所属资产信息有误，请联系管理员！');history.back()</script>"
   elseif request("xssbm")="" then 
   		response.Write"<script>alert('资产调拨失败！请选择调拨到的公司！');history.back()</script>"
   else 
		page=request("page")
		id=request("id")
		sql="select * from sbxx where id=" & id
		rs.open sql,connstr,1,3
		sbbh=rs("sbbh")
   		xssbm=request("xssbm")
   		rs("ssbm")=xssbm
		rs("gxsj")=now()
		rs.update
		rs.close
		set rs=nothing

		Set rsa=Server.CreateObject("ADODB.Recordset")
		sqla="select * from user_log"
		rsa.open sqla,connstr,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="调拨资产"
		rsa("alog")="将编号为<font color=red>【"&sbbh&"】</font>的资产由<font color=blue>【"&yssbm&"】</font>调拨到<font color=red>【"&xssbm&"】</font>"
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
		rsb("leixing")="调拨"
		rsb("ssbm")="【"&yssbm&"】"
		rsb("user")="【"&xssbm&"】"
		rsb("datetime")=now()
		rsb.update
		rsb.close
		set rsb=nothing
		response.write ("<script>alert('资产调拨成功！');window.location.replace('news_list.asp?page="&page&"');</script>")
   end if
else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
