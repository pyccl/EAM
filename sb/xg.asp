<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<html>
<script language="javascript">
function checkform()
{
if (document.form1.zilei.value=='')
{
alert('�ʲ����಻��Ϊ��');
document.form1.zilei.focus();
return false;
}

if (document.form1.xh.value=='')
{
alert('Ʒ���ͺŲ���Ϊ��');
document.form1.xh.focus();
return false;
}

if (document.form1.ssbm.value=='')
{
alert('������˾����Ϊ��');
document.form1.ssbm.focus();
return false;
}

if (document.form1.zt.value=='')
{
alert('�ʲ�״̬����Ϊ��');
document.form1.zt.focus();
return false;
}

if (document.form1.cfdd.value=='')
{
alert('���λ�ò���Ϊ��');
document.form1.cfdd.focus();
return false;
}

}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��˾�ʲ�����ϵͳ</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
</head>
<%
if Instr(session("juese"),"|103,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end
else
page=request("page")
	sqlu="select * from sbxx where id="& request("id")
		set rsu=conn.execute(sqlu)
	if rsu.eof then
		response.write ("<script>alert('û���ҵ���Ӧ�ļ�¼������ϵ����Ա��');history.back()</script>")
	else 
	if Instr(session("rank"),rsu("ssbm"))<>0 then 

dim rs3,rs4,rs5,count3,count4,count5
set rs3=server.CreateObject("Adodb.recordSet")

		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
		rk = "y_name = '" & mystr(i) & "' or " + rk
		next
		rk = rk & " False"

    sql3="select * from admin_shiyongdanwei where " & rk & " order by y_paixu asc"

rs3.open sql3,conn,1,1
%>
<script language="javascript">
	var Qcount=0;
	var subCat3 = new Array();
	<%
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
	Qcount=<%=count3%>

	function init(){
		var i;
		document.form1.ssbm.length=0;
		document.form1.ssbm.options[0]=new Option("==ѡ��˾==","");
		for(i=0;i<Qcount;i++){
			if(document.form1.gss.value===subCat3[i][0]){document.form1.ssbm.options[document.form1.ssbm.length]=new Option(subCat3[i][1],subCat3[i][0],true,true);}else{document.form1.ssbm.options[document.form1.ssbm.length]=new Option(subCat3[i][1],subCat3[i][0]);}
		}
	}
</script>
<%
set rs4=server.CreateObject("Adodb.recordSet")
set rs5=server.CreateObject("Adodb.recordSet")
sql4="select * from admin_department"
sql5="select * from admin_yuangong"
rs4.open sql4,conn,1,1
rs5.open sql5,conn,1,1
%>
<script language="javascript">
	var Dcount=0;
	var Ecount=0;
	var subCat4=new Array();
	var subCat5=new Array();
	<%
	count4=0
	count5=0
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
				
	Dcount=<%=count4%>
	Ecount=<%=count5%>
	function changeddepart(depart_id){
		var i;
		var x;
		document.form1.department.length=0;
		document.form1.syr.length=0;
		document.form1.department.options[0]=new Option("==ѡ����==","");
		document.form1.syr.options[0]=new Option("==ѡ��ʹ����==","<%=rsu("syz")%>");
		for(i=0;i<Dcount;i++){
			if(subCat4[i][2]===depart_id){
				document.form1.department.options[document.form1.department.length]=new Option(subCat4[i][1],subCat4[i][1]);
			}
		}
		for(x=0;x<Dcount;x++){
			if(subCat5[x][2]===depart_id){
				document.form1.syr.options[document.form1.syr.length]=new Option(subCat5[x][1],subCat5[x][0]);
			}
		}
	}
</script>
<body onLoad="init()">
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form name="form1" method=post action="change_save2.asp?page=<%=page%>&qx=<%=id%>" onSubmit="return checkform()">
    <tr class=classtop1>
      <td height="25" colspan="5" align="center"><strong>�ʲ���Ϣ�޸�</strong><input type="hidden" name="gss" value="<%=rsu("ssbm")%>"></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font><strong>�ʲ���ţ�</strong></div></td>
      <td  align="center" class="classtd"><div align="left">
          <input name="sbbh" class="form" id="sbbh" value="<%=rsu("sbbh")%>" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;<font color="#ff0033">* </font><strong>�ʲ�������</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="sbcs" class="form" id="sbcs" value="<%=rsu("sbcs")%>" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> �ʲ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="pp" id="pp" value="<%=rsu("pp")%>" class="form" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;<font color="#ff0033">* </font><strong>�ʲ����ࣺ</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="zilei" class="form" id="zilei" value="<%=rsu("zilei")%>" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=ssbm id="ssbm" style="WIDTH: 180px" onChange="changeddepart(document.form1.ssbm.options[document.form1.ssbm.selectedIndex].value);">
            <option value="">==ѡ��˾==</option>
          </select>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> &nbsp;&nbsp;�������ţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd">
		  <div align="left">
          <select name="department" id="department" style="WIDTH: 180px">
            <option value="">==ѡ����==</option>
          </select>
        <font color="#F00">����ѡ��˾����ѡ���š�ʹ����</font></div>
</td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>ʹ���ˣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="syz" value="<%=rsu("syz")%>" class="form" maxlength ="50" style="WIDTH:100px"/>
        <select name="syr" id="syr" class="form" onChange="syz.value=this.value">
          <option value="">==ѡ��ʹ����==</option>
        </select>
        <font color="red">�������ѡ��ʹ����</font></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> </strong><strong>���λ�ã�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
        <input name="cfdd" class="form" id="cfdd" value="<%=rsu("cfdd")%>" maxlength ="50"  style="WIDTH: 180px"/>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> Ʒ���ͺţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="xh" id="xh" value="<%=rsu("xh")%>" class="form" maxlength ="50"  style="WIDTH: 180px"/>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ�״̬��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <select name=zt id="zt" style="WIDTH: 180px">
            <%set rsz=conn.execute("select ztm from [admin_state] order by y_paixu asc")
           if not rsz.eof then
           do while not rsz.eof 
          %>
            <option value="<%=Trim(rsz("ztm"))%>" <%if rsz("ztm")=rsu("zt") then%>selected<%end if%>><%=rsz("ztm")%></option>
            <%rsz.movenext
            loop
            end if 
            rsz.close:set rsz=nothing
         %>
          </select>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�������ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="scrq" type="text" class="form" id="d420" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" value="<%=rsu("scrq")%>" style="WIDTH: 180px"/>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>����ʱ�䣺</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
        <input name="gzsj" id="d4311" class="form" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'%y-%M-%d\'}'})" value="<%=rsu("gzsj")%>" style="WIDTH: 180px"/>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>���޵��ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="baoxiu" type="text" class="form" id="d4312" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})" value="<%=rsu("baoxiu")%>" style="WIDTH: 180px"/>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>���ý�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="prince" value="<%=rsu("price")%>" class="form" maxlength ="50" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')" style="WIDTH: 180px"/>
          ��λ��Ԫ</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>CPU��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cpu" id="cpu" value="<%=rsu("cpu")%>" class="form" style="WIDTH: 180px"/>
          �����ַ���&reg;��&trade;
          ��&copy;</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;&nbsp;</font><strong>�ڴ��С��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ram" id="ram" value="<%=rsu("ram")%>" class="form" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=0&&p2<350?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')" style="WIDTH: 180px"/>
          ��λ��GB</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>Ӳ�̴�С��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="hdd" value="<%=rsu("hdd")%>" class="form" maxlength ="50"  style="WIDTH: 180px"/>
          ���Ӳ����&ldquo;|&rdquo;�ָ��λ��GB </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>Ӳ�����кţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="hddsn" value="<%=rsu("hddsn")%>" class="form" maxlength ="50"  style="WIDTH: 180px"/>
          ���Ӳ����&ldquo;|&rdquo;�ָ�</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�Կ���</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gpu" value="<%=rsu("gpu")%>" class="form" style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>IP �� ַ��</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <input name="ip" class="form" id="ip" value="<%=rsu("ip")%>" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>MAC��ַ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="mac" value="<%=rsu("mac")%>" class="form" style="WIDTH: 180px"/>
          ���������&ldquo;|&rdquo;�ָ�</div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��������</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <input name="jqm" id="jqm" class="form" value="<%=rsu("jqm")%>" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>����ϵͳ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <select name="czxt" id="czxt"  style="WIDTH: 180px">
          <option value="" selected>==ѡ�����ϵͳ==</option>
          <%
			 if rsu("czxt")<>"" then
				 o2sql="select os from os where os = '" & Trim(rsu("czxt")) & "'"
				 set rso2=conn.execute(o2sql)
				 ts=rso2.eof and rso2.bof
				 if ts then
				 %>
          <option value="<%=Trim(rsu("czxt"))%>" selected><%=rsu("czxt")%></option>
          <%
			 end if
		   end if
		   osql="select os from os order by paixu asc"
			 set rso=conn.execute(osql)
           if not rso.eof then
			   do while not rso.eof 
			  %>
          <option value="<%=Trim(rso("os"))%>" <%if rso("os")=rsu("czxt") then%>selected<%end if%>><%=rso("os")%></option>
          <%rso.movenext
				loop
            end if 
            rso.close:set rso=nothing
			rso2.close:set rso2=nothing
         %>
        </select>
        <% if ts then %>
        <font color="#F00">�����ѡ���1��</font>
        <%end if%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>���кţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ccbh" class="form" id="ccbh" value="<%=rsu("ccbh")%>" maxlength ="50"  style="WIDTH: 180px"/>
          ���ѯ������ȡ������Ϣ
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�۾�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="zhejiu" id="zhejiu" value="<%=rsu("zhejiu")%>" class="form" onkeyup="var p2 = parseFloat(value).toFixed(2);value = p2>=1&&p2<=360?(/\.0?$/.test(value)?value:p2.replace(/0$/,'').replace(/\.0$/,'')):''" onblur="value = value.replace(/\.0*$/,'')" style="WIDTH: 180px"/>
      ��λ����</div></td>
      <td rowspan="2" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ���Ƭ��</strong></div></td>
      <td rowspan="2" align="center" class="classtd">
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
      <td rowspan="2" align="center" valign="middle" class="classtd">
		  <iframe frameborder="0" src="../js/upload/upload.asp" name="upload"></iframe></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�� ע ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <textarea name="bz" cols="46" rows="5"><%=rsu("bz")%></textarea>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="5" align="center" class="classtd"><input name="�ύ" type="submit" class="button"   value=" �ύ�޸� " />
        &nbsp;
        <input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value="ȡ���޸�" />
      <input type="hidden" name="id" value="<%=request("id")%>" /></td>
    </tr>
  </form>
</table>
<%
   else
    response.write ("<script>alert('������Ȩ�޸Ĵ��ʲ�������ϵ����Ա��');history.back()</script>")
   end if
  end if
end if
%>
</body>