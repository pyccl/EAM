<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<% 
if Instr(session("juese"),"|203,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="�豸��¼"&replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"

pp=trim(request("pp"))
fenlei=request("fenlei")
gjc=trim(request("gjc"))
sj1=request("sj1")
sj2=request("sj2")
synx=request("synx")
ly=request("ly")
if isnull(sj2) then
	sj=date()
else
	sj=sj2
end if
   %>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>�豸��¼�б�</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="17"><%=session("companyname")%>�ʲ��۾ɱ�
	      <%
				select case synx
					case 0
						response.write "�������꣩"
					case 1
						response.write "�����۾ɣ�"
				end select
			%></th>
		  </tr>
		<tr align="center">
		  <th height="20" colspan="17" align="left">
            <%
				 
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "ssbm= '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"

	if ly = 1 then
		if synx=1 then 
			sql="select * from sbxx where zt<>'����' and datediff('m',gzsj,now()) < zhejiu and (" & rk & ")"
		elseif synx=0 then
			sql="select * from sbxx where zt<>'����' and datediff('m',gzsj,now()) >= zhejiu and (" & rk & ")"
		end if
	else
		sql="select * from sbxx where zt<>'����' and (" & rk & ")"
	end if
if pp<>"all" then sql=sql&" and pp like '%"&pp&"%'"
	if gjc<>"" then
		If fenlei="1" Then sql=sql&" and (sbbh like '%"&gjc&"%')"
		If fenlei="2" Then sql=sql&" and (ccbh like '%"&gjc&"%')"
		If fenlei="3" Then sql=sql&" and (ssbm like '%"&gjc&"%')"
		If fenlei="4" Then sql=sql&" and (syz like '%"&gjc&"%')"
		If fenlei="5" Then sql=sql&" and (cfdd like '%"&gjc&"%')"
		If fenlei="6" Then sql=sql&" and (zt like '%"&gjc&"%')"
		If fenlei="7" Then sql=sql&" and (xh like '%"&gjc&"%')"
	end if
		if synx <> 0 and synx <> 1 then
			response.write "ɸѡ������"
			if sj1 <> "" and sj2 <> "" then
				sql=sql&" and (gzsj >= #" & sj1 &"# and (gzsj <= #" & sj2 & "# or dateadd('" & "m" & "',iif(isnull(zhejiu),0,zhejiu),gzsj) <= #" & sj2 & "#))"
				response.write sj1 & "��" & sj2 & "��Χ�ڣ�"
			else
				if sj1 <> "" and sj2 = "" then
					sql=sql&" and (gzsj >= #" & sj1 &"#)"
					response.write sj1 & "֮��"
				end if
			end if
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
			<th>�ʲ����</th>
			<th>�ʲ����</th>
			<th>Ʒ���ͺ�</th>
			<th>������˾</th>
			<th>ʹ����</th>
			<th>��������</th>
			<th>����</th>
			<th>�۾�����</th>
			<th>��������</th>
			<th>�����۾�����</th>
			<th>��ֵ��</th>
			<th>��ֵ</th>
			<th>��ֵ</th>
			<th>�����۾�</th>
			<th>�ۼ��۾�</th>
			<th>ƽ�����۾ɶ�</th>
		  </tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>û���ҵ���Ӧ���ʲ���</strong></font>&nbsp;</p>"
		end if
			
		if not rs.eof then
			do while not rs.eof

	'---------------���湺�������ж�-----------------------'
	if isnull(rs("gzsj")) then
		gzsj="-"
	else 
		gzsj=rs("gzsj")
	end if
	'---------------���湺�������ж�-----------------------'
	'---------------���浥���ж�-----------------------'
	if isnull(rs("price")) then
		price="-"
	else
		price=rs("price")
	end if
	'---------------���浥���ж�-----------------------'
	'---------------�����۾������ж�-----------------------'
	if isnull(rs("zhejiu")) then
		 zhejiu="-"
	else
		 zhejiu=rs("zhejiu")
	end if
	'---------------�����۾������ж�-----------------------'
	'-------------�����������۾�����---------'
	if gzsj="-" or zhejiu="-" then
		jzsj="-"
	else
		if len(sj1)<>0 and len(sj2)<>0 then
			if datediff("m",gzsj,cdate(sj2)) > zhejiu then
				jzsj=DateAdd("m",zhejiu,gzsj)
			else
				jzsj=cdate(sj2)
			end if
		else
			if datediff("m",gzsj,now()) > zhejiu then
				jzsj=DateAdd("m",zhejiu,gzsj)
			else
				jzsj=date()
			end if
		end if
	end if
	'------------�����������۾�����---------'
	'---------------���������������-----------------------'
	if gzsj="-" then
		yzys = "-"
	else
		if len(sj2)=0 then
			yzys = datediff("m",gzsj,now())
		else
			yzys = datediff("m",gzsj,cdate(sj2))
		end if
	end if
	'-------------���������������------------'
	'------------�����ֵ���ж�----------------'
	dim cz
	cz=rs("sbcs")&rs("pp")
	sqlcz="select * from admin_sort where s_bname + s_name='" & cz & "'"
	set rscz=server.CreateObject("adodb.recordset")
	rscz.Open sqlcz, conn, 1, 1
		if isnull(rscz("canzhilv")) then
			czl2="-"
		else
			if rscz.recordcount = 1 then
				czl=rscz("canzhilv")
				czl2=rscz("canzhilv") & "%"
			else
				czl2="���ݴ���"
			end if
		end if
	rscz.close
	set rscz=nothing
	'------------�����ֵ���ж�----------------'
	'------------��������ֵ----------------'
	if czl="-" or price="-" then
		czz="-"
	else
		czz=price*czl/100
	end if
	'------------��������ֵ-----------------'
	'------------������㾻ֵ--------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		jz = "-"
	else
		if datediff("m",gzsj,jzsj)>=zhejiu then
			jz = price*czl/100
		else
			jz = price-(((price-(price*czl/100))/zhejiu*(datediff("m",gzsj,jzsj))))
		end if
	end if
	'---------------������㾻ֵ------------'
	'---------------������㱾���۾ɶ�------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		 byzj = "-"
	else
		 if datediff("m",gzsj,jzsj) >= zhejiu then
			byzj = "-"
		 else
			byzj = (price-(price*czl/100))/zhejiu
		 end if
	end if
	'---------------������㱾���۾ɶ�------------'
	'---------------��������ۼ��۾ɶ�------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		ljzj = "-"
	else
		ljzj = ((price-(price*czl/100))/zhejiu)*(datediff("m",gzsj,jzsj))
	end if
	'---------------��������ۼ��۾ɶ�------------'
	'---------------���������ƽ���۾ɶ�------------'
	if price="-" or zhejiu="-" or czl="-" or czl="���ݴ���" then
		pjzj="-"
	else
		pjzj=(price-(price*czl/100))/zhejiu
	end if
	'---------------���������ƽ���۾ɶ�------------'
			
			%>
		<tr align="center">
			<td><%=rs("id")%></td>
			<td><%=rs("sbbh")%></td>
			<td><%=rs("pp")%></td>
			<td><%=rs("xh")%></td>
			<td><%=rs("ssbm")%></td>
			<td><%=rs("syz")%></td>
			<td><%=gzsj%></td>
			<td><%=Formatnumber(price,2,,,-1)%></td>
			<td><%=zhejiu%></td>
			<td><%=yzys%></td>
			<td><%=jzsj%></td>
			<td><%=czl2%></td>
			<td><%=Formatnumber(czz,2,,,-1)%></td>
			<td><%=Formatnumber(jz,2,,,-1)%></td>
			<td><%=Formatnumber(byzj,2,,,-1)%></td>
			<td><%=Formatnumber(ljzj,2,,,-1)%></td>
			<td><%=Formatnumber(pjzj,2,,,-1)%></td>
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