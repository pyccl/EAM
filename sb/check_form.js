
//alert('signzip2');
if (document.order.signzip2.value.length>0) 
{
	if ( !isInteger(document.order.signzip2.value) || document.order.signzip2.value.length != 12 ) {
		window.alert('请输入正确的MAC地址!!');
		document.order.signzip2.select();
		document.order.signzip2.focus();
        return false;
	}
}
else
{
	alert('请输入MAC地址!');
	return false;
}
//-->