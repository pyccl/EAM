<%
sub toptitle(tno,tname,np,geturl,ifindex)
response.write "<a href='?order"&tno&"="
if request("order"&tno)="asc" then
	response.write "desc"
else
	response.write "asc"
end if
response.write "&page="&np&"&"&geturl&"'><strong><font color='#ffffff' size='-1'>"&tname&"</font></strong>"
if request("order"&tno)="asc" then
	response.write "<img src='"&ifindex&"/images/up2.gif' border='0' hspace='2' align='absmiddle'>"
else
	response.write "<img src='"&ifindex&"/images/down2.gif' border='0' hspace='2' align='absmiddle'>"
end if
response.write "</a>"
end sub
%>
