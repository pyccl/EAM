<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->

<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>

<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<%
on error resume next
call admintop()
if Instr(session("juese"),"|502,")=0 then %>
  <!--#include file="../inc/quanxian.asp"-->
<!--#include file="../inc/function.asp"-->
  <%
  response.end 
else
dim action, s_id
s_id=request.QueryString("s_id")
action=request("action")

select case action

case "del"
conn.execute "delete from admin_yuangong where id="&s_id
Set rsa=Server.CreateObject("ADODB.Recordset")
sqla="select * from user_log"
rsa.open sqla,connstr,1,3
rsa.addnew
rsa("username")=session("web_admin")
rsa("atype")="ɾ��Ա��"
rsa("alog")="ɾ��<font color=blue>��"&request("xingming")&"��</font><font color=red>��"&request("idcard")&"��</font>����Ϣ��"
rsa("atime")=now()
rsa("aip")=Trim(Request.ServerVariables("REMOTE_ADDR"))
rsa.update
rsa.close
set rsa=nothing
   response.write ("<script>alert('Ա��ɾ���ɹ�!');window.location.replace('admin_yuangong.asp?page="&page&"');</script>")
if request("page")<>"" then 
response.Redirect "admin_yuangong.asp?gjc="&gjc&"&s_name="&s_name&"&page="&request("page")&""
else
response.Redirect "admin_yuangong.asp?gjc="&gjc&"&s_name="&s_name&""
end if 
response.end 
end select
	
		   mystr=split(session("rank"),", ")
		   for i=0 to ubound(mystr)
		   rk = "company= '" & mystr(i) & "' or " + rk
		   rk2 = "y_name= '" & mystr(i) & "' or " + rk2
		   next
		   rk = rk & " False"
		   rk2 = rk2 & " False"
%>
<!--#include file="../inc/displaytip.asp"-->
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="100%" bgcolor="#183789">
  
    <td><table border="0" cellspacing="1" cellpadding="3" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="left" colspan="3" class="classtop1"><img src="../images/table.gif" width="16" height="14"><img src="../images/jt.gif" width="5" height="6">&nbsp;<strong>����Ա��</strong><%if Instr(session("juese"),"|501,")<>0 then %><a href="add_yuangong.asp"><img src="../images/add.png"></a><% end if %></td>
        </tr>
        <form name=form2 method=post action=admin_yuangong.asp>
          <tr >
            <td class="classtd" align="center" <%if Instr(session("juese"),"|504,")=0 and Instr(session("juese"),"|505,")=0 then %>colspan="2"<% end if %>><select name="anclassid" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
                <option selected>--������ת--</option>
                <option value=admin_yuangong.asp style="background-color:#B0E2FF">�鿴ȫ��Ա��</option>
                <option value="?synx=view" style="background-color:#B0E2FF">����5��Ա��</option>
              </select></td>
			<%if Instr(session("juese"),"|504,")<>0 and Instr(session("juese"),"|505,")<>0 then %>
				<td class="classtd"><input type=button class="button" onClick="location.href='upload/Ա�����ܱ�.xls'" value="ģ��" <%if Instr(session("juese"),"|504,")=0 then%> hidden disabled <%end if%> > <input type=button class="button" onClick="location.href='import.asp'" value="����" onmousemove="position();" onmouseout="hide();" <%if Instr(session("juese"),"|504,")=0 then%> hidden disabled <%end if%> >
				<input name=ifive type="button" class=button onClick="window.location.href='excel_yg.asp?ly=0';" value='������5��' size=3 <%if Instr(session("juese"),"|505,")=0 then%> hidden disabled<%end if%> ></td>
			<%end if%>
            <td class="classtd" >
			���ڣ�
				<input name="sj1" id="sj1" class="form" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'sj2\')||\'%y-%M-%d\'}'})" style="WIDTH: 80px"/>
				-
				<input id="sj2" class="form" type="text" name="sj2" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'sj1\')}',maxDate:'%y-%M-%d'})" style="WIDTH: 80px"/>
			���ࣺ
			<select name="dept">
                <option value="">==ѡ��˾==</option>
                <% sqla = "select y_id,y_name from admin_shiyongdanwei where "& rk2 &" order by y_paixu asc"
				   set rs=conn.execute(sqla)
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
              <select name=fenlei>
                <option value="1">�����֤����</option>
                <option value="2">������</option>
                <option value="3" selected>������</option>
                <option value="4">���ֻ�����</option>
                <option value="5">������</option>
              </select>
              �ؼ��ʣ�<input name="gjc" size="15" class=form>
              <input type=submit name=tiaojian value="��ѯ" class=button>
              <INPUT name=dcjg type="button" class=button onClick="window.location.href='excel_yg.asp?ly=1&dept=<%=request("dept")%>&fenlei=<%=request("fenlei")%>&gjc=<%=request("gjc")%>&sj1=<%=request("sj1")%>&sj2=<%=request("sj2")%>';" value='�������' size=3 <%if Instr(session("juese"),"|505,")=0 then%> hidden disabled <%end if%> ></td>
          </tr>
        </form>
      </table>
      <table border="0" cellspacing="1" cellpadding="4" bgcolor="#6298E1" align="center" width="100%">
        <%
		   
	pagecount=request("page")
	if pagecount<1 or pagecount="" then
	  pagecount="1"
	end if 

