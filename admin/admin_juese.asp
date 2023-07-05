<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%
   Result=request.QueryString("Result")
   ID=request.QueryString("ID")
if Instr(session("juese"),"|301,")=0 or ID=1 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公司资产管理系统</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function CheckOthers(form)
{
   for (var i=0;i<form.elements.length;i++)
   {
      var e = form.elements[i];
      if (e.checked==false)
      {
	     e.checked = true;
      }
      else
      {
	     e.checked = false;
      }
   }
}
function CheckAll(form)
{
   for (var i=0;i<form.elements.length;i++)
   {
      var e = form.elements[i];
      e.checked = true;
   }
}
function checkform()
{

   if (document.formbar.mingcheng.value.length<2 || document.formbar.mingcheng.value.length>10 )
   {
	  alert("请正确输入角色名（2-10个字符）");
      document.formbar.mingcheng.focus();
	  return false;
	  exit;
   }	
}
</script>

<body onLoad="init()">
<%
   dim mingcheng,datetime,beizhu,quanxian
	if ID="" then ID=0
	call AdminEdit() 
%>

<table border="0" cellspacing="1" cellpadding="4" align="center" bgcolor="#6298E1" width="100%"> 
  <FORM id="formfoo" name="formbar" action="admin_juese.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>" method="post" onSubmit="return checkform()">
    <tr class=classtop1>
      <td height="25" colspan="4" align="left">
		<img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6"><strong><%if Result="Modify" then%>&nbsp;编辑角色<%else%>&nbsp;添加角色<%end if%></strong>
	  </td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd" nowrap><div align="left"><font color="#ff0033">* </font><strong>角色名称：</strong></div></td>
      <td align="center" class="classtd" ><div align="left">
		  <input name="mingcheng" type="text" class="form" id="mingcheng" style="WIDTH: 180px;" value="<%=mingcheng%>" maxlength="10"></div></td>
      <td align="center" class="classtd"><div align="left"><strong>&nbsp;备注：</strong></div></td>
      <td valign="middle" class="classtd"><div align="left">
        <input name="beizhu" type="text" class="form" id="beizhu" style="WIDTH: 180px;" value="<%=beizhu%>" maxlength="50">
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd" nowrap><div align="left"><strong>&nbsp;具体权限：</strong></div><br>
      <input onClick="CheckAll(this.form)" name="submitallSelect" type="button" class="button"  id="submitallSelect" value="全选" style="HEIGHT: 18px;WIDTH: 36px;"><br><br><input onClick="CheckOthers(this.form)" name="buttonOtherSelect" type="button" class="button"  id="submitOtherSelect" value="反选" style="HEIGHT: 18px;WIDTH: 36px;"></td>
      <td height="25" colspan="3" class="classtd">
        <p>资产管理：
          <label>
            <input type="checkbox" name="qx101" value="|101," id="qx101" <%if Instr(quanxian,"|101,")>0 then response.write ("checked")%>>
          添加资产</label>
          <label>
            <input type="checkbox" name="qx102" value="|102," id="qx102" <%if Instr(quanxian,"|102,")>0 then response.write ("checked")%>>
            查看资产</label>
          <label>
            <input type="checkbox" name="qx103" value="|103," id="qx103" <%if Instr(quanxian,"|103,")>0 then response.write ("checked")%>>
            修改资产</label>
          <label>
            <input type="checkbox" name="qx111" value="|111," id="qx111" <%if Instr(quanxian,"|111,")>0 then response.write ("checked")%>>
            删除资产</label>
        
          <label>
            <input type="checkbox" name="qx104" value="|104," id="qx104" <%if Instr(quanxian,"|104,")>0 then response.write ("checked")%>>
            借出资产</label>
          <label>
            <input type="checkbox" name="qx105" value="|105," id="qx105" <%if Instr(quanxian,"|105,")>0 then response.write ("checked")%>>
            归还资产</label>
          <label>
            <input type="checkbox" name="qx106" value="|106," id="qx106" <%if Instr(quanxian,"|106,")>0 then response.write ("checked")%>>
            调拨资产</label>
          <label>
            <input type="checkbox" name="qx107" value="|107," id="qx107" <%if Instr(quanxian,"|107,")>0 then response.write ("checked")%>>
            转移资产</label>
          <label>
            <input type="checkbox" name="qx109" value="|109," id="qx109" <%if Instr(quanxian,"|109,")>0 then response.write ("checked")%>>
            导入资产</label>
          <label>
            <input type="checkbox" name="qx110" value="|110," id="qx110" <%if Instr(quanxian,"|110,")>0 then response.write ("checked")%>>
            导出资产</label>
		  <br>
        其他资产管理：
        <label>
          <input type="checkbox" name="qx108" value="|108," id="qx108" <%if Instr(quanxian,"|108,")>0 then response.write ("checked")%>>
          盘点资产</label>
		<label>
            <input type="checkbox" name="qx201" value="|201," id="qx201" <%if Instr(quanxian,"|201,")>0 then response.write ("checked")%>>
        标签管理</label>
		<label>
            <input type="checkbox" name="qx202" value="|202," id="qx202" <%if Instr(quanxian,"|202,")>0 then response.write ("checked")%>>
        资产折旧</label>
		<label>
            <input type="checkbox" name="qx203" value="|203," id="qx203" <%if Instr(quanxian,"|203,")>0 then response.write ("checked")%>>
        折旧导出</label>
        <br>
          系统管理：
          <label> <input type="checkbox" name="qx300" value="|300," id="qx300" <%if Instr(quanxian,"|300,")>0 then response.write ("checked")%>>
            系统设置</label>
          <label> <input type="checkbox" name="qx301" value="|301," id="qx301" <%if Instr(quanxian,"|301,")>0 then response.write ("checked")%>>
            角色管理</label>
          <label> <input type="checkbox" name="qx302" value="|302," id="qx302" <%if Instr(quanxian,"|302,")>0 then response.write ("checked")%>>
            账户管理</label>
        (
        <label> <input type="checkbox" name="qx306" value="|306," id="qx306" <%if Instr(quanxian,"|306,")>0 then response.write ("checked")%>>
          所有账户</label>
        )
        <label> <input type="checkbox" name="qx305" value="|305," id="qx305" <%if Instr(quanxian,"|305,")>0 then response.write ("checked")%>>
          账户添加</label>
        <label>
          <input type="checkbox" name="qx303" value="|303," id="qx303" <%if Instr(quanxian,"|303,")>0 then response.write ("checked")%>>
          查看日志</label>
        <label>
          <input type="checkbox" name="qx304" value="|304," id="qx304" <%if Instr(quanxian,"|304,")>0 then response.write ("checked")%>>
          删除日志</label>
        <label>
          <input type="checkbox" name="qx307" value="|307," id="qx307" <%if Instr(quanxian,"|307,")>0 then response.write ("checked")%>>
          重置盘点</label>
		  <br>信息管理：
          <label> <input type="checkbox" name="qx401" value="|401," id="qx401" <%if Instr(quanxian,"|401,")>0 then response.write ("checked")%>>
            公司管理</label>
          <label>
            <input type="checkbox" name="qx402" value="|402," id="qx402" <%if Instr(quanxian,"|402,")>0 then response.write ("checked")%>>
            部门管理</label>
          <label>
            <input name="qx403" type="checkbox" id="qx403" value="|403," <%if Instr(quanxian,"|403,")>0 then response.write ("checked")%>>
            分类管理</label>
          <label>
            <input name="qx404" type="checkbox" id="qx404" value="|404," <%if Instr(quanxian,"|404,")>0 then response.write ("checked")%>>
            状态管理</label>
          <label>
            <input name="qx405" type="checkbox" id="qx405" value="|405," <%if Instr(quanxian,"|405,")>0 then response.write ("checked")%>>
            操作系统管理</label>
