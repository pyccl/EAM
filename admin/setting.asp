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
<title>ϵͳ����</title>
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
alert('��˾���Ʋ���Ϊ��');
document.formbar.companyname.focus();
return false;
}
if (document.formbar.systemname.value=='')
{
alert('ϵͳ���Ʋ���Ϊ��');
document.formbar.systemname.focus();
return false;
}
    if (document.formbar.lock.value=='')
{
alert('������������Ϊ��');
document.formbar.lock.focus();
return false;
}
    if (document.formbar.imgh.value=='')
{
alert('�ʲ�ͼƬ�߶Ȳ���Ϊ��');
document.formbar.imgh.focus();
return false;
}
    if (document.formbar.imgw.value=='')
{
alert('�ʲ�ͼƬ��Ȳ���Ϊ��');
document.formbar.imgw.focus();
return false;
}
    if (document.formbar.yuangongimgw.value=='')
{
alert('Ա��ͼƬ��Ȳ���Ϊ��');
document.formbar.yuangongimgw.focus();
return false;
}
    if (document.formbar.liebiao.value=='')
{
alert('�б���Ŀ����Ϊ��');
document.formbar.liebiao.focus();
return false;
}
    if (document.formbar.biaoqian.value=='')
{
alert('��ǩ�б���Ŀ����Ϊ��');
document.formbar.biaoqian.focus();
return false;
}
	if(document.formbar.biaoqian.value % 3 != 0)
{
alert('��ǩ�б���Ŀ��Ϊ3�ı���');
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
      <td  height="25" colspan="3" align="left"><img src="../images/table.gif" width="16" height="14"><img src="images/jt.gif" width="5" height="6">&nbsp;ϵͳ����</td>
    </tr>
    <tr>
      <td rowspan="6" align="center"  class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>ϵͳ���ã�</strong></div></td>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>��˾����**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="companyname" class="form" id="companyname"  style="WIDTH: 180px" value="<%=rs("companyname")%>"/>
        </div></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>ϵͳ����**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="systemname" class="form" id="systemname"  style="WIDTH: 180px" value="<%=rs("systemname")%>"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>�˻�����������</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="lock" class="form" id="lock" style="WIDTH: 180px" onBlur="if(value<2)value=2" value="<%=rs("lock")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>15)value=15"/>
          �����û��������������������˻�����Χ2-15��</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;��¼ҳ��ʾ**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="message" class="form" id="message" style="WIDTH: 180px" value="<%=rs("message")%>" maxlength="50"/>
          ���õ�¼ҳ����Ϣ��ʾ��&lt;=50���ַ���</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;ICP������**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="icpnum" class="form" id="icpnum" style="WIDTH: 180px" value="<%=rs("ICPnum")%>"/>
          &nbsp;���ӣ�
          <input name="icphttp" class="form" id="icphttp" style="WIDTH: 180px" value="<%=rs("ICPhttp")%>" maxlength="255"/>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;����������**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="gongannum" class="form" id="gongannum" style="WIDTH: 180px" value="<%=rs("gongannum")%>"/>
          &nbsp;���ӣ�
          <input name="gonganhttp" class="form" id="gonganhttp" style="WIDTH: 180px" value="<%=rs("gonganhttp")%>" maxlength="255"/>
        </div></td>
    </tr>
    <tr>
      <td align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>�̵����ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;�̵㿪�أ�</div></td>
      <td height="25" align="center" class="classtd"><span class="forumrow"> </span>
        <div align="left"><label><span class="forumrow">
          <input name="pdkg" type="checkbox" style="HEIGHT: 15px;WIDTH: 15px;" <%if rs("pd") then response.write ("checked")%>>
          </span>ѡ�п�����δѡ�йر�</label> &nbsp;&nbsp;
          <input type="button" class=button  size=3 value='�����̵�״̬' name=Submit5  onClick="window.location.href='sb/cz_pdzt.asp?zt=cz';return confirm('ȷ�������̵�״̬?');">
        </div></td>
    </tr>
    <tr>
      <td rowspan="3" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>ͼƬ���ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>�ʲ�ͼƬ�߶ȣ�</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="imgh" class="form" id="imgh" style="WIDTH: 180px" onBlur="if(value<50)value=50" value="<%=rs("imgh")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>120)value=120"/>
          �����ʲ�����ҳͼƬ�߶ȣ���Χ50-120px��</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>�ʲ�ͼƬ��ȣ�</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="imgw" class="form" id="imgw" style="WIDTH: 180px" onBlur="if(value<150)value=150" value="<%=rs("imgw")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>300)value=300"/>
          �����ʲ���ά��ҳͼƬ��ȣ���Χ150-300px��</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>Ա����Ƭ��ȣ�</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="yuangongimgw" class="form" id="yuangongimgw" style="WIDTH: 180px" onBlur="if(value<50)value=50" value="<%=rs("yuangongimgw")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>120)value=120"/>
          ����Ա������ҳͼƬ�߶ȣ���Χ50-120px��</div></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>�б����ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>��ǩ�б���Ŀ**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="biaoqian" class="form" id="biaoqian" style="WIDTH: 180px" onBlur="if(value<3)value=3" value="<%=rs("biaoqian")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>30)value=30"/>
          ���ô�ӡ�б�ҳ��ʾ����������Χ3-30����Ϊ3�ı�����</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp;* </font>�����б���Ŀ**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left">
          <input name="liebiao" class="form" id="liebiao" style="WIDTH: 180px" onBlur="if(value<5)value=5" value="<%=rs("liebiao")%>" oninput="value=value.replace(/[^\d]/g,'');if(value>30)value=30"/>
          �����б�ҳÿҳ��ʾ����������Χ5-30��</div></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="classtd"><div align="left"><font color="#ff0033"> &nbsp; </font><strong>�������ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;��¼ҳ�Զ��ڰ�**��</div></td>
      <td height="25" align="center" class="classtd"><div align="left"><label><span class="forumrow">
        <input name="sfhb" type="checkbox" style="HEIGHT: 15px;WIDTH: 15px;" <%if rs("sfhb") then response.write ("checked")%>>
        </span>ѡ�п�����δѡ�йر�</label>
        <font color="red">��������Ҫ������ֹʱ�䣬���������á�</font>
      </div></td>
    </tr>
    <tr>
	<td height="25" align="center" class="classtd"><div align="left">&nbsp;&nbsp;�Զ��ڰ�ʱ�䣺</div></td>
	<td height="25" align="center" class="classtd"><div align="left">
	  <input name="kssj" id="d4311" class="form" type="text" size="20" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<%=rs("kssj")%>"/>
-
<input name="jssj" type="text" class="form" id="d4312" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'d4311\')}'})" value="<%=rs("jssj")%>" size="20"/>
��ʼʱ��-����ʱ��
	</div></td>
    </tr>
    <tr>
      <td height="25" colspan="3" align="center" class="classtd"><input name="�ύ" type="submit" class="button" id="�ύ"  value="�޸�" /></td>
    </tr>
    <tr>
      <td height="25" colspan="3" class="classfooter">ע�⣺*Ϊ�����**Ϊ���µ�¼����Ч��</td>
    </tr>
  </form>
</table>
<% end if %>
</body>
</html>
