<!--#include file="inc/mysession.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=CompanyName%></title>
<link href="images/default.css" rel="stylesheet" type="text/css" />
</head>
<%id=request("id")%>
<body  style="overflow:hidden">
<table width="195" height="100%" border="0" cellpadding="0" cellspacing="0">
  <td valign="top" style="border-right:solid 1px #fff;" ><table width="195" height="100%" border="0" cellpadding="0" cellspacing="0" style=" table-layout:fixed">
      <tr>
        <td height="15" background="images/default_17.gif" style="line-height:15px;">&nbsp;</td>
      </tr>
      <tr>
        <td style="background:#149ac0;"><table width="195" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="border-right:solid 1px #404040;"><table width="195" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"  style="background:url(images/left_bg.gif) repeat-x top; border-right:solid 1px #404040;"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <%if id="zc" then
							if Instr(session("juese"),"|101,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/dj.asp" target=mainframe>添加资产</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if 
						   if Instr(session("juese"),"|102,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/news_list.asp" target=mainframe>管理资产</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|201,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/news_list_lb.asp" target=mainframe>管理标签</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|108,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/pandian.asp" target=mainframe>资产盘点</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|202,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/zhejiu_list.asp" target=mainframe>资产折旧</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <% end if
						   end if%>
                        <%if id="xx" then
							if Instr(session("juese"),"|401,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_shiyongdanwei.asp" target=mainframe>管理公司</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|402,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_department.asp" target=mainframe>管理部门</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|403,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_bsort.asp" target=mainframe>管理大类</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_sort.asp" target=mainframe>管理小类</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|404,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_state.asp" target=mainframe>管理状态</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|405,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="information/admin_os.asp" target=mainframe>管理操作系统</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|501,")<>0 then %>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="/user/add_yuangong.asp" target=mainframe>添加员工</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|502,")<>0 then %>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="user/admin_yuangong.asp" target=mainframe>管理员工</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <!--<tr>
                      <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                          <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                              <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sb/admin_area.asp" target=mainframe>管理型号</a></td>
                            </tr>
                          </table></td>
                          <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                        </tr>
                      </table></td>
                    </tr>-->
                        <% end if
						   end if%>
                        <%if id="xt" then
						   if Instr(session("juese"),"|300,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="admin/setting.asp" target=mainframe>系统设置</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|601,")<>0 or Instr(session("juese"),"|602,")<>0 or Instr(session("juese"),"|603,")<>0 or Instr(session("juese"),"|604,")<>0 then%>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="admin/data.asp" target=mainframe>数据库管理</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|301,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="../admin/admin_juese.asp?Result=Add" target=mainframe>添加角色</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="../admin/juese.asp" target=mainframe>角色管理</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|305,")<>0 then %>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="../admin/add_user.asp" target=mainframe>添加账户</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|302,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="../admin/user_info.asp" target=mainframe>管理账户</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<% end if
						   if Instr(session("juese"),"|303,")<>0 then %>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="admin/user_log.asp" target=mainframe>查询日志</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <% end if
						   end if%>
                        <%if id="" then%>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="sysinfo.asp" target=mainframe>系统信息</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="serverinfo.asp" target=mainframe>服务器信息</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="count.asp" target=mainframe>系统统计</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="userinfo.asp" target=mainframe>账户信息</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
						<tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="help.asp" target=mainframe>系统帮助</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="update.asp" target=mainframe>更新记录</a></td>
                                    </tr>
                                  </table></td>
                                <td width="3"><img src="images/default_24.gif" width="3" height="28"></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td style="padding-bottom:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="3" height="28"><img src="images/default_21.gif" width="3" height="28"></td>
                                <td background="images/default_23.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="17%"><div align="right"><img src="images/list.gif" width="10" height="10"></div></td>
                                      <td width="83%" style="height:1;font-size:12pt; color:#ffffff;filter:glow(color=#215970,strength=1); padding-left:5px;"><a href="login.asp?action=out" target="_parent">退出系统</a>
                                    </tr>
                                  </table></td>
                              </tr>
                            </table></td>
                        </tr>
                        <%end if%>
                      </table></td>
                  </tr>
                  <tr>
                    <td height="10" style="border-right:solid 1px #404040;">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
          </table></td>
      </tr>
        </tr>
      
    </table></td>
    </tr>
  
</table>
</body>
</html>
