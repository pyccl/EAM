<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<% 
if Instr(session("juese"),"|505,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="员工信息"&replace(replace(replace(now,":","")," ",""),"/","")
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
<title>员工信息列表</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="16"><%=session("companyname")%>员工信息表
				<%
				   if ly = 0 then response.write "（已超5年）" end if
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
		xssj= "入职时间为" & sj1 & "至" & sj2 & "之间；"
	else
		if sj1 <> "" and sj2 = "" then
			sql=sql&" and (ruzhi >= #" & sj1 &"#)"
			xssj= "入职时间为" & sj1 & "之后；"
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
			response.write "筛选条件：" & xssj
			if dept="" then
				response.write "全部公司；"
			else
				response.write  dept & "；"
			end if
			if len(gjc)>0 then
				select case fenlei
					case 1
						response.write "按身份证号码；"
					case 2
						response.write "按部门；"
					case 3
						response.write "按姓名；"
					case 4
						response.write "按手机号码；"
					case 5
						response.write "按工号；"
				end select
				response.write "关键词：" & gjc & "；"
			end if
			end if
				response.write "<br>当前SQL语句为：" & sql 
%>
		</th>
		  </tr>
		<tr align="center">
			<th height="20">ID</th>
			<th>身份证号码</th>
			<th>姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>年龄</th>
			<th>公司</th>
			<th>部门</th>
			<th>职位</th>
			<th>入职时间</th>
			<th>最高学历</th>
			<th>手机号码</th>
			<th>微信</th>
			<th>QQ</th>
			<th>籍贯地址</th>
			<th>居住地址</th>
		  </tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>没有找到相应的员工！</strong></font>&nbsp;</p>"
		else
			do while not rs.eof
	'---------------下面计算性别-----------------------'
	 	xingbie=right(rs("idcard"),2)
	 if cint(left(xingbie,1)) mod 2=0 then
		 sex= "女"
	 else
		 sex= "男"
	 end if
	'---------------上面计算性别-----------------------'
	'---------------下面计算出生日期-----------------------'
		riqi=mid(rs("idcard"),7,8)
		birthday=mid(riqi,1,4)&"年"&mid(riqi,5,2)&"月"&mid(riqi,7,2)&"日"
		rq=mid(riqi,1,4)&"-"&mid(riqi,5,2)&"-"&mid(riqi,7,2)
	'---------------上面计算出生日期-----------------------'
	'---------------下面计算年龄-----------------------'
		age=DateDiff("yyyy",rq,date())
	'---------------上面计算年龄-----------------------'
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