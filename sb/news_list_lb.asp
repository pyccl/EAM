<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">

<%
on error resume next
call admintop()
if Instr(session("juese"),"|201,")=0 then %>
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
if request("page")<>"" then 
response.Redirect "news_list_lb.asp?gjc="&gjc&"&s_name="&s_name&"&page="&request("page")&""
else
response.Redirect "news_list_lb.asp?gjc="&gjc&"&s_name="&s_name&""
end if 
response.end 
end select
%>

<body>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="100%" bgcolor="#183789">
  
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height=25  align=left colspan=17  class=classtop1><img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6">&nbsp;<b>管理标签</b></td>
        </tr>
        <form name=form2 method=post action=news_list_lb.asp>
          <tr>
            <td class="classtd" align="center"><select name="anclassid" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
                <option selected style="background-color:#B0E2FF">--快速跳转--</option>
                <option value=news_list_lb.asp  style="background-color:#B0E2FF">查看全部资产</option>
                <option value="?synx=view" style="background-color:#B0E2FF">超过5年资产</option>
                <%set rs=conn.execute("select s_id,s_name from [admin_sort] order by s_paixu desc")
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
            <td   class="classtd" align="center"><script language="javascript">
function getlabel()
{
document.form1.action="qrcode1.asp";
document.form1.submit();

}
</script>
              <input class=button type="button" value="标签打印" language="javascript" onclick="getlabel()"/>
            &nbsp;<INPUT type="button" class=button  size=3 value='重置打印' name=Submit5  onClick="window.location.href='cz_dyzt.asp?zt=cz';return confirm('确定重置打印?');"></td>
            <td class="classtd" colspan="4" >分类：
              <select name=s_name1>
                <option value="0">全部分类</option>
                <%set rs=conn.execute("select s_id,s_name,s_bname from [admin_sort] order by s_paixu desc")
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
              &nbsp;
              </select>
              <select name=fenlei>
                <option value="1">按资产编号</option>
                <option value="2">按序列号</option>
                <option value="3">按所属公司</option>
                <option value="4" selected="selected">按使用人</option>
                <option value="5">按机器名</option>
                <option value="6">按资产位置</option>
                <option value="7">按资产状态</option>
              </select>
              &nbsp;&nbsp;检索关键词：
              <input name="gjc" size="15" class=form>
              <input type=submit name=tiaojian value=" 查 询 " class=button></td>
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
synx=replace(request("synx"),"'","’")
gjc=replace(request("gjc"),"'","’")
fenlei=replace(request("fenlei"),"'","’")
		  
gourl="s_name="&s_name&"&synx="&synx&"&gjc="&gjc&"&fenlei="&fenlei&""
	
set rs=server.CreateObject("adodb.recordset")
		   
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "ssbm= '" & mystr(i) & "' or " + rk
		   next
		   rk = rk & " False"
		   
if synx="view" then 
sql="select * from sbxx where datediff('m',gzsj,now())>60 and not dyzt and zt<>'报废' and (" & rk & ")"
else
sql="select * from sbxx where not dyzt and zt<>'报废' and (" & rk & ")"
end if

