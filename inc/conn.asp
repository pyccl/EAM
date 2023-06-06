<!--#include file="360_safe3.asp"-->
<%
'On Error Resume Next 
dim conn,connstr,db,rs,rs_s,rs_s1
db="/db/dnsb.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
Set rs=Server.CreateObject("ADODB.Recordset")

'conn.open "provider=SQLOLEDB;data source=127.0.0.1;initial catalog=zichan;user id=sa;password=SASA;"
 
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
conn.Open connstr


'-----------防注入语句开始---------------
Dim Fy_Url,Fy_a,Fy_x,Fy_Cs(),Fy_Cl,Fy_Ts,Fy_Zx 
'---定义部份 头------ 
Fy_Cl = 1 '处理方式：1=提示信息,2=转向页面,3=先提示再转向 
Fy_Zx = "index.Asp" '出错时转向的页面 
'---定义部份 尾------ 

On Error Resume Next 
Fy_Url=Request.ServerVariables("QUERY_STRING") 
Fy_a=split(Fy_Url,"&") 
redim Fy_Cs(ubound(Fy_a)) 
On Error Resume Next 
for Fy_x=0 to ubound(Fy_a) 
Fy_Cs(Fy_x) = left(Fy_a(Fy_x),instr(Fy_a(Fy_x),"=")-1) 
Next 
For Fy_x=0 to ubound(Fy_Cs) 
If Fy_Cs(Fy_x)<>"" Then 
If Instr(LCase(Request(Fy_Cs(Fy_x))),"'")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"select")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"update")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"chr")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"delete%20from")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),";")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"insert")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"mid")<>0 Or Instr(LCase(Request(Fy_Cs(Fy_x))),"master.")<>0 Then 
Select Case Fy_Cl 
Case "1" 
Response.Write "<Script Language=JavaScript>alert(' 出现错误！参数 "&Fy_Cs(Fy_x)&" 的值中包含非法字符串！\n\n 请不要在参数中出现：and,select,update,insert,delete,chr 等非法字符！\n\n本站已经设置了禁止SQL注入，请不要使用任何非法手段入侵本站！');window.close();</Script>" 
Case "2" 
Response.Write "<Script Language=JavaScript>location.href='"&Fy_Zx&"'</Script>" 
Case "3" 
Response.Write "<Script Language=JavaScript>alert(' 出现错误！参数 "&Fy_Cs(Fy_x)&"的值中包含非法字符串！\n\n 请不要在参数中出现：,and,select,update,insert,delete,chr 等非法字符！\n\n设计了门，非法侵入请离开，谢谢！');location.href='"&Fy_Zx&"';</Script>" 
End Select 
Response.End 
End If 
End If 
Next 
'-----------防注入语句结束---------------	

function SQLInject(strWords)
dim badChars, newChars, tmpChars, regEx, i
badChars = array( _
"select(.*)(from|with|by){1}", "insert(.*)(into|values){1}", "update(.*)set", "delete(.*)(from|with){1}", _
"drop(.*)(from|aggre|role|assem|key|cert|cont|credential|data|endpoint|event|f ulltext|function|index|login|type|schema|procedure|que|remote|role|route|sign| stat|syno|table|trigger|user|view|xml){1}", _
"alter(.*)(application|assem|key|author|cert|credential|data|endpoint|fulltext |function|index|login|type|schema|procedure|que|remote|role|route|serv|table|u ser|view|xml){1}", _
"xp_", "sp_", "restore\s", "grant\s", "revoke\s", _
"dbcc", "dump", "use\s", "set\s", "truncate\s", "backup\s", _
"load\s", "save\s", "shutdown", "cast(.*)\(", "convert(.*)\(", "execute\s", _
"updatetext", "writetext", "reconfigure", _
"/\*", "\*/", ";", "\-\-", "\[", "\]", "char(.*)\(", "nchar(.*)\(") 
newChars = strWords
for i = 0 to uBound(badChars)
Set regEx = New RegExp
regEx.Pattern = badChars(i)
regEx.IgnoreCase = True
regEx.Global = True
newChars = regEx.Replace(newChars, "")
Set regEx = nothing
next
newChars = replace(newChars, "'", "''")
SQLInject = newChars
end function
%> 