sj1=request("sj1")
sj2=request("sj2")
dept=replace(request("dept"),"'","��")
synx=replace(request("synx"),"'","��")
gjc=replace(request("gjc"),"'","��")
fenlei=replace(request("fenlei"),"'","��")
		  
	gourl="synx="&synx&"&gjc="&gjc&"&fenlei="&fenlei&"&dept="&dept&"&sj1="&sj1&"&sj2="&sj2
		  
set rs=server.CreateObject("adodb.recordset")

if synx="view" then 
	sql="select * from admin_yuangong where datediff('m',ruzhi,now())>60 and (" & rk & ")"
else
	sql="select * from admin_yuangong where (" & rk & ")"
end if
If dept<>"" then sql=sql&" and company like '%"&dept&"%'"
	if sj1 <> "" and sj2 <> "" then
		sql=sql&" and (ruzhi >= #" & sj1 &"# and ruzhi <= #" & sj2 & "#)"
	else
		if sj1 <> "" and sj2 = "" then
			sql=sql&" and (ruzhi >= #" & sj1 &"#)"
		end if
	end if
if gjc<>"" then
	If fenlei="1" Then sql=sql&" and idcard like '%"&gjc&"%'"
	If fenlei="2" Then sql=sql&" and department like '%"&gjc&"%'"
	If fenlei="3" Then sql=sql&" and xingming like '%"&gjc&"%'"
	If fenlei="4" Then sql=sql&" and phone like '%"&gjc&"%'"
	If fenlei="5" Then sql=sql&" and gh like '%"&gjc&"%'"
end if

			if request("order1")<>"" then
				sql=sql&" order by id "&request("order1")
		  		fyorder="order1="&request("order1")
			elseif request("order2")<>"" then
				sql=sql&" order by gh "&request("order2")
		  		fyorder="order2="&request("order2")
			elseif request("order3")<>"" then
				sql=sql&" order by idcard "&request("order3")
		  		fyorder="order3="&request("order3")
			elseif request("order4")<>"" then
				sql=sql&" order by xingming "&request("order4")
		  		fyorder="order4="&request("order4")
			elseif request("order5")<>"" then
				sql=sql&" order by company "&request("order5")
		  		fyorder="order5="&request("order5")
			elseif request("order6")<>"" then
				sql=sql&" order by department "&request("order6")
		  		fyorder="order6="&request("order6")
			elseif request("order7")<>"" then
				sql=sql&" order by [position] "&request("order7")
		  		fyorder="order7="&request("order7")
			elseif request("order8")<>"" then
				sql=sql&" order by phone "&request("order8")
		  		fyorder="order8="&request("order8")
			elseif request("order9")<>"" then
				sql=sql&" order by ruzhi "&request("order9")
		  		fyorder="order9="&request("order9")
		  	else
		  		sql=sql&" order by id desc"
			end if		  
		  
		  rs.open sql,conn, 1, 1
