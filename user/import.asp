<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
if Instr(session("juese"),"|504,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
On Error Resume Next 
Dim cn,oConn,connstr1
'打开XLS.
Set cn = Server.CreateObject("ADODB.Connection")
cn.Provider = "Microsoft.Jet.OLEDB.4.0 "
cn.ConnectionString = "Data Source=" & Server.MapPath("upload/员工汇总表.xls") & ";" & _
"Extended Properties=Excel 8.0;"
cn.Open

set rs=server.createobject("adodb.recordset") 
sql="select * from admin_yuangong "
rs.open sql,conn,1,3

'打开MDB.
connstr1="DBQ="+server.MapPath("../db/dnsb.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set oConn=server.CreateObject("ADODB.CONNECTION")
oConn.open connstr1
set rs1=server.createobject("adodb.recordset") 

'读取数据.
set rsRead=server.CreateObject("ADODB.Recordset") 
rsRead.Open "select * from [sheet1$]",cn,1,1 
n=0
do until rsRead.EOF
     '写入数据库.
	dim idcard
	sql1="select * from admin_yuangong where idcard='"&rsRead.Fields("身份证号")&"'"
	rs1.open sql1,connstr,1,3
	if rs1.RecordCount<>0 then
   		if n=0 then 
   			str="身份证号："&trim(rsRead.Fields("身份证号"))&"的员工已经存在，该条记录以下的记录均未完成录入！"
   		else
   			str="身份证号："&trim(rsRead.Fields("身份证号"))&"的员工已经存在，\n\n该条记录以上的记录已经录入成功，以下的记录均未完成录入，\n\n共录入了"&n&"条记录！"
  		end if
		response.write ("<script>alert('"&str&"');window.location.replace('admin_yuangong.asp');</script>")
		exit do
	else
   		if isnull(rsRead.Fields("姓名")) or isnull(rsRead.Fields("身份证号")) or isnull(rsRead.Fields("手机号码")) or isnull(rsRead.Fields("所属公司")) or isnull(rsRead.Fields("所属部门")) or isnull(rsRead.Fields("职位")) or isnull(rsRead.Fields("入职时间")) then
   			response.write ("<script>alert('必填字段项中未填全，请检查！\n\n提示：红色字段名为必填项目。');window.location.replace('admin_yuangong.asp');</script>")
   			exit do
   		else
			chk_id="ok"
			rs1.close
   		end if
	end if
	if chk_id="ok" Then
    	idcard=trim(rsRead.Fields("身份证号"))
		rs.addnew
		rs("idcard")=rsRead.Fields("身份证号")
		rs("xingming")=rsRead.Fields("姓名")
		rs("company")=rsRead.Fields("所属公司")
		rs("department")=rsRead.Fields("所属部门")
		rs("ruzhi")=rsRead.Fields("入职时间")
		rs("position")=rsRead.Fields("职位")
		rs("education")=rsRead.Fields("学历")
		rs("phone")=rsRead.Fields("手机号码")
		rs("weixin")=rsRead.Fields("微信")
		rs("qq")=rsRead.Fields("QQ")
		rs("place1")=rsRead.Fields("籍贯（省）")
		rs("place2")=rsRead.Fields("籍贯（市）")
		rs("place3")=rsRead.Fields("籍贯（县）")
		rs("place4")=rsRead.Fields("住址（省）")
		rs("place5")=rsRead.Fields("住址（市）")
		rs("place6")=rsRead.Fields("住址（县）")
		rs.update

	End If 
   rsRead.MoveNext 
   n=n+1
loop
   if n=0 then
		response.write("<script>alert('EXCEL中没有数据！请检查！')</script>")
   else
	   str="共导入"&n&"条记录！"
	   response.write ("<script>alert('"&str&"');window.location.replace('admin_yuangong.asp');</script>")
	rs.close
	   if chk_id="ok" Then
		set rsa=server.createobject("adodb.recordset") 
		sqla="select * from user_log "
		rsa.open sqla,conn,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="添加员工"
		rsa("alog")="导入身份证号为<font color=red>【"&idcard&"】</font>等的共<font color=blue>【"&n&"】</font>个员工"
		rsa("atime")=now()
		rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
		rsa.update
		rsa.close
		set rsa=nothing
	   end if
   end if
  response.write "<script>location.replace('admin_yuangong.asp')</script>"
end if
set rs=nothing
 %>
