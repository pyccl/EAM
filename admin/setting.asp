<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%if Instr(session("juese"),"|300,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else%>
<html>
<head>
<title>系统设置</title>
</head>

<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<script language="javascript">
	
function checkform()
{
if (document.formbar.companyname.value=='')
{
alert('公司名称不能为空');
document.formbar.companyname.focus();
return false;
}
if (document.formbar.systemname.value=='')
{
alert('系统名称不能为空');
document.formbar.systemname.focus();
return false;
}
    if (document.formbar.lock.value=='')
{
alert('锁定次数不能为空');
document.formbar.lock.focus();
return false;
}
    if (document.formbar.imgh.value=='')
{
alert('资产图片高度不能为空');
document.formbar.imgh.focus();
return false;
}
    if (document.formbar.imgw.value=='')
{
alert('资产图片宽度不能为空');
document.formbar.imgw.focus();
return false;
}
    if (document.formbar.yuangongimgw.value=='')
{
alert('员工图片宽度不能为空');
document.formbar.yuangongimgw.focus();
return false;
}
    if (document.formbar.liebiao.value=='')
{
alert('列表条目不能为空');
document.formbar.liebiao.focus();
return false;
}
    if (document.formbar.biaoqian.value=='')
{
alert('标签列表条目不能为空');
document.formbar.biaoqian.focus();
return false;
}
	if(document.formbar.biaoqian.value % 3 != 0)
{
alert('标签列表条目需为3的倍数');
document.formbar.biaoqian.value='24';
document.formbar.biaoqian.focus();
return false;
	   }
}
</script>
<%
    	sql="select * from setting"
		set rs=conn.execute(sql)
    %>
<body>
<table border="0" cellspacing="1" cellpadding="4" align="center" width="100%" bgcolor="#6298E1">
  <FORM id="formfoo" name="formbar" action="setting_save.asp" method="post" onSubmit="return checkform()">
    <tr class=classtop1>
      <td  height="25" colspan="3" align="left"><img src="../images/table.gif" width="16" height="14"><img src="images/jt.gif" width="5" height="6">&nbsp;系统设置</td>
    </tr>
    <tr>
      <td rowspan="6" align="center"  class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>系统设置：</strong></div></td>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>公司名称**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="companyname" class="form" id="companyname"  style="WIDTH: 180px" value="<%=rs("companyname")%>"/>
        </div></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>系统名称**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="systemname" class="form" id="systemname"  style="WIDTH: 180px" value="<%=rs("systemname")%>"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>账户锁定次数：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="lock" class="form" id="lock" style="WIDTH: 180px" onBlur="if(value<2)value=2" value="<%=rs("lock")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>15)value=15"/>
          设置用户输入密码错误次数锁定账户（范围2-15）</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;登录页提示**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="message" class="form" id="message" style="WIDTH: 180px" value="<%=rs("message")%>" maxlength="50"/>
          设置登录页面信息提示（&lt;=50个字符）</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;ICP备案号**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="icpnum" class="form" id="icpnum" style="WIDTH: 180px" value="<%=rs("ICPnum")%>"/>
          &nbsp;链接：
          <input name="icphttp" class="form" id="icphttp" style="WIDTH: 180px" value="<%=rs("ICPhttp")%>" maxlength="255"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;网警备案号**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gongannum" class="form" id="gongannum" style="WIDTH: 180px" value="<%=rs("gongannum")%>"/>
          &nbsp;链接：
          <input name="gonganhttp" class="form" id="gonganhttp" style="WIDTH: 180px" value="<%=rs("gonganhttp")%>" maxlength="255"/>
        </div></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>盘点设置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;盘点开关：</div></td>
      <td height="25" align="center" class="classtd"><span class="forumrow"> </span>
        <div align="left"><label><span class="forumrow">
          <input name="pdkg" type="checkbox" style="HEIGHT: 15px;WIDTH: 15px;" <%if rs("pd") then response.write ("checked")%>>
          </span>选中开启；未选中关闭</label> &nbsp;&nbsp;
          <input type="button" class=button  size=3 value='重置盘点状态' name=Submit5  onClick="window.location.href='sb/cz_pdzt.asp?zt=cz';return confirm('确定重置盘点状态?');">
        </div></td>
    </tr>
    <tr>
      <td rowspan="3" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>图片设置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>资产图片高度：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="imgh" class="form" id="imgh" style="WIDTH: 180px" onBlur="if(value<50)value=50" value="<%=rs("imgh")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>120)value=120"/>
          设置资产详情页图片高度（范围50-120px）</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>资产图片宽度：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="imgw" class="form" id="imgw" style="WIDTH: 180px" onBlur="if(value<150)value=150" value="<%=rs("imgw")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>300)value=300"/>
          设置资产二维码页图片宽度（范围150-300px）</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>员工照片宽度：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="yuangongimgw" class="form" id="yuangongimgw" style="WIDTH: 180px" onBlur="if(value<50)value=50" value="<%=rs("yuangongimgw")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>120)value=120"/>
          设置员工详情页图片高度（范围50-120px）</div></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>列表设置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>标签列表条目**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="biaoqian" class="form" id="biaoqian" style="WIDTH: 180px" onBlur="if(value<3)value=3" value="<%=rs("biaoqian")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>30)value=30"/>
          设置打印列表页显示的数量（范围3-30，且为3的倍数）</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>其他列表条目**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="liebiao" class="form" id="liebiao" style="WIDTH: 180px" onBlur="if(value<5)value=5" value="<%=rs("liebiao")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>30)value=30"/>
          设置列表页每页显示的数量（范围5-30）</div></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>其他设置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;登录页自动黑白**：</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><label><span class="forumrow">
        <input name="sfhb" type="checkbox" style="HEIGHT: 15px;WIDTH: 15px;" <%if rs("sfhb") then response.write ("checked")%>>
        </span>选中开启；未选中关闭</label>
        <font color="red">开启后，需要设置起止时间，否则不起作用。</font>
      </div></td>
    </tr>
    <tr>
	<td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;自动黑白时间：</div></td>
	<td height="25" align="center" class="classtd"><div align="left">
	  <input name="kssj" id="d4311" class="form" type="text" size="20" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<%=rs("kssj")%>"/>
-
<input name="jssj" type="text" class="form" id="d4312" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'d4311\')}'})" value="<%=rs("jssj")%>" size="20"/>
开始时间-结束时间
	</div></td>
    </tr>
    <tr>
      <td height="25" colspan="3" align="center" class="classtd"><input name="提交" type="submit" class="button" id="提交"  value="修改" /></td>
    </tr>
    <tr>
      <td height="25" colspan="3" class="classfooter">注意：*为必填项；**为重新登录后生效。</td>
    </tr>
  </form>
</table>
<% end if %>
</body>
</html>
