<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<%
jqm=trim(request("signwebname"))
ccbh=trim(request("ccbh"))
sbbh=trim(request("sbbh"))
xh=trim(request("xh"))
syz=trim(request("syz"))
txtIPAddr=trim(request("txtIPAddr"))
cfdd=trim(request("cfdd"))
pdimg=trim(request("img"))
sql1="select * from sbxx where sbbh='"+ sbbh +"'"
rs.open sql1,connstr,1,3

if not rs.eof then
      response.write ("<script>alert('���ʲ�����Ѿ����ڣ����������룡');window.history.go(-1);</script>")
	else
	chk_id="ok"
end if
rs.close

if chk_id="ok" Then
	filename=now()
	filename=replace(filename,"-","")
	filename=replace(filename,":","")
	filename=replace(filename," ","")
sql="select * from sbxx"
rs.open sql,connstr,1,3
rs.addnew
rs("sbbh")=trim(request("sbbh"))&request("sbid")
rs("sbid")=request("sbid")
rs("ccbh")=ccbh
rs("gzsj")=cdate(request ("gzsj"))
rs("sbcs")=request("sbcs")
rs("pp")=request("pp")
rs("zilei")=request("zilei")
rs("jqm")=jqm
rs("xh")=xh
rs("czxt")=request("czxt")
rs("ssbm")=request("ssbm")
rs("syz")=syz
rs("bz")=request("bz")
   rs("cpu")=request("cpu")
   rs("ram")=request("ram")
   rs("hdd")=request("hdd")
   rs("hddsn")=request("hddsn")
   rs("gpu")=request("gpu")
   rs("mac")=request("mac")
   rs("scrq")=cdate(request("scrq"))
   rs("price")=request("price")
   rs("baoxiu")=cdate(request("baoxiu"))
rs("ip")=txtIPAddr
rs("zt")=request("zt")
rs("cfdd")=cfdd
   rs("department")=request("department")
	if trim(request("pic"))="" then
   		rs("pic")=null
    else
		rs("pic")=trim(request("pic"))
	end if
rs("zhejiu")=request("zhejiu")
rs("tjry")=session("web_admin")
rs("tjsj")=now()
rs("gxsj")=now()
rs.update
rs.close
set rs=nothing

Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="����ʲ�"
rsa("alog")="���<font color=blue>��"&request("zilei")&"��</font>�±��Ϊ<font color=red>��"&trim(request("sbbh"))&request("sbid")&"��</font>���ʲ�"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
   

Set rsb=Server.CreateObject("ADODB.Recordset")
sqlb="select * from sb_log"
rsb.open sqlb,connstr,1,3
rsb.addnew
rsb("user")=session("web_admin")
rsb("zcid")=sbbh
rsb("leixing")="���"
rsb("datetime")=now()
rsb.update
rsb.close
set rsb=nothing

response.write ("<script>alert('�ʲ���Ϣ��ӳɹ�!');window.location.replace('news_list.asp');</script>")
end If
%>
