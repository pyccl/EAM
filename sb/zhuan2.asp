<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then
   ysyz=session("ysyz")
   ydepartment=session("ydepartment")
   if ysyz="" or ydepartment="" then 
   		response.Write"<script>alert('ϵͳ����ԭ����Ϊ�գ�����ϵ����Ա��');history.back()</script>"
   elseif request("xsyz")=ysyz then
   		response.Write"<script>alert('�ʲ�ת��ʧ�ܣ���ʹ���˲�����ԭʹ������ͬ��');history.back()</script>"
   elseif request("xsyz")="" or request("xdepartment")="" then 
   		response.Write"<script>alert('�ʲ�ת��ʧ�ܣ���ʹ���ˡ��������Ų���Ϊ�գ�');history.back()</script>"
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
		rsa("atype")="ת���ʲ�"
		rsa("alog")="�����Ϊ<font color=red>��"&sbbh&"��</font>���ʲ���<font color=blue>��"&ydepartment&"���ġ�"&ysyz&"��</font>ת�Ƶ�<font color=red>��"&xdepartment&"���ġ�"&xuser&"��</font>"
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
		rsb("leixing")="ת��"
		rsb("ssbm")="��"&ydepartment&"���ġ�"&ysyz&"��"
   		if ydepartment=xdepartment then
   			rsb("user")="��"&xuser&"��"
   		else
			rsb("user")="��"&xdepartment&"���ġ�"&xuser&"��"
   		end if
		rsb("datetime")=now()
		rsb.update
		rsb.close
		set rsb=nothing
		response.write ("<script>alert('�ʲ�ת�Ƴɹ���');window.location.replace('news_list.asp?page="&page&"');</script>")
   end if
else%>

<!--#include file="../inc/quanxian.asp"-->

<%end if%>
