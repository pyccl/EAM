<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/conn.asp"-->

<%if Instr(session("juese"),"|101,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>电脑资产管理系统-资产添加</title>
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
if (document.formbar.sbbh.value=='')
{
alert('资产编号不能为空');
document.formbar.sbbh.focus();
return false;
}

if (document.formbar.sbcs.value=='')
{
alert('资产从属不能为空');
document.formbar.sbcs.focus();
return false;
}

if (document.formbar.pp.value=='')
{
alert('资产类别不能为空');
document.formbar.pp.focus();
return false;
}

if (document.formbar.zilei.value=='')
{
alert('资产子类不能为空');
document.formbar.zilei.focus();
return false;
}

if (document.formbar.xh.value=='')
{
alert('品牌型号不能为空');
document.formbar.xh.focus();
return false;
}

if (document.formbar.ssbm.value=='')
{
alert('所属公司不能为空');
document.formbar.ssbm.focus();
return false;
}
	
if (document.formbar.zt.value=='')
{
alert('资产状态不能为空');
document.formbar.zt.focus();
return false;
}

if (document.formbar.cfdd.value=='')
{
alert('存放位置不能为空');
document.formbar.cfdd.focus();
return false;
}
	
if (document.formbar.zhejiu.value=='')
{
alert('折旧月数不能为空');
document.formbar.zhejiu.focus();
return false;
}
}
</script>
<body onLoad="init()">
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <FORM id="formfoo" name="formbar" action="regist_save.asp" method="post" onSubmit="return checkform()">
    <%
dim rs1,rs2,rs3,rs4,count1,count2,count3,count4
set rs1=server.CreateObject("Adodb.recordSet")
set rs3=server.CreateObject("Adodb.recordSet")
sql="select * from admin_bsort order by s_paixu asc"

		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
		rk = "y_name = '" & mystr(i) & "' or " + rk
	    rk1 = "company = '" & mystr(i) & "' or " + rk1
		next
		rk = rk & " False"
	    rk1 = rk1 & "False"


    sql3="select * from admin_shiyongdanwei where " & rk & " order by y_paixu asc"

rs1.open sql,conn,1,1
rs3.open sql3,conn,1,1
%>
    <script language="javascript">
	var Pcount=0;
	var Qcount=0;
	var subCat1 = new Array();
	var subCat3 = new Array();
	<%
	count1=0
	do while not rs1.eof
	%>
		subCat1[<%=count1%>]=new Array("<%=rs1("s_name")%>","<%=rs1("s_name")%>"); 
	<%
		rs1.movenext
		count1=count1+1
	loop
	rs1.close
	set rs1=nothing
	count3=0
	do while not rs3.eof

	%>
		subCat3[<%=count3%>]=new Array("<%=rs3("y_name")%>","<%=rs3("y_name")%>"); 
	<%
		rs3.movenext
		count3=count3+1
	loop
	rs3.close
	set rs3=nothing
	%>
	Pcount=<%=count1%>
	Qcount=<%=count3%>

	function init(){
		var i;
		var j;
		document.formbar.sbcs.length=0;
		document.formbar.sbcs.options[0]=new Option("==选择从属==","");
		for(i=0;i<Pcount;i++){
		document.formbar.sbcs.options[document.formbar.sbcs.length]=
		new Option(subCat1[i][1],subCat1[i][0]);
		}
		i=0;
		j=0;
		document.formbar.ssbm.length=0;
		document.formbar.ssbm.options[0]=new Option("==选择公司==","");
		for(i=0;i<Qcount;i++){
		document.formbar.ssbm.options[document.formbar.ssbm.length]=
		new Option(subCat3[i][1],subCat3[i][0]);
		}
	}
</script>
    <%
