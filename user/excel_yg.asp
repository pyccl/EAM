<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<% 
if Instr(session("juese"),"|505,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="Ա����Ϣ"&replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"
   
	ly=request("ly")
	sj1=request("sj1")
    sj2=request("sj2")
	dept=trim(request("dept"))
	fenlei=request("fenlei")
	gjc=trim(request("gjc"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>Ա����Ϣ�б�</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="16"><%=session("companyname")%>Ա����Ϣ��
				<%
				   if ly = 0 then response.write "���ѳ�5�꣩" end if
				%>
		  </th>
		  </tr>
		<tr>
		<th height="20" colspan="16" align="left">
			<%
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "company= '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"

if ly=0 then 
	sql="select * from admin_yuangong where datediff('m',ruzhi,now())>60 and (" & rk & ")"
else
	sql="select * from admin_yuangong where (" & rk & ")"
end if
If dept<>"" then sql=sql&" and company like '%"&dept&"%'"
	if sj1 <> "" and sj2 <> "" then
		sql=sql&" and (ruzhi >= #" & sj1 &"# and ruzhi <= #" & sj2 & "#)"
		xssj= "��ְʱ��Ϊ" & sj1 & "��" & sj2 & "֮�䣻"
	else
		if sj1 <> "" and sj2 = "" then
			sql=sql&" and (ruzhi >= #" & sj1 &"#)"
			xssj= "��ְʱ��Ϊ" & sj1 & "֮��"
		end if
	end if
if gjc<>"" then
	If fenlei="1" Then sql=sql&" and idcard like '%"&gjc&"%'"
	If fenlei="2" Then sql=sql&" and department like '%"&gjc&"%'"
	If fenlei="3" Then sql=sql&" and xingming like '%"&gjc&"%'"
	If fenlei="4" Then sql=sql&" and phone like '%"&gjc&"%'"
	If fenlei="5" Then sql=sql&" and gh like '%"&gjc&"%'"
end if
sql=sql&" order by id desc"
		if ly <> 0 then
			response.write "ɸѡ������" & xssj
			if dept="" then
				response.write "ȫ����˾��"
			else
				response.write  dept & "��"
			end if
			if len(gjc)>0 then
				select case fenlei
					case 1
						response.write "�����֤���룻"
					case 2
						response.write "�����ţ�"
					case 3
						response.write "��������"
					case 4
						response.write "���ֻ����룻"
					case 5
						response.write "�����ţ�"
				end select
				response.write "�ؼ��ʣ�" & gjc & "��"
			end if
			end if
				response.write "<br>��ǰSQL���Ϊ��" & sql 
%>
		</th>
		  </tr>
		<tr align="center">
			<th height="20">ID</th>
			<th>���֤����</th>
			<th>����</th>
			<th>�Ա�</th>
			<th>��������</th>
			<th>����</th>
			<th>��˾</th>
			<th>����</th>
			<th>ְλ</th>
			<th>��ְʱ��</th>
			<th>���ѧ��</th>
			<th>�ֻ�����</th>
			<th>΢��</th>
			<th>QQ</th>
			<th>�����ַ</th>
			<th>��ס��ַ</th>
		  </tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>û���ҵ���Ӧ��Ա����</strong></font>&nbsp;</p>"
		else
			do while not rs.eof
	'---------------��������Ա�-----------------------'
	 	xingbie=right(rs("idcard"),2)
	 if cint(left(xingbie,1)) mod 2=0 then
		 sex= "Ů"
	 else
		 sex= "��"
	 end if
	'---------------��������Ա�-----------------------'
	'---------------��������������-----------------------'
		riqi=mid(rs("idcard"),7,8)
		birthday=mid(riqi,1,4)&"��"&mid(riqi,5,2)&"��"&mid(riqi,7,2)&"��"
		rq=mid(riqi,1,4)&"-"&mid(riqi,5,2)&"-"&mid(riqi,7,2)
	'---------------��������������-----------------------'
	'---------------�����������-----------------------'
		age=DateDiff("yyyy",rq,date())
	'---------------�����������-----------------------'
			%>
		<tr align="center">
			<td><%=rs("id")%></td>
			<td><% response.write "'" & rs("idcard")%></td>
			<td><%=rs("xingming")%></td>
			<td><%=sex%></td>
			<td><%=birthday%></td>
			<td><%=age%></td>
			<td><%=rs("company")%></td>
			<td><%=rs("department")%></td>
			<td><%=rs("position")%></td>
			<td><%=rs("ruzhi")%></td>
			<td><%=rs("education")%></td>
			<td><%=rs("phone")%></td>
			<td><%=rs("weixin")%></td>
			<td><%=rs("qq")%></td>
			<td><%response.write rs("place1") & "-" & rs("place2") & "-" & rs("place3")%></td>
			<td><%response.write rs("place4") & "-" & rs("place5") & "-" & rs("place6")%></td>
		  </tr>
			<%rs.movenext
			loop
		End If
		rs.close
		set rs=Nothing
	end if%>
		</table>
</body>
</html>