<!--#include file="../inc/Conn.asp"-->

<link href="../images/tab.css" rel="stylesheet" type="text/css">
<link href="../css.css" rel="stylesheet" type="text/css">
<%if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="../inc/quanxian.asp"-->
<%
  response.end

else

Dim ZC_DATABASE_PATH

ZC_DATABASE_PATH="../db/dnsb.mdb"	'���ݿ�·��'

data_array= Split(ZC_DATABASE_PATH,"/")

Dim action
action=trim(request("action"))
Dim dbpath,bkfolder,bkdbname,fso,fso1

	Select Case action
	Case ""
		Call chushihua()
	Case "CompressData" 'ѹ������'
		Dim tmprs
		dim allarticle
		dim Maxid
		dim topic,username,dateandtime,body
		call CompressData()
	case "BackupData" '��������'
		if request("act")="Backup" Then
			call updata()
		else
			call BackupData()
		end If
	case "RestoreData" '��ԭ����'
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
						response.write "<br><center><font color=red>���ݿ⻹ԭ�ɹ���</font></center><br><br><a href=""data.asp"">����</a>"
					else
						response.write "<br><center><font color=red>��ԭ���·��������ȷ�Ϻ��������룡</font></center><br><br><a href=""data.asp"">����</a>"
						response.end
					end if
				else
					response.write "<br><center><font color=red>û���ҵ�����������ݿ⣡" 
					response.write "<br>����·��������ȷ�Ϻ��������룡</font><br><br><a href=""data.asp"">����</a></center>"
				end If
		else
			call RestoreData()
		end If
	Case "SpaceSize" 'ϵͳ�ռ�ռ��'
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
			response.write "<center><br>�����ݵ����ݿ�" & dbname &"�Ѿ����ɹ�ɾ��<br><br><a href=""data.asp""><font color=red>����</font></a></center>"
		Else
			response.write "<center>" & dbpath 
			response.write "<br>����·��������ȷ�Ϻ��������룡<br><br><a href=""data.asp""><font color=red>����</font></a></center>"
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
            <td height="25" align="center" colspan="5" class="classtop">���ݿ����</td>
          </tr>
          <form id="edit">
            <tr height="25" align="center" class="classtd">
              <td><a href="?action=SpaceSize"><strong>[���ݿ�ռ�ÿռ�]</strong></a></td>
              <% if Instr(session("juese"),"|601,")<>0 or ID=1 then %>
              <td><a href="?action=CompressData"><strong>[ѹ�����ݿ�]</strong></a></td>
              <% end if
				if Instr(session("juese"),"|602,")<>0 or ID=1 then %>
              <td><a href="?action=BackupData"><strong>[�������ݿ�]</strong></a></td>
              <% end if
				if Instr(session("juese"),"|603,")<>0 or ID=1 then %>
              <td><a href="?action=RestoreData"><strong>[��ԭ���ݿ�]</strong></a></td>
              <% end if 
				if Instr(session("juese"),"|604,")<>0 or ID=1 then %>
              <td><a href="datainit.asp"><strong><font color="red">[���ݿ��ʼ��]</font></strong></a></td>
              <% end if %>
            </tr>
          </form>
        </table></td>
    </tr>
  </table>
</div>
<%end sub

