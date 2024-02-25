<!--#include file="inc/conn.asp"-->
<%
	sqlu="select * from sbxx where id="& Clng(request("id"))
		set rsu=conn.execute(sqlu)
   		sbbh=rsu("sbbh")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsu("sbbh")%>资产信息</title>
<style type="text/css">
<!--
.STYLE11 {
	color: #000000;
	font-weight: bold;
	font-size:24px;
	font-family:"黑体";
	
}
-->
</style>
</head>
<body>
<table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#23b14d">
<!--  <tr>
    <td colspan="4" valign="top" nowrap="nowrap"><img src="images/zc.JPG" width="936"/></td>
  </tr>-->
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">资产编号</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("sbbh")%> </p></td>
    <td rowspan="7" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">照片</p></td>
    <td rowspan="7" valign="middle"><p align="center" class="STYLE11">
		<%if Trim(rsu("pic"))="" or isnull(rsu("pic")) then
			 response.write "<img src=" & "images/noimg.gif" & " height=" & session("imgh") & ">"
		else
			 response.write "<img src="&rsu("pic")&" width="&session("imgw")&">"
		end if%>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">公司</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("ssbm")%> </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">部门</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("department")%></p></td>
  </tr>
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">使用人</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("syz")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">资产类型</p></td>
    <td height="20" align="center" valign="top"><p align="center" class="STYLE11"><%=rsu("pp")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">资产型号</p></td>
    <td height="20" align="center" valign="top"><p align="center" class="STYLE11"><%=rsu("xh")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">已用时长</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11">
      <%
			if not isnull(rsu("gzsj")) or not isnull(rsu("scrq")) then 
			 if not isnull(rsu("gzsj")) then
		   		temprq=rsu("gzsj")
		     else
		   		temprq=rsu("scrq")
		     end if
		   		tempz=Datediff("D",now(),temprq)
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
				tempz = tempz - tempm * 30
				tempd = Int(tempz)
			   if tempy = 0 then
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = "今天到期"
			         else
			            tempdis = tempd & "天"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempm & "个月"
			         else
			            tempdis = tempm & "个月" & tempd & "天"
			         end if
			      end if
			   else
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = tempy & "年"
			         else
			            tempdis = tempy & "年零" & tempd & "天"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempy & "年" & tempm & "个月"
			         else
			            tempdis= tempy & "年" & tempm & "个月" & tempd & "天"
			         end if
			      end if
			   end if
				response.write "<B><font color=red>&nbsp;已用" & tempdis & "</font></B>"
			end if
			%>
    </p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">序列号</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11"><%=rsu("ccbh")%></p></td>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">保修剩余</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11">
      <%
			if not isnull(rsu("baoxiu")) then 
			 tempz=Datediff("D",now(),rsu("baoxiu"))
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
				tempz = tempz - tempm * 30
				tempd = Int(tempz)
			   if tempy = 0 then
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = "0天"
			         else
			            tempdis = tempd & "天"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempm & "个月"
			         else
			            tempdis = tempm & "个月" & tempd & "天"
			         end if
			      end if
			   else
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = tempy & "年"
			         else
			            tempdis = tempy & "年零" & tempd & "天"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempy & "年" & tempm & "个月"
			         else
			            tempdis= tempy & "年" & tempm & "个月" & tempd & "天"
			         end if
			      end if
			   end if
			   if rsu("baoxiu") >=now() then 
				response.write "<B><font color=blue>还有" & tempdis & "到期</font></B>"
			   else
				response.write "<B><font color=red>已过期" & tempdis & "</font></B>"
			   end if
			end if
			%>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">CPU</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("cpu")%></p></td>
    <td valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">内存</p></td>
    <td valign="middle"><p align="center" class="STYLE11"><%=rsu("ram")%>G<br>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">硬盘</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11">        <%if isnull(rsu("hdd")) then response.write "0" else response.write replace(rsu("hdd"),"|","G+") end if%>G</p></td>
    <td valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">显卡</p></td>
    <td valign="middle"><p align="center" class="STYLE11"><%=rsu("gpu")%><br>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">所在位置</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("cfdd")%></p></td>
    <td valign="middle" nowrap="nowrap" class="STYLE11"><div align="center">设备状态</div></td>
    <td valign="middle">
	<%	
	    dim zt
	    zt=rsu("zt")
	    sqlzt="select * from admin_state where ztm='" & zt & "'"
	   	set rszt=server.CreateObject("adodb.recordset")
		rszt.Open sqlzt, conn, 1, 1
	%>
	<%if rsu("pdzt")=false then%>
	<div align="center"><span class="STYLE11"><%response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"%></span></div>
	<%else%>
	<div align="center"><span class="STYLE11"><%response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"%></span></div>
	<%
	    rszt.close
	    set rszt=nothing
	   end if%>
	</td>
  </tr>
  <tr>
    <td align="center" valign="middle" nowrap="nowrap">
      <p align="center" class="STYLE11">资产备注</p></td>
	  <td colspan="3" valign="middle"><p class="STYLE11"><%=rsu("bz")%></p></td>
  </tr>
  <tr>
    <td align="center" valign="middle" nowrap="nowrap"><span class="STYLE11">盘点信息</span></td>
    <td height="25" colspan="4" class="STYLE11">
		  <%
			 select case rsu("pdzt")
			 	case 0 pd="<font color=#AE0000>未盘点</font>"
			 	case 1 pd="<font color=#006000>正常</font>"
			 	case 2 pd="<font color=blue>盘盈</font>"
			 	case 3 pd="<font color=red>盘亏</font>"
			 end select
			 if rsu("pdzt") = 0 then
		  %>
		状态：<%=pd%>
			<%else%>
		时间：<%=rsu("pdsj")%>；状态：<%=pd%>；备注：<%=rsu("pdbz")%>
			<%end if%></td>
  </tr>
  <tr>
	<td align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">详细记录</p></td>
