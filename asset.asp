<!--#include file="inc/conn.asp"-->
<%
	sqlu="select * from sbxx where id="& Clng(request("id"))
		set rsu=conn.execute(sqlu)
   		sbbh=rsu("sbbh")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsu("sbbh")%>�ʲ���Ϣ</title>
<style type="text/css">
<!--
.STYLE11 {
	color: #000000;
	font-weight: bold;
	font-size:24px;
	font-family:"����";
	
}
-->
</style>
</head>
<body>
<table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#23b14d">
<!--  <tr>
    <td colspan="4" valign="top" nowrap="nowrap"><img src="images/zc.JPG" width="936"/></td>
  </tr>-->
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">�ʲ����</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("sbbh")%> </p></td>
    <td rowspan="7" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">��Ƭ</p></td>
    <td rowspan="7" valign="middle"><p align="center" class="STYLE11">
		<%if Trim(rsu("pic"))="" or isnull(rsu("pic")) then
			 response.write "<img src=" & "images/noimg.gif" & " height=" & session("imgh") & ">"
		else
			 response.write "<img src="&rsu("pic")&" width="&session("imgw")&">"
		end if%>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">��˾</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("ssbm")%> </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">����</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("department")%></p></td>
  </tr>
  <tr>
    <td height="20" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">ʹ����</p></td>
    <td height="20" valign="top"><p align="center" class="STYLE11"><%=rsu("syz")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">�ʲ�����</p></td>
    <td height="20" align="center" valign="top"><p align="center" class="STYLE11"><%=rsu("pp")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="top" nowrap="nowrap"><p align="center" class="STYLE11">�ʲ��ͺ�</p></td>
    <td height="20" align="center" valign="top"><p align="center" class="STYLE11"><%=rsu("xh")%></p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">����ʱ��</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11">
      <%
			if not isnull(rsu("gzsj")) or not isnull(rsu("scrq")) then 
			 if not isnull(rsu("gzsj")) then
		   		temprq=rsu("gzsj")
		     else
		   		temprq=rsu("scrq")
		     end if
		   		tempz=Datediff("D",now(),temprq)
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
				tempz = tempz - tempm * 30
				tempd = Int(tempz)
			   if tempy = 0 then
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = "���쵽��"
			         else
			            tempdis = tempd & "��"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempm & "����"
			         else
			            tempdis = tempm & "����" & tempd & "��"
			         end if
			      end if
			   else
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = tempy & "��"
			         else
			            tempdis = tempy & "����" & tempd & "��"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempy & "��" & tempm & "����"
			         else
			            tempdis= tempy & "��" & tempm & "����" & tempd & "��"
			         end if
			      end if
			   end if
				response.write "<B><font color=red>&nbsp;����" & tempdis & "</font></B>"
			end if
			%>
    </p></td>
  </tr>
  <tr>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">���к�</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11"><%=rsu("ccbh")%></p></td>
    <td height="20" align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">����ʣ��</p></td>
    <td height="20" align="center" valign="middle"><p align="center" class="STYLE11">
      <%
			if not isnull(rsu("baoxiu")) then 
			 tempz=Datediff("D",now(),rsu("baoxiu"))
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
				tempz = tempz - tempm * 30
				tempd = Int(tempz)
			   if tempy = 0 then
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = "0��"
			         else
			            tempdis = tempd & "��"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempm & "����"
			         else
			            tempdis = tempm & "����" & tempd & "��"
			         end if
			      end if
			   else
			      if tempm = 0 then
			         if tempd = 0 then
			            tempdis = tempy & "��"
			         else
			            tempdis = tempy & "����" & tempd & "��"
			         end if
			      else
			         if tempd = 0 then
			            tempdis = tempy & "��" & tempm & "����"
			         else
			            tempdis= tempy & "��" & tempm & "����" & tempd & "��"
			         end if
			      end if
			   end if
			   if rsu("baoxiu") >=now() then 
				response.write "<B><font color=blue>����" & tempdis & "����</font></B>"
			   else
				response.write "<B><font color=red>�ѹ���" & tempdis & "</font></B>"
			   end if
			end if
			%>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">CPU</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("cpu")%></p></td>
    <td valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">�ڴ�</p></td>
    <td valign="middle"><p align="center" class="STYLE11"><%=rsu("ram")%>G<br>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">Ӳ��</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11">        <%if isnull(rsu("hdd")) then response.write "0" else response.write replace(rsu("hdd"),"|","G+") end if%>G</p></td>
    <td valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">�Կ�</p></td>
    <td valign="middle"><p align="center" class="STYLE11"><%=rsu("gpu")%><br>
    </p></td>
  </tr>
  <tr>
    <td height="20" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">����λ��</p></td>
    <td height="20" valign="middle"><p align="center" class="STYLE11"><%=rsu("cfdd")%></p></td>
    <td valign="middle" nowrap="nowrap" class="STYLE11"><div align="center">�豸״̬</div></td>
    <td valign="middle">
	<%	
	    dim zt
	    zt=rsu("zt")
	    sqlzt="select * from admin_state where ztm='" & zt & "'"
	   	set rszt=server.CreateObject("adodb.recordset")
		rszt.Open sqlzt, conn, 1, 1
	%>
	<%if rsu("pdzt")=false then%>
	<div align="center"><span class="STYLE11"><%response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"%></span></div>
	<%else%>
	<div align="center"><span class="STYLE11"><%response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"%></span></div>
	<%
	    rszt.close
	    set rszt=nothing
	   end if%>
	</td>
  </tr>
  <tr>
    <td align="center" valign="middle" nowrap="nowrap">
      <p align="center" class="STYLE11">�ʲ���ע</p></td>
	  <td colspan="3" valign="middle"><p class="STYLE11"><%=rsu("bz")%></p></td>
  </tr>
  <tr>
    <td align="center" valign="middle" nowrap="nowrap"><span class="STYLE11">�̵���Ϣ</span></td>
    <td height="25" colspan="4" class="STYLE11">
		  <%
			 select case rsu("pdzt")
			 	case 0 pd="<font color=#AE0000>δ�̵�</font>"
			 	case 1 pd="<font color=#006000>����</font>"
			 	case 2 pd="<font color=blue>��ӯ</font>"
			 	case 3 pd="<font color=red>�̿�</font>"
			 end select
			 if rsu("pdzt") = 0 then
		  %>
		״̬��<%=pd%>
			<%else%>
		ʱ�䣺<%=rsu("pdsj")%>��״̬��<%=pd%>����ע��<%=rsu("pdbz")%>
			<%end if%></td>
  </tr>
  <tr>
	<td align="center" valign="middle" nowrap="nowrap"><p align="center" class="STYLE11">��ϸ��¼</p></td>
