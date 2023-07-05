<!--#include file="inc/const.asp"-->
<!--#include file="inc/conn.asp"-->
<!-- #include file="inc/md5.asp" -->
<%
set rshb=server.CreateObject("Adodb.recordSet")
sqlhb="select sfhb,kssj,jssj from setting"
rshb.open sqlhb,connstr,1,1
if rshb("sfhb") then

	'-----------以下是网站自动黑白代码------------'

	dim StartTime
	dim EndTime
	dim NowTime

	StartTime = rshb("kssj")
	EndTime = rshb("jssj")
	NowTime = now()

	if NowTime > StartTime and NowTime < EndTime then
	   response.write "<style>"
	   response.write "html {-webkit-filter: grayscale(100%);background:white;filter:progid:DXImageTransform.Microsoft.BasicImage(graysale=1);}"
	   response.write "</style>"
	end if
end if
      rshb.close
      set rshb=nothing

	'-----------以上是网站自动黑白代码------------'
   
	dim action
	action=Request.QueryString("action")
	fileName = Request.ServerVariables("script_name")
	username=trim(request("user"))
	userpw=trim(request("userpw"))
	select case action
	  case "chk"
	    call chk(username,userpw)
	  case "out"
	    call out()
	  case else
	    call login()
	end select
'******************↓目的：    管理员登陆界面
'***************************************
sub login()
%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <%
    	sql="select * from setting"
		set rs1=conn.execute(sql)
		companyname=rs1("companyname")
	   titles=companyname & rs1("systemname")
       mess=rs1("message")
       rs1.close
        set rs1=nothing%>
