<!--#include file="inc/const.asp" -->   
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/mysession.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>页脚</title>
<link href="images/default.css" rel="stylesheet" type="text/css" />
</head>
<%
sqlrank="select * from admin where admin_id='"&session("web_admin")&"'"
Set rsrank=conn.execute(sqlrank)
	rank=rsrank("rank")
%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="images/login_26_1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="23" height="28"><div align="right"><img src="images/user.gif" width="16" height="12" /></div></td>
        <td width="120" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><div align="right">欢迎您,<font color="red"><%=session("cname")%></font>&nbsp;权限:</div></td>
        <td width="100" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);">
			<div align="left">
          <marquee behavior="alternate" scrollamount="2">
            <% if isnull(rank) then
					response.write "<font color=red><b>无权限！</b></font>" 
				else
					response.write "<font color=yellow>"& rank &"</b>"
				end if %>
            </marquee>
			</div>
		  </td>
        <td width="2"><img src="images/login_29.gif" width="2" height="28" /></td>
        <td width="30"><div align="center"><img src="images/date.gif" width="16" height="12" /></div></td>
        <td width="2"><img src="images/login_29.gif" width="2" height="28" /></td>
        <td width="145">
			<script type="text/javascript">
			  function showTime(){
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth()+1;
				var day = date.getDate();
				var hour = date.getHours();
				var minute = date.getMinutes();
				var second = date.getSeconds();
				hour = hour > 9 ? hour : "0" + hour;
				minute = minute > 9 ? minute : "0" + minute;
				second = second > 9 ? second : "0" + second;
				document.getElementById("time").innerHTML = year+"年"+month+"月"+day+"日 "+hour+":"+minute+":"+second;
			  }
			  setInterval("showTime()",1000);
			</script>
		<div id="time" align="center" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"></div></td>
        <td style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);">
            <div align="center">
            <%
            sql="select icpnum,icphttp,gongannum,gonganhttp from setting"
            rs.open sql,connstr,1,3
            if len(rs("icpnum"))>0 then 
                if len(rs("icphttp"))>0 then %>
                <a href=<%=rs("icphttp")%> target=_blank><%=rs("icpnum")%></a>
                <%else%>
                <%=rs("icpnum")%>
            <%  end if
            end if
            if len(rs("gongannum"))>0 then %>
                &nbsp;&nbsp;<img src="images/gongan.png">
                <% if len(rs("gonganhttp"))>0 then %>
                <a href=<%=rs("gonganhttp")%> target=_blank><%=rs("gongannum")%></a>
                <%else%>
                <%=rs("gongannum")%>
            <%  end if
            end if
            %>
                </div>
        </td>
        <td width="145" style="height:1;font-size:9pt; color:#ffffff;filter:glow(color=#215970,strength=1);"><div align="center">版本: <%=version%></div></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
