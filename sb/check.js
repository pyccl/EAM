function chk(){

	/************************************************************************/
	if (document.post.user_id.value==""){
	alert('登录ID是必须填写的!');
	document.post.user_id.focus();
	return false;
	}


	/************************************************************************/
	if (document.post.user_pw1.value==""){
	alert('密码是必须填写的! ！');
	document.post.user_pw1.focus();
	return false;
	}
	
	if (document.post.user_pw2.value==""){
	alert('请确认密码! ！');
	document.post.user_pw2.focus();
	return false;
	}
	
	if (document.post.user_pw1.value!=document.post.user_pw2.value){
		alert('两次输入的密码不一样！');
		document.post.user_pw1.focus();
		return false;
		}


	/************************************************************************/

	var name=document.post.user_name.value
	if (document.post.user_name.value==""){
	alert('请填写真实性名！');
	document.post.user_name.focus();
	return false;
	}

	for(i=0;i<=name.length;i++){
		if ((name.substring(i,(i+1))=="1")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="2")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="3")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="4")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="5")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="6")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="7")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="8")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="9")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="0")){
			alert('含有非法数字！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="/")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==".")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="~")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="`")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="'")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==";")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==",")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="!")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="@")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="$")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="%")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="&")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==" ")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="　")){
			alert('含有非法字符！请重新输入！');
			document.post.user_name.focus();
			return false;		
		}
	}

}