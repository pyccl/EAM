<!--#include file="inc/conn.asp"-->
<!--#include file="inc/mysession.asp"-->

<link href="css.css" rel="stylesheet" type="text/css">
<link href="images/tab.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%if session("rank")<>"" then %>
<body>
<table width="100%" border="0" cellpadding="1" cellspacing="0" >
  <tr>
    <td height="25" background="images/default_19.gif" style="border-left:solid 1px #aad5e6;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30"><div align="center"><img src="images/table.gif" width="16" height="14"></div></td>
        <td width="15"><img src="images/jt.gif" width="5" height="6"></td>
        <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><b>系统统计</b></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1"  bgcolor="#6298E1">
	    <tbody>
		<% if Instr(session("juese"),"|102,")<>0 then %>
	      <tr>
			<%
				set rszc=server.CreateObject("adodb.recordset")
				sqlzc="select * from sbxx"
				rszc.Open sqlzc, conn, 1, 1
				zccount=rszc.recordcount
				rszc.Close
			%>
	        <td width="5%" align="center" class="classtd"><p>资产</p>
            <p><%=zccount%>台</p></td>
	        <td width="95%" class="classtd"><table border="0" cellspacing="1" bgcolor="#FFFFFF" align="center" width="100%">
	    <%
		set rszt=server.CreateObject("adodb.recordset")
		sqlzt="select * from admin_state"
		rszt.Open sqlzt, conn, 1, 1
		%>
	          <tbody>
	            <tr>
	              <td rowspan="2" align="center" valign="middle" class="classtd" width="5%">状态</td>
	        <%
			   do while not rszt.eof
				set rszf=server.CreateObject("adodb.recordset")
				sqlzcf="select * from sbxx where zt='" & rszt("ztm") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
	        <td height="20" width="<%=round(zcf/zccount*95,2)%>%" nowrap="nowrap" title="<%=rszt("ztm")%>【<%=zcf%>台，<%=round(zcf/zccount*100,2)%>%】" bgcolor="<%=rszt("ztys")%>"></td>
	        <%  rszf.Close
				rszt.movenext
				loop
			%>
                </tr>
	            <tr>
	              <td class="classtd" height="20" colspan="<%=rszt.recordcount%>">图例：
	        <%
			rszt.movefirst
			do while not rszt.eof
				sqlzcf="select * from sbxx where zt='" & rszt("ztm") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
	                <font color="<%=rszt("ztys")%>"><%=rszt("ztm")%></font>
			<% rszf.Close
				rszt.movenext
				loop
			%>
			</td>
         </tr>
      </tbody>
	        <%rszt.Close
			set rszt=nothing
			%>
	          </table>
	          <br>
              <table border="0" cellspacing="1" bgcolor="#FFFFFF" align="center" width="100%">
        <%
		set rszt=server.CreateObject("adodb.recordset")
		sqlzt="select * from admin_bsort order by s_paixu asc"
		rszt.Open sqlzt, conn, 1, 1
		%>
                <tbody>
                  <tr>
                    <td rowspan="2" align="center" valign="middle" class="classtd" width="5%">分类</td>
             <%
				set rszc=server.CreateObject("adodb.recordset")
				sqlzc="select * from sbxx"
				rszc.Open sqlzc, conn, 1, 1
				zccount=rszc.recordcount
				rszc.Close
			do while not rszt.eof
				set rszf=server.CreateObject("adodb.recordset")
				sqlzcf="select * from sbxx where sbcs='" & rszt("s_name") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
            <td height="20" width="<%=round(zcf/zccount*95,2)%>%" nowrap="nowrap" title="<%=rszt("s_name")%>【<%=zcf%>台，<%=round(zcf/zccount*100,2)%>%】" bgcolor="<%=rszt("s_color")%>"></td>
            <%  rszf.Close
				rszt.movenext
				loop
			%>
                  </tr>
                  <tr>
                    <td class="classtd" height="20" colspan="<%=rszt.recordcount%>">图例：
            <%
			rszt.movefirst
			do while not rszt.eof
				sqlzcf="select * from sbxx where sbcs='" & rszt("s_name") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
                      <font color="<%=rszt("s_color")%>"><%=rszt("s_name")%></font>
            <% rszf.Close
				rszt.movenext
				loop
			%></td>
                  </tr>
                </tbody>
                <%rszt.Close
			set rszt=nothing
			%>
              </table>
              <br>
              <table border="0" cellspacing="0" bgcolor="#FFFFFF" align="center" width="100%">
        <%
		set rszt=server.CreateObject("adodb.recordset")
		sqlzt="select * from admin_shiyongdanwei order by y_paixu asc"
		rszt.Open sqlzt, conn, 1, 1
		%>
                <tbody>
                  <tr>
                    <td rowspan="2" align="center" valign="middle" class="classtd" width="5%">公司</td>
            <%
				set rszc=server.CreateObject("adodb.recordset")
				sqlzc="select * from sbxx"
				rszc.Open sqlzc, conn, 1, 1
				zccount=rszc.recordcount
				rszc.Close
			do while not rszt.eof
				set rszf=server.CreateObject("adodb.recordset")
				sqlzcf="select * from sbxx where ssbm='" & rszt("y_name") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
                    <td height="20" width="<%=round(zcf/zccount*95,2)%>%" nowrap="nowrap" title="<%=rszt("y_name")%>【<%=zcf%>台，<%=round(zcf/zccount*100,2)%>%】" bgcolor="<%=rszt("y_color")%>"></td>
            <% rszf.Close
				rszt.movenext
				loop
			%>
                  </tr>
                  <tr>
                    <td class="classtd" height="20" colspan="<%=rszt.recordcount%>">图例：
                      <%
			rszt.movefirst
			do while not rszt.eof
				sqlzcf="select * from sbxx where ssbm='" & rszt("y_name") &"'"
				rszf.Open sqlzcf, conn, 1, 1
			    zcf=rszf.recordcount
			%>
                      <font color="<%=rszt("y_color")%>"><%=rszt("y_name")%></font>
            <% rszf.Close
				rszt.movenext
				loop
			%></td>
                  </tr>
                </tbody>
                <%rszt.Close
			set rszt=nothing
			%>
              </table></td>
          </tr>
			<% end if
			   if Instr(session("juese"),"|502,")<>0 then %>
	      <tr>
			<%
				set rsyh=server.CreateObject("adodb.recordset")
				sqlyh="select * from admin_yuangong"
				rsyh.Open sqlyh, conn, 1, 1
				yhcount=rsyh.recordcount
				rsyh.Close
			%>
	        <td width="5%" align="center" class="classtd"><p>&nbsp;</p></td>
	        <td width="95%" class="classtd">&nbsp;</td>
          </tr>
	      <tr>
	        <td align="center" class="classtd"><p>员工</p>
            <p><%=yhcount%>人</p></td>
	        <td class="classtd"><table border="0" cellspacing="0" bgcolor="#FFFFFF" align="center" width="100%">
	          <tbody>
	            <tr>
	              <td rowspan="2" align="center" valign="middle" class="classtd" width="5%">性别</td>
	              <%
				set rsyg=server.CreateObject("adodb.recordset")
				sqlyg="select * from admin_yuangong"
				rsyg.Open sqlyg, conn, 1, 1
				ygcount=rsyg.Recordcount
				rsyg.Close

				set rsfyg=server.CreateObject("adodb.recordset")
				sqlzyg="select * from admin_yuangong where left(right(idcard,2),1) mod 2 <> 0"
				rsfyg.Open sqlzyg, conn, 1, 1
			    fyg=rsfyg.recordcount
					 rsfyg.Close
					 sqlzyg="select * from admin_yuangong where left(right(idcard,2),1) mod 2 = 0"
					 rsfyg.Open sqlzyg, conn, 1, 1
					 fyg2=rsfyg.recordcount
			%>
	              <td height="20" width="<%=round(fyg/ygcount*95,2)%>%" nowrap="nowrap" title="男【<%=fyg%>人，<%=round(fyg/ygcount*100,2)%>%】" bgcolor="#00C3FF"></td>
	              <td height="20" width="<%=round(fyg2/ygcount*95,2)%>%" nowrap="nowrap" title="女【<%=fyg2%>人，<%=round(fyg2/ygcount*100,2)%>%】" bgcolor="#FF5070"></td>
	              <%  rszyg.Close %>
                </tr>
	            <tr>
	              <td class="classtd" height="21" colspan="2">图例： <font color="#00C3FF">男</font>&nbsp;<font color="#FF5070">女</font></td>
                </tr>
              </tbody>
	          <%rszt.Close
			set rszt=nothing
			%>
	          </table>
				<br>
	          <table border="0" cellspacing="1" bgcolor="#FFFFFF" align="center" width="100%">
	          <%
		set rszt=server.CreateObject("adodb.recordset")
		sqlzt="select * from admin_shiyongdanwei order by y_paixu asc"
		rszt.Open sqlzt, conn, 1, 1
		%>
	          <tbody>
	            <tr>
	              <td rowspan="2" align="center" valign="middle" class="classtd" width="5%">公司</td>
	              <%
				set rsyg=server.CreateObject("adodb.recordset")
				sqlyg="select * from admin_yuangong"
				rsyg.Open sqlyg, conn, 1, 1
				ygcount=rsyg.Recordcount
				rsyg.Close
			do while not rszt.eof
				set rsfyg=server.CreateObject("adodb.recordset")
				sqlzyg="select * from admin_yuangong where company='" & rszt("y_name") &"'"
				rsfyg.Open sqlzyg, conn, 1, 1
			    fyg=rsfyg.recordcount
			%>
	              <td height="20" width="<%=round(fyg/ygcount*95,2)%>%" nowrap="nowrap" title="<%=rszt("y_name")%>【<%=fyg%>人，<%=round(fyg/ygcount*100,2)%>%】" bgcolor="<%=rszt("y_color")%>"></td>
	              <%  rszyg.Close
				rszt.movenext
				loop
			%>
                </tr>
	            <tr>
	              <td class="classtd" height="21" colspan="<%=rszt.Recordcount%>">图例：
	                <%
			rszt.movefirst
			do while not rszt.eof
				sqlzyg="select * from sbxx where ssbm='" & rszt("y_name") &"'"
				rsfyg.Open sqlzyg, conn, 1, 1
			    fyg=rsfyg.recordcount
			%>
	                <font color="<%=rszt("y_color")%>"><%=rszt("y_name")%></font>
	                <%  rszyg.Close
				rszt.movenext
				loop
			%></td>
                </tr>
			<% end if %>
              </tbody>
	          <%rszt.Close
			set rszt=nothing
			%>
            </table>
            </td>
          </tr>
		<%
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   	rk = "ssbm='" & mystr(i) & "' or " + rk
		   next
		   rk =rk & " False"
					 
				sqlpdaa="and ssbm='" & session("rank") & "'"
				set rspda=server.CreateObject("adodb.recordset")
				sqlpda="select * from sbxx where zt<>'报废' and (" & rk & ")"
				rspda.Open sqlpda, conn, 1, 1
			    pdz=rspda.recordcount
   		set rspds=server.CreateObject("adodb.recordset")
		sqlpd="select * from setting"
		rspds.Open sqlpd, conn, 1, 1
		if rspds("pd") and Instr(session("juese"),"|108,")<>0 then
		%>
	      <tr>
	        <td align="center" class="classtd">&nbsp;</td>
	        <td class="classtd">&nbsp;</td>
          </tr>
	      <tr>
	        <td align="center" class="classtd"><p>盘点</p>
                  <p><%=pdz%>台</p></td>
	        <td class="classtd">
		<table border="0" cellspacing="1" bgcolor="#FFFFFF" align="center" width="100%">
	          <tbody>
	              <%
				rspda.Close
					 sqlpd9="select * from sbxx where zt<>'报废' and pdzt=0 and (" & rk & ")"
					 rspda.Open sqlpd9, conn, 1, 1
					 pd9=rspda.recordcount
					 rspda.Close
					 sqlpd1="select * from sbxx where zt<>'报废' and pdzt=1 and (" & rk & ")"
					 rspda.Open sqlpd1, conn, 1, 1
					 pd1=rspda.recordcount
					 rspda.Close
					 sqlpd2="select * from sbxx where zt<>'报废' and pdzt=2 and (" & rk & ")"
					 rspda.Open sqlpd2, conn, 1, 1
					 pd2=rspda.recordcount
					 rspda.Close
					 sqlpd3="select * from sbxx where zt<>'报废' and pdzt=3 and (" & rk & ")"
					 rspda.Open sqlpd3, conn, 1, 1
					 pd3=rspda.recordcount
					 rspda.Close
				if pd9>0 then
			%>
				<tr>
					<td align="center" colspan="4" bgcolor="#FFFFFF">
						<marquee onMouseOut="this.start()" onMouseOver="this.stop()" behavior="alternate" scrollamount="10"><font color="red"><B>注意：还有<%=pd9%>台未盘点资产，请检查！</B></font></marquee>
					</td>
				</tr>
			<%end if%>
	            <tr>
	              <td height="20" width="<%=round(pd9/pdz*100,2)%>%" nowrap="nowrap" title="未盘点【<%=pd9%>台，<%=round(pd9/pdz*100,2)%>%】" bgcolor="#CCCCCC"></td>
	              <td height="20" width="<%=round(pd1/pdz*100,2)%>%" nowrap="nowrap" title="正常【<%=pd1%>台，<%=round(pd1/pdz*100,2)%>%】" bgcolor="Green"></td>
				  <td height="20" width="<%=round(pd2/pdz*100,2)%>%" nowrap="nowrap" title="盘盈【<%=pd2%>台，<%=round(pd2/pdz*100,2)%>%】" bgcolor="Blue"></td>
				  <td height="20" width="<%=round(pd3/pdz*100,2)%>%" nowrap="nowrap" title="盘亏【<%=pd3%>台，<%=round(pd3/pdz*100,2)%>%】" bgcolor="Red"></td>
	              <%  rszyg.Close %>
                </tr>
	            <tr>
	              <td class="classtd" height="21" colspan="4">图例： <strong>未盘点</strong><%=pd9%>&nbsp;<font color="Green"><strong>正常</strong></font><%=pd1%>&nbsp;<font color=blue><strong>盘盈</strong></font><%=pd2%>&nbsp;<font color=red><strong>盘亏</strong></font><%=pd3%></td>
                </tr>
              </tbody>
	          <%rszt.Close
			set rszt=nothing
			%>
	          </table></td>
          </tr>
        </tbody>
<%end if%>
</table>
</body>
<%else%>

<!--#include file="inc/quanxian.asp"-->

<%end if%>