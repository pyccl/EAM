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
'��XLS.
Set cn = Server.CreateObject("ADODB.Connection")
cn.Provider = "Microsoft.Jet.OLEDB.4.0 "
cn.ConnectionString = "Data Source=" & Server.MapPath("upload/Ա�����ܱ�.xls") & ";" & _
"Extended Properties=Excel 8.0;"
cn.Open

set rs=server.createobject("adodb.recordset") 
sql="select * from admin_yuangong "
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
	dim idcard
	sql1="select * from admin_yuangong where idcard='"&rsRead.Fields("���֤��")&"'"
	rs1.open sql1,connstr,1,3
	if rs1.RecordCount<>0 then
   		if n=0 then 
   			str="���֤�ţ�"&trim(rsRead.Fields("���֤��"))&"��Ա���Ѿ����ڣ�������¼���µļ�¼��δ���¼�룡"
   		else
   			str="���֤�ţ�"&trim(rsRead.Fields("���֤��"))&"��Ա���Ѿ����ڣ�\n\n������¼���ϵļ�¼�Ѿ�¼��ɹ������µļ�¼��δ���¼�룬\n\n��¼����"&n&"����¼��"
  		end if
		response.write ("<script>alert('"&str&"');window.location.replace('admin_yuangong.asp');</script>")
		exit do
	else
   		if isnull(rsRead.Fields("����")) or isnull(rsRead.Fields("���֤��")) or isnull(rsRead.Fields("�ֻ�����")) or isnull(rsRead.Fields("������˾")) or isnull(rsRead.Fields("��������")) or isnull(rsRead.Fields("ְλ")) or isnull(rsRead.Fields("��ְʱ��")) then
   			response.write ("<script>alert('�����ֶ�����δ��ȫ�����飡\n\n��ʾ����ɫ�ֶ���Ϊ������Ŀ��');window.location.replace('admin_yuangong.asp');</script>")
   			exit do
   		else
			chk_id="ok"
			rs1.close
   		end if
	end if
	if chk_id="ok" Then
    	idcard=trim(rsRead.Fields("���֤��"))
		rs.addnew
		rs("idcard")=rsRead.Fields("���֤��")
		rs("xingming")=rsRead.Fields("����")
		rs("company")=rsRead.Fields("������˾")
		rs("department")=rsRead.Fields("��������")
		rs("ruzhi")=rsRead.Fields("��ְʱ��")
		rs("position")=rsRead.Fields("ְλ")
		rs("education")=rsRead.Fields("ѧ��")
		rs("phone")=rsRead.Fields("�ֻ�����")
		rs("weixin")=rsRead.Fields("΢��")
		rs("qq")=rsRead.Fields("QQ")
		rs("place1")=rsRead.Fields("���ᣨʡ��")
		rs("place2")=rsRead.Fields("���ᣨ�У�")
		rs("place3")=rsRead.Fields("���ᣨ�أ�")
		rs("place4")=rsRead.Fields("סַ��ʡ��")
		rs("place5")=rsRead.Fields("סַ���У�")
		rs("place6")=rsRead.Fields("סַ���أ�")
		rs.update

	End If 
   rsRead.MoveNext 
   n=n+1
loop
   if n=0 then
		response.write("<script>alert('EXCEL��û�����ݣ����飡')</script>")
   else
	   str="������"&n&"����¼��"
	   response.write ("<script>alert('"&str&"');window.location.replace('admin_yuangong.asp');</script>")
	rs.close
	   if chk_id="ok" Then
		set rsa=server.createobject("adodb.recordset") 
		sqla="select * from user_log "
		rsa.open sqla,conn,1,3
		rsa.addnew
		rsa("username")=session("web_admin")
		rsa("atype")="���Ա��"
		rsa("alog")="�������֤��Ϊ<font color=red>��"&idcard&"��</font>�ȵĹ�<font color=blue>��"&n&"��</font>��Ա��"
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