<br>
        人员管理：
        <label>
            <input type="checkbox" name="qx501" value="|501," id="qx501" <%if Instr(quanxian,"|501,")>0 then response.write ("checked")%>>
          添加员工</label>
        <label>
          <input type="checkbox" name="qx502" value="|502," id="qx502" <%if Instr(quanxian,"|502,")>0 then response.write ("checked")%>>
          查看员工</label>
        <label>
          <input type="checkbox" name="qx503" value="|503," id="qx503" <%if Instr(quanxian,"|503,")>0 then response.write ("checked")%>>
          修改员工</label>
        <label>
          <input type="checkbox" name="qx506" value="|506," id="qx506" <%if Instr(quanxian,"|506,")>0 then response.write ("checked")%>>
          删除员工</label>
        <label>
          <input type="checkbox" name="qx504" value="|504," id="qx504" <%if Instr(quanxian,"|504,")>0 then response.write ("checked")%>>
          导入员工</label>
        <label>
          <input type="checkbox" name="qx505" value="|505," id="qx505" <%if Instr(quanxian,"|505,")>0 then response.write ("checked")%>>
          导出员工</label>
<br>
        数据库管理：
        <label>
            <input type="checkbox" name="qx601" value="|601," id="qx601" <%if Instr(quanxian,"|601,")>0 then response.write ("checked")%>>
          压缩数据库</label>
        <label>
          <input type="checkbox" name="qx602" value="|602," id="qx602" <%if Instr(quanxian,"|602,")>0 then response.write ("checked")%>>
          备份数据库</label>
        <label>
          <input type="checkbox" name="qx603" value="|603," id="qx603" <%if Instr(quanxian,"|603,")>0 then response.write ("checked")%>>
          <font color="red">还原数据库</font>
        </label>
        <label>
          <input type="checkbox" name="qx604" value="|604," id="qx604" <%if Instr(quanxian,"|604,")>0 then response.write ("checked")%>>
          <font color="red">初始化数据库</font>
        </label>
        </p></td>
    </tr>
      <%if Result="Modify" then%>
      <tr>
        <td height="25" align="right" class="classtd" nowrap><div align="left"><strong>&nbsp;改前权限：</strong></div></td>
        <td colspan="3" class="classtd" style="word-wrap:break-word;">
		<% if trim(quanxian)="" then
		   	response.write "<font color=red>暂无权限！</font>"
		   else
				if Instr(quanxian,"|101,")<>0 then
					rk = "添加资产,"
				end if
				if Instr(quanxian,"|102,")<>0 then
					rk = rk & "查看资产,"
				end if
				if Instr(quanxian,"|103,")<>0 then
					rk = rk & "修改资产,"
				end if
				if Instr(quanxian,"|111,")<>0 then
					rk = rk & "删除资产,"
				end if
				if Instr(quanxian,"|104,")<>0 then
					rk = rk & "借出资产,"
				end if
				if Instr(quanxian,"|105,")<>0 then
					rk =rk & "归还资产,"
				end if
				if Instr(quanxian,"|106,")<>0 then
					rk = rk & "调拨资产,"
				end if
				if Instr(quanxian,"|107,")<>0 then
					rk = rk & "转移资产,"
				end if
				if Instr(quanxian,"|109,")<>0 then
					rk = rk & "导入资产,"
				end if
				if Instr(quanxian,"|110,")<>0 then
					rk = rk & "导出资产,"
				end if
				if Instr(quanxian,"|108,")<>0 then
					rk = rk & "盘点资产,"
				end if
				if Instr(quanxian,"|201,")<>0 then
					rk = rk & "标签管理,"
				end if
				if Instr(quanxian,"|202,")<>0 then
					rk = rk & "资产折旧,"
				end if
				if Instr(quanxian,"|203,")<>0 then
					rk = rk & "折旧导出,"
				end if
				if Instr(quanxian,"|300,")<>0 then
					rk = rk & "系统设置,"
				end if
				if Instr(quanxian,"|301,")<>0 then
					rk = rk & "角色管理,"
				end if
				if Instr(quanxian,"|302,")<>0 then
					rk = rk & "账户管理"
				end if
				if Instr(quanxian,"|302,")<>0 and Instr(quanxian,"|306,")<>0 then
					rk = rk & "（含所有账户）,"
				else
					if Instr(quanxian,"|302,")<>0 and Instr(quanxian,"|306,")=0 then
						rk = rk & ","
					end if
				end if
				if Instr(quanxian,"|305,")<>0 then
					rk = rk & "账户添加,"
				end if
				if Instr(quanxian,"|303,")<>0 then
					rk = rk & "查看日志,"
				end if
				if Instr(quanxian,"|304,")<>0 then
					rk = rk & "删除日志,"
				end if
				if Instr(quanxian,"|307,")<>0 then
					rk = rk & "重置盘点,"
				end if
				if Instr(quanxian,"|401,")<>0 then
					rk = rk & "公司管理,"
				end if
				if Instr(quanxian,"|402,")<>0 then
					rk = rk & "部门管理,"
				end if
				if Instr(quanxian,"|403,")<>0 then
					rk = rk & "分类管理,"
				end if
				if Instr(quanxian,"|404,")<>0 then
					rk = rk & "状态管理,"
				end if
				if Instr(quanxian,"|405,")<>0 then
					rk = rk & "操作系统管理,"
				end if
				if Instr(quanxian,"|501,")<>0 then
					rk = rk & "添加员工,"
				end if
				if Instr(quanxian,"|502,")<>0 then
					rk = rk & "查看员工,"
				end if
				if Instr(quanxian,"|503,")<>0 then
					rk = rk & "修改员工,"
				end if
				if Instr(quanxian,"|506,")<>0 then
					rk = rk & "删除员工,"
				end if
				if Instr(quanxian,"|504,")<>0 then
					rk = rk & "导入员工,"
				end if
				if Instr(quanxian,"|505,")<>0 then
					rk = rk & "导出员工,"
				end if
				if Instr(quanxian,"|601,")<>0 then
					rk = rk & "压缩数据库,"
				end if
				if Instr(quanxian,"|602,")<>0 then
					rk = rk & "备份数据库,"
				end if
				if Instr(quanxian,"|603,")<>0 then
					rk = rk & "还原数据库,"
				end if
				if Instr(quanxian,"|604,")<>0 then
					rk = rk & "数据库初始化,"
				end if
				rk = mid(rk,1,(len(rk)-1))
				response.write rk
			end if %>
		  </td>
      </tr>
    <tr>
        <td height="25" align="center" valign="middle" class="classtd" nowrap><div align="left"><strong>&nbsp;绑定账户：</strong></div></td>
        <td height="25" colspan="3" valign="middle" class="classtd">
		<%
			set rs2=server.CreateObject("adodb.recordset")
			sql2="select admin_id,admin_name from admin where juese = " & ID
			rs2.open sql2,conn, 1, 1
		    if rs2.eof and rs2.bof then
				response.write "<font color = red>未绑定任何用户</font>"
			else
		   		do while not rs2.eof
		   			zh=zh & rs2("admin_id") & "(" & rs2("admin_name") & ") "
		   			rs2.movenext
				loop
					response.write "<font color = blue><b>" & zh & "</b></font>共" & rs2.recordcount & "个用户"
			end if
			rs2.close
			set rs2=Nothing
		%>
		</td>
    </tr>
	  <%end if%>
    <tr>
      <td height="25" colspan="4" align="center" valign="middle" class="classtd"><div>
          <input name="提交" type="submit" class="button" id="提交"  value="保存" />
          &nbsp;
          <input name="qt" type="button" class="button" id="qt"  value="取消" onClick="location='juese.asp'"/>
        </div></td>
    </tr>
  </form>
