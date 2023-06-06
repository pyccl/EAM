<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
page=request("page")
	sqlu="select * from sbxx where id="& request("id")
		set rsu=conn.execute(sqlu)
   if rsu.eof then
   	response.write ("<script>alert('没有找到相应的资产记录！请联系管理员！');history.back()</script>")
   else 
   if Instr(session("rank"),rsu("ssbm"))<>0 and Instr(session("juese"),"|108,")<>0 then 
%>
<html>
<script language="javascript">
function checkform()
{
if (document.form1.cfdd.value=='')
{
alert('存放位置不能为空');
document.form1.cfdd.focus();
return false;
}

if (document.form1.xh.value=='')
{
alert('品牌型号不能为空');
document.form1.xh.focus();
return false;
}

if (document.form1.pdzt.value=='')
{
alert('盘点状态不能为空');
document.form1.pdzt.focus();
return false;
}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公司资产管理系统</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
</head>

<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form name="form1" method=post action="pd_save.asp?page=<%=page%>&qx=<%=id%>" onSubmit="return checkform()">
    <tr class=classtop1>
      <td  height="25" colspan="5" align="center"><strong>资 产 信 息 盘 点</strong></td>
    </tr>
    <tr>
      <td width="12%" align="center"  class="classtd"><div align="left">&nbsp;&nbsp;<strong>资产编号：</strong></div></td>
      <td  align="center" class="classtd" ><div align="left"><%=rsu("sbbh")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>资产从属：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left"><%=rsu("sbcs")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>资产类别：</strong></div></td>
      <td width="35%" height="25" align="center" class="classtd"><div align="left"><%=rsu("pp")%></div></td>
      <td width="12%" height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;</strong><strong>资产子类：</strong></div></td>
      <td width="41%" height="25" colspan="2" align="center" class="classtd"><div align="left"><%=rsu("zilei")%></div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>所属公司：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ssbm")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> &nbsp;&nbsp;使 用 人：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left"><%=rsu("syz")%></div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> 存放位置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="cfdd" style="WIDTH: 180px" class="form" id="cfdd" value="<%=rsu("cfdd")%>" size="20" maxlength ="50" />
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;<font color="#ff0033">* </font><strong>盘点状态：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
        <select name=pdzt id="pdzt" style="WIDTH: 180px">
		  <option value="" selected>==选择状态==</option>
          <option value="1">正常</option>
		  <option value="2">盘盈</option>
		  <option value="3">盘亏</option>
		  </select>
      </div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> 品牌型号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="xh" style="WIDTH: 180px" id="xh" value="<%=rsu("xh")%>" class="form" size="20" maxlength ="50" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>生产日期：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="scrq" style="WIDTH: 180px" type="text" class="form" id="d420" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" value="<%=rsu("scrq")%>" size="20"/>
	  </div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>购置时间：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gzsj" style="WIDTH: 180px" id="d4311" class="form" type="text" size="20" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'%y-%M-%d\'}'})" value="<%=rsu("gzsj")%>"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>购置金额：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="prince" style="WIDTH: 180px" value="<%=rsu("price")%>" class="form" size="20" maxlength ="50" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
		  单位：元</div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>CPU：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cpu" style="WIDTH: 180px" id="cpu" value="<%=rsu("cpu")%>" class="form" size="20" />
        特殊字符：&reg;、&trade;
      、&copy;</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;&nbsp;</font><strong>内存大小：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ram" style="WIDTH: 180px" id="ram" value="<%=rsu("ram")%>" class="form" size="20" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0&&p2<350?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
		  单位：GB</div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>硬盘大小：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="hdd" style="WIDTH: 180px" value="<%=rsu("hdd")%>" class="form" size="20" maxlength ="50" />
          多块硬盘用&ldquo;|&rdquo;分割；单位：GB </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>硬盘序列号：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="hddsn" style="WIDTH: 180px" value="<%=rsu("hddsn")%>" class="form" size="20" maxlength ="50" />
		  多块硬盘用&ldquo;|&rdquo;分割</div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>显卡：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gpu" style="WIDTH: 180px" value="<%=rsu("gpu")%>" class="form" size="20"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>IP 地 址：</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <input name="ip" style="WIDTH: 180px" class="form" id="ip" value="<%=rsu("ip")%>" size="20" maxlength ="50" />
		  </div></td></tr>
    <tr>
      <td height="25"  align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>MAC地址：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="mac" style="WIDTH: 180px" value="<%=rsu("mac")%>" class="form" size="20"/>
          多块网卡用&ldquo;|&rdquo;分割</div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>机器名：</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <input name="jqm" style="WIDTH: 180px" id="jqm" class="form" value="<%=rsu("jqm")%>" size="20" maxlength ="50" />
		  </div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>保修到期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="baoxiu" type="text" style="WIDTH: 180px" class="form" id="d4312" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})" value="<%=rsu("baoxiu")%>" size="20"/>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>序列号：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ccbh" style="WIDTH: 180px" class="form" id="ccbh" value="<%=rsu("ccbh")%>" size="20" maxlength ="50" />
          常用：<a href="https://www.dell.com/support/home/cn/zh/cnbsd1" target="_blank">Dell</a> <a href="https://think.lenovo.com.cn/service/warranty/repairDeploy.html" target="_blank">Thinkpad</a> <a href="https://newsupport.lenovo.com.cn/" target="_blank">联想</a></div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>操作系统：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="czxt" style="WIDTH: 180px" value="<%=rsu("czxt")%>" class="form" size="20" maxlength ="50" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>所属部门：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left"><%=rsu("department")%></div></td></tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>盘点备注：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <textarea name="pdbz" cols="46" rows="5"><%=rsu("pdbz")%></textarea>
        </div></td>
      <td class="classtd"><div align="left">&nbsp;&nbsp;<strong>资产照片：</strong></div></td>
      <td class="classtd">
        <%if rsu("pic") <> "" then%>
        	<img id="img" height="<%=session("imgh")%>" src="<%=rsu("pic")%>">
        <%else%>
        	<img id="img" height="<%=session("imgh")%>" src="../images/noimg.gif">
        <%end if%>
        <input name="pic" type="hidden" id="pic" value="<%=rsu("pic")%>"/>
	  <script>
			function backfn(aaa){
				document.getElementById("img").src=aaa;
				document.getElementById("pic").value=aaa;
			}
			</script>	  </td>
      <td class="classtd"><iframe frameborder="0" src="../js/upload/upload.asp" name="upload"></iframe>        <br></td></tr>
    <tr>
      <td height="25" colspan="5" align="center" class="classtd"><input name="提交" type="submit" class="button"   value=" 确认盘点 " />&nbsp;
        <input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value="取消盘点" />
      <input type="hidden" name="id" value="<%=request("id")%>" /></td>
		  <tr></tr>
  </form>
</table>
<%
   else
    response.write ("<script>alert('错误！无权盘点此资产！请联系管理员！');history.back()</script>")
   end if
  end if%>