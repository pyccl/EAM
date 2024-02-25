<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<%
on error resume next
call admintop()
if Instr(session("juese"),"|202,")=0 then 
	js=session("juese")%>
<!--#include file="../inc/quanxian.asp"-->
<!--#include file="../inc/function.asp"-->
<%
  response.end
else
dim action, s_id
s_id=request.QueryString("s_id")
action=request("action")

select case action

case "del"
conn.execute "delete from sbxx where id="&s_id
Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="删除资产"
rsa("alog")="删除编号为<font color=red>【"&request("sbbh")&"】</font>的资产"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
if request("page")<>"" then 
response.Redirect "news_list.asp?gjc="&gjc&"&s_name="&s_name&"&page="&request("page")&""
else
response.Redirect "news_list.asp?gjc="&gjc&"&s_name="&s_name&""
end if 
response.end 
end select
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="100%" bgcolor="#183789">
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="left" colspan="4" class="classtop1"><img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6">&nbsp;<strong>资产折旧表</strong></td>
        </tr>
        <form name=form2 method=post action=zhejiu_list.asp>
          <tr>
            <td class="classtd" align="center"><select name="anclassid" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
                <option selected>--快速跳转--</option>
                <option value=zhejiu_list.asp style="background-color:#B0E2FF">查看全部资产</option>
                <option value="?synx=zjw" style="background-color:#B0E2FF">查看折旧完资产</option>
                <option value="?synx=zzj" style="background-color:#B0E2FF">查看正折旧资产</option>
                <%
		  set rs=conn.execute("select s_id,s_name from [admin_bsort] order by s_paixu desc")
           if not rs.eof then
           do while not rs.eof 
          %>
                <option value="?s_name=<%=server.urlencode(Trim(rs("s_name")))%>"><%=rs("s_name")%></option>
                <%rs.movenext
            loop
            end if
           rs.close:set rs=nothing
			%>
              </select></td>
            <td class="classtd">快速导出：<input type="button" class=button  size=3 value='已折完' name=iall onClick="window.location.href='excel_zj.asp?ly=1&synx=0';">
            <input type="button" class=button  size=3 value='正在折' name=iall2 onClick="window.location.href='excel_zj.asp?ly=1&synx=1';"></td>
            <td class="classtd">时间：<input name="sj1" id="sj1" class="form" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'sj2\')||\'%y-%M-%d\'}'})" style="WIDTH: 80px"/>
            -
              <input id="sj2" class="form" type="text" name="sj2" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'sj1\')}',maxDate:'%y-%M-%d'})" style="WIDTH: 80px"/>
              分类：
<select name=s_name1>
                <option value="all">全部分类</option>
                <%
			set rs=conn.execute("select * from [admin_sort] order by s_paixu desc")
           if not rs.eof then
           do while not rs.eof 
          %>
                <option value="<%=Trim(rs("s_name"))%>">【<%=rs("s_bname")%>】<%=rs("s_name")%></option>
                <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
              </select>
              <select name="fenlei">
                <option value="1">按资产编号</option>
                <option value="2">按序列号</option>
                <option value="3">按所属公司</option>
                <option value="4" selected>按使用人</option>
                <option value="5">按存放位置</option>
                <option value="6">按资产状态</option>
                <option value="7">按资产型号</option>
              </select>
关键词：
<input name="gjc" size="15" class=form>
<input type=submit name=tiaojian value=" 查 询 " class=button></td>
            <td class="classtd" >
				<INPUT type="button" class=button  size=3 value='导出结果' name=dcjg onClick="window.location.href='excel_zj.asp?ly=2&synx=2&pp=<%=request("s_name1")%>&fenlei=<%=request("fenlei")%>&gjc=<%=request("gjc")%>&sj1=<%=request("sj1")%>&sj2=<%=request("sj2")%>';" <%if Instr(session("juese"),"|203,")=0 then%> hidden disabled<%end if%> >
			</td>
          </tr>
        </form>
      </table>
      <table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
        <%
		   
	pagecount=request("page")
	if pagecount<1 or pagecount="" then
	  pagecount="1"
	end if
		   
