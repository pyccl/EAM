<!--#include file="../inc/mysession.asp" -->
<%
if Instr(session("juese"),"|109,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
%>
<!--#include file="../inc/conn.asp"-->
<%
On Error Resume Next 
Dim cn,oConn,connstr1
'打开XLS.
Set cn = Server.CreateObject("ADODB.Connection")
cn.Provider = "Microsoft.Jet.OLEDB.4.0 "
cn.ConnectionString = "Data Source=" & Server.MapPath("upload/资产汇总表.xls") & ";" & _
"Extended Properties=Excel 8.0;"
cn.Open

set rs=server.createobject("adodb.recordset") 
sql="select * from sbxx "
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
	dim sbbh
	sql1="select * from sbxx where sbbh='"&rsRead.Fields("资产编号")&"'"
	rs1.open sql1,connstr,1,3
	if not rs1.eof then
   		if n=0 then 
   			str="资产编号："+trim(rsRead.Fields("资产编号"))+"的资产已经存在，该条记录以下的记录均未完成录入！"
   		else
   			str="资产编号："+trim(rsRead.Fields("资产编号"))+"的资产已经存在，\n\n该条记录以上的记录已经录入成功，以下的记录均未完成录入，\n\n共录入了"&n&"条记录！"
  		end if
		response.write ("<script>alert('"&str&"');window.location.replace('news_list.asp');</script>")
		exit do
	else
   		if isnull(rsRead.Fields("资产编号")) or isnull(rsRead.Fidlds("资产从属")) or isnull(rsRead.Fidlds("资产类别")) or isnull(rsRead.Fidlds("资产子类")) or isnull(rsRead.Fidlds("品牌型号")) or isnull(rsRead.Fidlds("所属公司")) or isnull(rsRead.Fidlds("存放位置")) or isnull(rsRead.Fidlds("资产状态")) then
   			response.write ("<script>alert('必填字段项中未填全，请检查！\n\n提示：红色字段名为必填项目。');window.location.replace('news_list.asp');</script>")
   			exit do
   		else
			chk_id="ok"
			rs1.close
   		end if
	end if
	if chk_id="ok" Then
    	sbbh=trim(rsRead.Fields("资产编号"))
		rs.addnew
		rs("sbbh")=rsRead.Fields("资产编号")
		rs("sbid")=rsRead.Fields("资产分类ID")
		rs("sbcs")=rsRead.Fields("资产从属")
		rs("pp")=rsRead.Fields("资产类别")
		rs("zilei")=rsRead.Fields("资产子类")
		rs("xh")=rsRead.Fields("品牌型号")
		rs("czxt")=rsRead.Fields("操作系统")
		rs("jqm")=rsRead.Fields("机器名")
		rs("ssbm")=rsRead.Fields("所属公司")
		rs("department")=rsRead.Fields("所属部门")
		rs("cpu")=rsRead.Fields("CPU")
		rs("ram")=rsRead.Fields("内存大小")
		rs("hdd")=rsRead.Fields("硬盘大小")
		rs("hddsn")=rsRead.Fields("硬盘序列号")
		rs("gpu")=rsRead.Fields("显卡")
		rs("ip")=rsRead.Fields("IP地址")
		rs("mac")=rsRead.Fields("MAC地址")
		rs("scrq")=rsRead.Fields("生产日期")
		rs("gzsj")=rsRead.Fields("购置时间")
		rs("price")=rsRead.Fields("价格")
		rs("baoxiu")=rsRead.Fields("保修到期时间")
		rs("ccbh")=rsRead.Fields("序列号")
		rs("syz")=rsRead.Fields("使用人")
		rs("bz")=rsRead.Fields("备注")
		rs("cfdd")=rsRead.Fields("存放位置")
		rs("zt")=rsRead.Fields("资产状态")
		rs("tjry")=session("web_admin")
		rs("tjsj")=now()
		rs("gxsj")=now()

		rs.update

	End If 
   
	set rsb=server.createobject("adodb.recordset") 
	sqlb="select * from sb_log "
	rsb.open sqlb,conn,1,3
	rsb.addnew
	rsb("zcid")=sbbh
	rsb("leixing")="入库"
	rsb("datetime")=now()
	rsb("user")=session("web_admin")
	rsb("sbbm")=rsRead.Fields("所属公司")
	rsb.update
	rsb.close
	set rsb=nothing

   rsRead.MoveNext 
   n=n+1
loop
   if n=0 then
		response.write("<script>alert('EXCEL中没有数据！请检查！')</script>")
   else
	   str="共导入"&n&"条记录！"
	   response.write ("<script>alert('"&str&"');window.location.replace('news_list.asp');</script>")
	rs.close
	   if chk_id="ok" Then
		set rsa=server.createobject("adodb.recordset") 
		sqla="select * from user_log "
		rsa.open sqla,conn,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="添加资产"
		rsa("alog")="导入编号为<font color=red>【"&sbbh&"】</font>等的共<font color=blue>【"&n&"】</font>条资产"
		rsa("atime")=now()
		rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
		rsa.update
		rsa.close
		set rsa=nothing
	   end if
   end if
  response.write "<script>location.replace('news_list.asp')</script>"
end if
set rs=nothing
 %>
