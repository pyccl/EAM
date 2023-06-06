<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
if Cint(request("id"))=Cint(request("qx")) then 
page=request("page")
id=request("id")
sql="select * from sbxx where id=" & id
rs.open sql,connstr,1,3
sbbh=rs("sbbh")
rs("cfdd")=request("cfdd")
rs("xh")=request("xh")
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
rs("pdbz")=request("pdbz")
rs("pdzt")=request("pdzt")
select case request("pdzt")
   case 1 pdzt="正常"
   case 2 pdzt="盘盈"
   case 3 pdzt="盘亏"
end select
	rs("baoxiu")=cdate(request("baoxiu"))
	if trim(request("pic"))<>"" then
		rs("pic")=trim(request("pic"))
	end if
rs("pdsj")=now()
rs.update
rs.close
set rs=nothing

Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="盘点资产"
rsa("alog")="盘点编号为<font color=blue>【"&sbbh&"】</font>的资产为<font color=red>【"&pdzt&"】</font>"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
response.write ("<script>alert('盘点资产成功!');window.location.replace('pandian.asp?page="&page&"');</script>")

else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>