'====================ϵͳ�ռ�ռ��======================='
Sub SpaceSize()
On Error Resume Next
%>
<table border="0" cellspacing="1" cellpadding="0" height="0" align=center width="98%" bgcolor="#183789">
  <tr>
    <td><table border="0" cellspacing="1" cellpadding="4" bgcolor="#FFFFFF" align="center" width="100%">
        <tr>
          <td height="25" align="center" colspan="2" class="classtop">���ݿ�ռ�ÿռ�鿴</td>
        </tr>
        <form id="edit">
          <tr height="25" align="center" class="classtd">
            <td width="50%"><strong>���ݿ�·����</strong><%=ZC_DATABASE_PATH%></td>
            <td width="50%"><b>���ݿ��С��
              <%showSpaceinfo("../"&data_array(1)&"")%>
              </b></td>
          </tr>
          <tr height="25" align="center" class="classtd">
            <td><strong>Ĭ�ϱ������ݿ�·����</strong>/admin/databackup</td>
            <td><b>�������ݿ��С��
              <%showSpaceinfo("databackup")%>
              </b></td>
          </tr>
          <tr height="25" align="center" class="classtd">
            <td><strong>ϵͳ·����</strong><%=server.MapPath("/")%></td>
            <td><b>ϵͳ���ƴ�С��
              <%showSpaceinfo("/")%>
              </b></td>
          </tr>
        </form>
        <tr height="25" align="center" class="classtd">
          <td colspan="2"><input name="reset" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" ���� " /></td>
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
          <td height="25" align="center" colspan="4" class="classtop">��ԭ���ݿ�</td>
        </tr>
        <form id="edit" method="post" action="?action=RestoreData&act=Restore">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><b>��ԭ��·�������·������</b></td>
            <td width="50%" align="left"><input type="text" size="30" name="DBpath" value="DataBackup\<%=replace(Date(),"/","-")%>_Bak.mdb"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><b>��ԭ���·�������·������</b></td>
            <td align="left"><input type="text" size="30" name="backpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd" align="center">
            <td colspan="2"><input type="submit" value="��ʼ��ԭ" class="button">
              &nbsp;
              <input name="reset2" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" ȡ�� " /></td>
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
          <td height="25" align="center" colspan="4" class="classtop"><strong>�������ݿ�</strong></td>
        </tr>
        <tr height="25" class="classtd">
          <td width="50%" align="center"><strong>�Ѿ��ɹ����ݣ��������ݿ�·����<%=bkfolder%>\<%=bkdbname%></strong></td>
        </tr>
        <%
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "����˴��������ݿ⣺<font color=red><a href="""& ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname &""">" & ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname
			response.write "</font></td></tr>"
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "<a href=""data.asp?action=deletebackup&dbpath="&request.form("bkfolder") &"&dbname=" & bkdbname &"""><strong>����������Ϻ�ɵ���˴�ɾ���������ݿ⣡</strong></a>"
			response.write "</td></tr>"
			response.write "<tr height='25' class='classtd'>"
			response.write "<td align='center'><b>"
			response.write "<a href=""data.asp""><font color=red>����</font></a></td></tr>"
			%>
      </table></td>
  </tr>
</table>
<%Else
		response.write "<br><center><font color=red>���������Ҳ����ļ���</font><br><br><a href=""data.asp"">����</a></center>"
	End If
	Set fso = nothing
End Sub
'==================���ĳһĿ¼�Ƿ����=================='
Function CheckDir(FolderPath)
	folderpath=Server.MapPath(".")&"\"&folderpath
	Set fso1 = CreateObject("Scripting.FileSystemObject")
	If fso1.FolderExists(FolderPath) Then
		'����
		CheckDir = True
	Else
		'������
		CheckDir = False
	End If
	Set fso1 = nothing
End Function
'==================����ָ����������Ŀ¼=================='
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
          <td height="25" align="center" colspan="4" class="classtop"><strong>�������ݿ�</strong></td>
        </tr>
        <form id="edit" method="post" action="?action=BackupData&act=Backup">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><strong>��ǰ���ݿ�·�������·������</strong></td>
            <td width="50%" align="left"><input type="text" size="15" name="DBpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><strong>�������ݿ�·�������·������</strong></td>
            <td align="left"><input type="text" size="15" name="bkfolder" value="Databackup">
              ��Ŀ¼�������ڣ�ϵͳ���Զ�����</td>
          </tr>
          <tr height="25" class="classtd">
            <td align="right"><strong>���ݺ����ݿ�����</strong></td>
            <td align="left"><input type="text" size="20" name="bkDBname" value="<%=replace(Date(),"/","-")%>_bak.mdb">
              �������Զ�����</td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><strong><font color="red">ע����������ļ������ڽ�������������ڽ�����</font></strong></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><input type="submit" value="��ʼ����" class="button">
              &nbsp;
              <input name="reset3" type="reset" onClick="javascript:history.back(-1);" class="button"  value=" ȡ�� " /></td>
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
          <td height="25" align="center" colspan="4" class="classtop">ѹ�����ݿ�</td>
        </tr>
        <form id="edit" action="?action=CompressData" method="post">
          <tr height="25" class="classtd">
            <td width="50%" align="right"><strong>ѹ�����ݿ��·����</strong></td>
            <td width="50%" align="left"><input type="text" name="dbpath" value="<%=ZC_DATABASE_PATH%>"></td>
          </tr>
          <tr height="25" class="classtd">
            <td align="center" colspan="2"><input type="submit" value="��ʼѹ��" class="button">
              &nbsp;<a href="data.asp"><font color="red">����</font></a></td>
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

'=====================ѹ������=========================
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

	CompactDB = "�������ݿ�" & dbpath & "�Ѿ��ɹ���ѹ����" & vbCrLf

  
Else
	CompactDB = "�������·��������ȷ�Ϻ��������룡" & vbCrLf
End If

End Function

'=====================END=========================

response.write "</body></html>"
end if
%>