if s_name<>"0" And s_name<>"" then sql=sql&" and pp like '%"&s_name&"%'"
If gjc<>"" and fenlei="1" Then sql=sql&" and (sbbh like '%"&gjc&"%')"
If gjc<>"" and fenlei="2" Then sql=sql&" and (ccbh like '%"&gjc&"%')"
If gjc<>"" and fenlei="3" Then sql=sql&" and (ssbm like '%"&gjc&"%')"
If gjc<>"" and fenlei="4" Then sql=sql&" and (syz like '%"&gjc&"%')"
If gjc<>"" and fenlei="5" Then sql=sql&" and (jqm like '%"&gjc&"%')"
If gjc<>"" and fenlei="6" Then sql=sql&" and (cfdd like '%"&gjc&"%')"
If gjc<>"" and fenlei="7" Then sql=sql&" and (zt like '%"&gjc&"%')"

		  
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
				sql=sql&" order by department "&request("order6")
		  		fyorder="order6="&request("order6")
			elseif request("order7")<>"" then
				sql=sql&" order by cfdd "&request("order7")
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
<script language="javascript" src="../js/check.js"></script>
        <tr class=classtop1>
          <td nowrap height="15" align="center" width="5%"  background="../images/th_bg.gif"><strong><a href="javascript:void(0);" onclick="checkAll()"><font color="yellow">全</font></a>\<a href="javascript:void(0);" onclick="uncheckAll()"><font color="yellow">否</font></a></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "1","ID",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "2","资产编号",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "3","资产类别",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "4","资产型号",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "5","所属公司",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "6","所属部门",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "7","存放位置",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "8","使用人",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong><%toptitle "9","状态",pagecount,gourl,""%></strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>二维码</strong></td>
          <td nowrap height="15" align="center" background="../images/th_bg.gif"><strong>资产信息</strong></td>
        </tr>
        <%if rs.eof and rs.bof then
			response.write "<tr><td colspan=13 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>数据为空！请添加。</font></div></td></tr>"
		Else
			if not isempty(request("page")) then   
				pagecount=cint(request("page"))   
			else   
				pagecount=1
			end if
		pgnum=cint(request("pagenum"))
			if pgnum=0 or isnull(pgnum) then
				rs.pagesize=session("biaoqian")
			else
				rs.pagesize=pgnum
			end if
		rs.AbsolutePage=pagecount
				do while not rs.eof%>
        <form name="form1" id="form1" method="post" action="" target="_blank">
          <%if rs("dyzt")=false then%>
          <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
            <td align="center"><input name="lbid" id="lbid" type="checkbox" <%if rs("dyzt")=true then%>disabled<%end if%> value=<%=rs("id")%> >
              <%if rs("dyzt")=true then%>
              <%end if%></td>
            <td align="center"><%=rs("id")%></td>
            <td align="center"><%s_id=rs("id")%>
              <%=Replace(rs("sbbh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%><%if rs("pic") <> "" then%><a href="<%=rs("pic")%>" target="_blank"><img src="../images/img.png" height="12" title="点击查看该资产图片"></a><%end if%></td>
            <td align="center" ><%=(rs("pp"))%></td>
            <td align="center"><%=Replace(rs("xh"),gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center"><%ssbm=rs("ssbm")%>
              <%=Replace(ssbm,gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center"><%=rs("department")%></td>
            <td align="center" ><%=Replace(rs("cfdd"),gjc,"<font color=red><b>"&gjc&"</b></font>")%></td>
            <td align="center">
				<%if rs("sbcs")="服务器" then%>
					<%=Replace(rs("ip"),gjc,"<font color=red><b>"&gjc&"</b></font>")%>
				<%else%>
					<%=Replace(rs("syz"),gjc,"<font color=red><b>"&gjc&"</b></font>")%>
				<%end if%>
			</td>
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
            <td align="center" ><input class=button type="button" name="qrcodedp" value="二维码" onclick="javascript:window.open('qrcode.asp?id=<%=s_id%>','_blank')"/></td>
            <td align="center" ><input class=button type="button" name="assetdp" value="详细" onclick="javascript:window.open('../asset.asp?id=<%=s_id%>','_blank')"/></td>
          </tr>
          <%end if%>
          <%
rs.movenext
j=j+1                                                                     
if j>=rs.pagesize then exit do                                                           
loop
%>
        </form>
        <form action="news_list.asp?<%=fyorder%>&<%=gourl%>" method="post">
          <tr class=botbg>
            <td height="25" align="center" colspan=15><div align="center"> 共有数据 <b><%=rs.recordcount%></b> 条, 页次: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b>, 
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
                &nbsp; 直接到第
                <%if rs.pagecount>15 then %>
                <input name="page" size="5" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
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
              </div>
				</td>
        </form>
        <%
End If %>
	<tr class="classfooter"><td colspan=14><div>当前执行SQL语句：<font color="red">
    <%response.write sql%></font></div></td></tr>
<% rs.close
set rs=Nothing
%>
      </table></td>
  </tr>
</table>
<%end if%>
</body>
