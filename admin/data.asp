<!--#include file="../inc/Conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end

else

Dim ZC_DATABASE_PATH

ZC_DATABASE_PATH="../db/dnsb.mdb"	'数据库路径'

data_array= Split(ZC_DATABASE_PATH,"/")

Dim action
action=trim(request("action"))
Dim dbpath,bkfolder,bkdbname,fso,fso1

	Select Case action
	Case ""
		Call chushihua()
	Case "CompressData" '压缩数据'
		Dim tmprs
		dim allarticle
		dim Maxid
		dim topic,username,dateandtime,body
		call CompressData()
	case "BackupData" '备份数据'
		if request("act")="Backup" Then
			call updata()
		else
			call BackupData()
		end If
	case "RestoreData" '还原数据'
		dim backpath
		if request("act")="Restore" Then
			Dbpath=request.form("Dbpath")
			backpath=request.form("backpath")
				if dbpath="" Then
					response.write "Please input your database whole Name" 
				else
					Dbpath=server.mappath(Dbpath)
				end If
			backpath=server.mappath(backpath)

			Set Fso=server.CreateObject("scripting.filesystemobject")
				if fso.fileexists(dbpath) Then 
					if fso.fileexists(backpath) then
						fso.copyfile Dbpath,Backpath
						response.write "<br><center><font color=red>数据库还原成功！</font></center><br><br><a href=""data.asp"">返回</a>"
					else
						response.write "<br><center><font color=red>还原后的路径有误，请确认后重新输入！</font></center><br><br><a href=""data.asp"">返回</a>"
						response.end
					end if
				else
					response.write "<br><center><font color=red>没有找到您所需的数据库！" 
					response.write "<br>输入路径错误，请确认后重新输入！</font><br><br><a href=""data.asp"">返回</a></center>"
				end If
		else
			call RestoreData()
		end If
	Case "SpaceSize" '系统空间占用'
		call SpaceSize()
	Case "deletebackup"
		Dim dbname
		dbpath=Request.QueryString("dbpath")
		dbname=Request.QueryString("dbname")
		dbpath=Server.MapPath(dbpath)
		dbpath=dbpath &"\"&dbname
		set fso = CreateObject("Scripting.FileSystemObject")
		If fso.FileExists(dbPath) Then
			fso.DeleteFile(DBPath)
			Set fso = nothing
			response.write "<center><br>您备份的数据库" & dbname &"已经被成功删除<br><br><a href=""data.asp""><font color=red>返回</font></a></center>"
		Else
			response.write "<center>" & dbpath 
			response.write "<br>输入路径错误，请确认后重新输入！<br><br><a href=""data.asp""><font color=red>返回</font></a></center>"
		End If
	Case Else
	End Select
response.write"</body></html>"

Sub chushihua()
%>
<div align=center>
  <table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
    <tr>
      <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
          <tr>
            <td height="25" align="center" colspan="5" class="classtop">数据库管理</td>
          </tr>
          <form id="edit">
            <tr height="25" align="center" class="classtd">
              <td><a href="?action=SpaceSize"><strong>[数据库占用空间]</strong></a></td>
              <% if Instr(session("juese"),"|601,")<>0 or ID=1 then %>
              <td><a href="?action=CompressData"><strong>[压缩数据库]</strong></a></td>
              <% end if
				if Instr(session("juese"),"|602,")<>0 or ID=1 then %>
              <td><a href="?action=BackupData"><strong>[备份数据库]</strong></a></td>
              <% end if
				if Instr(session("juese"),"|603,")<>0 or ID=1 then %>
              <td><a href="?action=RestoreData"><strong>[还原数据库]</strong></a></td>
              <% end if 
				if Instr(session("juese"),"|604,")<>0 or ID=1 then %>
              <td><a href="datainit.asp"><strong><font color="red">[数据库初始化]</font></strong></a></td>
              <% end if %>
            </tr>
          </form>
        </table></td>
    </tr>
  </table>
</div>
<%end sub

'====================系统空间占用======================='
Sub SpaceSize()
On Error Resume Next
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="2" class="classtop">数据库占用空间查看</td>
        </tr>
        <form id="edit">
          <tr height="25" align="center" class="classtd">
            <td width="50%"><strong>数据库路径：</strong><%=ZC_DATABASE_PATH%></td>
            <td width="50%"><b>数据库大小：
              <%showSpaceinfo("../"&data_array(1)&"")%>
              </b></td>
          </tr>
          <tr height="25" align="center" class="classtd">
            <td><strong>默认备份数据库路径：</strong>/admin/databackup</td>
            <td><b>备份数据库大小：
              <%showSpaceinfo("databackup")%>
              </b></td>
          </tr>
          <tr height="25" align="center" class="classtd">
            <td><strong>系统路径：</strong><%=server.MapPath("/")%></td>
            <td><b>系统共计大小：
              <%showSpaceinfo("/")%>
              </b></td>
          </tr>
        </form>
        <tr height="25" align="center" class="classtd">
          <td colspan="2"><input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" 返回 " /></td>
        </tr>
      </table></td>
  </tr>
</table>
<%
End Sub

Sub ShowSpaceInfo(drvpath)
	dim fso,d,size,showsize
	set fso=server.CreateObject("scripting.filesystemobject") 
	drvpath=server.mappath(drvpath) 
	set spacesizeinfo=fso.getfolder(drvpath) 
	size=spacesizeinfo.size
	showsize=size & " Byte" 
	if size>1024 Then
		size=(Size/1024)
		showsize=size & " KB"
	end If
	if size>1024 Then
		size=(size/1024)
		showsize=formatnumber(size,2) & " MB" 
	end If
	if size>1024 Then
		size=(size/1024)
		showsize=formatnumber(size,2) & " GB" 
	end If 
	response.write "<font face=verdana>" & showsize & "</font>"
