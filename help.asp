<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站帮助文档</title>
<link href="images/tab.css" rel="stylesheet" type="text/css" />
</head>

<body>
<p class="td1">一、系统概述 </p>
<p class="td1"> 1.本系统由天天ASP原系统V4.0 build 20190522进行更改、更新。<br />
  2.系统由ASP源码、Access数据库生成。<br />
  3.默认首页需要设置为default.asp。<br />
  4.首次登录系统需要配置以下内容：公司、部门、大类、小类、状态、操作系统、角色、账户等内容（如不符合自行更改）；<br />
  5.账户权限为管理公司权限、角色中内容是在有公司权限的情况下进行的管理。</p>
<p class="td1">二、数据结构</p>
<p class="td1">本系统采用Access做数据库，也可以使用Microsoft SQL数据库（暂时未做）。</p>
<p class="td1">1.数据库<br />
本系统拥有一个数据库，数据库文件路径：&ldquo;\db\dasb.mdb&rdquo;。</p>
<p class="td1">2.表<br />
  本数据库拥有16个表，其中admin_Area、bwl、pdsj表暂未用。<br />
  
</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr background="images/th_bg.gif" style="color:#ffffff;">
      <td height="24" align="center" valign="middle">序号</td>
      <td height="24" align="center" valign="middle">表名</td>
      <td height="24" align="center" valign="middle">关键字段</td>
      <td height="24" align="center" valign="middle">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">admin</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">管理员账户表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle"><strong><em>2</em></strong></td>
      <td height="24" align="center" valign="middle"><em><strong>admin_Area</strong></em></td>
      <td height="24" align="center" valign="middle"><em><strong>c_id</strong></em></td>
      <td height="24" valign="middle">暂无用</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">admin_bsort</td>
      <td height="24" align="center" valign="middle">p_id</td>
      <td height="24" valign="middle">分类-大类</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">admin_department</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">部门表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">admin_shiyongdanwei</td>
      <td height="24" align="center" valign="middle">c_id</td>
      <td height="24" valign="middle">公司表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">admin_sort</td>
      <td height="24" align="center" valign="middle">p_id</td>
      <td height="24" valign="middle">分类-小类</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">7</td>
      <td height="24" align="center" valign="middle">admin_state</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">状态表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">8</td>
      <td height="24" align="center" valign="middle">admin_yuangong</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">员工表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle"><em><strong>9</strong></em></td>
      <td height="24" align="center" valign="middle"><strong><em>bwl</em></strong></td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle"><strong><em>暂无用</em></strong></td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">10</td>
      <td height="24" align="center" valign="middle">juese</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">角色表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">11</td>
      <td height="24" align="center" valign="middle">OS</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">操作系统表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle"><strong><em>12</em></strong></td>
      <td height="24" align="center" valign="middle"><strong><em>pdsj</em></strong></td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle"><strong><em>暂无用</em></strong></td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">13</td>
      <td height="24" align="center" valign="middle">sb_log</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">资产日志（关于资产的）</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">14</td>
      <td height="24" align="center" valign="middle">sbxx</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">资产详细表</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">15</td>
      <td height="24" align="center" valign="middle">setting</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">设置存储</td>
    </tr>
    <tr bgcolor='#EBF2F9' >
      <td height="24" align="center" valign="middle">16</td>
      <td height="24" align="center" valign="middle">user_log</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24" valign="middle">用户日志（关于用户的）</td>
    </tr>
  </tbody>
