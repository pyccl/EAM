<!--#include file="inc/mysession.asp" -->
<!--#include file="inc/conn.asp"-->
<link href="../css.css" rel="stylesheet" type="text/css">
<link href="../images/tab.css" rel="stylesheet" type="text/css">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	
<script language=javascript>
 <!--
 var startTime,endTime;
 var d=new Date();
 startTime=d.getTime();
 //-->
 </script>
	
<title>ϵͳ��Ϣ</title>
<link href="images/tab.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="images/default_19.gif" style="border-left:solid 1px #aad5e6;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30"><div align="center"><img src="images/table.gif" width="16" height="14"></div></td>
          <td width="15"><img src="images/jt.gif" width="5" height="6"></td>
          <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><b>��������Ϣ</b></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#6298E1">
  <tr class="botbg" >
    <td height="24" colspan="4" class="td_title">�� ������������Ϣ</td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">����������</td>
    <td colspan="1" ><%=Request.ServerVariables("SERVER_NAME")%></td>
    <td colspan="1" align="right">������IP��</td>
    <td colspan="1"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">�ͻ���IP��</td>
    <td colspan="1" ><span class="forumRow"><%=Request.ServerVariables("REMOTE_ADDR")%></span></td>
    <td colspan="1" align="right">Э�����ƺ��޶���</td>
    <td colspan="1"><span class="forumRow"><%=Request.ServerVariables("SERVER_PROTOCOL")%></span></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">�������˿ڣ�</td>
    <td colspan="1" ><%=Request.ServerVariables("SERVER_PORT")%></td>
    <td colspan="1" align="right">������ʱ�䣺</td>
    <td colspan="1"><%=now%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">�����Ŀ¼·����</td>
    <td colspan="1" ><% = server.MapPath("../")
%></td>
    <td colspan="1" align="right">������CPU������</td>
    <td colspan="1"><%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ��</td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">�������������棺</td>
    <td colspan="1" ><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
    <td colspan="1" align="right">����������ϵͳ��</td>
    <td colspan="1"><%=Request.ServerVariables("OS")%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24" align="right" class="forumRowHighlight">IIS�汾��</td>
    <td class="forumRow"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
    <td colspan="1" align="right">�ű���ʱʱ�䣺</td>
    <td colspan="1"><%=Server.ScriptTimeout%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24" align="right" class="forumRowHighlight"><pre>Session��ʱʱ�䣺</pre></td>
    <td class="forumRow"><%=Session.Timeout%>����<%= Request.ServerVariables("QUERY_STRING") %></td>
    <td colspan="1" align="right"><pre>��ǰҳ���SessionID�ǣ�</pre></td>
    <td colspan="1"><%=Session.SessionID%></td>
  </tr>
  <%If ObjTest("Scripting.FileSystemObject") Then
  Set fsoobj = server.CreateObject("Scripting.FileSystemObject")
%>
  <tr class="botbg">
    <td height="24" colspan="4" class="td_title" >�� ������������Ϣ</td>
  </tr>
  <tr height="20" align=center  bgcolor='#EBF2F9'>
    <td>�̷��ʹ���������״̬</td>
    <td>�ļ�ϵͳ</td>
    <td>���ÿռ�</td>
    <td>�ܿռ�</td>
  </tr>
  <%
' ���Դ�����Ϣ���뷨����"COCOON ASP ̽��" '
Set drvObj = fsoobj.Drives
For Each d in drvObj
%>
  <tr height="18" align=center  bgcolor='#EBF2F9'>
    <td align="right"><%=cdrivetype(d.DriveType) & " " & d.DriveLetter%>: <%=cIsReady(d.isReady)%></td>
    <%
If d.DriveLetter = "A" Then 'Ϊ��ֹӰ������������������'
Else
%>
    <td ><%=d.FileSystem%></td>
    <td align="right" ><%=cSize(d.FreeSpace)%></td>
    <td align="right" ><%=cSize(d.TotalSize)%></td>
    <%
End If
%>
  </tr>
<%
Next
%>
  	<%For i=0 to 10%>
  	<%next%>
  <%For i=27 to 38%>
  	<%next%>
  	<%For i=11 to 16%>
  	<%next%>
  	<%For i=17 to 24%>
  	<%next%>
  	<%For i=25 to 26%>
  	<%next%>
<%i=39
if i=39 then%>
<%end if%>
  <tr class="botbg">
    <td height="24" colspan=4 class="td_title">�� ��ǰ�����Ŀ¼��Ϣ
      <%
