<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
page=request("page")
	sqlu="select * from sbxx where id="& request("id")
		set rsu=conn.execute(sqlu)
if Instr(session("juese"),"|106,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end 
else
   session("yssbm")=rsu("ssbm")
   session("ysyz")=rsu("syz")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��˾�ʲ�����ϵͳ-�ʲ�����</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form name="form1" action="diao2.asp?page=<%=page%>&qx=<%=id%>" method="post">
    <tr class=classtop1>
      <td  height="25" colspan="4" align="center"><strong>�� �� �� ��</strong></td>
    </tr>
    <tr>
      <td align="center"  class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ���ţ�</strong></div></td>
      <td  align="center" class="classtd" ><div align="left">
          <input name="sbbh" class="form" id="sbbh" value="<%=rsu("sbbh")%>" size="20" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="sbcs" class="form" id="sbcs" value="<%=rsu("sbcs")%>" size="20" maxlength ="50" disabled  style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�ʲ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="pp" id="pp" value="<%=rsu("pp")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px" />
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <div align="left">&nbsp;&nbsp;<strong>Ʒ���ͺţ�</strong></div>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="xh" id="xh" value="<%=rsu("xh")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>ԭ������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=ssbm disabled="disabled" id="ssbm" style="WIDTH: 180px">
            <%set rs=conn.execute("select y_id,y_name from [admin_shiyongdanwei] order by y_paixu asc")
           if not rs.eof then
           do while not rs.eof 
          %>
            <option value="<%=Trim(rs("y_name"))%>" <%if rs("y_name")=rsu("ssbm") then%>selected<%end if%>><%=rs("y_name")%></option>
            <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
          </select>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033">&nbsp;*</font><strong> ��������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <select name=xssbm id="xssbm" style="WIDTH: 180px">
            <option value="">==��ѡ��������Ĺ�˾==</option>
            <% sql="select y_id,y_name from [admin_shiyongdanwei] where y_name<>'"&session("yssbm")&"' order by y_paixu asc"
			 set rs=conn.execute(sql)
           if not rs.eof then
           do while not rs.eof 
          %>
            <option value="<%=Trim(rs("y_name"))%>"><%=rs("y_name")%></option>
            <%rs.movenext
            loop
            end if 
            rs.close:set rs=nothing
         %>
          </select>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>ԭʹ���ˣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="syz" disabled="disabled" class="form" value="<%=rsu("syz")%>" size="20" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>ԭ�����ţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="department" disabled="disabled" class="form" value="<%=rsu("department")%>" size="20" style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>���λ�ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="cfdd" disabled="disabled" class="form" id="cfdd" value="<%=rsu("cfdd")%>" size="20" maxlength ="50"  style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��ǰ״̬��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="zt" class="form" id="zt" value="<%=rsu("zt")%>" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>����ϵͳ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="czxt" value="<%=rsu("czxt")%>" class="form" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>�� �� �ţ�</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <input name="ccbh" class="form" id="ccbh" value="<%=rsu("ccbh")%>" size="20" maxlength ="50" disabled style="WIDTH: 180px"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;<strong>��&nbsp;ע ��</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <textarea name="bz" cols="60" rows="5" disabled><%=rsu("bz")%></textarea>
        </div></td>
    </tr>
    <tr>
      <td height="25" colspan="4" align="center" class="classtd"><input name="�ύ" type="submit" class="button" value=" ���� " />
        &nbsp;
        <input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" ȡ�� " />
      <input type="hidden" name="id" value="<%=request("id")%>" /></td>
    </tr>
  </form>
</table>
<%end if%>
</body>
</html>