</table>
<p>2.admin表（管理员账户表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" background="images/th_bg.gif" style="color:#ffffff;">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24" valign="middle">ID号，用户数据的匹配</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">admin_name</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24" valign="middle">管理员姓名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">admin_id</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24" valign="middle">管理员登录名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">admin_pw</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24" valign="middle">管理员密码</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">lastlogin_time</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24" valign="middle">最后登录时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">lastlogin_ip</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24" valign="middle">最后登录IP地址</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">7</td>
      <td height="24" align="center" valign="middle">rank</td>
      <td height="24" align="center" valign="middle">备注</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24" valign="middle">权限</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">8</td>
      <td height="24" align="center" valign="middle">lastlogin_soft</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">200</td>
      <td height="24" valign="middle">最后登录软件（出处）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">9</td>
      <td height="24" align="center" valign="middle">amwork</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24" valign="middle">管理员密码输入错误次数</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">10</td>
      <td height="24" align="center" valign="middle">working</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24" valign="middle">管理员是否被锁定</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">11</td>
      <td height="24" align="center" valign="middle">nowwork</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24" valign="middle">暂无用</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">12</td>
      <td height="24" align="center" valign="middle">juese</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24" valign="middle">管理员角色编号（juese表ID）</td>
    </tr>
  </tbody>
</table>
<p>3.admin_bsort表（分类表-大类）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">s_id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">分类ID（大类）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">s_name</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">分类名称（大类）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">s_color</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">分类颜色（大类）（显示统计等）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">s_paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">排序（显示的先后顺序）</td>
    </tr>
  </tbody>
</table>
<p>4.admin_department表（部门表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">s_id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">部门ID</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">company</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">公司名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">department</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">部门名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">s_paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">部门排序（显示的先后顺序）</td>
    </tr>
  </tbody>
</table>
<p>5.admin_shiyongdanwei表（公司表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">y_id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">公司ID</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">y_name</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">公司名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">y_color</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">公司颜色（显示统计等）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">y_paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">公司排序（显示的先后顺序）</td>
    </tr>
  </tbody>
</table>
<p>6.admin_sort表（分类表-小类）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">s_id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">分类ID（小类）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">s_bname</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">大类名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">s_name</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">小类名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">s_paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">分类排序（显示的先后顺序）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">canzhilv</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">残值率（折旧功能）</td>
    </tr>
  </tbody>
</table>
<p>7.admin_state表（状态表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">状态编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">ztm</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">10</td>
      <td height="24">状态名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">ztys</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">7</td>
      <td height="24">状态颜色（显示统计等）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">y_paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">状态排序（显示的先后顺序）</td>
    </tr>
  </tbody>
</table>
<p>8.admin_yuangong表（员工表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">员工ID</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">xingming</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">员工姓名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">sex</td>
      <td height="24" align="center" valign="middle">布尔</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">性别（已不用，由身份证号自动算出）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">company</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">公司名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">department</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">所属部门</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">position</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">职位</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">7</td>
      <td height="24" align="center" valign="middle">ruzhi</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">入职时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">8</td>
      <td height="24" align="center" valign="middle">weixin</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">微信号码</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">9</td>
      <td height="24" align="center" valign="middle">phone</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">11</td>
      <td height="24">电话号码</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">10</td>
      <td height="24" align="center" valign="middle">qq</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">QQ号码</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">11</td>
      <td height="24" align="center" valign="middle">idcard</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">18</td>
      <td height="24">身份证号码</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">12</td>
      <td height="24" align="center" valign="middle">education</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">文化程度</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">13</td>
      <td height="24" align="center" valign="middle">place1</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">籍贯-省</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">14</td>
      <td height="24" align="center" valign="middle">place2</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">籍贯-市</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">15</td>
      <td height="24" align="center" valign="middle">place3</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">籍贯-县</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">16</td>
      <td height="24" align="center" valign="middle">place4</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">当前住址-省</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">17</td>
      <td height="24" align="center" valign="middle">place5</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">当前住址-市</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">18</td>
      <td height="24" align="center" valign="middle">place6</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">当前住址-县</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">19</td>
      <td height="24" align="center" valign="middle">photo</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">员工相片（路径）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">20</td>
      <td height="24" align="center" valign="middle">gh</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">15</td>
      <td height="24">员工工号</td>
    </tr>
  </tbody>
</table>
<p>9.juese表（角色）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">id</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">角色编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">mingcheng</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">20</td>
      <td height="24">角色名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">datetime</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">最后更新时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">state</td>
      <td height="24" align="center" valign="middle">布尔</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">是否启用</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">beizhu</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">quanxian</td>
      <td height="24" align="center" valign="middle">备注</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">角色的详细权限</td>
    </tr>
  </tbody>
