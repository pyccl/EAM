<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/idcard.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��˾�ʲ�����ϵͳ</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<script src="../js/address/jquery.slim.min.js"></script>
<script src="../js/address/distpicker.js"></script>
<script src="../js/address/main.js"></script>
<script language="javascript">
function checkform()
{
    
if (document.form1.idCard.value=='')
{
alert('���֤�Ų���Ϊ��');
document.form1.idCard.focus();
return false;
}
	
if (document.form1.company.value=='')
{
alert('������˾����Ϊ��');
document.form1.company.focus();
return false;
}

if (document.form1.department.value=='')
{
alert('���Ų���Ϊ��');
document.form1.department.focus();
return false;
}

if (document.form1.position.value=='')
{
alert('ְλ����Ϊ��');
document.form1.position.focus();
return false;
}

if (document.form1.ruzhi.value=='')
{
alert('��ְʱ�䲻��Ϊ��');
document.form1.ruzhi.focus();
return false;
}

if (document.form1.phone.value=='')
{
alert('�ֻ����벻��Ϊ��');
document.form1.phone.focus();
return false;
}
}
</script>
</head>
<%if Instr(session("juese"),"|503,")=0 then%>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else
	page=request("page")
	sqlu="select * from admin_yuangong where id="& request("id")
	set rsu=server.createobject("adodb.recordset")
	rsu.open sqlu,connstr,1,1
	session("id") = rsu("id")
	session("yuanidcard") = rsu("idcard")
%>
<body>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form name="form1" method=post action="change_save2.asp?page=<%=page%>" onSubmit="return checkform()">
    <tr class=classtop1>
      <td  height="25" colspan="5" align="center"><b>Ա����Ϣ�޸�</b></td>
    </tr>
    <tr>
      <td height="25" align="center"  class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font><strong>Ա��������</strong></div></td>
      <td  align="center" class="classtd" ><div align="left">
          <input name="xingming" class="form" id="xingming" value="<%=rsu("xingming")%>" size="20" maxlength ="50" style="WIDTH: 180px" />
      </div></td>
      <td rowspan="5" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��Ƭ��</strong></div></td>
      <td rowspan="5" align="center" valign="middle" class="classtd">
		<%if rsu("photo") <> "" then%>
        	<img id="img" width="<%=session("yuangongimgw")%>" src="<%=rsu("photo")%>">
        <%else%>
        	<img id="img" width="<%=session("yuangongimgw")%>" src="../images/noimg.png">
        <%end if%>
        <input name="pic" type="hidden" id="pic" value="<%=rsu("photo")%>"/>
		<script>
			function backfn(aaa){
				document.getElementById("img").src=aaa;
				document.getElementById("pic").value=aaa;
			}
			</script>
	  </td>
      <td rowspan="5" align="center" valign="middle" class="classtd"><iframe frameborder="0" src="../js/upload/upload.asp" name="upload"></iframe></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>���ţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <div align="left">
          <%=rsu("gh")%>
        </div>
      </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�Ա�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <div align="left">
            <% riqi=mid(rsu("idcard"),7,8)
             xingbie=right(rsu("idcard"),2)
             if cint(left(xingbie,1)) mod 2=0 then
                 response.write "Ů"
             else
                 response.write "��"
             end if %>
          </div>
        </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�������ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%response.write mid(riqi,1,4)&"��"&mid(riqi,5,2)&"��"&mid(riqi,7,2)&"��"%>
      </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ���֤�ţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="idCard" class="form" id="idCard" style="WIDTH: 180px" value="<%=rsu("idcard")%>" maxlength="18" onBlur="javascript:checkIdcard(document.all.idCard.value);">
          </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <select name=company id="company" style="WIDTH: 180px">
          <%
		mystr=split(session("rank"),", ")
		for i=0 to ubound(mystr)
		rk = "y_name = '" & mystr(i) & "' or " + rk
		next
		rk = rk & " False"
		sql = "select y_name from admin_shiyongdanwei where " & rk & " order by y_paixu asc"

			   set rs=conn.execute(sql)
           if not rs.eof then
           do while not rs.eof 
          %>
          <option value="<%=Trim(rs("y_name"))%>" <%if rs("y_name")=rsu("company") then%>selected<%end if%>><%=rs("y_name")%></option>
          <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
        </select>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ���ţ�</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
        <input name="department" class="form" style="WIDTH: 180px" value="<%=rsu("department")%>" />
      </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;* </font><strong>ְλ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="position" class="form" style="WIDTH: 180px" value="<%=rsu("position")%>" />
          </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ��ְʱ�䣺</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="ruzhi" class="form" type="text" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" style="WIDTH: 180px" value="<%=rsu("ruzhi")%>"/>
        </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>ѧ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="education" class="form" style="WIDTH: 180px" value="<%=rsu("education")%>"  />
          </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> �ֻ����룺</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="phone" class="form" style="WIDTH: 180px" value="<%=rsu("phone")%>" maxlength="11" oninput="value=value.replace(/[^\d]/g,'')"/></div></td>
    
	<tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>΢�ţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="weixin" class="form" style="WIDTH: 180px" value="<%=rsu("weixin")%>"  />
          </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>QQ��</strong></div></td>
      <td height="25" colspan="2" align="center" class="classtd"><div align="left">
          <input name="qq" class="form" style="WIDTH: 180px" value="<%=rsu("qq")%>" maxlength="12" oninput="value=value.replace(/[^\d]/g,'')"/></div></td>
    
	<tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�����ַ��</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
          <div id="distpicker2">
            <%if len(rsu("place1"))=0 then%>
            <select data-province="-- ѡ��ʡ�� --" name="jg_1">
            </select>
            <%else%>
            <select data-province=<%=rsu("place1")%> name="jg_1">
            </select>
            <%end if%>
            <%if len(rsu("place2"))=0 then%>
            <select data-city="-- ѡ������ --" name="jg_2">
            </select>
            <%else%>
            <select data-city=<%=rsu("place2")%> name="jg_2">
            </select>
            <%end if%>
            <%if len(rsu("place3"))=0 then%>
            <select data-district="-- ѡ������ --" name="jg_3">
            </select>
            <%else%>
            <select data-district=<%=rsu("place3")%> name="jg_3">
            </select>
            <%end if%>
          </div>
        </div></td>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��ס��ַ��</strong></div></td>
      <td height="25" colspan="4" align="center" class="classtd"><div align="left">
        <div id="distpicker">
          <%if len(rsu("place4"))=0 then%>
          <select data-province="-- ѡ��ʡ�� --" name="zz_1">
          </select>
          <%else%>
          <select data-province=<%=rsu("place4")%> name="zz_1">
          </select>
          <%end if%>
          <%if len(rsu("place5"))=0 then%>
          <select data-city="-- ѡ������ --" name="zz_2">
          </select>
          <%else%>
          <select data-city=<%=rsu("place5")%> name="zz_2">
          </select>
          <%end if%>
          <%if len(rsu("place6"))=0 then%>
          <select data-district="-- ѡ������ --" name="zz_3">
          </select>
          <%else%>
          <select data-district=<%=rsu("place6")%> name="zz_3">
          </select>
          <%end if%>
        </div>
      </div></td>
    </tr>
    <tr>
      <td height="25" colspan="5" align="center" class="classfooter">
        <input name="�ύ" type="submit" class="form"   value=" �ύ�޸� " />&nbsp;
        <input name="reset" type="reset" onClick="javascript:history.back(-1);" class="form"  value="ȡ���޸�" />
        <input type="hidden" name="id" value="<%=request("id")%>" />
      </td>
    </tr>
  </form>
</table>
</body>
<%end if%>
