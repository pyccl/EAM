<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|502,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
		page=Request.Querystring("page")
		id=Request.Querystring("id")
		sqlu="select * from admin_yuangong where id=" & id
			set rsu=conn.execute(sqlu)
			If Not rsu.eof Then 
				Call info()
				Else
   response.write("<br><br><div align=center>δ�ҵ���Ա����Ϣ����<a href=admin_yuangong.asp>����˴�</a>���أ�</div>")
			End If 
Sub info()
%>
<style type="text/css">
<!--
.STYLE7 {color: #ffffff}
-->
</style>
<!--#include file="../inc/displaytip.asp"-->
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
  <form action="change_save2.asp" method="post" name="form1" id="form1">
    <tr class="classtop1">
      <td  height="25" colspan="4" align="center"><strong><font color="#ffffff">Ա����<%=rsu("xingming")%>��<%=rsu("gh")%>����������</font></strong></td>
    </tr>
    <tr>
      <td height="25" colspan="2" align="center"  class="classfooter"><div align="left"><strong>&nbsp;<font color="#ff0000"><%=rsu("xingming")%></font>��<%=rsu("gh")%>������ϸ��Ϣ</strong></div></td>
      <td height="25" align="center"  class="classfooter">
		  <div align="left" onmousemove="position();" onmouseout="hide();">
			<%
				set rs2=server.CreateObject("adodb.recordset")
				sql2="select * from sbxx where syz like '%"& rsu("gh") &"%'"
				rs2.open sql2,conn, 1, 1
					do while not rs2.eof
			   			idd = rs2("id")
			   			zc=zc & "��" & rs2("pp") & "��" & rs2("sbbh") & "��" & "<br>"
						rs2.movenext
					loop
				if rs2.eof and rs2.bof then
					response.write "<strong><font color = red>�������κ��ʲ�</font></strong>"
				else
			   		response.write "<strong>���¹���<font color=red> "& rs2.recordcount &" </font>̨�豸</strong>"
				end if
			%>
		  </div>
		  </td>
      <td height="25" align="center" class="classfooter" ><%if Instr(session("rank"),rsu("company"))<>0 and Instr(session("juese"),"|503,")<>0 then%><a href="xg_yuangong.asp?id=<%=rsu("id")%>" class="STYLE7">�޸�����</a><%end if%></td>
    </tr>
    <tr>
      <td height="25" align="center"  class="classtd"><div align="left"><strong>���������ţ���</strong></div></td>
      <td align="center" class="classtd" ><div align="left"><%=rsu("xingming")%>(<%=rsu("gh")%>)</div></td>
	   <td rowspan="6" align="center" class="classtd"><div align="left"><span class="font"><strong> ��Ƭ��</strong></span></div></td>
       <td rowspan="6" class="classtd">
			<%
			pic=rsu("photo")
			if Trim(pic)="" or isnull(rsu("photo")) then
			   response.write "<img width=" & session("yuangongimgw") & " src=" & "../images/noimg.png" & ">" 
			else
				response.write "<a href=" & pic & " target='_blank' title='���ͼƬ�鿴ԭͼ'><img src=" & pic & " width=" & session("yuangongimgw") & "></a>"
			end if
			%></td>
	  </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong> �Ա�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <% riqi=mid(rsu("idcard"),7,8)
             xingbie=right(rsu("idcard"),2)
             if cint(left(xingbie,1)) mod 2=0 then
                 response.write "Ů"
             else
                 response.write "��"
             end if %>
		  </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�������ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%response.write mid(riqi,1,4)&"��"&mid(riqi,5,2)&"��"&mid(riqi,7,2)&"��"%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>���֤�ţ�</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left" title="<%=rsu("idcard")%>"><%idcard=Left(rsu("idcard"),6)&"********"&Right(rsu("idcard"),4)%><%=idcard%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong> ������˾��</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("company")%></div></td>
    </tr>

    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>�������ţ�</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("department")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>ְλ��</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("position")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>��ְʱ�䣺</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <%=rsu("ruzhi")%> &nbsp;	
		  <%
			if not isnull(rsu("ruzhi")) then 
			 tempz=Datediff("D",now(),rsu("ruzhi"))
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
			   if rsu("ruzhi") >now() then 
				response.write "<B><font color=red>¼�����</font></B>"
			   elseif tempy=0 and tempm<>0 then
					response.write "<B>˾��<font color=#2E8B57>" & tempm & "��</font></B>"
			   elseif tempy=0 and tempm=0 then
					response.write "<B><font color=#006400>��Ա��</font></B>"
				else
					response.write "<B>˾��<font color=#0000FF>" & tempy & "��</font></B>"
			   end if
			end if
			%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>���ѧ����</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("education")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>�ֻ����룺</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("phone")%></div></td>
    </tr>
	<tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>΢�ţ�</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("weixin")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>QQ��</strong></span></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("qq")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><span class="font"><strong>�����ַ��</strong></span></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left"><%=rsu("place1")%>-<%=rsu("place2")%>-<%=rsu("place3")%></div></td>
    </tr>
	<tr>
	  <td class="classtd"><div align="left"><span class="font"><strong>��ס��ַ��</strong></span></div></td>
	  <td colspan="3" class="classtd"><div align="left"><%=rsu("place4")%>-<%=rsu("place5")%>-<%=rsu("place6")%></div></td>
    </tr>
	<tr>
	  <td align="center" class="classtd"><div align="left"><span class="font"><strong>�豸��¼��</strong></span></div></td>
<%
	sqll="select * from sb_log where ssbm like '%"& rsu("xingming") &"%' or user like '%"& rsu("xingming") &"%' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=4 valign=middle class=classtd>��Ա��û���κ��ʲ���¼��</td>"
   			else
		   		rsuu.pagesize=5
				if request("page")<>"" then
		  			epage=cint(request("page"))
		   			if epage<1 then epage=1
		   			if epage>rsuu.pagecount then epage=rsuu.pagecount
				else
					epage=1
				end if
			rsuu.absolutepage = epage
   %>
	  <td colspan="3" class="classtd" align="center"><div align="left">
	    <% i=0
			do while not rsuu.eof 
				'������z�ж������ǽ�����黹�Ļ�������������ʾ��ͬ��'
				if rsuu("leixing")="���" or rsuu("leixing")="�黹" then %>
	    <%=rsuu("datetime")%>&nbsp;��<font color="red">��<%=rsuu("leixing")%>��</font>�ʲ����Ϊ<font color="blue">��<%=rsuu("zcid")%>��</font>���ʲ���<br>
	    		<%elseif rsuu("leixing")="ת��" then %>
	    <%=rsuu("datetime")%>&nbsp;����<font color="blue"><%=rsuu("zcid")%></font>���ʲ���<font color="red"><%=rsuu("ssbm")%></font><%=rsuu("leixing")%>��<font color="blue"><%=rsuu("user")%></font>��<br>
	    		<% end if
				rsuu.movenext()
				i=i+1
				if i>=rsuu.pagesize then exit do
            loop %>
	    </div>
        <%if rsuu.pagecount>1 then%>
        <div align="center"> ҳ�Σ�<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>ҳ������<font color="red"><%=rsuu.recordcount%></font>����¼�� <a href="info.asp?id=<%=rsu("id")%>&page=1">��ҳ</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=epage-1%>">ǰһҳ</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=epage+1%>">��һҳ</a>&nbsp;<a href="info.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>">ĩҳ</a> </div>
        <%end if
		   end if%>
      </td>
    </tr>
	<tr>
      <td colspan="4" align="center" bgcolor="#4685CA" class="classfooter"><a href="#" class="STYLE7" height="25" onClick="javascript :history.back(-1);">&lt;&lt;&lt; �����б� &gt;&gt;&gt;</a></td>
    </tr>
  </form>
</table>
	<div id="tip" style="position:fixed; visibility:hidden; background:#9F97FF;"><%=zc%></div>
<%End Sub
end if%>