<% 
'Code by safe3
On Error Resume Next
if request.querystring<>"" then call stophacker(request.querystring,"'|(and|or)\b.+?(>|<|=|in|like)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if request.Form<>"" then call stophacker(request.Form,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if request.Cookies<>"" then call stophacker(request.Cookies,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)") 
ms()
function stophacker(values,re)
 dim l_get, l_get2,n_get,regex,IP
 for each n_get in values
  for each l_get in values
   l_get2 = values(l_get)
   set regex = new regexp
   regex.ignorecase = true
   regex.global = true
   regex.pattern = re
   if regex.test(l_get2) then
                                IP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
                                If IP = "" Then 
                                  IP=Request.ServerVariables("REMOTE_ADDR")
                                end if
                                'slog("<br><br>����IP: "&ip&"<br>����ʱ��: " & now() & "<br>����ҳ�棺"&Request.ServerVariables("URL")&"<br>�ύ��ʽ: "&Request.ServerVariables("Request_Method")&"<br>�ύ����: "&l_get&"<br>�ύ����: "&l_get2)
    Response.Write "����Ա��ʾ����������Ա��⵽�Ƿ�������"
    Response.end
   end if
   set regex = nothing
  next
 next
end function 

sub slog(logs)
        dim toppath,fs,Ts
        toppath = Server.Mappath("/log.htm")
                                Set fs = CreateObject("scripting.filesystemobject")
                                If Not Fs.FILEEXISTS(toppath) Then 
                                    Set Ts = fs.createtextfile(toppath, True)
                                    Ts.close
                                end if
                                    Set Ts= Fs.OpenTextFile(toppath,8)
                                    Ts.writeline (logs)
                                    Ts.Close
                                    Set Ts=nothing
                                    Set fs=nothing
end sub
sub ms()
        dim path,fs
        path = Server.Mappath("update360.asp")
        Set fs = CreateObject("scripting.filesystemobject")
        If Fs.FILEEXISTS(path) Then 
        Response.Write "�������������ļ�update360.asp��ֹ�ڿ�����"
        Response.End
        end if
        Set fs=nothing
end sub
%>