<%
	sqll="select * from sb_log where zcid='"& sbbh &"' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=3 valign=middle>���ʲ�û���κμ�¼��</td>"
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
			<td height="25" colspan="4" align="center" class="classtd"><div align="left" class="STYLE11">
           		<% i=0
				   do while not rsuu.eof 
						 '������z�ж������ǽ�����黹�Ļ�������������ʾ��ͬ��'
						 if rsuu("leixing")="���" or rsuu("leixing")="�黹" then %>
							<%=rsuu("datetime")%>&nbsp;����<font color="red">��<%=rsuu("ssbm")%>��</font>��<font color="blue">��<%=rsuu("user")%>��</font><%=rsuu("leixing")%>��<br>
						 <%elseif rsuu("leixing")="ת��" or rsuu("leixing")="����" then %>
							<%=rsuu("datetime")%>&nbsp;����<font color="red"><%=rsuu("ssbm")%></font><%=rsuu("leixing")%>��<font color="blue"><%=rsuu("user")%></font>��<br>
						<% else %>
							<%=rsuu("datetime")%>&nbsp;����<font color="red">��<%=rsuu("user")%>��</font><%=rsuu("leixing")%>��<br>
						<% end if
				   rsuu.movenext()
					i=i+1
					if i>=rsuu.pagesize then exit do
            	loop %>
		  </div>
					<%if rsuu.pagecount>1 then%>
			<div align="center">
				ҳ�Σ�<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>ҳ������<font color="red"><%=rsuu.recordcount%></font>����¼��<br>
				<a href="asset.asp?id=<%=rsu("id")%>&page=1"><img src="images/frist.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=epage-1%>"><img src="images/previous.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=epage+1%>"><img src="images/next.png"></a>&nbsp;
				<a href="asset.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>"><img src="images/last.png"></a>
			</div>
		<%end if
		   end if%>
	</td>
  </tr>
</table>
</body>
</html>