set rs2=server.CreateObject("Adodb.recordSet")
set rs4=server.CreateObject("Adodb.recordSet")
set rs5=server.CreateObject("Adodb.recordSet")
sql="select * from admin_sort"
sql4="select * from admin_department"
sql5="select * from admin_yuangong"
rs2.open sql,conn,1,1
rs4.open sql4,conn,1,1
rs5.open sql5,conn,1,1
%>
    <script language="javascript">
	var Ccount=0;
	var Dcount=0;
	var Ecount=0;
	var subCat2=new Array();
	var subCat4=new Array();
	var subCat5=new Array();
	<%
	count2=0
	count4=0
	count5=0
	do while not rs2.eof
	%>
		subCat2[<%=count2%>]=new Array("<%=rs2("s_bname")%>","<%=rs2("s_name")%>","<%=rs2("s_bname")%>");
	<%
		count2=count2+1
		rs2.movenext
	loop
	rs2.close
	set rs2=nothing
	do while not rs4.eof
	%>
		subCat4[<%=count4%>]=new Array("<%=rs4("company")%>","<%=rs4("department")%>","<%=rs4("company")%>");
	<%
		count4=count4+1
		rs4.movenext
	loop
	rs4.close
	set rs4=nothing
	do while not rs5.eof
	%>
		subCat5[<%=count5%>]=new Array("<%=rs5("gh")%>|<%=rs5("xingming")%>","<%=rs5("department")%>-<%=rs5("xingming")%>","<%=rs5("company")%>");
	<%
		count5=count5+1
		rs5.movenext
	loop
	rs5.close
	set rs5=nothing
	%>
	Ccount=<%=count2%>
	Dcount=<%=count4%>
	Ecount=<%=count5%>

	function changedCity(cityId){
		var i;
		document.formbar.pp.length=0;
		document.formbar.pp.options[0]=new Option("==选择类别==","");
		for(i=0;i<Ccount;i++){
			if(subCat2[i][2]==cityId){
				document.formbar.pp.options[document.formbar.pp.length]=
				new Option(subCat2[i][1],subCat2[i][1]);
			}
		}
	}
	function changeddepart(depart_id){
		var i;
		var x;
		document.formbar.department.length=0;
		document.formbar.syr.length=0;
		document.formbar.department.options[0]=new Option("==选择部门==","");
		document.formbar.syr.options[0]=new Option("==选择员工==","");
		for(i=0;i<Dcount;i++){
			if(subCat4[i][2]==depart_id){
				document.formbar.department.options[document.formbar.department.length]=
				new Option(subCat4[i][1],subCat4[i][1]);
			}
		}
		for(x=0;x<Dcount;x++){
			if(subCat5[x][2]==depart_id){
				document.formbar.syr.options[document.formbar.syr.length]=
				new Option(subCat5[x][1],subCat5[x][0]);
			}
		}
	}
