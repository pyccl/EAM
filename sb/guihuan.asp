<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<html>
<head>
<%
if Instr(session("juese"),"|105,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end 
else
page=request("page")
	sqlu="select * from sbxx where id="& request("id")
		set rsu=conn.execute(sqlu)
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��˾�ʲ�����ϵͳ-�ʲ��黹</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="init()">
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form name="form1" method=post action="guihuan2.asp?page=<%=page%>&qx=<%=id%>">

	  
    <%
dim rs1,rs2,rs3,count1,count2,count3
set rs1=server.CreateObject("Adodb.recordSet")
	   
		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
		rk = "y_name = '" & mystr(i) & "' or " + rk
		next
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
var x;
document.form1.ssbm.length=0;
document.form1.ssbm.options[0]=new Option("==ѡ��黹�����ڹ�˾==","");
for(i=0;i<Pcount;i++){
	document.form1.ssbm.options[document.form1.ssbm.length]=new Option(subCat1[i][1],subCat1[i][0]);
}}
</script>
    <%
set rs2=server.CreateObject("Adodb.recordSet")
set rs3=server.CreateObject("Adodb.recordSet")
sql="select * from admin_department"
sql3="select * from admin_yuangong"
rs2.open sql,conn,1,1
rs3.open sql3,conn,1,1
%>
    <script language="javascript">
var Ccount=0;
var Dcount=0;
var subCat2=new Array();
var subCat3=new Array();
<%
count2=0
count3=0
do while not rs2.eof
%>
subCat2[<%=count2%>]=new Array("<%=rs2("company")%>","<%=rs2("department")%>","<%=rs2("company")%>");
<%
count2=count2+1
rs2.movenext
loop
rs2.close
set rs2=nothing
do while not rs3.eof
%>
subCat3[<%=count3%>]=new Array("<%=rs3("gh")%>|<%=rs3("xingming")%>","<%=rs3("department")%>-<%=rs3("xingming")%>","<%=rs3("company")%>");
<%
count3=count3+1
rs3.movenext
loop
rs3.close
set rs3=nothing
%>
Ccount=<%=count2%>
Dcount=<%=count3%>
function changeddep(cityId){
var i,x;
document.form1.department.length=0;
document.form1.department.options[0]=new Option("==ѡ����==","");
document.form1.syr.length=0;
document.form1.syr.options[0]=new Option("==ѡ��黹��==","");
for(i=0;i<Ccount;i++){
if(subCat2[i][2]==cityId){
document.form1.department.options[document.form1.department.length]=new Option(subCat2[i][1],subCat2[i][1]);
}}
for(x=0;x<Ccount;x++){
if(subCat3[x][2]==cityId){
document.form1.syr.options[document.form1.syr.length]=new Option(subCat3[x][1],subCat3[x][0]);
}}
}
</script>
	  
	  
    <tr class=classtop1>
      <td  height="25" colspan="4" align="center"><strong>�� �� �� ��</strong></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ���ţ�</strong></div></td>
      <td  align="center" class="classtd" ><div align="left">
          <input name="sbbh" class="form" id="sbbh" value="<%=rsu("sbbh")%>" size="20" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="sbcs" class="form" id="sbcs" value="<%=rsu("sbcs")%>" size="20" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="pp" id="pp" value="<%=rsu("pp")%>" class="form" size="20" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ����ࣺ</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="zilei" id="zilei" value="<%=rsu("zilei")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>Ʒ���ͺţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="xh" id="xh" value="<%=rsu("xh")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
      <td height="25" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font><strong>������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <div align="left"><span class="font">
          <select name="ssbm" id="ssbm" style="WIDTH: 180px" onChange="changeddep(document.form1.ssbm.options[document.form1.ssbm.selectedIndex].value);">
            <option value="">==ѡ��黹�����ڹ�˾==</option>
          </select>
        </span></div>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;<font color="#ff0033">* </font><strong>�� �� �ˣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <input name="syz" class="form" maxlength ="50" style="WIDTH:100px"/>
        <select name="syr" id="syr" class="form" onChange="syz.value=this.value">
          <option value="">==ѡ��黹��==</option>
        </select>
      </div></td>
      <td height="25" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�������ţ�</strong></div></td>
      <td height="25" align="center" class="classtd">
		  <div align="left">
			  <span class="font">
        <select class="form" name="department" id="department" style="WIDTH: 180px">
          <option value="">==ѡ����==</option>
        </select>
      </span></div>
	  </td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;<font color="#ff0033">* </font><strong>���λ�ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cfdd" class="form" id="cfdd" value="<%=rsu("cfdd")%>" size="20" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��ǰ״̬��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="zt" class="form" id="zt" value="<%=rsu("zt")%>" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>����ϵͳ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="czxt" value="<%=rsu("czxt")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
      <td height="25" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�� �� �ţ�</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <input name="ccbh" class="form" id="ccbh" value="<%=rsu("ccbh")%>" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�� ע ��</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <textarea name="bz" cols="60" rows="5" disabled><%=rsu("bz")%></textarea>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="4" align="center" class="classtd"><input name="�ύ" type="submit" class="button"   value=" �黹 " />
        &nbsp;
        <input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" ȡ�� " />
      <input type="hidden" name="id" value="<%=request("id")%>" /></td>
    </tr>
  </form>
</table>
<%end if%>
</body>
