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
'��XLS.
Set cn = Server.CreateObject("ADODB.Connection")
cn.Provider = "Microsoft.Jet.OLEDB.4.0 "
cn.ConnectionString = "Data Source=" & Server.MapPath("upload/�ʲ����ܱ�.xls") & ";" & _
"Extended Properties=Excel 8.0;"
cn.Open

set rs=server.createobject("adodb.recordset") 
sql="select * from sbxx "
rs.open sql,conn,1,3

'��MDB.
connstr1="DBQ="+server.MapPath("../db/dnsb.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set oConn=server.CreateObject("ADODB.CONNECTION")
oConn.open connstr1
set rs1=server.createobject("adodb.recordset") 

'��ȡ����.
set rsRead=server.CreateObject("ADODB.Recordset") 
rsRead.Open "select * from [sheet1$]",cn,1,1 
n=0
do until rsRead.EOF
     'д�����ݿ�.
	dim sbbh
	sql1="select * from sbxx where sbbh='"&rsRead.Fields("�ʲ����")&"'"
	rs1.open sql1,connstr,1,3
	if not rs1.eof then
   		if n=0 then 
   			str="�ʲ���ţ�"+trim(rsRead.Fields("�ʲ����"))+"���ʲ��Ѿ����ڣ�������¼���µļ�¼��δ���¼�룡"
   		else
   			str="�ʲ���ţ�"+trim(rsRead.Fields("�ʲ����"))+"���ʲ��Ѿ����ڣ�\n\n������¼���ϵļ�¼�Ѿ�¼��ɹ������µļ�¼��δ���¼�룬\n\n��¼����"&n&"����¼��"
  		end if
		response.write ("<script>alert('"&str&"');window.location.replace('news_list.asp');</script>")
		exit do
	else
   		if isnull(rsRead.Fields("�ʲ����")) or isnull(rsRead.Fidlds("�ʲ�����")) or isnull(rsRead.Fidlds("�ʲ����")) or isnull(rsRead.Fidlds("�ʲ�����")) or isnull(rsRead.Fidlds("Ʒ���ͺ�")) or isnull(rsRead.Fidlds("������˾")) or isnull(rsRead.Fidlds("���λ��")) or isnull(rsRead.Fidlds("�ʲ�״̬")) then
   			response.write ("<script>alert('�����ֶ�����δ��ȫ�����飡\n\n��ʾ����ɫ�ֶ���Ϊ������Ŀ��');window.location.replace('news_list.asp');</script>")
   			exit do
   		else
			chk_id="ok"
			rs1.close
   		end if
	end if
	if chk_id="ok" Then
    	sbbh=trim(rsRead.Fields("�ʲ����"))
		rs.addnew
		rs("sbbh")=rsRead.Fields("�ʲ����")
		rs("sbid")=rsRead.Fields("�ʲ�����ID")
		rs("sbcs")=rsRead.Fields("�ʲ�����")
		rs("pp")=rsRead.Fields("�ʲ����")
		rs("zilei")=rsRead.Fields("�ʲ�����")
		rs("xh")=rsRead.Fields("Ʒ���ͺ�")
		rs("czxt")=rsRead.Fields("����ϵͳ")
		rs("jqm")=rsRead.Fields("������")
		rs("ssbm")=rsRead.Fields("������˾")
		rs("department")=rsRead.Fields("��������")
		rs("cpu")=rsRead.Fields("CPU")
		rs("ram")=rsRead.Fields("�ڴ��С")
		rs("hdd")=rsRead.Fields("Ӳ�̴�С")
		rs("hddsn")=rsRead.Fields("Ӳ�����к�")
		rs("gpu")=rsRead.Fields("�Կ�")
		rs("ip")=rsRead.Fields("IP��ַ")
		rs("mac")=rsRead.Fields("MAC��ַ")
		rs("scrq")=rsRead.Fields("��������")
		rs("gzsj")=rsRead.Fields("����ʱ��")
		rs("price")=rsRead.Fields("�۸�")
		rs("baoxiu")=rsRead.Fields("���޵���ʱ��")
		rs("ccbh")=rsRead.Fields("���к�")
		rs("syz")=rsRead.Fields("ʹ����")
		rs("bz")=rsRead.Fields("��ע")
		rs("cfdd")=rsRead.Fields("���λ��")
		rs("zt")=rsRead.Fields("�ʲ�״̬")
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
	rsb("leixing")="���"
	rsb("datetime")=now()
	rsb("user")=session("web_admin")
	rsb("sbbm")=rsRead.Fields("������˾")
	rsb.update
	rsb.close
	set rsb=nothing

   rsRead.MoveNext 
   n=n+1
loop
   if n=0 then
		response.write("<script>alert('EXCEL��û�����ݣ����飡')</script>")
   else
	   str="������"&n&"����¼��"
	   response.write ("<script>alert('"&str&"');window.location.replace('news_list.asp');</script>")
	rs.close
	   if chk_id="ok" Then
		set rsa=server.createobject("adodb.recordset") 
		sqla="select * from user_log "
		rsa.open sqla,conn,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="����ʲ�"
		rsa("alog")="������Ϊ<font color=red>��"&sbbh&"��</font>�ȵĹ�<font color=blue>��"&n&"��</font>���ʲ�"
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