End Sub 

Sub RestoreData()
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="4" class="classtop">还原数据库</td>
        </tr>
        <form id="edit" method="post" action="?action=RestoreData&act=Restore">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><b>还原的路径（相对路径）：</b></td>
            <td width="50%" align="left"><input type="text" size="30" name="DBpath" value="DataBackup\<%=replace(Date(),"/","-")%>_Bak.mdb"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><b>还原后的路径（相对路径）：</b></td>
            <td align="left"><input type="text" size="30" name="backpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd" align="center">
            <td colspan="2"><input type="submit" value="开始还原" class="button">
              &nbsp;
              <input name="reset2" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" 取消 " /></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<%
End Sub

Sub updata()
	Dbpath=request.form("Dbpath")
	Dbpath=server.mappath(Dbpath)
	bkfolder=request.form("bkfolder")
	bkdbname=request.form("bkdbname")
	Set Fso=server.CreateObject("scripting.filesystemobject")
	if fso.fileexists(dbpath) Then
		If CheckDir(bkfolder) = True Then
			fso.copyfile dbpath,bkfolder& "\"& bkdbname
		else
			MakeNewsDir bkfolder
			fso.copyfile dbpath,bkfolder& "\"& bkdbname
		end If
	%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="4" class="classtop"><strong>备份数据库</strong></td>
        </tr>
        <tr height="25" class="classtd">
          <td width="50%" align="center"><strong>已经成功备份，您的数据库路径：<%=bkfolder%>\<%=bkdbname%></strong></td>
        </tr>
        <%
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "点击此处下载数据库：<font color=red><a href="""& ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname &""">" & ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname
			response.write "</font></td></tr>"
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "<a href=""data.asp?action=deletebackup&dbpath="&request.form("bkfolder") &"&dbname=" & bkdbname &"""><strong>当您下载完毕后可点击此处删除备份数据库！</strong></a>"
			response.write "</td></tr>"
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "<a href=""data.asp""><font color=red>返回</font></a></td></tr>"
			%>
      </table></td>
  </tr>
</table>
<%Else
		response.write "<br><center><font color=red>发生错误！找不到文件！</font><br><br><a href=""data.asp"">返回</a></center>"
	End If
	Set fso = nothing
End Sub
'==================检查某一目录是否存在=================='
Function CheckDir(FolderPath)
	folderpath=Server.MapPath(".")&"\"&folderpath
	Set fso1 = CreateObject("Scripting.FileSystemObject")
	If fso1.FolderExists(FolderPath) Then
		'存在
		CheckDir = True
	Else
		'不存在
		CheckDir = False
	End If
	Set fso1 = nothing
End Function
'==================根据指定名称生成目录=================='
Function MakeNewsDir(foldername)
	dim f
	Set fso1 = CreateObject("Scripting.FileSystemObject")
	Set f = fso1.CreateFolder(foldername)
	MakeNewsDir = True
	Set fso1 = nothing
End Function
Sub BackupData()
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="4" class="classtop"><strong>备份数据库</strong></td>
        </tr>
        <form id="edit" method="post" action="?action=BackupData&act=Backup">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><strong>当前数据库路径（相对路径）：</strong></td>
            <td width="50%" align="left"><input type="text" size="15" name="DBpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><strong>备份数据库路径（相对路径）：</strong></td>
            <td align="left"><input type="text" size="15" name="bkfolder" value="Databackup">
              该目录若不存在，系统将自动建立</td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><strong>备份后数据库名称</strong></td>
            <td align="left"><input type="text" size="20" name="bkDBname" value="<%=replace(Date(),"/","-")%>_bak.mdb">
              按日期自动命名</td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><strong><font color="red">注：如果备份文件不存在将建立；如果存在将覆盖</font></strong></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><input type="submit" value="开始备份" class="button">
              &nbsp;
              <input name="reset3" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" 取消 " /></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<%
End Sub

Sub CompressData()
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="4" class="classtop">压缩数据库</td>
        </tr>
        <form id="edit" action="?action=CompressData" method="post">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><strong>压缩数据库的路径：</strong></td>
            <td width="50%" align="left"><input type="text" name="dbpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><input type="submit" value="开始压缩" class="button">
              &nbsp;<a href="data.asp"><font color="red">返回</font></a></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<%
Dim dbpath,boolIs97
dbpath = request("dbpath")
boolIs97 = request("boolIs97")

If dbpath <> "" Then
	dbpath = server.mappath(dbpath)
	response.write "<br>"
	response.write(CompactDB(dbpath,boolIs97))
End If

End Sub

'=====================压缩参数=========================
Function CompactDB(dbPath, boolIs97)
Dim fso, Engine, strDBPath,JET_3X
strDBPath = Left(dbPath,InStrRev(DBPath,"\"))
Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists(dbPath) Then
	fso.CopyFile dbpath,strDBPath & "temp.mdb"
	Set Engine = CreateObject("JRO.JetEngine")

	If boolIs97 = "True" Then
		Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
		"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" _
		& "Jet OLEDB:Engine Type=" & JET_3X
	Else
		Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", _
		"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb"
	End If

	fso.CopyFile strDBPath & "temp1.mdb",dbpath
	fso.DeleteFile(strDBPath & "temp.mdb")
	fso.DeleteFile(strDBPath & "temp1.mdb")
	Set fso = nothing
	Set Engine = nothing

	CompactDB = "您的数据库" & dbpath & "已经成功被压缩！" & vbCrLf

  
Else
	CompactDB = "您输入的路径有误，请确认后重新输入！" & vbCrLf
End If

End Function

'=====================END=========================

response.write "</body></html>"
end if
%>
