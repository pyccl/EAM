<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then
   yssbm=session("yssbm")
   ysyz=session("ysyz")
   if ysyz<>"" or yssbm="" then 
   		response.Write"<script>alert('ϵͳ����ԭ�����ʲ���Ϣ��������ϵ����Ա��');history.back()</script>"
   elseif request("xssbm")="" then 
   		response.Write"<script>alert('�ʲ�����ʧ�ܣ���ѡ��������Ĺ�˾��');history.back()</script>"
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
		rsa("atype")="�����ʲ�"
		rsa("alog")="�����Ϊ<font color=red>��"&sbbh&"��</font>���ʲ���<font color=blue>��"&yssbm&"��</font>������<font color=red>��"&xssbm&"��</font>"
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
		rsb("leixing")="����"
		rsb("ssbm")="��"&yssbm&"��"
		rsb("user")="��"&xssbm&"��"
		rsb("datetime")=now()
		rsb.update
		rsb.close
		set rsb=nothing
		response.write ("<script>alert('�ʲ������ɹ���');window.location.replace('news_list.asp?page="&page&"');</script>")
   end if
else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