s_name=replace(request("s_name"),"'","’")
s_name1=replace(request("s_name1"),"'","’")
dept=replace(request("dept"),"'","’")
sj1=request("sj1")
sj2=request("sj2")
synx=replace(request("synx"),"'","’")
gjc=replace(request("gjc"),"'","’")
fenlei=replace(request("fenlei"),"'","’")
		  
gourl="s_name="&s_name&"&s_name1="&s_name1&"&synx="&synx&"&gjc="&gjc&"&fenlei="&fenlei&"&sj1="&sj1&"&sj2="&sj2&""
		  		  
set rs=server.CreateObject("adodb.recordset")

	   mystr=split(session("rank"),", ")
	   for i=0 to ubound(mystr)
	   rk = "ssbm= '" & mystr(i) & "' or " + rk
	   next
	   rk = rk & " False"

	if synx="zzj" then 
	sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,now()) < zhejiu and (" & rk & ")"
	elseif synx="zjw" then
	sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,now()) >= zhejiu and (" & rk & ")"
	else
	sql="select * from sbxx where zt<>'报废' and (" & rk & ")"
	end if
if s_name<>"" then sql=sql&" and sbcs like '%"&s_name&"%'"
	if sj1 <> "" and sj2 <> "" then
		sql=sql&" and (gzsj >= #" & sj1 &"# and (gzsj <= #" & sj2 & "# or dateadd('" & "m" & "',iif(isnull(zhejiu),0,zhejiu),gzsj) <= #" & sj2 & "#))"
	else
		if sj1 <> "" and sj2 = "" then
			sql=sql&" and (gzsj >= #" & sj1 &"#)"
		end if
	end if
	if s_name1<>"all" then sql=sql&" and pp like '%"&s_name1&"%'"
	If gjc<>"" and fenlei="1" Then sql=sql&" and (sbbh like '%"&gjc&"%')"
	If gjc<>"" and fenlei="2" Then sql=sql&" and (ccbh like '%"&gjc&"%')"
	If gjc<>"" and fenlei="3" Then sql=sql&" and (ssbm like '%"&gjc&"%')"
	If gjc<>"" and fenlei="4" Then sql=sql&" and (syz like '%"&gjc&"%')"
	If gjc<>"" and fenlei="5" Then sql=sql&" and (cfdd like '%"&gjc&"%')"
	If gjc<>"" and fenlei="6" Then sql=sql&" and (zt like '%"&gjc&"%')"
	If gjc<>"" and fenlei="7" Then sql=sql&" and (xh like '%"&gjc&"%')"

			if request("order1")<>"" then
				sql=sql&" order by id "&request("order1")
		  		fyorder="order1="&request("order1")
			elseif request("order2")<>"" then
				sql=sql&" order by sbbh "&request("order2")
		  		fyorder="order2="&request("order2")
			elseif request("order3")<>"" then
				sql=sql&" order by pp "&request("order3")
		  		fyorder="order3="&request("order3")
			elseif request("order4")<>"" then
				sql=sql&" order by xh "&request("order4")
		  		fyorder="order4="&request("order4")
			elseif request("order5")<>"" then
				sql=sql&" order by ssbm "&request("order5")
		  		fyorder="order5="&request("order5")
			elseif request("order6")<>"" then
				sql=sql&" order by gzsj "&request("order6")
		  		fyorder="order6="&request("order6")
			elseif request("order7")<>"" then
				sql=sql&" order by price "&request("order7")
		  		fyorder="order7="&request("order7")
			elseif request("order8")<>"" then
				sql=sql&" order by zhejiu "&request("order8")
		  		fyorder="order8="&request("order8")
			elseif request("order9")<>"" then
				sql=sql&" order by canzhilv "&request("order9")
		  		fyorder="order9="&request("order9")
		  	else
		  		sql=sql&" order by id desc"
			end if
		  
		  rs.open sql,conn, 1, 1
