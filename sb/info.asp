<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
if Instr(session("juese"),"|102,")=0 then %>
   <!--#include file="../inc/quanxian.asp"-->
  <%
  response.end
else
		page=Request.Querystring("page")
		id=Request.Querystring("id")
		sqlu="select * from sbxx where id="& id
			set rsu=conn.execute(sqlu)
			If Not rsu.eof Then 
				Call info()
				Else
				response.write("<div align=center>���󣡲����ڸõ����ʲ���</div>")
			End If 
Sub info()
%>
<style type="text/css">
<!--
.STYLE7 {
	color: #ffffff
}
-->
</style>
<title><%=rsu("sbbh")%>---�ʲ�����</title>
<body>
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
  <form action="change_save2.asp" method="post" name="form1" id="form1">
    <tr class="classtop1">
      <td  height="25" colspan="4" align="center"><strong><font color="#ffffff" size="+1">�ʲ���<%=rsu("sbbh")%>��������</font></strong></td>
    </tr>
    <tr>
      <td height="25" colspan="3" align="center"  class="classfooter"><div align="left"><strong>&nbsp;<font color="#ffffff"><%=rsu("sbbh")%></font>���ʲ���Ϣ</strong></div></td>
      <td width="32%" height="25" align="center" class="classfooter">
		<%if Instr(session("rank"),rsu("ssbm"))<>0 and Instr(session("juese"),"|103,")<>0 then%>
			<a href="xg.asp?id=<%=rsu("id")%>&qx=<%=rsu("id")%>" class="STYLE7">�޸�����</a>
        <%end if%>
	</td>
    </tr>
    <tr>
      <td width="16%" align="center"  class="classtd"><div align="left"><strong>�ʲ���ţ�</strong></div></td>
      <td width="34%" align="center" class="classtd" ><div align="left"><%=rsu("sbbh")%></div></td>
      <td width="16%" height="25" align="center" class="classtd"><div align="left"><strong> �ʲ�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("sbcs")%></div>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong> �ʲ����</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("pp")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> �ʲ����ࣺ</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("zilei")%> </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>������˾��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ssbm")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�������ţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("department")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>���λ�ã�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("cfdd")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> ʹ �� �ˣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("syz")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�ʲ�״̬��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%
			dim zt
			zt=rsu("zt")
			sqlzt="select * from admin_state where ztm='" & zt & "'"
			set rszt=server.CreateObject("adodb.recordset")
			rszt.Open sqlzt, conn, 1, 1
			response.write "<font color=" & rszt("ztys") & ">" & zt & "</font>"
			rszt.close
			set rszt=nothing
		%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong> Ʒ���ͺţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("xh")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�������ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("scrq")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>����ʱ�䣺</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gzsj")%>
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
			         tempdis = tempd & "��"
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
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>���޵��ڣ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("baoxiu")%>
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
			         tempdis = tempd & "��"
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
				response.write "<B><font color=blue>&nbsp;����" & tempdis & "����</font></B>"
			   else
				response.write "<B><font color=red>&nbsp;�ѹ���" & tempdis & "</font></B>"
			   end if
			end if
			%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>���ý�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("price")%>Ԫ</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>CPU��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("cpu")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�ڴ��С��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ram")%>GB</div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>Ӳ�̴�С��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("hdd")) then response.write "<br>" else response.write replace(rsu("hdd"),"|","<br>") end if%>
      </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>Ӳ�����кţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("hddsn")) then response.write "<br>" else response.write replace(rsu("hddsn"),"|","<br>") end if%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�Կ���</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gpu")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>��������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("jqm")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>IP �� ַ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ip")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>MAC��ַ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
        <%if isnull(rsu("mac")) then response.write "<br>" else response.write replace(rsu("mac"),"|","<br>") end if%>
      </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>����ϵͳ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("czxt")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>���кţ�</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("ccbh")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>����ʱ�䣺</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("gxsj")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�����Ա��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("tjry")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>��ӡ״̬��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
		  <%
			if rsu("dyzt") then
				response.write "�Ѵ�ӡ"
			 else
			 	response.write "δ��ӡ"
			 end if
		  %>
		  </div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�۾�������</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("zhejiu")%></div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�� ע ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><%=rsu("bz")%></div></td>
      <td height="25" align="center" class="classtd"><div align="left"><strong>ͼ Ƭ ��</strong></div></td>
      <td height="25" align="center" class="classtd"><div align="left">
			<%
			pic=rsu("pic")
			if Trim(pic)="" or isnull(rsu("pic")) then
				response.write "<img src=" & "../images/noimg.gif" & " height=" & session("imgh") & ">"
			else
				response.write "<a href=" & pic & " target='_blank' title='���ͼƬ�鿴ԭͼ'><img src=" & pic & " height=" & session("imgh") & "></a>"
			end if
			%>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>����̵㣺</strong></div></td>
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
          <%
			 select case rsu("pdzt")
			 	case 0 pd="<font color=#AE0000>δ�̵�</font>"
			 	case 1 pd="<font color=#006000>����</font>"
			 	case 2 pd="<font color=blue>��ӯ</font>"
			 	case 3 pd="<font color=red>�̿�</font>"
			 end select
			 if rsu("pdzt")=0 then
		  %>
          ״̬��<B><%=pd%></B>
          <%else%>
          ʱ�䣺<%=rsu("pdsj")%>��״̬��<B><%=pd%></B>����ע��<%=rsu("pdbz")%>
          <%end if%>
        </div></td>
    </tr>
    <tr>
      <td height="25" align="center" class="classtd"><div align="left"><strong>�豸��¼��</strong></div></td>
      <%
	sqll="select * from sb_log where zcid='"& rsu("sbbh") &"' order by datetime"
		 set rsuu=server.createobject("adodb.recordset")
		 rsuu.open sqll,conn,1,1
			if rsuu.eof then
   				response.write "<td colspan=4 valign=middle>���ʲ�û���κμ�¼��</td>"
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
      <td height="25" colspan="3" align="center" class="classtd"><div align="left">
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
        <div align="center"> ҳ�Σ�<font color="red"><%=epage%></font>/<font color="red"><%=rsuu.pagecount%></font>ҳ������<font color="red"><%=rsuu.recordcount%></font>����¼�� <a href="info.asp?id=<%=rsu("id")%>&page=1">��ҳ</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=epage-1%>">ǰһҳ</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=epage+1%>">��һҳ</a>&nbsp; <a href="info.asp?id=<%=rsu("id")%>&page=<%=rsuu.pagecount%>">ĩҳ</a> </div>
        <%end if
		   end if%>
		</td>
    </tr>
    <tr>
      <td colspan="4" align="center" bgcolor="#4685CA" class="classfooter"><a href="#" class="STYLE7" height="25" onClick="javascript :history.back(-1);">&lt;&lt;&lt; ������ҳ &gt;&gt;&gt;</a></td>
    </tr>
  </form>
</table>
</body>
<%End Sub
end if%>
