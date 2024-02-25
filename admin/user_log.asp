<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
if Instr(session("juese"),"|303,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else%>
<html>
<head>
<title>用户日志</title>
<link href="../sb/css/modelcss.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" src="../js/check.js"></script>
<SCRIPT LANGUAGE="javascript">
	function checkdelitem(trid)
	{
	if (eval("document.formDel.id"+ trid +".checked"))
	{
		eval("document.all.tr"+ trid +".className='classtd1'");
	}
	else
	{
		eval("document.all.tr"+ trid +".className='classtd'");
	}
	}
</SCRIPT>
<body>
<table width="100%" border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tr>
    <th height="24" colspan="7" class="classtop">操作日志
      <select name="anclassid" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
        <option selected>--快速跳转--</option>
        <option value="?logtype=all">所有记录</option>
        <option value="?logtype=添加资产">添加资产</option>
        <option value="?logtype=修改资产">修改资产</option>
        <option value="?logtype=删除资产">删除资产</option>
        <option value="?logtype=借出资产">借出资产</option>
        <option value="?logtype=归还资产">归还资产</option>
        <option value="?logtype=转移资产">转移资产</option>
        <option value="?logtype=调拨资产">调拨资产</option>
		<option value="?logtype=盘点资产">盘点资产</option>
		<option value="?logtype=添加角色">添加角色</option>
		<option value="?logtype=修改角色">修改角色</option>
		<option value="?logtype=删除角色">删除角色</option>
		<option value="?logtype=添加员工">添加员工</option>
		<option value="?logtype=修改员工">修改员工</option>
		<option value="?logtype=删除员工">删除员工</option>
      </select>
    </th>
  </tr>
  <form action="?Result=LoginLog" method="post" name="formDel" >
    <%
    logtype=request("logtype")
    set rs=server.CreateObject("adodb.recordset")
	   if logtype="all" then
			sql="select * from user_log order by id desc"
	   else
	   		sql="select * from user_log where atype like '%"&logtype&"%' order by id desc"
	   end if
    rs.open sql,conn, 1, 1
   %>
    <tr class=classtop1>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>ID</strong></div></td>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>管理用户名</strong></div></td>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>操作类型</strong></div></td>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>操作内容</strong></div></td>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>操作时间</strong></div></td>
      <td nowrap background="../images/th_bg.gif"><div align="center"><strong>操作IP</strong></div></td>
      <% if Instr(session("juese"),"|304,")<>0 then%>
      <td nowrap background="../images/th_bg.gif"><div align="center" ><a href="javascript:void(0);" onclick="checkAll()">全选</a>\<a href="javascript:void(0);" onclick="uncheckAll()">否</a></div></td>
      <%end if%>
    </tr>
    <%
if rs.eof and rs.bof then
	response.write "<tr><td colspan=11 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>日志库中没有记录！</font></div></td></tr>"
Else
	if not isempty(request("page")) then   
		pagecount=cint(request("page"))
	else   
		pagecount=1
	end if
	rs.pagesize=session("liebiao")
		la=rs.recordcount mod rs.pagesize
			rem la是计算最后一页有几条记录。
		if la = 0 then la = session("liebiao")
	rs.AbsolutePage=pagecount
	do while not rs.eof %>
    <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
      <td height=30><div align="center"><%=rs("id")%></div></td>
      <td><div align="center"><%=rs("username")%></div></td>
      <td><div align="center"><%=rs("atype")%></div></td>
      <td><div align="center"><%=rs("alog")%></div></td>
      <td><div align="center"><%=rs("atime")%></div></td>
      <td><div align="center"><%=rs("aip")%></div></td>
      <%if Instr(session("juese"),"|304,")<>0 then%>
      <td><div align="center">
          <input name="selectID" type="checkbox" value='<%=rs("ID")%>' style='HEIGHT: 13px;WIDTH: 13px;'>
        </div></td>
      <%end if%>
    </tr>
    <%
		j=j+1
	 	if pagecount = rs.pagecount then
			if j>=la then exit do
	  	else
			if j>=rs.pagesize then exit do
	  	end if
		rs.movenext
	loop
end if
    if Instr(session("juese"),"|304,")<>0 and not(rs.eof and rs.bof) then%>
    <tr bgcolor="#EBF2F9">
      <td colspan="7" align="right" height="30" class="forumrow"><input name="submitDelSelect" type="submit" class="button" id="submitDelSelect" value="删除所选"></td>
    </tr>
  </form>
  <%end if %>
  <form action="user_log.asp?logtype=<%=logtype%>" method="post">
    <tr class="botbg">
      <td height="25" align="center" colspan="7"><div align="center"> 共有 <b><%=rs.recordcount%></b> 条记录, 页次: <b><font color=red><%=pagecount%></font>/<%=rs.pagecount%></b> , 当前从第
          <%if pagecount<=1 then
				response.write "<font color=red>1</font>"
			else
				response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
			end if%>
          条开始。
          
          <% if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
          <a href="?logtype=<%=logtype%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?logtype=<%=logtype%>&page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
          <% end if %>
          <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
          <a href="?logtype=<%=logtype%>&page=1"><img src="../images/frist.png"></a><a href="?logtype=<%=logtype%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a>
          <%end if%>
          <% if pagecount<>1 and rs.pagecount<>pagecount then%>
          <a href="?logtype=<%=logtype%>&page=1"><img src="../images/frist.png"></a><a href="?logtype=<%=logtype%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.png"></a><a href="?logtype=<%=logtype%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.png"></a><a href="?logtype=<%=logtype%>&page=<%=rs.pagecount%>"><img src="../images/last.png"></a>
          <% end if%>
		<%if rs.pagecount>1 then%>
           &nbsp;直接到第
          <%if rs.pagecount>15 then %>
          <input name="page" size="3" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>" onBlur="if(value<1)value=1" value="1">
          <% else %>
          <select name="page">
            <%for i=1 to rs.pagecount%>
            <option value="<%=i%>"><%=i%></option>
            <%next%>
          </select>
          <%end if%>
          页
          <input type="submit" name="go" value="跳转" class="button">
          <%end if%>
        </div></td>
    </tr>
  </form>
        <tr class="classfooter">
          <td colspan="7"><div>当前执行SQL语句：<font color="red"><%response.write sql%></font></div></td>
        </tr>
  <% 
rs.close
set rs=Nothing
%>
</table>
</body>
</html>
<%
    if request("Result") = "LoginLog" then 
        SelectID=request("SelectID")
        if SelectID<>"" then  conn.execute "delete from user_log where id in ("& SelectID &")"
        Response.write"<script>location.href=""user_log.asp"";</script>"
    end if
end if%>