%>
        <tr class=classtop1>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "1","ID",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "2","资产编号",pagecount,gourl,""%>
          </strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "3","资产类别",pagecount,gourl,""%>
          </strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "4","资产型号",pagecount,gourl,""%>
          </strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "5","所属公司",pagecount,gourl,""%>
          </strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "6","购置时间",pagecount,gourl,""%>
          </strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "7","价格",pagecount,gourl,""%>
          </strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>
            <%toptitle "8","折旧月",pagecount,gourl,""%>
          </strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>截至日期</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>已折月</strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>残值率</strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>残值</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>净值</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>本月折旧</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>累计折旧</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>月折旧额</strong></td>
          <td nowrap align="center" background="../images/th_bg.gif"><strong>详情</strong></td>
        </tr>
        <%
if rs.eof and rs.bof then
	response.write "<tr><td colspan=17 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>数据为空！请添加。</font></div></td></tr>"
Else
	if not isempty(request("page")) then   
		pagecount=cint(request("page"))   
	else   
		pagecount=1
	end if
	rs.pagesize=session("liebiao")
	rs.AbsolutePage=pagecount
		do while not rs.eof
				if len(sj1)<>0 and len(sj2)<>0 then
					if datediff("m",rs("gzsj"),cdate(sj2)) > rs("zhejiu") then
						jzsj=DateAdd("m",rs("zhejiu"),rs("gzsj"))
					else
						jzsj=cdate(sj2)
					end if
				else
					if datediff("m",rs("gzsj"),now()) > rs("zhejiu") then
						jzsj=DateAdd("m",rs("zhejiu"),rs("gzsj"))
					else
						jzsj=date()
					end if
				end if
		   %>
			<form name="form1" id="form1" method="post" action="" target="_blank">
			  <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
				<td align="center" ><%=rs("id")%><%s_id=rs("id")%></td>
				<td align="center"><%=Replace(rs("sbbh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%>
				  <%if rs("pic") <> "" then%>
				  <a href="<%=rs("pic")%>" target="_blank"><img src="../images/img.png" height="10" title="点击查看该资产图片"></a>
			    <%end if%></td>
				<td align="center"><%=(rs("pp"))%></td>
				<td align="center"><%=Replace(rs("xh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
				<td align="center"><%ssbm=rs("ssbm")%>
			    <%=Replace(ssbm,gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
				<td align="center"><%if isnull(rs("gzsj")) then response.write "-" else response.write rs("gzsj") end if%></td>
				<td align="center"><%if isnull(rs("price")) then response.write "-" else response.write FormatNumber(rs("price"),2) end if%></td>
				<td align="center">
					<%
					if isnull(rs("zhejiu")) then
						 response.write "-"
					else
						 response.write rs("zhejiu")
					end if
					%>
				</td>
				<td align="center"><%
						if isnull(rs("gzsj")) or isnull(rs("zhejiu")) then
							response.write "-"
						else
							if datediff("m",rs("gzsj"),jzsj)>=rs("zhejiu") then
								response.write "<font color=red>" & jzsj & "</font>"
							else
								response.write jzsj
							end if
						end if
					%></td>
				<td align="center"><%
						if isnull(rs("gzsj")) then
							response.write "-"
						else
							if len(sj2)=0 then
								if datediff("m",rs("gzsj"),now()) < rs("zhejiu") or isnull(rs("zhejiu")) then
									response.write datediff("m",rs("gzsj"),now())
								else
									response.write "<font color=red>" & datediff("m",rs("gzsj"),now()) & "</font>"
								end if
							else
								if datediff("m",rs("gzsj"),cdate(sj2)) < rs("zhejiu") or isnull(rs("zhejiu")) then
									response.write datediff("m",rs("gzsj"),cdate(sj2))
								else
									response.write "<font color=red>" & datediff("m",rs("gzsj"),cdate(sj2)) & "</font>"
								end if
							end if
						end if
					%></td>
				<td align="center">
				<%
					dim cz
					cz=rs("sbcs")&rs("pp")
					sqlcz="select * from admin_sort where s_bname + s_name='" & cz & "'"
					set rscz=server.CreateObject("adodb.recordset")
					rscz.Open sqlcz, conn, 1, 1
						if isnull(rscz("canzhilv")) then
							response.write "-"
				   			czl=""
						else
							if rscz.recordcount = 1 then
				   				czl=rscz("canzhilv")
								response.write czl & "%"
							else
								response.write "<font color = red>错误</font>"
							end if
						end if
					rscz.close
					set rscz=nothing
				%>
				</td>
				<td align="center">
					
				<%
					if czl="" or isnull(rs("price")) then
						response.write "-"
					else
						response.write FormatNumber(rs("price")*czl/100,2)
					end if
				%>
				
				</td>
				<td align="center"><%
						if isnull(rs("gzsj")) or isnull(rs("price")) or isnull(rs("zhejiu")) or czl = "" then
							response.write "-"
						else
							if datediff("m",rs("gzsj"),jzsj)>=rs("zhejiu") then
								response.write FormatNumber(rs("price")*czl/100,2)
							else
								response.write FormatNumber((rs("price")-(((rs("price")-(rs("price")*czl/100))/rs("zhejiu"))*(datediff("m",rs("gzsj"),jzsj)))),2)
							end if
						end if
					%></td>
				<td align="center">
					<%if isnull(rs("gzsj")) or isnull(rs("price")) or isnull(rs("zhejiu")) or czl = "" then
						 response.write "-"
					else
						 if datediff("m",rs("gzsj"),jzsj) >= rs("zhejiu") then
							response.write "-"
						 else
							response.write FormatNumber((rs("price")-(rs("price")*czl/100))/rs("zhejiu"),2)
						 end if
					end if%>
				</td>
				<td align="center">
					
				  <%
						if isnull(rs("gzsj")) or isnull(rs("price")) or isnull(rs("zhejiu")) or czl = "" then
							response.write "-"
						else
							response.write FormatNumber(((rs("price")-(rs("price")*czl/100))/rs("zhejiu"))*(datediff("m",rs("gzsj"),jzsj)),2)
						end if
					%>
					
				</td>
				<td align="center"><%
						if isnull(rs("price")) or isnull(rs("zhejiu")) or czl="" then
							response.write "-"
						else
							response.write FormatNumber((rs("price")-(rs("price")*czl/100))/rs("zhejiu"),2)
						end if
					%></td>
				<td align="center"><input class=button type="button" name="info2" value="详情" onclick="javascript:window.location.href='info.asp?id=<%=s_id%>'"/></td>
			  </tr>
			  <%
			rs.movenext
			j=j+1
			if j>=rs.pagesize then exit do
		loop%>
			</form>
			<form action="zhejiu_list.asp?<%=fyorder%>&<%=gourl%>" method="post">
			  <tr class="botbg">
				<td height="25" align="center" colspan="17"><div align="center"> 共有数据 <b><%=rs.recordcount%></b> 条, 页次: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
					当前从第
					<%
			   if pagecount<=1 then
			   response.write "<font color=red>1</font>"
			   else
			   response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
			   end if
			  %>
					条开始。
					
					<% if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
					<a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
					<% end if %>
					<% if rs.pagecount>1 and rs.pagecount=pagecount then %>
					<a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.png"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a>
					<%end if%>
					<% if pagecount<>1 and rs.pagecount<>pagecount then%>
					<a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.png"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
					<% end if%>
					<%if rs.pagecount>1 then%>
						&nbsp;直接到第
						<%if rs.pagecount>15 then %>
							<input name="page" value="1" size="5" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
						<% else %>
							<select name="page">
							  <%for i=1 to rs.pagecount%>
								<option value="<%=i%>"><%=i%></option>
							  <%next%>
							</select>
						<%end if%>
						页
						<input type="submit" name="go" value="跳转" class=button>
					<%end if%>
			    </div></td>
		</form>
			<%End If %>
        <tr class="classfooter">
          <td colspan="17"><div>当前执行SQL语句：<font color="red"><%response.write sql%></font></div></td>
        </tr>
<%
css=rs.pagesize
rs.close
set rs=Nothing
%>
      </table></td>
  </tr>
</table>
<%end if%>