<%
	sqll="select * from sb_log where zcid='"& sbbh &"' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=3 valign=middle>该资产没有任何记录！</td>"
   			else
		   		rsuu.pagesize=5
				if request("page")<>"" then
		  			epage=cint(request("page"))
		   			if epage<1 then epage=1
		   			if epage>rsuu.pagecount then epage=rsuu.pagecount
				else
					epage=1
				end if
			rsuu.absolutepage = epage
   %>
			<td height="25" colspan="4" align="center" class="classtd"><div align="left" class="STYLE11">
           		<% i=0
				   do while not rsuu.eof 
						 '下面是z判断类型是借出、归还的话，与其他的显示不同。'
						 if rsuu("leixing")="借出" or rsuu("leixing")="归还" then %>
							<%=rsuu("datetime")%>&nbsp;：由<font color="red">【<%=rsuu("ssbm")%>】</font>的<font color="blue">【<%=rsuu("user")%>】</font><%=rsuu("leixing")%>。<br>
						 <%elseif rsuu("leixing")="转移" or rsuu("leixing")="调拨" then %>
							<%=rsuu("datetime")%>&nbsp;：由<font color="red"><%=rsuu("ssbm")%></font><%=rsuu("leixing")%>到<font color="blue"><%=rsuu("user")%></font>。<br>
						<% else %>
							<%=rsuu("datetime")%>&nbsp;：由<font color="red">【<%=rsuu("user")%>】</font><%=rsuu("leixing")%>。<br>
						<% end if
				   rsuu.movenext()
					i=i+1
					if i>=rsuu.pagesize then exit do
            	loop %>
		  </div>
					<%if rsuu.pagecount>1 then%>
			<div align="center">
				页次：<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>页，共有<font color="red"><%=rsuu.recordcount%></font>条记录。<br>
				<a href="asset.asp?id=<%=rsu("id")%>&page=1"><img src="images/frist.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=epage-1%>"><img src="images/previous.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=epage+1%>"><img src="images/next.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>"><img src="images/last.png"></a>
			</div>
		<%end if
		   end if%>
	</td>
  </tr>
</table>
</body>
</html>
