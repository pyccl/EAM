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
<title>�����ʲ�����ϵͳ-�ʲ����</title>
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
if (document.formbar.sbbh.value=='')
{
alert('�ʲ���Ų���Ϊ��');
document.formbar.sbbh.focus();
return false;
}

if (document.formbar.sbcs.value=='')
{
alert('�ʲ���������Ϊ��');
document.formbar.sbcs.focus();
return false;
}

if (document.formbar.pp.value=='')
{
alert('�ʲ������Ϊ��');
document.formbar.pp.focus();
return false;
}

if (document.formbar.zilei.value=='')
{
alert('�ʲ����಻��Ϊ��');
document.formbar.zilei.focus();
return false;
}

if (document.formbar.xh.value=='')
{
alert('Ʒ���ͺŲ���Ϊ��');
document.formbar.xh.focus();
return false;
}

if (document.formbar.ssbm.value=='')
{
alert('������˾����Ϊ��');
document.formbar.ssbm.focus();
return false;
}
	
if (document.formbar.zt.value=='')
{
alert('�ʲ�״̬����Ϊ��');
document.formbar.zt.focus();
return false;
}

if (document.formbar.cfdd.value=='')
{
alert('���λ�ò���Ϊ��');
document.formbar.cfdd.focus();
return false;
}
	
if (document.formbar.zhejiu.value=='')
{
alert('�۾���������Ϊ��');
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
		document.formbar.sbcs.options[0]=new Option("==ѡ�����==","");
		for(i=0;i<Pcount;i++){
		document.formbar.sbcs.options[document.formbar.sbcs.length]=
		new Option(subCat1[i][1],subCat1[i][0]);
		}
		i=0;
		j=0;
		document.formbar.ssbm.length=0;
		document.formbar.ssbm.options[0]=new Option("==ѡ��˾==","");
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
		document.formbar.pp.options[0]=new Option("==ѡ�����==","");
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
		document.formbar.department.options[0]=new Option("==ѡ����==","");
		document.formbar.syr.options[0]=new Option("==ѡ��Ա��==","");
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
		  <img src="../images/jt.gif" width="5" height="6">&nbsp;<b>����ʲ�</b></td>
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
      <td align="center"  class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>�ʲ���ţ�</strong></div></td>
      <td align="center" class="classtd"><div align="left">
          <input name="sbbh" class="form" id="sbbh"  style="WIDTH: 180px"  onBlur="getjqm()" />
          <font color="red">������д������Ŀ������޷��޸�</font></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>�ʲ�������</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name="sbcs" id="sbcs" onChange="changedCity(document.formbar.sbcs.options[document.formbar.sbcs.selectedIndex].value);" style="WIDTH: 180px" class="form">
            <option value="">==ѡ�����==</option>
          </select>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>�ʲ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name="pp" id="pp" style="WIDTH: 180px" class="form">
            <option value="">==ѡ�����==</option>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>�ʲ����ࣺ</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="zilei" class="form" id="zilei" style="WIDTH: 180px"  />
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=ssbm id="ssbm" style="WIDTH: 180px" onChange="changeddepart(document.formbar.ssbm.options[document.formbar.ssbm.selectedIndex].value);" class="form">
            <option value="">==ѡ��˾==</option>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�������ţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name="department" id="department" style="WIDTH: 180px" class="form">
            <option value="">==ѡ����==</option>
          </select>
          <font color="red">�ʲ���ʹ��ʱ����ѡ����</font>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>���λ�ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cfdd" class="form" id="cfdd" style="WIDTH: 180px" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;ʹ �� �ˣ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
		<input name="syz" id="syz" style="WIDTH: 100px" class="form"/>
		<select name="syr" id="syr" class="form" onChange="syz.value=this.value">
			<option value="">==ѡ��Ա��==</option>
		</select> <font color="red">�������ѡ��Ա��</font></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>Ʒ���ͺţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="xh" style="WIDTH: 180px" class="form"  />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong><font color="#ff0033"> &nbsp;* </font>�ʲ�״̬��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name=zt id="zt" style="WIDTH: 180px" class="form">
            <option value="">==ѡ��״̬==</option>
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
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;����ϵͳ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=czxt id="czxt" style="WIDTH: 180px" class="form">
            <option value="">==ѡ�����ϵͳ==</option>
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
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�������ڣ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="scrq" type="text" class="form" id="d420" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�������ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gzsj" id="d4311" class="form" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'%y-%M-%d\'}'})" style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;���ý�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="price" class="form" id="price"   style="WIDTH: 180px" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
          ��λ��Ԫ</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;C&nbsp;P&nbsp;U��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cpu" class="form" id="cpu" style="WIDTH: 180px"/>
          �����ַ���&reg;��&trade;
          ��&copy;</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�ڴ��С��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ram" class="form" id="ram" style="WIDTH: 180px" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0&&p2<350?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')"/>
          ��λ��GB</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;Ӳ�̴�С��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="hdd" class="form" id="hdd" style="WIDTH: 180px"/>
          �����&ldquo;|&rdquo;�ָ��λ��GB</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;Ӳ�����кţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="hddsn" class="form" id="hddsn" style="WIDTH: 180px" />
          �����&ldquo;|&rdquo;�ָ�</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;��&nbsp;&nbsp;����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gpu" class="form" id="gpu" style="WIDTH: 180px" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;I&nbsp;P��ַ��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="txtIPAddr" class="form" id="txtIPAddr" style="WIDTH: 180px"  />
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;MAC��ַ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="mac" class="form" id="mac" style="WIDTH: 180px" />
          ��������&ldquo;|&rdquo;�ָ�</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�� �� ����</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="signwebname" class="form" id="signwebname"   style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;���޵��ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input id="d4312" class="form" type="text" name="baoxiu" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})"  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�� �� �ţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ccbh" class="form" id="ccbh" style="WIDTH: 180px" />
          ���ѯ������ȡ������Ϣ
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�۾�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="zhejiu" class="form" id="zhejiu" style="WIDTH: 180px" onblur="value = value.replace(/\.0*$/,'')" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=1&&p2<=360?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" value="60"/>
      ��λ����</div></td>
      <td rowspan="2" class="classtd"><div align="left"><strong>&nbsp;&nbsp;�ʲ���Ƭ��</strong></div></td>
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
      <td height="25" align="center" class="classtd"><div align="left"><strong>&nbsp;&nbsp;��&nbsp;ע��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <p class="font">
            <textarea name="bz" id="bz" cols="46" rows="5"></textarea>
          </p>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="5" align="center" class="classtd"><input name="�ύ" type="submit" class="button" id="�ύ"  value="���" />
        &nbsp;
      <input name="qt" type="button" class="button" id="qt"  value="ȡ��" onClick="location='news_list.asp'"/></td>
    </tr>
  </form>
</table>
<%end if%>
</body>
</html>