<title><%=titles%>登录</title>
</script>
<link href="images/login.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/favicon.ico"/>
<link rel="bookmark" href="/favicon.ico"/>
<style type="text/css">
<!--
.STYLE1 {
	color: #8a8a8a;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript" language="javascript">
function keyDown(e){ 
 var keycode = 0;
 //IE浏览器
 if(CheckBrowserIsIE()){
  keycode = event.keyCode;
 }else{
 //火狐浏览器
 keycode = e.which;
 }
 if (keycode == 13 ) //回车键是13
 {
  //document.getElementById("login").click();
  document.getElementById("login").submit();
 }
}
//判断访问者的浏览器是否是IE
function CheckBrowserIsIE(){
 var result = false;
 var browser = navigator.appName;
 if(browser == "Microsoft Internet Explorer"){
  result = true;
 }
 return result;
}
</script>
</head>
<body onkeydown="keyDown(event);">
<form name="login" id="login" method="post" action="<%=fileName%>?action=chk">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="63"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="279" height="63" ><a href="login.asp" target="_parent"><img src="images/login_01.gif" border="0" ></a></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="34" background="images/login_04.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="147" height="34" background="images/login_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="14%" height="20"></td>
                    <td width="86%"></td>
                  </tr>
                </table></td>
                <td>&nbsp;</td>
                <td><table width="100" border="0" align="right" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="76"><div align="center"><a href="help.asp"><img src="images/bz.gif" width="67" height="19"></a></div></td>
                    <td width="24"><div align="center"><a href="update.asp"><img src="images/help.gif" width="17" height="16"></a></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="29" background="images/login_07.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#cbcbcb">&nbsp;</td>
      </tr>
      <tr>
        <td height="489" background="images/login_08.gif"><table width="986" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="200" background="images/login_09.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="81"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="357" height="81" background="images/login_11.gif">&nbsp;</td>
                <td width="322" background="images/login_13.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="134" height="81"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="49" background="images/login_12.gif">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="32"><div align="center">
                          <input name="user" type="text" tabindex="1">
                        </div></td>
                      </tr>
                    </table></td>
                    <td>&nbsp;</td>
                    <td width="137"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="49" background="images/login_14.gif">&nbsp;</td>
                      </tr>
                      <tr>
					  
                        <td height="32"><div align="center">
                          <input name="userpw" type="password" tabindex="2">
                        </div></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
                <td width="155">
				<a href="javascript:document.login.submit();"><img src="images/login_15.gif" width="155" height="81" border="0" ></a></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="73" align="center" background="images/login_19.gif">验证码：
              <input name="code" type="text" id="code" tabindex="3" size="4" maxlength="4">
				<img id="captcha_image" style="height:25px;width:70px;" align="absmiddle" onclick="this.src=this.src+'?'" src="Inc/code.asp"/></td>
          </tr>
          <tr>
            <td height="31"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="271" height="31" background="images/login_20.gif">&nbsp;</td>
                <td width="408" valign="middle" background="images/login_21.gif" ><img src="images/bb.gif" width="22" height="21">
                    <span class="STYLE1"><font color="#666666"><%=mess%></font></span>
                  </td>
                <td width="307" background="images/login_22.gif">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="104" background="images/login_23.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bgcolor="#e4e4e4">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
<tr>
    <td height="33" valign="bottom" background="images/login_26.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="45" height="28"><div align="right"><img src="images/date.gif" width="14" height="16"></div></td>
        <td width="170" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><div align="center">日期:<%=year(date())%>年<%=month(date())%>月<%=day(date())%>日 <%=weekdayname(weekday(now)) %> </div></td>
        <td width="2"><img src="images/login_29.gif" width="2" height="28"></td>
        <td>&nbsp;</td>
        <td width="2"><img src="images/login_29.gif" width="2" height="28"></td>
        <td width="145" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><div align="center">版本: <%=version%></div></td>
      </tr>
    </table></td>
  </tr>
</table>
  </form>
</body>
</html>
<%end sub

'****************目的：    用户检测界面
'***********************************
sub chk(UserName, Password)
dim strUser  
strUser = UserName 
strPassword = md5(Password)
      sql="select * from setting"
      set rs=conn.execute(sql)
      Npass=rs("lock")
      rs.close
      set rs=nothing
'*********SQL安全检查
'*******************
    strUser = SQLInject(strUser)
    strPassword = SQLInject(strPassword)
	mycode = request.form("code")
	  
	if mycode = "" then
		Response.Write "<script language=javascript>alert('请输入验证码!');this.location.href='"&request.ServerVariables("HTTP_REFERER")&"';</script>"
		Response.end()
	else
		if mycode<>Session("getcode") then
			Response.Write "<script language=javascript>alert('请输入正确验证码,谢谢!');javascript:history.back();</script>"
			Response.end()
		end if
	end if
	
    set rs13=server.CreateObject("Adodb.recordSet")
    sql13="select * from admin where admin_id='"&strUser&"'"
    rs13.open sql13,connstr,1,3
if rs13.bof or rs13.eof then 
    response.write ("<script>alert('用户名错误!');location.href='"+fileName+"';</script>")
    response.end
else 
      adminid=rs13("admin_id")
      pass=rs13("admin_pw")
      amwork=rs13("amwork")
      working=rs13("working")
end if
if working=0 then
   response.write "<script language=javascript> alert('该管理员帐号已被锁定，请联系超级管理员。');location.replace('login.asp');</script>"
   response.end
end if
if Cint(amwork)>=Cint(Npass) then
   conn.execute "update admin set working = 0 where  admin_id='"&strUser&"' "
   response.write "<script language=javascript> alert('登录失败超过"&Npass&"次,帐号已锁定，请联系管理员解锁。');location.replace('login.asp');</script>"
   response.end
End if
if strPassword<>pass then
   conn.execute "update admin set amwork = amwork+1 where admin_id='"&strUser&"' "
    if amwork < Npass then
       response.write "<script language=javascript> alert('管理员密码不正确，请重新输入。注意：密码输错超过"&Npass&"次，将会被锁定！');location.replace('login.asp');</script>"
    end if
    if amwork = Npass then
       response.write "<script language=javascript> alert('管理员密码不正确，由于密码输错超过"&Npass&"次，账户已经被锁定！请联系管理员进行解锁。');location.replace('login.asp');</script>"
    end if
    response.end                
end if 

if adminid=strUser and strPassword=pass then
		session("lastip")=rs13("lastlogin_ip")
		session("lasttime")=rs13("lastlogin_time")
        rs13("lastlogin_time")=Trim(now())
		rs13("lastlogin_ip")=Request.ServerVariables("Remote_Addr")
        rs13("lastlogin_soft")=Request.ServerVariables("Http_USER_AGENT")
		session("web_admin")=rs13("admin_id")
		session("cname")=rs13("admin_name")
		session("rank")=rs13("rank")
		session("uid")=rs13("id")
		js=rs13("juese")
			if isnull(js) then
				response.write ("<script>alert('用户权限配置为空!请联系管理员操作！');location.href='"+fileName+"';</script>")
				response.end
			end if
    	sqljs="select * from juese where id = " & js
		set rsjs=conn.execute(sqljs)
			if rsjs.bof or rsjs.eof or isnull(rs13("juese")) then 
				response.write ("<script>alert('用户权限配置错误!请联系管理员操作！');location.href='"+fileName+"';</script>")
				response.end
			else
				session("juese")=rsjs("quanxian")
				session("juesemc")=rsjs("mingcheng")
			end if
       rsjs.close
        set rsjs=nothing

		rs13.Update
		rs13.close
		set rs13=nothing 
        conn.execute "update admin set amwork = 0 where admin_id='"&strUser&"' "
    	sql="select * from setting"
		set rs14=conn.execute(sql)
        session("liebiao")=rs14("liebiao")
		session("biaoqian")=rs14("biaoqian")
		session("companyname")=rs14("companyname")
		session("imgh")=rs14("imgh")
		session("imgw")=rs14("imgw")
		session("yuangongimgw")=rs14("yuangongimgw")
		Response.Redirect "default.asp"
end if
end sub

'******************目的：    退出登陆界面
'*************************************
sub out()
	session("web_admin")=""
	session("uid")=""
	session("cname")=""
	session("rank")=""
    session("liebiao")=""
	session("biaoqian")=""
	session("companyname")=""
	session("juese")=""
	session("juesemc")=""
	session("imgh")=""
	session("imgw")=""
	session("yuangongimgw")=""
	response.write ("<script>window.open('login.asp','_parent');</script>")
end sub
%>