<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then 
page=request("page")
id=request("id")
sql="select * from sbxx where id=" & id
rs.open sql,connstr,1,3
sbbh=rs("sbbh")
rs("xh")=request("xh")
rs("zilei")=trim(request("zilei"))
rs("ccbh")=request("ccbh")
rs("syz")=request("syz")
   if len(trim(request("gzsj")))=0 then
   	rs("gzsj")=null
   else
	rs("gzsj")=cdate(request("gzsj"))
   end if
	rs("price")=request("prince")
   if len(trim(request("scrq")))=0 then
   	rs("scrq")=null
   else
	rs("scrq")=cdate(request("scrq"))
   end if
	rs("cpu")=request("cpu")
	rs("ram")=request("ram")
	rs("hdd")=request("hdd")
   rs("hddsn")=request("hddsn")
   rs("gpu")=request("gpu")
rs("ip")=request("ip")
rs("gxsj")=now()
   rs("mac")=request("mac")
rs("czxt")=request("czxt")
rs("jqm")=request("jqm")
rs("bz")=request("bz")
rs("zt")=request("zt")
rs("cfdd")=request("cfdd")
rs("ssbm")=request("ssbm")
   rs("department")=request("department")
	rs("baoxiu")=cdate(request("baoxiu"))
	if trim(request("pic"))="" then
		rs("pic")=null
	else
		rs("pic")=trim(request("pic"))
	end if
	if request("zhejiu")="" then
   		rs("zhejiu")=null
   	else
   		rs("zhejiu")=request("zhejiu")
    end if
rs.update
rs.close
set rs=nothing

Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="修改资产"
rsa("alog")="修改<font color=blue>【"&request("zilei")&"】</font>下编号为<font color=red>【"&sbbh&"】</font>的资产"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
response.write ("<script>alert('资产信息修改成功!');window.location.replace('news_list.asp?page="&page&"');</script>")

else%>

<!--#include file="../inc/quanxian.asp"-->

<%end if%>
