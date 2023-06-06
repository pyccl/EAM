<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
if Instr(session("juese"),"|102,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
		page=Request.Querystring("page")
		id=Request.Querystring("id")
		sqlu="select * from sbxx where id="& id
			set rsu=conn.execute(sqlu)
			If Not rsu.eof Then 
				Call info()
				Else
				response.write("<div align=center>错误！不存在该电脑资产！</div>")
			End If 
Sub info()
%>
<style type="text/css">
<!--
.STYLE7 {
	color: #ffffff
}
-->
</style>
<title><%=rsu("sbbh")%>---资产详情</title>
<body>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form action="change_save2.asp" method="post" name="form1" id="form1">
    <tr class="classtop1">
      <td  height="25" colspan="4" align="center"><strong><font color="#ffffff" size="+1">资产【<%=rsu("sbbh")%>】的详情</font></strong></td>
    </tr>
    <tr>
      <td height="25" colspan="3" align="center"  class="classfooter"><div align="left"><strong>&nbsp;<font color="#ffffff"><%=rsu("sbbh")%></font>：资产信息</strong></div></td>
      <td width="32%" height="25" align="center" class="classfooter">
		<%if Instr(session("rank"),rsu("ssbm"))<>0 and Instr(session("juese"),"|103,")<>0 then%>
			<a href="xg.asp?id=<%=rsu("id")%>&qx=<%=rsu("id")%>" class="STYLE7">修改资料</a>
        <%end if%>
	</td>
    </tr>
    <tr>
      <td width="16%" align="center"  class="classtd"><div align="left"><strong>资产编号：</strong></div></td>
      <td width="34%" align="center" class="classtd" ><div align="left"><%=rsu("sbbh")%></div></td>
      <td width="16%" height="25" align="center" class="classtd"><div align="left"><strong> 资产从属：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("sbcs")%></div>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong> 资产类别：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("pp")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> 资产子类：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("zilei")%> </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>所属公司：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ssbm")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>所属部门：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("department")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>存放位置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("cfdd")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> 使 用 人：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("syz")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>资产状态：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%
			dim zt
			zt=rsu("zt")
			sqlzt="select * from admin_state where ztm='" & zt & "'"
			set rszt=server.CreateObject("adodb.recordset")
			rszt.Open sqlzt, conn, 1, 1
			response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"
			rszt.close
			set rszt=nothing
		%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> 品牌型号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("xh")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>生产日期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("scrq")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>购置时间：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gzsj")%>
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
			         tempdis = tempd & "天"
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
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>保修到期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("baoxiu")%>
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
			         tempdis = tempd & "天"
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
				response.write "<B><font color=blue>&nbsp;还有" & tempdis & "到期</font></B>"
			   else
				response.write "<B><font color=red>&nbsp;已过期" & tempdis & "</font></B>"
			   end if
			end if
			%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>购置金额：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("price")%>元</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>CPU：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("cpu")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>内存大小：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ram")%>GB</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>硬盘大小：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("hdd")) then response.write "<br>" else response.write replace(rsu("hdd"),"|","<br>") end if%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>硬盘序列号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("hddsn")) then response.write "<br>" else response.write replace(rsu("hddsn"),"|","<br>") end if%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>显卡：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gpu")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>机器名：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("jqm")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>IP 地 址：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ip")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>MAC地址：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("mac")) then response.write "<br>" else response.write replace(rsu("mac"),"|","<br>") end if%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>操作系统：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("czxt")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>序列号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ccbh")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>更新时间：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gxsj")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>添加人员：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("tjry")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>打印状态：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <%
			if rsu("dyzt") then
				response.write "已打印"
			 else
			 	response.write "未打印"
			 end if
		  %>
		  </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>折旧月数：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("zhejiu")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>备 注 ：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("bz")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>图 片 ：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
			<%
			pic=rsu("pic")
			if Trim(pic)="" or isnull(rsu("pic")) then
				response.write "<img src=" & "../images/noimg.gif" & " height=" & session("imgh") & ">"
			else
				response.write "<a href=" & pic & " target='_blank' title='点击图片查看原图'><img src=" & pic & " height=" & session("imgh") & "></a>"
			end if
			%>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>最后盘点：</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <%
			 select case rsu("pdzt")
			 	case 0 pd="<font color=#AE0000>未盘点</font>"
			 	case 1 pd="<font color=#006000>正常</font>"
			 	case 2 pd="<font color=blue>盘盈</font>"
			 	case 3 pd="<font color=red>盘亏</font>"
			 end select
			 if rsu("pdzt")=0 then
		  %>
          状态：<B><%=pd%></B>
          <%else%>
          时间：<%=rsu("pdsj")%>；状态：<B><%=pd%></B>；备注：<%=rsu("pdbz")%>
          <%end if%>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>设备记录：</strong></div></td>
      <%
	sqll="select * from sb_log where zcid='"& rsu("sbbh") &"' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=4 valign=middle>该资产没有任何记录！</td>"
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
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
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
        <div align="center"> 页次：<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>页，共有<font color="red"><%=rsuu.recordcount%></font>条记录。 <a href="info.asp?id=<%=rsu("id")%>&page=1">首页</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=epage-1%>">前一页</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=epage+1%>">后一页</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>">末页</a> </div>
        <%end if
		   end if%>
		</td>
    </tr>
    <tr>
      <td colspan="4" align="center" bgcolor="#4685CA" class="classfooter"><a href="#" class="STYLE7" height="25" onClick="javascript :history.back(-1);">&lt;&lt;&lt; 返回上页 &gt;&gt;&gt;</a></td>
    </tr>
  </form>
</table>
</body>
<%End Sub
end if%>
