<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
   if Cint(request("id"))=Cint(request("qx")) then 
		if request("syz")="" or request("ssbm")="" or request("cfdd")="" then 
			response.Write"<script>alert('�黹ʧ�ܣ�ʹ���ߡ�������˾����ŵص㲻��Ϊ�գ�');history.back()</script>"
		else
			page=request("page")
			id=request("id")
			sql="select * from sbxx where id=" & id
			rs.open sql,connstr,1,3
			zileii=rs("zilei")
			sbbh=rs("sbbh")
   			user=request("syz")
			rs("syz")=""
			rs("zt")="���ô���"
			rs("cfdd")=request("cfdd")
			rs("department")=""
			rs("gxsj")=now()
			rs.update
			rs.close
			set rs=nothing
   
			Set rsa=Server.CreateObject("ADODB.Recordset")
			sqla="select * from user_log"
			rsa.open sqla,connstr,1,3
			rsa.addnew
			rsa("username")=session("web_admin")
			rsa("atype")="�黹�ʲ�"
			rsa("alog")="<font color=red>��"&user&"��</font>�黹<font color=blue>��"&zileii&"��</font>�±��Ϊ<font color=red>��"&sbbh&"��</font>���ʲ�"
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
			rsb("leixing")="�黹"
			rsb("ssbm")=request("ssbm")
			rsb("user")=request("syz")
			rsb("datetime")=now()
			rsb.update
			rsb.close
			set rsb=nothing
			response.write ("<script>alert('�ʲ��ѹ黹!');window.location.replace('news_list.asp?page="&page&"');</script>")
   
		end if

   else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
