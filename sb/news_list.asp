<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
on error resume next
call admintop()
if Instr(session("juese"),"|102,")=0 then 
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
<!--#include file="../inc/displaytip.asp"-->
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="100%" bgcolor="#183789">
  
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height=25  align=left colspan=5 class=classtop1><img src="../images/table.gif" width="16" height="14"> <img src="../images/jt.gif" width="5" height="6"> &nbsp;<b>管理资产</b> <a href="dj.asp"> <img src="../images/add.png"> </a> &nbsp;(<a href="baofei.asp"><font color="#FFFFFF">管理报废资产</font></a>) </td>
        </tr>
        <form name=form2 method=post action=news_list.asp>
          <tr>
            <td class="classtd" align="center"><select name="anclassid" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
                <option selected style="background-color:#B0E2FF">--快速跳转--</option>
                <option value=news_list.asp style="background-color:#B0E2FF">查看全部资产</option>
                <option value="?synx=zaibao" style="background-color:#B0E2FF">未超过5年资产</option>
                <option value="?synx=view" style="background-color:#B0E2FF">超过5年资产</option>
                <%
							set rs=conn.execute("select s_id,s_name from [admin_bsort] order by s_paixu desc")
							if not rs.eof then
								do while not rs.eof 
						%>
                <option value="?s_name=<%=server.urlencode(Trim(rs("s_name")))%>"><%=rs("s_name")%></option>
                <%		rs.movenext
								loop
							end if
						rs.close:set rs=nothing
						%>
              </select></td>
            <td class="classtd"><input type=button class="button" onClick="location.href='upload/资产汇总表.xls'" value="模板" <%if Instr(session("juese"),"|109,")=0 then%>hidden disabled<%end if%> >
              <input type=button class="button" onClick="location.href='import.asp'" value="导入" onmousemove="position();" onmouseout="hide();" <%if Instr(session("juese"),"|109,")=0 then%>hidden disabled<%end if%> >
              <input type="button" class=button size=3 value='导出未超5年' name=iall onClick="window.location.href='excel_cx.asp?ly=2&sj=0';" <%if Instr(session("juese"),"|110,")=0 then%> hidden disabled<%end if%> >
              <input type="button" class=button  size=3 value='导出超5年' name=ifive onClick="window.location.href='excel_cx.asp?ly=2&sj=1';" <%if Instr(session("juese"),"|110,")=0 then%> hidden disabled<%end if%> ></td>
            <td colspan="4" class="classtd" >分类：
              <select name=s_name1>
                <option value="all">全部分类</option>
                <%
				set rs=conn.execute("select * from [admin_sort] order by s_paixu desc")
				if not rs.eof then
				do while not rs.eof 
				%>
                <option value="<%=Trim(rs("s_name"))%>">【<%=rs("s_bname")%>】<%=rs("s_name")%></option>
                <%	rs.movenext
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
                <option value="8">按MAC地址</option>
                <option value="9">按硬盘SN号</option>
              </select>
              关键词：
              <input name="gjc" size="15" class=form>
              <input type=submit name=tiaojian value=" 查 询 " class=button>
              <INPUT type="button" class=button  size=3 value='导出结果' name=dcjg onClick="window.location.href='excel_cx.asp?pp=<%=request("s_name1")%>&fenlei=<%=request("fenlei")%>&gjc=<%=request("gjc")%>&ly=2&sj=2';" <%if Instr(session("juese"),"|110,")=0 then%> hidden disabled<%end if%> ></td>
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
	synx=replace(request("synx"),"'","’")
	gjc=replace(request("gjc"),"'","’")
	fenlei=replace(request("fenlei"),"'","’")
		  
		  
	gourl="s_name="&s_name&"&s_name1="&s_name1&"&synx="&synx&"&gjc="&gjc&"&fenlei="&fenlei&""
		  		  
	set rs=server.CreateObject("adodb.recordset")

			   mystr=split(session("rank"),", ")
			   for i=0 to ubound(mystr)
			   rk = "ssbm= '" & mystr(i) & "' or " + rk
			   next
			   rk = rk & " False"

	if synx="view" then 
	sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,date())>60 and (" & rk & ")"
	elseif synx="zaibao" then
	sql="select * from sbxx where zt<>'报废' and datediff('m',gzsj,date())<=60 and (" & rk & ")"
	else
	sql="select * from sbxx where zt<>'报废' and (" & rk & ")"
	end if
		if s_name<>"" then sql=sql&" and sbcs like '%"&s_name&"%'"
		if s_name1<>"all" then sql=sql&" and pp like '%"&s_name1&"%'"
		If gjc<>"" and fenlei="1" Then sql=sql&" and (sbbh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="2" Then sql=sql&" and (ccbh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="3" Then sql=sql&" and (ssbm like '%"&gjc&"%')"
		If gjc<>"" and fenlei="4" Then sql=sql&" and (syz like '%"&gjc&"%' or gh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="5" Then sql=sql&" and (cfdd like '%"&gjc&"%')"
		If gjc<>"" and fenlei="6" Then sql=sql&" and (zt like '%"&gjc&"%')"
		If gjc<>"" and fenlei="7" Then sql=sql&" and (xh like '%"&gjc&"%')"
		If gjc<>"" and fenlei="8" Then sql=sql&" and (mac like '%"&gjc&"%')"
		If gjc<>"" and fenlei="9" Then sql=sql&" and (hddsn like '%"&gjc&"%')"

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
				sql=sql&" order by cfdd "&request("order6")
		  		fyorder="order6="&request("order6")
			elseif request("order7")<>"" then
				sql=sql&" order by baoxiu "&request("order7")
		  		fyorder="order7="&request("order7")
			elseif request("order8")<>"" then
				sql=sql&" order by syz "&request("order8")
		  		fyorder="order8="&request("order8")
			elseif request("order9")<>"" then
				sql=sql&" order by zt "&request("order9")
		  		fyorder="order9="&request("order9")
		  	else
		  		sql=sql&" order by id desc"
			end if
		  
		rs.open sql,conn, 1, 1
	%>
        <tr class=classtop1>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "1","ID",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "2","资产编号",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "3","资产类别",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "4","资产型号",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "5","所属公司",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "6","存放位置",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "7","保修剩余",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "8","使用人",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "9","状态",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>详情</strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>操作</strong></td>
        </tr>
        <%
	   
	if rs.eof and rs.bof then
		response.write "<tr><td colspan=11 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>数据为空！请添加。</font></div></td></tr>"
	Else
		if not isempty(request("page")) then   
			pagecount=cint(request("page"))   
		else   
			pagecount=1
		end if
		rs.pagesize=session("liebiao")
		rs.AbsolutePage=pagecount
			do while not rs.eof%>
        <form name="form1" id="form1" method="post" action="" target="_blank">
          <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
            <td align="center" ><%=rs("id")%>
              <%s_id=rs("id")%></td>
            <td align="center"><%=Replace(rs("sbbh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%>
              <%if rs("pic") <> "" then%>
              <a href="<%=rs("pic")%>" target="_blank"><img src="../images/img.png" height="10" title="点击查看该资产图片"></a>
              <%end if%></td>
            <td align="center" ><%=(rs("pp"))%></td>
            <td align="center"><%=Replace(rs("xh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center"><%ssbm=rs("ssbm")%>
              <%=Replace(ssbm,gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center"><%=Replace(rs("cfdd"),gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center"><%
						if not isnull(rs("baoxiu")) then
							synx1=datediff("d",date(),rs("baoxiu"))
							nyrn=int(abs(synx1 / 365))
							nyry=int(abs((synx1 mod 365) / 30))
							nyrr=abs((synx1 mod 365) mod 30)
							if nyrn = 0 then
								if nyry = 0 then
									xs=nyrr & "天"
								else
									xs=nyry & "个月" & nyrr & "天"
								end if
						   else 
								if nyry = 0 then
									xs=nyrn & "年" & "零" & nyrr & "天"
								else
									xs=nyrn & "年" & nyry & "个月" & nyrr & "天"
								end if
						   end if
							if not isnull(rs("baoxiu")) then
									if synx1>=0 then
										response.write "<font color=blue>" & xs & "</font>"
									else
										response.write "<b><font color=red>过期" & xs & "</font></b>"
									end if
							end if
						else
							response.write "-"
						end if
					%></td>
            <td align="center">
			<%if rs("sbcs")="服务器" then%>
              <%=Replace(rs("ip"),gjc,"<font color=red><b>"&gjc&"</b></font>")%>
			<%else%>
				<%=Replace(rs("syz"),gjc,"<font color=red><b>"&gjc&"</b></font>") %>
			<% end if %></td>
            <td align="center"><%
				dim zt
				zt=rs("zt")
				sqlzt="select * from admin_state where ztm='" & zt & "'"
				set rszt=server.CreateObject("adodb.recordset")
				rszt.Open sqlzt, conn, 1, 1
				response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"
				rszt.close
				set rszt=nothing
			%></td>
            <td align="center" ><input class=button type="button" name="info2" value="详情" onclick="javascript:window.location.href='info.asp?id=<%=s_id%>'"/></td>
            <td align="center" ><input class=button type="button" value="改" onclick="javascript:window.location.href='xg.asp?id=<%=s_id%>&page=<%=pagecount%>&qx=<%=s_id%>'" 
				<%if Instr(session("juese"),"|103,")=0 then%> disabled hidden<%end if %> >
              <input class=button type="button" value="借" onclick="javascript:window.location.href='jiechu.asp?id=<%=s_id%>&page=<%=pagecount%>'" 
				<%if Instr(session("juese"),"|104,")=0 or zt<>"闲置待发" then%> disabled hidden <%end if%> >
              <input class=button type="button" value="还" onclick="javascript:window.location.href='guihuan.asp?id=<%=s_id%>&page=<%=pagecount%>'" 
				<%if Instr(session("juese"),"|105,")=0 or zt<>"正常使用" then%> disabled hidden <%end if%> >
              <input class=button type="button" value="转" onclick="javascript:window.location.href='zhuan.asp?id=<%=s_id%>&page=<%=pagecount%>'" 
				<%if Instr(session("juese"),"|107,")=0 or zt<>"正常使用" then%> disabled hidden <%end if%> >
              <input class=button type="button" value="调" onclick="javascript:window.location.href='diao.asp?id=<%=s_id%>&page=<%=pagecount%>'" 
				<%if Instr(session("juese"),"|106,")=0 or zt<>"闲置待发" then%> disabled hidden <%end if%> >
              <input class="button" type="button" name="Submit2" value="删" onclick="{if(confirm('确认删除么?')){location.href='news_list.asp?action=del&amp;s_id=<%=rs("id")%>&amp;sbbh=<%=rs("sbbh")%>&amp;gjc=<%=gjc%>&amp;s_name=<%=s_name%>&amp;page=<%=request("page")%>';}return false;}"
				<%if Instr(session("juese"),"|111,")=0 or zt="正常使用" then%> disabled hidden <%end if%> >
              <%if Instr(session("juese"),"|103,")=0 and Instr(session("juese"),"|104,")=0 and Instr(session("juese"),"|105,")=0 and Instr(session("juese"),"|106,")=0 and Instr(session("juese"),"|107,")=0 and Instr(session("juese"),"|111,")=0 then response.write "<img src=../images/note.gif>无权操作" end if %></td>
          </tr>
          <%
				rs.movenext
				j=j+1
				if j>=rs.pagesize then exit do
			loop%>
        </form>
        <form action="news_list.asp?<%=fyorder%>&<%=gourl%>" method="post">
          <tr class="botbg">
            <td height="25" align="center" colspan=15><div align="center"> 共有 <b><%=rs.recordcount%></b> 条记录, 页次: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
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
                <a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
                <% end if %>
                <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
                <a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a>
                <%end if%>
                <% if pagecount<>1 and rs.pagecount<>pagecount then%>
                <a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
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
        <%
	End If
	css=rs.pagesize
	rs.close
	set rs=Nothing
	%>
      </table></td>
  </tr>
</table>
<%end if%>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <tr class="classfooter">
    <td colspan=15><div>当前执行SQL语句：<font color="red">
        <%response.write sql%>

        </font></div></td>
  </tr>
</table>
<div id="tip" style="position:fixed; visibility:hidden; background:#9F97FF;width:120px;"><strong>导入文件请先下载模板，修改后上传到/sb/upload/目录下替换，最后再点击“导入”按钮。</strong></div>