%>
        <tr class=classtop1>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "1","ID",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" align="center"><strong><%toptitle "2","����",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "3","���֤��",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "4","����",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" align="center"><strong>�Ա�</strong></td>
          <td nowrap background="../images/th_bg.gif" align="center"><strong>����</strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "5","��˾",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "6","����",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "7","ְλ",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "8","�ֻ�����",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong><%toptitle "9","˾��",pagecount,gourl,""%></strong></td>
          <td nowrap background="../images/th_bg.gif" align="center"><strong>�豸����</strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>��ϸ��Ϣ</strong></td>
          <td nowrap background="../images/th_bg.gif" height="15" align="center"><strong>����</strong></td>
        </tr>
        <%if rs.eof and rs.bof then
response.write "<tr><td colspan=14 height=30 class=classtd><div align=center><img src=../images/note.gif><font color=red size=+1>����Ա��������ӡ�</font></div></td></tr>"
Else
if not isempty(request("page")) then   
pagecount=cint(request("page"))   
else
pagecount=1
end if
rs.pagesize=session("liebiao")
rs.AbsolutePage=pagecount
        do while not rs.eof%>
        <form name="form1" id="form1" method="post" action="" target="_blank">
          <tr bgcolor='#EBF2F9' onMouseOver = "this.style.backgroundColor = '#FFFFFF'" onMouseOut = "this.style.backgroundColor = ''">
            <td align="center"><%=rs("id")%>
            <%y_id=rs("id")%></td>
            <td align="center"><%=Replace(rs("gh"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center"><%idcard=Left(rs("idcard"),6)&"********"&Right(rs("idcard"),4)%>
            <%=Replace(idcard,gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center" ><%=Replace(rs("xingming"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%>
			<%if rs("photo") <> "" then%>
				  <a href="<%=rs("photo")%>" target="_blank"><img src="../images/img.png" height="10" title="����鿴���ʲ�ͼƬ"></a>
				  <%end if%>
				
				</td>
            <td align="center">
			  <%
				 riqi=mid(rsu("idcard"),7,8)
				 xingbie=right(rs("idcard"),2)
				 if cint(left(xingbie,1)) mod 2=0 then
					 response.write "Ů"
				 else
					 response.write "��"
				 end if
			  %>
			</td>
            <td align="center">
			<%
				riqi=mid(rs("idcard"),7,8)
				rq=mid(riqi,1,4)&"-"&mid(riqi,5,2)&"-"&mid(riqi,7,2)
				response.write DateDiff("yyyy",rq,date())
			%>
			</td>
            <td align="center"><%=Replace(rs("company"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center"><%=Replace(rs("department"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center" ><%=Replace(rs("position"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center" ><%=Replace(rs("phone"),gjc,"<font color=red><strong>"&gjc&"</strong></font>")%></td>
            <td align="center" ><%
			if not isnull(rs("ruzhi")) then 
			 tempz=Datediff("D",now(),rs("ruzhi"))
				tempz = abs(tempz)
				tempy = Int(tempz / 365)
				tempz = tempz - tempy * 365
				tempm = Int(tempz / 30)
			   if rs("ruzhi") >now() then 
				response.write "<strong><font color=red>¼�����</font></strong>"
			   elseif tempy=0 and tempm<>0 then
					response.write "<strong><font color=#2E8B57>" & tempm & "��</font></strong>"
			   elseif tempy=0 and tempm=0 then
					response.write "<strong><font color=#006400>��Ա��</font></strong>"
				else
					response.write "<strong><font color=#0000FF>" & tempy & "��</font></strong>"
			   end if
			end if
			%></td>
            <td align="center"><%
			set rs2=server.CreateObject("adodb.recordset")
			sql2="select * from sbxx where syz like '%"& rs("gh") &"%'"
			rs2.open sql2,conn, 1, 1
		    if rs2.eof and rs2.bof then
				response.write "<font color = red>0</font>"
			else
				response.write "<font color = blue><strong>" & rs2.recordcount & "</strong></font>"
			end if
		%></td>
            <td align="center"><input class=button type="button" name="info2" value="��ϸ��Ϣ" onclick="javascript:window.location.href='info.asp?id=<%=y_id%>'"/></td>
            <td align="center">
              <input class=button type="button" value="�޸�" onclick="javascript:window.location.href='xg_yuangong.asp?id=<%=y_id%>&page=<%=pagecount%>'" <%if Instr(session("juese"),"|503,")=0 then%> disabled hidden<%end if %> > 
               <input name="Submit2" type="button" class="button" onclick="{if(confirm('ȷ��ɾ��������'+'<%=rs("xingming")%>'+'�����֤�ţ�'+'<%=rs("idcard")%>'+'��Ա��ô��')){location.href='admin_yuangong.asp?action=del&amp;s_id=<%=rs("id")%>&amp;xingming=<%=rs("xingming")%>&amp;idcard=<%=rs("idcard")%>&amp;gjc=<%=gjc%>&amp;page=<%=request("page")%>';}return false;}" value="ɾ��" <%if Instr(session("juese"),"|506,")=0 or rs2.recordcount>0 then%> disabled hidden <%end if %> >
               <%if Instr(session("juese"),"|503,")=0 and Instr(session("juese"),"|506,")=0 then response.write "<img src=../images/note.gif><font color=red>��Ȩ������</font>" end if %>
            </tr>
          <%
			rs2.close
			set rs2=Nothing
			 
rs.movenext
j=j+1
if j>=rs.pagesize then exit do
	loop
%>
        </form>
        <form action="admin_yuangong.asp?<%=fyorder%>&<%=gourl%>" method="post">
          <tr class=botbg>
            <td height="25" align="center" colspan="14"><div align="center"> �������� <strong><%=rs.recordcount%></strong> ��, ҳ��: <strong><font color=red><%=pagecount%></font>/<%=rs.pagecount%></strong>, 
              ��ǰ�ӵ�
              <%
			   if pagecount<=1 then
			   response.write "<font color=red>1</font>"
			   else
			   response.write "<font color=red>" & pagecount*rs.pagesize-rs.pagesize+1 & "</font>"
			   end if
			  %>
              ����ʼ��
  
  <% if pagecount=1 and rs.pagecount<>pagecount and rs.pagecount<>0 then%>
  <a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
  <% end if %>
  <% if rs.pagecount>1 and rs.pagecount=pagecount then %>
  <a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a>
  <%end if%>
  <% if pagecount<>1 and rs.pagecount<>pagecount then%>
  <a href="?<%=fyorder%>&<%=gourl%>&page=1"><img src="../images/frist.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount-1)%>"><img src="../images/previous.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=cstr(pagecount+1)%>"><img src="../images/next.gif"></a><a href="?<%=fyorder%>&<%=gourl%>&page=<%=rs.pagecount%>"><img src="../images/last.gif"></a>
  <% end if%>
  <%if rs.pagecount>1 then%>
  &nbsp;ֱ�ӵ���
  <%if rs.pagecount>15 then %>
  <input name="page" value="1" size="5" oninput="value=value.replace(/[^\d]/g,'');if(value><%=rs.pagecount%>)value=<%=rs.pagecount%>;if(value<1)value=1">
  <% else %>
  <select name="page">
    <%for i=1 to rs.pagecount%>
    <option value="<%=i%>"><%=i%></option>
    <%next%>
  </select>
  <%end if%>ҳ
  <input type="submit" name="go" value="��ת" class=button>
  <%end if%>
            </div></td>
        </form>
        <%End If%>
        <tr class="classfooter">
          <td colspan="14"><div>��ǰִ��SQL��䣺<font color="red"><%response.write sql%></font></div></td>
        </tr>
<%
rs.close
set rs=Nothing
%>
      </table></td>
  </tr>
</table>
<%end if%>
<div id="tip" style="position:fixed; visibility:hidden; background:#9F97FF;width:120px;"><strong>�����ļ���������ģ�壬�޸ĺ��ϴ���/user/upload/Ŀ¼���滻������ٵ�������롱��ť��</strong></div>
  