dPath = server.MapPath("/")
Set dDir = fsoObj.GetFolder(dPath)
Set dDrive = fsoObj.GetDrive(dDir.Drive)
%>
      �ļ���: <%=dPath%></td>
  </tr>
  <tr height="23" align="center"  bgcolor='#EBF2F9'>
    <td >���ÿռ�/���ÿռ�</td>
    <td >���������ļ��м��ļ�����</td>
    <td >����ʱ��</td>
    <td >�޸�ʱ��</td>
  </tr>
  <tr height="20" align="center"  bgcolor='#EBF2F9'>
    <td ><%=cSize(dDir.Size)%>/<%=cSize(dDrive.AvailableSpace)%></td>
    <td ><%=BianLi (dPath,0,0)%></td>
    <td ><%=dDir.DateCreated%>
</td>
    <td ><%=dDir.DateLastModified%></td>
  </tr>
  <%
Set fsoobj = Nothing
End If
%>
  <tr class="botbg">
    <td height="24" colspan="4" class="td_title">�� ASP�ű����ͺ������ٶȲ���</td>
  </tr>
  <tr height="20" align=center  bgcolor='#EBF2F9'>
    <td colspan="4" ><%
'��Ϊֻ����50��μ��㣬����ȥ�����Ƿ����ѡ���ֱ�Ӽ��'
Response.Write "����������ԣ����ڽ���50��μӷ�����==>"
Dim t1, t2, lsabc, thetime, thetime2
t1 = Timer
For i = 1 To 500000
  lsabc = 1 + 1
Next
t2 = Timer
thetime = CStr(Int(( (t2 - t1) * 10000 ) + 0.5) / 10)
Response.Write " ����ɣ� ==> <font color=red>" & thetime & "����</font>��<br>"
Response.Write "����������ԣ����ڽ���20��ο�������==>"
t1 = Timer
For i = 1 To 200000
  lsabc = 2^0.5
Next
t2 = Timer
thetime2 = CStr(Int(( (t2 - t1) * 10000 ) + 0.5) / 10)
Response.Write " ����ɣ� ==> <font color=red>" & thetime2 & "����</font>��<br>"
%></td>
  </tr>
  <tr  bgcolor='#EBF2F9'>
    <td align=center style="LINE-HEIGHT: 150%" colspan="4"> ҳ��װ��ʱ�䣨�ǽű�ִ��ʱ�䣬��ֵ������������ͻ��˴�������������йأ���������޹أ���
      <script language="javascript">
d=new Date();endTime=d.getTime();document.write((endTime-startTime)/1000);
  </script>
      �� </td>
  </tr>
</table>
</body>
</html>
<%
Function cdrivetype(tnum)
  Select Case tnum
    Case 0
       cdrivetype = "δ֪"
    Case 1
       cdrivetype = "���ƶ�����"
    Case 2
       cdrivetype = "����Ӳ��"
    Case 3
       cdrivetype = "�������"
    Case 4
       cdrivetype = "CD-ROM"
    Case 5
       cdrivetype = "RAM ����"
  End Select
End Function

Function cIsReady(trd)
  Select Case trd
    Case true
       cIsReady = "<font color='blue'><b>��</b></font>"
    Case false
       cIsReady = "<font color='red'><b>��</b></font>"
  End Select
End Function

Function cSize(tSize)
  If tSize>= 1073741824 Then
    cSize = Int((tSize / 1073741824) * 1000) / 1000 & " GB"
  ElseIf tSize>= 1048576 Then
    cSize = Int((tSize / 1048576) * 1000) / 1000 & " MB"
  ElseIf tSize>= 1024 Then
    cSize = Int((tSize / 1024) * 1000) / 1000 & " KB"
  Else
    cSize = tSize & "B"
  End If
End Function
		
Function BianLi(Path, ng, cs)
  Dim Fso, ObjFolder, ObjFile
  Set Fso = Server.CreateObject("scrip"&"ting.filesys"&"temObject")
  For Each ObjFile in Fso.GetFolder(Path).Files
    ng = ng + 1
  Next
  For Each ObjFolder In Fso.GetFolder(Path).SubFolders
    cs = cs + 1
    BianLi Path & "\" & ObjFolder.Name, ng, cs
  Next
  Set Fso = Nothing
  BianLi = "�ļ��У�"&cs&"�����ļ�����"&ng&"��"
End Function
%>