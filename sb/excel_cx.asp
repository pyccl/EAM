<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
if Instr(session("juese"),"|110,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="�豸��¼"&replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"
   
	ly=request("ly")
   	sj=request("sj")
	synx=request("synx")
	pp=trim(request("pp"))
	fenlei=request("fenlei")
	gjc=trim(request("gjc"))
%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>�豸��¼�б�</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="30"><%=session("companyname")%>�ʲ������
				<%
				   if ly = 0 then response.write "�����ϣ�" end if
				   if ly = 1 then
				   		select case synx
				   			case 0
				   				response.write "��δ�̵㣩"
						   	case 1
				   				response.write "���̵�������"
						    case 2
				   				response.write "����ӯ��"
						    case 3
				   				response.write "���̿���"
				   		end select
				   end if
				   if ly = 2 then
				   		if sj = 1 then
				   				response.write "������5�꣩"
				   		elseif sj = 0 then
				   				response.write "��δ����5�꣩"
				 		end if
				   end if
				%>
		  </th>
		  </tr>
		<tr>
		<th height="20" colspan="30" align="left">
			ɸѡ������
			<%
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "ssbm= '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"

select case ly
	case 0
		sql="select * from sbxx where zt='����' and ("& rk & ") "
	case 1
		select case synx
			case 0 
				sql="select * from sbxx where zt<>'����' and pdzt=0 and (" & rk & ")"
			case 1
				sql="select * from sbxx where zt<>'����' and pdzt=1 and (" & rk & ")"
			case 2
				sql="select * from sbxx where zt<>'����' and pdzt=2 and (" & rk & ")"
			case 3
				sql="select * from sbxx where zt<>'����' and pdzt=3 and (" & rk & ")"
		end select
	case 2
		select case sj
			case 0
				sql="select * from sbxx where zt<>'����' and datediff('m',gzsj,date())<=60 and (" & rk & ")"
			case 1
				sql="select * from sbxx where zt<>'����' and datediff('m',gzsj,date())>60 and (" & rk & ")"
			case 2
				sql="select * from sbxx where zt<>'����' and ("& rk & ") "
		end select
end select
	if sj <> 0 or sj <> 1 then
		if pp<>"all" then sql=sql&" and pp like '%"&pp&"%'"
		If gjc<>"" and fenlei="1" Then sql=sql&" and (sbbh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="2" Then sql=sql&" and (ccbh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="3" Then sql=sql&" and (ssbm like '%"&gjc&"%')"
		If gjc<>"" and fenlei="4" Then sql=sql&" and (syz like '%"&gjc&"%')"
		If gjc<>"" and fenlei="5" Then sql=sql&" and (cfdd like '%"&gjc&"%')"
		If gjc<>"" and fenlei="6" Then sql=sql&" and (zt like '%"&gjc&"%')"
		If gjc<>"" and fenlei="7" Then sql=sql&" and (xh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="8" Then sql=sql&" and (mac like '%"&gjc&"%')"
		If gjc<>"" and fenlei="9" Then sql=sql&" and (hddsn like '%"&gjc&"%')"

	   if pp="all" then
			response.write "ȫ�����ࣻ"
		else
			response.write  pp & "��"
		end if
		if len(gjc)>0 then
			select case fenlei
				case 1
					response.write "���ʲ���ţ�"
				case 2
					response.write "�����кţ�"
				case 3
					response.write "��������˾��"
				case 4
					response.write "��ʹ���ˣ�"
				case 5
					response.write "�����λ�ã�"
				case 6
					response.write "���ʲ�״̬��"
				case 7
					response.write "���ʲ��ͺţ�"
				case 8
					response.write "��MAC��ַ��"
				case 9
					response.write "��Ӳ��SN�ţ�"
			end select
			response.write "�ؼ��ʣ�" & gjc & "��"
		end if
	end if
sql=sql&" order by id desc"
response.write "<br>��ǰSQL���Ϊ��" & sql 
			%>
		</th>
		  </tr>
		<tr align="center">
			<th height="20">ID</th>
			<th>�豸���</th>
			<th>����</th>
			<th>����</th>
			<th>����</th>
			<th>�ͺ�</th>
			<th>����ϵͳ</th>
			<th>������</th>
			<th>��˾</th>
			<th>����</th>
			<th>���λ��</th>
			<th>ʹ����</th>
			<th>����ʱ��</th>
			<th>�۸�</th>
			<th>��������</th>
			<th>����ʱ��</th>
			<th>��ʹ����</th>
			<th>�Ƿ�5��</th>
			<th>CPU</th>
			<th>�ڴ�</th>
			<th>Ӳ��</th>
			<th>Ӳ�����к�</th>
			<th>�Կ�</th>
			<th>IP��ַ</th>
			<th>MAC��ַ</th>
			<th>�ʲ�״̬</th>
			<th>�̵�״̬</th>
			<th>���к�</th>
			<th>���ʱ��</th>
			<th>������ʱ��</th>
		</tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1	
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>û���ҵ���Ӧ���ʲ���</strong></font>&nbsp;</p>"
		end if
			
		if not rs.eof then
			do while not rs.eof

			select case rs("zt")
			case "����ʹ��"
				zt=  "<font color=blue>����ʹ��</font>"
			case "���ô���"
				zt= "<font color=green>���ô���</font>"
			case "����ά��"
		   		zt= "<font color=yellow>����ά��</font>"
			case else
		   		zt= "<font color=red>����</font>"
			end select
		   

			select case rs("pdzt")
			case 3
				pdzt=  "<B><font color=red>�̿�</font></b>"
			case 2
				pdzt= "<B><font color=Blue>��ӯ</font></b>"
			case 1
				pdzt= "<B>����</b>"
			case else
				pdzt= "<font color=red>δ�̵�</font>"
			end select
		   
		synx1=datediff("m",rs("gzsj"),now())
		if synx1>60 then
			baofei="��"
		else
			baofei="��"
		end if
			%>
		<tr align="center">
			<td><%=rs("id")%></td>
			<td><%=rs("sbbh")%></td>
			<td><%=rs("sbcs")%></td>
			<td><%=rs("pp")%></td>
			<td><%=rs("zilei")%></td>
			<td><%=rs("xh")%></td>
			<td><%=rs("czxt")%></td>
			<td><%=rs("jqm")%></td>
			<td><%=rs("ssbm")%></td>
			<td><%=rs("department")%></td>
			<td><%=rs("cfdd")%></td>
			<td><%=rs("syz")%></td>
			<td><%=rs("gzsj")%></td>
			<td><%=Formatnumber(rs("price"),2,,,-1)%></td>
			<td><%=rs("scrq")%></td>
			<td><%=rs("baoxiu")%></td>
			<td><%=synx1%></td>
			<td><%=baofei%></td>
			<td><%=rs("cpu")%></td>
			<td><%=rs("ram")%></td>
			<td><%=rs("hdd")%></td>
			<td><%=rs("hddsn")%></td>
			<td><%=rs("gpu")%></td>
			<td><%=rs("ip")%></td>
			<td><%=rs("mac")%></td>
			<td><%=zt%></td>
			<td><%=pdzt%></td>
			<td><%=rs("ccbh")%></td>
			<td><%=rs("tjsj")%></td>
			<td><%=rs("gxsj")%></td>
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