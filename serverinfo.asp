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
	
<title>系统信息</title>
<link href="images/tab.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="images/default_19.gif" style="border-left:solid 1px #aad5e6;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30"><div align="center"><img src="images/table.gif" width="16" height="14"></div></td>
          <td width="15"><img src="images/jt.gif" width="5" height="6"></td>
          <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><b>服务器信息</b></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#6298E1">
  <tr class="botbg" >
    <td height="24" colspan="4" class="td_title">■ 服务器基本信息</td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">服务器名：</td>
    <td colspan="1" ><%=Request.ServerVariables("SERVER_NAME")%></td>
    <td colspan="1" align="right">服务器IP：</td>
    <td colspan="1"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">客户机IP：</td>
    <td colspan="1" ><span class="forumRow"><%=Request.ServerVariables("REMOTE_ADDR")%></span></td>
    <td colspan="1" align="right">协议名称和修订：</td>
    <td colspan="1"><span class="forumRow"><%=Request.ServerVariables("SERVER_PROTOCOL")%></span></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">服务器端口：</td>
    <td colspan="1" ><%=Request.ServerVariables("SERVER_PORT")%></td>
    <td colspan="1" align="right">服务器时间：</td>
    <td colspan="1"><%=now%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">程序根目录路径：</td>
    <td colspan="1" ><% = server.MapPath("../")
%></td>
    <td colspan="1" align="right">服务器CPU数量：</td>
    <td colspan="1"><%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td colspan="1" align="right">服务器解译引擎：</td>
    <td colspan="1" ><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
    <td colspan="1" align="right">服务器操作系统：</td>
    <td colspan="1"><%=Request.ServerVariables("OS")%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24" align="right" class="forumRowHighlight">IIS版本：</td>
    <td class="forumRow"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
    <td colspan="1" align="right">脚本超时时间：</td>
    <td colspan="1"><%=Server.ScriptTimeout%></td>
  </tr>
  <tr bgcolor='#EBF2F9'>
    <td height="24" align="right" class="forumRowHighlight"><pre>Session超时时间：</pre></td>
    <td class="forumRow"><%=Session.Timeout%>分钟<%= Request.ServerVariables("QUERY_STRING") %></td>
    <td colspan="1" align="right"><pre>当前页面的SessionID是：</pre></td>
    <td colspan="1"><%=Session.SessionID%></td>
  </tr>
  <%If ObjTest("Scripting.FileSystemObject") Then
  Set fsoobj = server.CreateObject("Scripting.FileSystemObject")
%>
  <tr class="botbg">
    <td height="24" colspan="4" class="td_title" >■ 服务器磁盘信息</td>
  </tr>
  <tr height="20" align=center  bgcolor='#EBF2F9'>
    <td>盘符和磁盘类型与状态</td>
    <td>文件系统</td>
    <td>可用空间</td>
    <td>总空间</td>
  </tr>
  <%
' 测试磁盘信息的想法来自"COCOON ASP 探针" '
Set drvObj = fsoobj.Drives
For Each d in drvObj
%>
  <tr height="18" align=center  bgcolor='#EBF2F9'>
    <td align="right"><%=cdrivetype(d.DriveType) & " " & d.DriveLetter%>: <%=cIsReady(d.isReady)%></td>
    <%
If d.DriveLetter = "A" Then '为防止影响服务器，不检查软驱'
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
    <td height="24" colspan=4 class="td_title">■ 当前程序根目录信息
      <%
dPath = server.MapPath("/")
Set dDir = fsoObj.GetFolder(dPath)
Set dDrive = fsoObj.GetDrive(dDir.Drive)
%>
      文件夹: <%=dPath%></td>
  </tr>
  <tr height="23" align="center"  bgcolor='#EBF2F9'>
    <td >已用空间/可用空间</td>
    <td >程序所有文件夹及文件数量</td>
    <td >创建时间</td>
    <td >修改时间</td>
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
    <td height="24" colspan="4" class="td_title">■ ASP脚本解释和运算速度测试</td>
  </tr>
  <tr height="20" align=center  bgcolor='#EBF2F9'>
    <td colspan="4" ><%
'因为只进行50万次计算，所以去掉了是否检测的选项而直接检测'
Response.Write "整数运算测试，正在进行50万次加法运算==>"
Dim t1, t2, lsabc, thetime, thetime2
t1 = Timer
For i = 1 To 500000
  lsabc = 1 + 1
Next
t2 = Timer
thetime = CStr(Int(( (t2 - t1) * 10000 ) + 0.5) / 10)
Response.Write " 已完成！ ==> <font color=red>" & thetime & "毫秒</font>。<br>"
Response.Write "浮点运算测试，正在进行20万次开方运算==>"
t1 = Timer
For i = 1 To 200000
  lsabc = 2^0.5
Next
t2 = Timer
thetime2 = CStr(Int(( (t2 - t1) * 10000 ) + 0.5) / 10)
Response.Write " 已完成！ ==> <font color=red>" & thetime2 & "毫秒</font>。<br>"
%></td>
  </tr>
  <tr  bgcolor='#EBF2F9'>
    <td align=center style="LINE-HEIGHT: 150%" colspan="4"> 页面装载时间（非脚本执行时间，此值与服务器带宽，客户端带宽及其电脑性能有关，与服务器无关）：
      <script language="javascript">
d=new Date();endTime=d.getTime();document.write((endTime-startTime)/1000);
  </script>
      秒 </td>
  </tr>
</table>
</body>
</html>
<%
Function cdrivetype(tnum)
  Select Case tnum
    Case 0
       cdrivetype = "未知"
    Case 1
       cdrivetype = "可移动磁盘"
    Case 2
       cdrivetype = "本地硬盘"
    Case 3
       cdrivetype = "网络磁盘"
    Case 4
       cdrivetype = "CD-ROM"
    Case 5
       cdrivetype = "RAM 磁盘"
  End Select
End Function

Function cIsReady(trd)
  Select Case trd
    Case true
       cIsReady = "<font color='blue'><b>√</b></font>"
    Case false
       cIsReady = "<font color='red'><b>×</b></font>"
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
  BianLi = "文件夹："&cs&"个，文件数："&ng&"个"
End Function
%>