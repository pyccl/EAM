<!--#include file="UpLoad_Class.asp"-->
<%
if lcase(request.ServerVariables("REQUEST_METHOD"))="post" then
dim upload
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|png|gif"
upload.MaxSize = 2 * 1024 * 1024 '2M'
upload.GetData()
if upload.ErrorID>0 then 
	response.Write upload.Description
else
	dim file,savpath
	path=year(now()) & "/" & month(now()) & "/"
	savepath = "/images/img/" & path
	set file = upload.files("file1")
	if file.isfile then
		result = file.saveToFile(savepath,0,true)
		if result then
			msg = savepath & file.filename
		else
			msg = file.Exception
		end if
	end if
end if
set upload = nothing
%>
<script>window.parent.backfn.apply(this,["<%=msg%>"]);</script>
<%else%>
<form action="upload.asp" method="post" enctype="multipart/form-data" target="upload" id="upfrm"> 
<center>请选择图片文件<br><br><input type="file" name="file1" onchange="verificationPicFile(this)"/><br><br><input type="submit" value="上传" /></center>
</form>
<%end if%>
<script type="text/javascript">
            //图片类型验证
            function verificationPicFile(file) {
                var fileTypes = [".jpg", ".jpeg", ".png" , ".gif"];
                var filePath = file.value;
                //当括号里面的值为0、空字符、false 、null 、undefined的时候就相当于false
                if(filePath){
                    var isNext = false;
                    var fileEnd = filePath.substring(filePath.indexOf("."));
                    for (var i = 0; i < fileTypes.length; i++) {
                        if (fileTypes[i] == fileEnd) {
                            isNext = true;
                            break;
                        }
                    }
                    if (!isNext){
                        alert('仅支持.jpg，.jpeg，.png，.gif格式的图片！');
                        file.value = "";
						document.getElementById("Submit").disabled=true;
                        return false;
                    }
                }else {
                    return false;
                }
                 var fileSize = 0;
                var fileMaxSize = 1024;//1M
                var filePath = file.value;
                if(filePath){
                    fileSize =file.files[0].size;
                    var size = fileSize / 2048;
                    if (size > fileMaxSize) {
                        alert("图片大小不能大于2M！");
                        file.value = "";
						document.getElementById("Submit").disabled=true;
                        return false;
                    }else if (size <= 0) {
                        alert("图片大小不能为0M！");
                        file.value = "";
						document.getElementById("Submit").disabled=true;
                        return false;
                    }
                }else{
                    return false;
                }
  var filePath = file.value;
  if(filePath){
      //读取图片数据
      var filePic = file.files[0];
      var reader = new FileReader();
      reader.onload = function (e) {
          var data = e.target.result;
          //加载图片获取图片真实宽度和高度
          var image = new Image();
          image.onload=function(){
              var width = image.width;
              var height = image.height;
              if (width >= 200 & height >= 200){
				  bh=document.getElementById("bh").value;
                  alert("图片符合要求！请点击上传按钮上传！");
				  document.getElementById("Submit").disabled=false;
              }else {
                  alert("图片尺寸应大于：200px*200px！");
                  file.value = "";
				  document.getElementById("Submit").disabled=true;
                  return false;
              }
          };
          image.src= data;
      };
      reader.readAsDataURL(filePic);
  }else{
      return false;
  }
}
</script>