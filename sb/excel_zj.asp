<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<% 
if Instr(session("juese"),"|203,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="设备记录"&replace(replace(replace(now,":","")," ",""),"/","")
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
<title>设备记录列表</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="17"><%=session("companyname")%>资产折旧表
	      <%
				select case synx
					case 0
						response.write "（已折完）"
					case 1
						response.write "（正折旧）"
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
			sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,now()) < zhejiu and (" & rk & ")"
		elseif synx=0 then
			sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,now()) >= zhejiu and (" & rk & ")"
		end if
	else
		sql="select * from sbxx where zt<>'报废' and (" & rk & ")"
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
			response.write "筛选条件："
			if sj1 <> "" and sj2 <> "" then
				sql=sql&" and (gzsj >= #" & sj1 &"# and (gzsj <= #" & sj2 & "# or dateadd('" & "m" & "',iif(isnull(zhejiu),0,zhejiu),gzsj) <= #" & sj2 & "#))"
				response.write sj1 & "到" & sj2 & "范围内；"
			else
				if sj1 <> "" and sj2 = "" then
					sql=sql&" and (gzsj >= #" & sj1 &"#)"
					response.write sj1 & "之后；"
				end if
			end if
			if pp="all" then
				response.write "全部分类；"
			else
				response.write  pp & "；"
			end if
			if len(gjc)>0 then
				select case fenlei
					case 1
						response.write "按资产编号；"
					case 2
						response.write "按序列号；"
					case 3
						response.write "按所属公司；"
					case 4
						response.write "按使用人；"
					case 5
						response.write "按存放位置；"
					case 6
						response.write "按资产状态；"
					case 7
						response.write "按资产型号；"
				end select
				response.write "关键词：" & gjc & "；"
			end if
		end if
sql=sql&" order by id desc"
	response.write "<br>当前SQL语句为：" & sql 
			%>
			</th>
		  </tr>
		<tr align="center">
			<th height="20">ID</th>
			<th>资产编号</th>
			<th>资产类别</th>
			<th>品牌型号</th>
			<th>所属公司</th>
			<th>使用人</th>
			<th>购置日期</th>
			<th>单价</th>
			<th>折旧月数</th>
			<th>已折月数</th>
			<th>截至折旧日期</th>
			<th>残值率</th>
			<th>残值</th>
			<th>净值</th>
			<th>本月折旧</th>
			<th>累计折旧</th>
			<th>平均月折旧额</th>
		  </tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>没有找到相应的资产！</strong></font>&nbsp;</p>"
		end if
			
		if not rs.eof then
			do while not rs.eof

	'---------------下面购买日期判断-----------------------'
	if isnull(rs("gzsj")) then
		gzsj="-"
	else 
		gzsj=rs("gzsj")
	end if
	'---------------上面购买日期判断-----------------------'
	'---------------下面单价判断-----------------------'
	if isnull(rs("price")) then
		price="-"
	else
		price=rs("price")
	end if
	'---------------上面单价判断-----------------------'
	'---------------下面折旧月数判断-----------------------'
	if isnull(rs("zhejiu")) then
		 zhejiu="-"
	else
		 zhejiu=rs("zhejiu")
	end if
	'---------------上面折旧月数判断-----------------------'
	'-------------下面计算截至折旧日期---------'
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
	'------------上面计算截至折旧日期---------'
	'---------------下面计算已折月数-----------------------'
	if gzsj="-" then
		yzys = "-"
	else
		if len(sj2)=0 then
			yzys = datediff("m",gzsj,now())
		else
			yzys = datediff("m",gzsj,cdate(sj2))
		end if
	end if
	'-------------上面计算已折月数------------'
	'------------下面残值率判断----------------'
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
				czl2="数据错误"
			end if
		end if
	rscz.close
	set rscz=nothing
	'------------上面残值率判断----------------'
	'------------下面计算残值----------------'
	if czl="-" or price="-" then
		czz="-"
	else
		czz=price*czl/100
	end if
	'------------上面计算残值-----------------'
	'------------下面计算净值--------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		jz = "-"
	else
		if datediff("m",gzsj,jzsj)>=zhejiu then
			jz = price*czl/100
		else
			jz = price-(((price-(price*czl/100))/zhejiu*(datediff("m",gzsj,jzsj))))
		end if
	end if
	'---------------上面计算净值------------'
	'---------------下面计算本月折旧额------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		 byzj = "-"
	else
		 if datediff("m",gzsj,jzsj) >= zhejiu then
			byzj = "-"
		 else
			byzj = (price-(price*czl/100))/zhejiu
		 end if
	end if
	'---------------上面计算本月折旧额------------'
	'---------------下面计算累计折旧额------------'
	if gzsj="-" or price="-" or zhejiu="-" or czl="-" then
		ljzj = "-"
	else
		ljzj = ((price-(price*czl/100))/zhejiu)*(datediff("m",gzsj,jzsj))
	end if
	'---------------上面计算累计折旧额------------'
	'---------------下面计算月平均折旧额------------'
	if price="-" or zhejiu="-" or czl="-" or czl="数据错误" then
		pjzj="-"
	else
		pjzj=(price-(price*czl/100))/zhejiu
	end if
	'---------------上面计算月平均折旧额------------'
			
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