</table>
<p>10.OS表（操作系统表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">ID</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">系统编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">os</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">操作系统名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">paixu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">系统排序（显示的先后顺序）</td>
    </tr>
  </tbody>
</table>
<p>11.sb_log表（设备日志表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">ID</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">系统编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">zcid</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">资产ID</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">leixing</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">日志类型</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">ssbm</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">所属部门</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">user</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24"> 操作账户名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">datetime</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">日志生成时间</td>
    </tr>
  </tbody>
</table>
<p>12.sbxx表（设备信息表、资产详情表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">ID</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">系统编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">sbbh</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">设备编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle"><em><strong>3</strong></em></td>
      <td height="24" align="center" valign="middle"><em><strong>sbid</strong></em></td>
      <td height="24" align="center" valign="middle"><em><strong>数值</strong></em></td>
      <td height="24" align="center" valign="middle"><em><strong>整型</strong></em></td>
      <td height="24"><em><strong>设备ID（暂不用）</strong></em></td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">sbcs</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">设备从属</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">pp</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">设备类别</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">zilei</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">子类</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">7</td>
      <td height="24" align="center" valign="middle">xh</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">型号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">8</td>
      <td height="24" align="center" valign="middle">czxt</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">操作系统</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">9</td>
      <td height="24" align="center" valign="middle">jqm</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">机器名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">10</td>
      <td height="24" align="center" valign="middle">ssbm</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">公司名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">11</td>
      <td height="24" align="center" valign="middle">department</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">部门</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">12</td>
      <td height="24" align="center" valign="middle">cpu</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">CPU</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">13</td>
      <td height="24" align="center" valign="middle">ram</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">小数</td>
      <td height="24">内存大小</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">14</td>
      <td height="24" align="center" valign="middle">hdd</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">硬盘大小</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">15</td>
      <td height="24" align="center" valign="middle">hddsn</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">硬盘序列号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">16</td>
      <td height="24" align="center" valign="middle">gpu</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">显卡</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">17</td>
      <td height="24" align="center" valign="middle">IP</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">IP地址</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">18</td>
      <td height="24" align="center" valign="middle">MAC</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">网卡MAC地址</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">19</td>
      <td height="24" align="center" valign="middle">scrq</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">生产日期</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">20</td>
      <td height="24" align="center" valign="middle">gzsj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">购置时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">21</td>
      <td height="24" align="center" valign="middle">price</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">小数</td>
      <td height="24">价格</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">22</td>
      <td height="24" align="center" valign="middle">baoxiu</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">保修时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">23</td>
      <td height="24" align="center" valign="middle">ccbh</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">设备序列号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">24</td>
      <td height="24" align="center" valign="middle">syz</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">使用者</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">25</td>
      <td height="24" align="center" valign="middle">bz</td>
      <td height="24" align="center" valign="middle">备注</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">26</td>
      <td height="24" align="center" valign="middle">cfdd</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">存放地点</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">27</td>
      <td height="24" align="center" valign="middle">zt</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">设备状态</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">28</td>
      <td height="24" align="center" valign="middle">pdzt</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">盘点状态</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">29</td>
      <td height="24" align="center" valign="middle">dyzt</td>
      <td height="24" align="center" valign="middle">布尔</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">是否打印（标签）</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">30</td>
      <td height="24" align="center" valign="middle">tjsj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">提交时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">31</td>
      <td height="24" align="center" valign="middle">gxsj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">更新时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">32</td>
      <td height="24" align="center" valign="middle">tjry</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">60</td>
      <td height="24">提交人员</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">33</td>
      <td height="24" align="center" valign="middle">pic</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">设备图片路径</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">34</td>
      <td height="24" align="center" valign="middle">pdsj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">盘点时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">35</td>
      <td height="24" align="center" valign="middle">pdbz</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">盘点备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">36</td>
      <td height="24" align="center" valign="middle">zhejiu</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">折旧月数</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle"><strong><em>37</em></strong></td>
      <td height="24" align="center" valign="middle"><strong><em>gh</em></strong></td>
      <td height="24" align="center" valign="middle"><strong><em>文本 </em></strong></td>
      <td height="24" align="center" valign="middle"><strong><em>15</em></strong></td>
      <td height="24"><em><strong>所属用户工号（暂不用）</strong></em></td>
    </tr>
  </tbody>
