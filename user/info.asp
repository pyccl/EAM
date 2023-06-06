<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|502,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
		page=Request.Querystring("page")
		id=Request.Querystring("id")
		sqlu="select * from admin_yuangong where id=" & id
			set rsu=conn.execute(sqlu)
			If Not rsu.eof Then 
				Call info()
				Else
   response.write("<br><br><div align=center>未找到该员工信息，请<a href=admin_yuangong.asp>点击此处</a>返回！</div>")
			End If 
Sub info()
%>
<style type="text/css">
<!--
.STYLE7 {color: #ffffff}
-->
</style>
<!--#include file="../inc/displaytip.asp"-->
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <form action="change_save2.asp" method="post" name="form1" id="form1">
    <tr class="classtop1">
      <td  height="25" colspan="4" align="center"><strong><font color="#ffffff">员工【<%=rsu("xingming")%>（<%=rsu("gh")%>）】的详情</font></strong></td>
    </tr>
    <tr>
      <td height="25" colspan="2" align="center"  class="classfooter"><div align="left"><strong>&nbsp;<font color="#ff0000"><%=rsu("xingming")%></font>（<%=rsu("gh")%>）的详细信息</strong></div></td>
      <td height="25" align="center"  class="classfooter">
		  <div align="left" onmousemove="position();" onmouseout="hide();">
			<%
				set rs2=server.CreateObject("adodb.recordset")
				sql2="select * from sbxx where syz like '%"& rsu("gh") &"%'"
				rs2.open sql2,conn, 1, 1
					do while not rs2.eof
			   			idd = rs2("id")
			   			zc=zc & "【" & rs2("pp") & "：" & rs2("sbbh") & "】" & "<br>"
						rs2.movenext
					loop
				if rs2.eof and rs2.bof then
					response.write "<strong><font color = red>名下无任何资产</font></strong>"
				else
			   		response.write "<strong>名下共有<font color=red> "& rs2.recordcount &" </font>台设备</strong>"
				end if
			%>
		  </div>
		  </td>
      <td height="25" align="center" class="classfooter" ><%if Instr(session("rank"),rsu("company"))<>0 and Instr(session("juese"),"|503,")<>0 then%><a href="xg_yuangong.asp?id=<%=rsu("id")%>" class="STYLE7">修改资料</a><%end if%></td>
    </tr>
    <tr>
      <td height="25" align="center"  class="classtd"><div align="left"><strong>姓名（工号）：</strong></div></td>
      <td align="center" class="classtd" ><div align="left"><%=rsu("xingming")%>(<%=rsu("gh")%>)</div></td>
	   <td rowspan="6" align="center" class="classtd"><div align="left"><span class="font"><strong> 照片：</strong></span></div></td>
       <td rowspan="6" class="classtd">
			<%
			pic=rsu("photo")
			if Trim(pic)="" or isnull(rsu("photo")) then
			   response.write "<img width=" & session("yuangongimgw") & " src=" & "../images/noimg.png" & ">" 
			else
				response.write "<a href=" & pic & " target='_blank' title='点击图片查看原图'><img src=" & pic & " width=" & session("yuangongimgw") & "></a>"
			end if
			%></td>
	  </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong> 性别：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <% riqi=mid(rsu("idcard"),7,8)
             xingbie=right(rsu("idcard"),2)
             if cint(left(xingbie,1)) mod 2=0 then
                 response.write "女"
             else
                 response.write "男"
             end if %>
		  </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>出生日期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%response.write mid(riqi,1,4)&"年"&mid(riqi,5,2)&"月"&mid(riqi,7,2)&"日"%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>身份证号：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left" title="<%=rsu("idcard")%>"><%idcard=Left(rsu("idcard"),6)&"********"&Right(rsu("idcard"),4)%><%=idcard%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong> 所属公司：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("company")%></div></td>
    </tr>

    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>所属部门：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("department")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>职位：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("position")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>入职时间：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <%=rsu("ruzhi")%> &nbsp;	
		  <%
			if not isnull(rsu("ruzhi")) then 
			 tempz=Datediff("D",now(),rsu("ruzhi"))
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
			   if rsu("ruzhi") >now() then 
				response.write "<B><font color=red>录入错误！</font></B>"
			   elseif tempy=0 and tempm<>0 then
					response.write "<B>司龄<font color=#2E8B57>" & tempm & "月</font></B>"
			   elseif tempy=0 and tempm=0 then
					response.write "<B><font color=#006400>新员工</font></B>"
				else
					response.write "<B>司龄<font color=#0000FF>" & tempy & "年</font></B>"
			   end if
			end if
			%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>最高学历：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("education")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>手机号码：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("phone")%></div></td>
    </tr>
	<tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>微信：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("weixin")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>QQ：</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("qq")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>籍贯地址：</strong></span></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left"><%=rsu("place1")%>-<%=rsu("place2")%>-<%=rsu("place3")%></div></td>
    </tr>
	<tr>
	  <td class="classtd"><div align="left"><span class="font"><strong>居住地址：</strong></span></div></td>
	  <td colspan="3" class="classtd"><div align="left"><%=rsu("place4")%>-<%=rsu("place5")%>-<%=rsu("place6")%></div></td>
    </tr>
	<tr>
	  <td align="center" class="classtd"><div align="left"><span class="font"><strong>设备记录：</strong></span></div></td>
<%
	sqll="select * from sb_log where ssbm like '%"& rsu("xingming") &"%' or user like '%"& rsu("xingming") &"%' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=4 valign=middle class=classtd>该员工没有任何资产记录！</td>"
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
	  <td colspan="3" class="classtd" align="center"><div align="left">
	    <% i=0
			do while not rsuu.eof 
				'下面是z判断类型是借出、归还的话，与其他的显示不同。'
				if rsuu("leixing")="借出" or rsuu("leixing")="归还" then %>
	    <%=rsuu("datetime")%>&nbsp;：<font color="red">【<%=rsuu("leixing")%>】</font>资产编号为<font color="blue">【<%=rsuu("zcid")%>】</font>的资产。<br>
	    		<%elseif rsuu("leixing")="转移" then %>
	    <%=rsuu("datetime")%>&nbsp;：将<font color="blue"><%=rsuu("zcid")%></font>的资产由<font color="red"><%=rsuu("ssbm")%></font><%=rsuu("leixing")%>到<font color="blue"><%=rsuu("user")%></font>。<br>
	    		<% end if
				rsuu.movenext()
				i=i+1
				if i>=rsuu.pagesize then exit do
            loop %>
	    </div>
        <%if rsuu.pagecount>1 then%>
        <div align="center"> 页次：<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>页，共有<font color="red"><%=rsuu.recordcount%></font>条记录。 <a href="info.asp?id=<%=rsu("id")%>&page=1">首页</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=epage-1%>">前一页</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=epage+1%>">后一页</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>">末页</a> </div>
        <%end if
		   end if%>
      </td>
    </tr>
	<tr>
      <td colspan="4" align="center" bgcolor="#4685CA" class="classfooter"><a href="#" class="STYLE7" height="25" onClick="javascript :history.back(-1);">&lt;&lt;&lt; 返回列表 &gt;&gt;&gt;</a></td>
    </tr>
  </form>
</table>
	<div id="tip" style="position:fixed; visibility:hidden; background:#9F97FF;"><%=zc%></div>
<%End Sub
end if%>