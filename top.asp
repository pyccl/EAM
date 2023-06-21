<!--#include file="inc/mysession.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=CompanyName%></title>
<link href="images/default.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {
font-size: 16px；

}
.STYLE2 {font-size: 16px; color: #FFFFFF; }
-->
</style>
<style id="changeColor" type="text/css"></style>
<SCRIPT LANGUAGE="JavaScript">
function adClick(ad, site) {
top.left.location.href=ad;
top.mainframe.location.href = site;}
</script>
</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="38" background="images/default_04.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="279" height="38" background="images/default_01.gif">&nbsp;</td>
        <td width="146" valign="top" background="images/default_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="14%" height="20"><img src="images/home.gif" width="16" height="15" /></td>
            <td width="86%" height="34"><a href="default.asp" target="_parent"><img src="images/sy.gif" width="48" height="19" border="0" /></a></td>
          </tr>
        </table></td>
        <td valign="top"><div align="right">
          <table width="100" border="0" align="right" cellpadding="0" cellspacing="0" height="34">
                  <tr>
                    <td width="76" ><div align="center"><a href="login.asp?action=out" target="_parent"><img src="images/quit.gif" width="67" height="19" border="0"></a></div></td>
                    <td width="24"><div align="center"><a href="help.asp" target="_blank"><img src="images/help.gif" width="18" height="16"></a></div></td>
                  </tr>
          </table></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/default_08.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="nav">
      <tr>
        <td width="75" height="35" background="images/default_06.gif">&nbsp;</td>
        <td style="padding-left:130px;"><table width="525" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <td width="4" height="23"><img src="images/default_10.gif" width="4" height="23" /></td>
             <td width="75" ><div align="center" ><span class="STYLE1"></span><span class="STYLE1" ><a href="javascript:adClick('left.asp?id=', 'tab.asp');"  style=" backgroundColor:#a8a5a5" id="a1" onclick="change(this.id)" >系统首页</a></span></div></td><td width="4"><img src="images/default_13.gif" width="4" height="23" /></td>
            <td width="75"><div align="center"><span class="STYLE1"></span>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                 
                  <td ><div align="center"><a href="javascript:adClick('left.asp?id=zc', 'sb/news_list.asp');" id="a2"  onclick="change(this.id)">资产管理</a></div></td>
				  <script>

function change(obj) {
for (var i=1; i<6; i++)
{
x="a"+i
document.getElementById(x).style.backgroundColor="";
if (obj.value==x.value)
{
document.getElementById(obj).style.backgroundColor="#a8a5a5";
}

}

}
</script>
                 <td width="4"><img src="images/default_13.gif" width="4" height="23" /></td>
                </tr>
              </table>
            </div></td>
			
			
            <td width="75"><div align="center"><span class="STYLE1"></span><span class="STYLE1"><a href="javascript:adClick('left.asp?id=xx', 'user/admin_yuangong.asp');"  id="a3"  onclick="change(this.id)">信息管理</a></span></div></td><td width="4"><img src="images/default_13.gif" width="4" height="23" /></td>
            <td width="75"><div align="center"><span class="STYLE1"></span><span class="STYLE1"><a href="javascript:adClick('left.asp?id=xt', 'admin/user_log.asp');"  id="a4" onclick="change(this.id)">系统管理</a></span></div></td><td width="4"><img src="images/default_13.gif" width="4" height="23" /></td>
           <td width="75"><div align="center"><span class="STYLE1"></span><span class="STYLE1"><a href="login.asp?action=out"  id="a5" onclick="change(this.id)" target="_parent">退出系统</a></span></div></td><td width="4"><img src="images/default_13.gif" width="4" height="23" /></td>

          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