</table>
<p>13.setting表（设置表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">systemname</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">20</td>
      <td height="24">系统名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">companyname</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">公司名称</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">lock</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">密码输入错误次数</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">ICPnum</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">25</td>
      <td height="24">ICP备案号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">ICPhttp</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">ICP备案地址</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">gongannum</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">30</td>
      <td height="24">公安备案号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">7</td>
      <td height="24" align="center" valign="middle">gonganhttp</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">公安备案地址</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">8</td>
      <td height="24" align="center" valign="middle">imgh</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">资产详情页图片高度</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">9</td>
      <td height="24" align="center" valign="middle">imgw</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">资产二维码页图片宽度</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">10</td>
      <td height="24" align="center" valign="middle">yuangongimgw</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">用户图片宽度</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">11</td>
      <td height="24" align="center" valign="middle">pd</td>
      <td height="24" align="center" valign="middle">布尔</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">盘点开关</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">12</td>
      <td height="24" align="center" valign="middle">liebiao</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">列表页数量</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">13</td>
      <td height="24" align="center" valign="middle">biaoqian</td>
      <td height="24" align="center" valign="middle">数值</td>
      <td height="24" align="center" valign="middle">整型</td>
      <td height="24">标签页数量</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">14</td>
      <td height="24" align="center" valign="middle">message</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">登录页提示信息</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">15</td>
      <td height="24" align="center" valign="middle">sfhb </td>
      <td height="24" align="center" valign="middle">布尔</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">首页是否黑白</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">16</td>
      <td height="24" align="center" valign="middle">kssj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">首页黑白开始时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">17</td>
      <td height="24" align="center" valign="middle">jssj</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">首页黑白结束时间</td>
    </tr>
  </tbody>
</table>
<p>14.user_log表（用户日志表）</p>
<table width="500" border="0" align="center" cellspacing="1" cellpadding="4" bgcolor="#6298E1">
  <tbody>
    <tr align="center" valign="middle" style="color:#ffffff;" background="images/th_bg.gif">
      <td height="24">序号</td>
      <td height="24">字段名</td>
      <td height="24">字段类型</td>
      <td height="24">字段大小</td>
      <td height="24">备注</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">1</td>
      <td height="24" align="center" valign="middle">ID</td>
      <td height="24" align="center" valign="middle">自动编号</td>
      <td height="24" align="center" valign="middle">-</td>
      <td height="24">系统编号</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">2</td>
      <td height="24" align="center" valign="middle">username</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">用户名</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">3</td>
      <td height="24" align="center" valign="middle">atype</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">50</td>
      <td height="24">日志类型</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">4</td>
      <td height="24" align="center" valign="middle">alog</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">255</td>
      <td height="24">日志内容</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">5</td>
      <td height="24" align="center" valign="middle">atime</td>
      <td height="24" align="center" valign="middle">日期时间</td>
      <td height="24" align="center" valign="middle">&nbsp;</td>
      <td height="24">日志生成时间</td>
    </tr>
    <tr bgcolor='#EBF2F9'>
      <td height="24" align="center" valign="middle">6</td>
      <td height="24" align="center" valign="middle">aip</td>
      <td height="24" align="center" valign="middle">文本</td>
      <td height="24" align="center" valign="middle">100</td>
      <td height="24">操作IP地址</td>
    </tr>
  </tbody>
</table>
<p class="td1" >三、系统文件结构</p>
<object border="1px" type="text/x-scriptlet" data="目录.txt" width="80%" height="120px">
</object>
<p class="td1" >四、</p>
</body>
</html>