</table>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <tr bgcolor="#4aa5ca">
    <td colspan=15><div style="color:white">
      注意：<br>1.日志管理仅有超级管理员有权限。<br>2.标签管理指的是打印、重置打印二维码标签。<br>3.只勾选账户管理时，仅能修改所登录的账户的用户名密码姓名。勾选后方的所有账户后，可管理系统里的所有账户。<br>4.资产管理、部门管理、员工管理是需要对应于账户的权限，账户拥有该公司的管理权后才拥有该处的权限。<br><font color="red">5.注意：还原数据库、初始化数据库将会清空原数据库数据，请谨慎分配该权限！</font>
    </div></td>
  </tr>
</table>

<% end if %>
</body>
</html>
<%
sub AdminEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存角色
    set rs = server.createobject("adodb.recordset")
    if Result="Add" then '创建角色
      set rsCheckAdd = conn.execute("select mingcheng from juese where mingcheng='" & trim(Request.Form("mingcheng")) & "'")
      if not (rsCheckAdd.bof and rsCheckAdd.eof) then '判断此名称是否存在
        response.write "<script language=javascript> alert('" & trim(Request.Form("mingcheng")) & "角色名称已经存在，请换一个再试试！');history.back(-1);</script>"
        response.end
      end if  
	  sql="select * from juese"
      rs.open sql,conn,1,3
      rs.addnew
      if len(trim(Request.Form("mingcheng")))<2 or len(trim(Request.Form("mingcheng")))>10  then
        response.write "<script language=javascript> alert('角色必填，且字符数为2-10位！');history.back(-1);</script>"
        response.end
      end if	  
      rs("mingcheng")=trim(Request.Form("mingcheng"))
	  rs("quanxian")=Request.Form("qx101") & Request.Form("qx102") & Request.Form("qx103") & Request.Form("qx104") & Request.Form("qx105") &_
	                     Request.Form("qx106") & Request.Form("qx107") & Request.Form("qx108") & Request.Form("qx109") & Request.Form("qx110") & Request.Form("qx111") & Request.Form("qx201") & Request.Form("qx202") & Request.Form("qx203") & Request.Form("qx300") & Request.Form("qx301") & Request.Form("qx302") & Request.Form("qx303") & Request.Form("qx304") & Request.Form("qx305") & Request.Form("qx306") & Request.Form("qx307")&_
	                     Request.Form("qx401") & Request.Form("qx402") & Request.Form("qx403") & Request.Form("qx404") & Request.Form("qx405") & Request.Form("qx501") & Request.Form("qx502") & Request.Form("qx503") & Request.Form("qx504") & Request.Form("qx505") & Request.Form("qx506") & Request.Form("qx601") & Request.Form("qx602") & Request.Form("qx603") & Request.Form("qx603")
	  rs("beizhu")=trim(Request.Form("beizhu"))
	  rs("datetime")=now()
			Set rsa=Server.CreateObject("ADODB.Recordset")
			sqla="select * from user_log"
			rsa.open sqla,connstr,1,3
			rsa.addnew
			rsa("username")=session("web_admin")
			rsa("atype")="添加角色"
			rsa("alog")="添加名称为<font color=red>【"& trim(Request.Form("mingcheng")) &"】</font>的角色。"
			rsa("atime")=now()
			rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
			rsa.update
			rsa.close
			set rsa=nothing
		response.write "<script language=javascript> alert('成功添加角色！');location.replace('juese.asp');</script>"
	end if  
	if Result="Modify" then '修改角色
		  sql="select * from juese where ID="&ID
		  rs.open sql,conn,1,3
		  rs("mingcheng")=trim(Request.Form("mingcheng"))
		  rs("quanxian")=Request.Form("qx101") & Request.Form("qx102") & Request.Form("qx103") & Request.Form("qx104") & Request.Form("qx105") &_
	                     Request.Form("qx106") & Request.Form("qx107") & Request.Form("qx108") & Request.Form("qx109") & Request.Form("qx110") & Request.Form("qx111") & Request.Form("qx201") & Request.Form("qx202") & Request.Form("qx203") & Request.Form("qx300") & Request.Form("qx301") & Request.Form("qx302") & Request.Form("qx303") & Request.Form("qx304") & Request.Form("qx305") & Request.Form("qx306") & Request.Form("qx307")&_
	                     Request.Form("qx401") & Request.Form("qx402") & Request.Form("qx403") & Request.Form("qx404") & Request.Form("qx405") & Request.Form("qx501") & Request.Form("qx502") & Request.Form("qx503") & Request.Form("qx504") & Request.Form("qx505") & Request.Form("qx506") & Request.Form("qx601") & Request.Form("qx602") & Request.Form("qx603") & Request.Form("qx604")
		  rs("beizhu")=trim(Request.Form("beizhu"))
		  rs("datetime")=now()
		end if
		rs.update
		rs.close
		set rs=nothing 
				Set rsa=Server.CreateObject("ADODB.Recordset")
				sqla="select * from user_log"
				rsa.open sqla,connstr,1,3
				rsa.addnew
				rsa("username")=session("web_admin")
				rsa("atype")="修改角色"
				rsa("alog")="修改名称为<font color=red>【"& trim(Request.Form("mingcheng")) &"】</font>的角色。"
				rsa("atime")=now()
				rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
				rsa.update
				rsa.close
				set rsa=nothing
		response.write "<script language=javascript> alert('成功修改角色！');location.replace('juese.asp');</script>"
  else '提取角色名称'
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from juese where ID="& ID
      rs.open sql,conn,1,1
	  mingcheng=rs("mingcheng")
	  datetime=rs("datetime")
	  quanxian=rs("quanxian")
	  beizhu=rs("beizhu")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
%>
