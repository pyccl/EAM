<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->
<%if Instr(session("juese"),"|501,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公司资产管理系统</title>
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<!--#include file="../inc/idcard.asp"-->
<script src="../js/address/jquery.slim.min.js"></script>
<script src="../js/address/distpicker.js"></script>
<script src="../js/address/main.js"></script>
<script language="javascript">
function checkform()
{
if (document.formbar.xingming.value=='')
{
alert('姓名不能为空');
document.formbar.xingming.focus();
return false;
}
if (document.formbar.gh.value=='')
{
alert('工号不能为空');
document.formbar.gh.focus();
return false;
}
if (document.formbar.idCard.value=='')
{
alert('身份证号不能为空');
document.formbar.idCard.focus();
return false;
}
if (document.formbar.company.value=='')
{
alert('所属公司不能为空');
document.formbar.company.focus();
return false;
}

if (document.formbar.department.value=='')
{
alert('部门不能为空');
document.formbar.department.focus();
return false;
}

if (document.formbar.position.value=='')
{
alert('职位不能为空');
document.formbar.position.focus();
return false;
}

if (document.formbar.ruzhi.value=='')
{
alert('入职时间不能为空');
document.formbar.ruzhi.focus();
return false;
}

if (document.formbar.phone.value=='')
{
alert('手机号码不能为空');
document.formbar.phone.focus();
return false;
}
}
</script>

<body onLoad="init()">
<%
dim rs1,rs2,rs3,count1,count2,count3
set rs1=server.CreateObject("Adodb.recordSet")
   if not isnull(session("rank")) then
		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
			rk = "y_name = '" & mystr(i) & "' or " + rk
			rk2 = "ssbm= '" & mystr(i) & "' or " + rk2
		next
   			rk2 = rk2 & " False"
  end if
		rk = rk & " False"
		sql="select * from admin_shiyongdanwei where " & rk & " order by y_paixu asc"
rs1.open sql,conn,1,1
%>
<script language="javascript">
	var Pcount=0;
	var subCat1 = new Array();
	<%
	count1=0
	do while not rs1.eof
	%>
		subCat1[<%=count1%>]=new Array("<%=rs1("y_name")%>","<%=rs1("y_name")%>"); 
	<%
		rs1.movenext
		count1=count1+1
	loop
	rs1.close
	set rs1=nothing
	%>
	Pcount=<%=count1%>

	function init(){
		var i;
		var j;
		document.formbar.company.length=0;
		document.formbar.company.options[0]=new Option("==选择公司==","");
		for(i=0;i<Pcount;i++){
		document.formbar.company.options[document.formbar.company.length]=
		new Option(subCat1[i][1],subCat1[i][0]);
		}
	}
</script>
<%
set rs2=server.CreateObject("Adodb.recordSet")
sql="select * from admin_department"
rs2.open sql,conn,1,1
%>
<script language="javascript">
	var Ccount=0;
	var subCat2=new Array();
	<%
	count2=0
	do while not rs2.eof
	%>
		subCat2[<%=count2%>]=new Array("<%=rs2("company")%>","<%=rs2("department")%>","<%=rs2("company")%>");
	<%
		count2=count2+1
		rs2.movenext
	loop
	rs2.close
	set rs2=nothing
	%>
	Ccount=<%=count2%>

	function changedCity(cityId){
		var i;
		document.formbar.department.length=0;
		document.formbar.department.options[0]=new Option("==选择部门==","");
		for(i=0;i<Ccount;i++){
			if(subCat2[i][2]==cityId){
				document.formbar.department.options[document.formbar.department.length]=
				new Option(subCat2[i][1],subCat2[i][1]);
			}
		}
	}
</script>
<table border="0" cellspacing="1" cellpadding="4" align="center" width="100%" bgcolor="#6298E1">
  <FORM id="formfoo" name="formbar" action="regist_save.asp" method="post" onSubmit="return checkform()">
    <tr class=classtop1>
      <td  height="25" colspan="5" align="left"><img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6">&nbsp;<b>添加员工</b></td>
    </tr>
		<%
		dim kn,na
		set rsn=server.CreateObject("adodb.recordset")
		sqln="select xingming from admin_yuangong"
		rsn.open sqln,conn, 1, 1
		do while not rsn.eof
			na = na & ", " & rsn("xingming")
			rsn.movenext
		loop
		na = mid (na,3)
		mystrna=split(na,", ")
		for k=0 to ubound(mystrna)
			na2 = "syz not like '%" & mystrna(k) & "%' and " + na2
		next
		na2 = mid(na2,1,len(na2)-5)
		if na2 = "" then na2 = " False "
		set rs3=server.CreateObject("adodb.recordset")
		sql3="select syz from sbxx where len(syz) <> 0 and len(syz)<4 and syz not like '%保密%' and syz not like '%展厅%' and (" & na2 & ") and (" & rk2 & ")" & " group by syz order by count(syz) desc"
		rs3.open sql3,conn, 1, 1
		do while not rs3.eof
			kn = kn & "、" & rs3("syz")
			rs3.movenext
		loop
		if len(kn) > 0 then
	%>
    <tr class="classtd">
      <td height="25" colspan="5" align="left">
		<% 
		   response.write "<div title=" & mid(kn,2) & ">可能未添加的员工<font color=red>（鼠标悬停查看具体）</font>：" & left(mid(kn,2),50)
			if len(kn)>50 then response.write "……"
			response.write "</div>"
		else
		%>
		</td>
    </tr>
	<%end if%>
    <tr>
      <td height="25" align="center"  class="classtd"><div align="left"><font color="#ff0033">* </font><strong>姓名：</strong></div></td>
      <td align="center" class="classtd" ><div align="left">
          <input name="xingming" class="form" id="xingming"  style="WIDTH: 180px" maxlength="4"/>
        </div></td>
      <td rowspan="5" align="center" class="classtd"><div align="left"><strong>&nbsp;相片：</strong></div></td>
      <td rowspan="5" align="center" valign="middle" class="classtd">
		<img id="img" width="<%=session("yuangongimgw")%>" src="../images/noimg.png">
			<input type="hidden" name="pic" id="pic"/>
			<script>
			function backfn(aaa){
				document.getElementById("img").src=aaa;
				document.getElementById("pic").value=aaa;
			}
			</script>
		</td>
      <td rowspan="5" align="center" valign="middle" class="classtd">
		<iframe frameborder="0" src="../js/upload/upload.asp" name="upload"></iframe>
	  </td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">*</font><strong> 身份证号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="idCard" class="form" id="idCard" style="WIDTH: 180px" maxlength="18" onBlur="javascript:checkIdcard(document.all.idCard.value);"></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">*</font><strong> 工号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="gh" class="form" id="gh"  style="WIDTH: 180px" maxlength="15"/>
      <font color="red">谨慎填写，该条目填完后无法修改</font></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;最高学历：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="education" style="WIDTH: 180px" class="form"  />
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">*</font><strong> 手机号码：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="phone" class="form" style="WIDTH: 180px" maxlength="11" oninput="value=value.replace(/[^\d]/g,'')"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">* </font><b>所属公司<strong>：</strong></b></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <select name="company" id="company" style="WIDTH: 180px" class="form" onChange="changedCity(document.formbar.company.options[document.formbar.company.selectedIndex].value);">
          <option value="">==选择公司==</option>
        </select>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">*</font><strong> 部门：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
        <select name="department" id="department" style="WIDTH: 180px" class="form">
          <option value="">==选择部门==</option>
        </select>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">* </font><strong>职位：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="position" style="WIDTH: 180px" class="form" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">* </font><strong>入职时间</strong><strong>：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ruzhi" type="text" class="form" id="ruzhi" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;微信：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="weixin" style="WIDTH: 180px" class="form"  />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;QQ：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="qq" class="form" style="WIDTH: 180px" maxlength="12" oninput="value=value.replace(/[^\d]/g,'')"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;籍贯地址：</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <div id="distpicker2">
            <select data-province="-- 选择省市 --" name="jg_1">
            </select>
            <select data-city="-- 选择市区 --" name="jg_2">
            </select>
            <select data-district="-- 选择县市 --" name="jg_3">
            </select>
          </div>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="left" valign="middle" class="classtd"><div align="left"><strong>&nbsp;当前住址：</strong></div></td>
      <td height="25" colspan="4" align="left" valign="middle" class="classtd"><div align="left">
          <div id="distpicker3">
            <select data-province="-- 选择省市 --" name="zz_1">
            </select>
            <select data-city="-- 选择市区 --" name="zz_2">
            </select>
            <select data-district="-- 选择县市 --" name="zz_3">
            </select>
          </div>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="5" align="center" valign="middle" class="classtd"><div>
          <input name="提交" type="submit" class="form" id="提交"  value="添加" />
          &nbsp;
          <input name="qt" type="button" class="form" id="qt"  value="取消" onClick="location='admin_yuangong.asp'"/>
        </div></td>
    </tr>
  </form>
</table>
<%end if%>
</body>
</html>
