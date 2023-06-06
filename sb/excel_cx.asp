<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
if Instr(session("juese"),"|110,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else

nowfilename="设备记录"&replace(replace(replace(now,":","")," ",""),"/","")
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
<title>设备记录列表</title>
</head>
<body>
		<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
		<tr align="center">
		  <th height="20" colspan="30"><%=session("companyname")%>资产详情表
				<%
				   if ly = 0 then response.write "（报废）" end if
				   if ly = 1 then
				   		select case synx
				   			case 0
				   				response.write "（未盘点）"
						   	case 1
				   				response.write "（盘点正常）"
						    case 2
				   				response.write "（盘盈）"
						    case 3
				   				response.write "（盘亏）"
				   		end select
				   end if
				   if ly = 2 then
				   		if sj = 1 then
				   				response.write "（超过5年）"
				   		elseif sj = 0 then
				   				response.write "（未超过5年）"
				 		end if
				   end if
				%>
		  </th>
		  </tr>
		<tr>
		<th height="20" colspan="30" align="left">
			筛选条件：
			<%
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "ssbm= '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"

select case ly
	case 0
		sql="select * from sbxx where zt='报废' and ("& rk & ") "
	case 1
		select case synx
			case 0 
				sql="select * from sbxx where zt<>'报废' and pdzt=0 and (" & rk & ")"
			case 1
				sql="select * from sbxx where zt<>'报废' and pdzt=1 and (" & rk & ")"
			case 2
				sql="select * from sbxx where zt<>'报废' and pdzt=2 and (" & rk & ")"
			case 3
				sql="select * from sbxx where zt<>'报废' and pdzt=3 and (" & rk & ")"
		end select
	case 2
		select case sj
			case 0
				sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,date())<=60 and (" & rk & ")"
			case 1
				sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,date())>60 and (" & rk & ")"
			case 2
				sql="select * from sbxx where zt<>'报废' and ("& rk & ") "
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
				case 8
					response.write "按MAC地址；"
				case 9
					response.write "按硬盘SN号；"
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
			<th>设备编号</th>
			<th>从属</th>
			<th>类型</th>
			<th>子类</th>
			<th>型号</th>
			<th>操作系统</th>
			<th>机器名</th>
			<th>公司</th>
			<th>部门</th>
			<th>存放位置</th>
			<th>使用者</th>
			<th>购置时间</th>
			<th>价格</th>
			<th>生产日期</th>
			<th>保修时间</th>
			<th>已使用月</th>
			<th>是否超5年</th>
			<th>CPU</th>
			<th>内存</th>
			<th>硬盘</th>
			<th>硬盘序列号</th>
			<th>显卡</th>
			<th>IP地址</th>
			<th>MAC地址</th>
			<th>资产状态</th>
			<th>盘点状态</th>
			<th>序列号</th>
			<th>添加时间</th>
			<th>最后更新时间</th>
		</tr>
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn, 1, 1	
		if rs.eof and rs.bof then
			response.write "<p><font color=red><strong>没有找到相应的资产！</strong></font>&nbsp;</p>"
		end if
			
		if not rs.eof then
			do while not rs.eof

			select case rs("zt")
			case "正常使用"
				zt=  "<font color=blue>正常使用</font>"
			case "闲置待发"
				zt= "<font color=green>闲置待发</font>"
			case "正在维修"
		   		zt= "<font color=yellow>正在维修</font>"
			case else
		   		zt= "<font color=red>报废</font>"
			end select
		   

			select case rs("pdzt")
			case 3
				pdzt=  "<B><font color=red>盘亏</font></b>"
			case 2
				pdzt= "<B><font color=Blue>盘盈</font></b>"
			case 1
				pdzt= "<B>正常</b>"
			case else
				pdzt= "<font color=red>未盘点</font>"
			end select
		   
		synx1=datediff("m",rs("gzsj"),now())
		if synx1>60 then
			baofei="是"
		else
			baofei="否"
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