</script>
    <tr class=classtop1 width="12%" >
      <td  height="25" colspan="5" align="left">
		  <img src="../images/table.gif" width="16" height="14">
		  <img src="../images/jt.gif" width="5" height="6">&nbsp;<b>添加资产</b></td>
    </tr>
    <script language="javascript">
		function getjqm()
		{
			var sbbhTxt1=document.getElementById("sbbh");
			var jqmTxt=document.getElementById("signwebname");
			jqmTxt.value=sbbhTxt1.value;
		}
	</script>
    <tr>
      <td align="center"  class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>资产编号：</strong></div></td>
      <td align="center" class="classtd"><div align="left">
          <input name="sbbh" class="form" id="sbbh"  style="WIDTH: 180px"  onBlur="getjqm()" />
          <font color="red">谨慎填写，该条目填完后无法修改</font></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>资产从属：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name="sbcs" id="sbcs" onChange="changedCity(document.formbar.sbcs.options[document.formbar.sbcs.selectedIndex].value);" style="WIDTH: 180px" class="form">
            <option value="">==选择从属==</option>
          </select>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>资产类别：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name="pp" id="pp" style="WIDTH: 180px" class="form">
            <option value="">==选择类别==</option>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>资产子类：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="zilei" class="form" id="zilei" style="WIDTH: 180px"  />
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>所属公司：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=ssbm id="ssbm" style="WIDTH: 180px" onChange="changeddepart(document.formbar.ssbm.options[document.formbar.ssbm.selectedIndex].value);" class="form">
            <option value="">==选择公司==</option>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;所属部门：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name="department" id="department" style="WIDTH: 180px" class="form">
            <option value="">==选择部门==</option>
          </select>
          <font color="red">资产在使用时，请选择此项！</font>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>存放位置：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cfdd" class="form" id="cfdd" style="WIDTH: 180px" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;使 用 人：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
		<input name="syz" id="syz" style="WIDTH: 100px" class="form"/>
		<select name="syr" id="syr" class="form" onChange="syz.value=this.value">
			<option value="">==选择员工==</option>
		</select> <font color="red">请填入或选择员工</font></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>品牌型号：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="xh" style="WIDTH: 180px" class="form"  />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>资产状态：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name=zt id="zt" style="WIDTH: 180px" class="form">
            <option value="">==选择状态==</option>
            <%set rs=conn.execute("select ztm from [admin_state] order by y_paixu asc")
           if not rs.eof then
           do while not rs.eof 
          %>
            <option value="<%=Trim(rs("ztm"))%>"><%=rs("ztm")%></option>
            <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
          </select>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;操作系统：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=czxt id="czxt" style="WIDTH: 180px" class="form">
            <option value="">==选择操作系统==</option>
            <%
		   osql="select os from os order by paixu asc" 
		   set rso=conn.execute(osql)
           if not rso.eof then
           do while not rso.eof 
          %>
            <option value="<%=Trim(rso("os"))%>"><%=rso("os")%></option>
            <%rso.movenext
            loop
            end if 
            rso.close:set rso=nothing
         %>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;生产日期：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="scrq" type="text" class="form" id="d420" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;购置日期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gzsj" id="d4311" class="form" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'%y-%M-%d\'}'})" style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;购置金额：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="price" class="form" id="price"   style="WIDTH: 180px" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
          单位：元</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;C&nbsp;P&nbsp;U：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cpu" class="form" id="cpu" style="WIDTH: 180px"/>
          特殊字符：&reg;、&trade;
          、&copy;</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;内存大小：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ram" class="form" id="ram" style="WIDTH: 180px" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0&&p2<350?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
          单位：GB</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;硬盘大小：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="hdd" class="form" id="hdd" style="WIDTH: 180px"/>
          多块用&ldquo;|&rdquo;分割，单位：GB</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;硬盘序列号：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="hddsn" class="form" id="hddsn" style="WIDTH: 180px" />
          多块用&ldquo;|&rdquo;分割</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;显&nbsp;&nbsp;卡：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gpu" class="form" id="gpu" style="WIDTH: 180px" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;I&nbsp;P地址：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="txtIPAddr" class="form" id="txtIPAddr" style="WIDTH: 180px"  />
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;MAC地址：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="mac" class="form" id="mac" style="WIDTH: 180px" />
          多网卡用&ldquo;|&rdquo;分割</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;机 器 名：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="signwebname" class="form" id="signwebname"   style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;保修到期：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input id="d4312" class="form" type="text" name="baoxiu" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})"  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;序 列 号：</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ccbh" class="form" id="ccbh" style="WIDTH: 180px" />
          请查询官网获取保修信息
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;折旧月数：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="zhejiu" class="form" id="zhejiu" style="WIDTH: 180px" onblur="value = value.replace(/\.0*$/,'')" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=1&&p2<=360?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" value="60"/>
      单位：月</div></td>
      <td rowspan="2" class="classtd"><div align="left"><strong>&nbsp;&nbsp;资产照片：</strong></div></td>
      <td rowspan="2" align="center" valign="middle" class="classtd">
		<img id="img" height="<%=session("imgh")%>" src="../images/noimg.gif">
			<input type="hidden" name="pic" id="pic"/>
			<script>
			function backfn(aaa){
				document.getElementById("img").src=aaa;
				document.getElementById("pic").value=aaa;
			}
			</script>	  </td>
      <td rowspan="2" align="center" valign="middle" class="classtd">
			<iframe frameborder="0" src="../js/upload/upload.asp" name="upload"></iframe>	  </td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;备&nbsp;注：</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <p class="font">
            <textarea name="bz" id="bz" cols="46" rows="5"></textarea>
          </p>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="5" align="center" class="classtd"><input name="提交" type="submit" class="button" id="提交"  value="添加" />
        &nbsp;
      <input name="qt" type="button" class="button" id="qt"  value="取消" onClick="location='news_list.asp'"/></td>
    </tr>
  </form>
</table>
<%end if%>
</body>
</html>