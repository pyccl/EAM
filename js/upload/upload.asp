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
<center>��ѡ��ͼƬ�ļ�<br><br><input type="file" name="file1" onchange="verificationPicFile(this)"/><br><br><input type="submit" value="�ϴ�" /></center>
</form>
<%end if%>
<script type="text/javascript">
            //ͼƬ������֤
            function verificationPicFile(file) {
                var fileTypes = [".jpg", ".jpeg", ".png" , ".gif"];
                var filePath = file.value;
                //�����������ֵΪ0�����ַ���false ��null ��undefined��ʱ����൱��false
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
                        alert('��֧��.jpg��.jpeg��.png��.gif��ʽ��ͼƬ��');
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
                        alert("ͼƬ��С���ܴ���2M��");
                        file.value = "";
						document.getElementById("Submit").disabled=true;
                        return false;
                    }else if (size <= 0) {
                        alert("ͼƬ��С����Ϊ0M��");
                        file.value = "";
						document.getElementById("Submit").disabled=true;
                        return false;
                    }
                }else{
                    return false;
                }
  var filePath = file.value;
  if(filePath){
      //��ȡͼƬ����
      var filePic = file.files[0];
      var reader = new FileReader();
      reader.onload = function (e) {
          var data = e.target.result;
          //����ͼƬ��ȡͼƬ��ʵ��Ⱥ͸߶�
          var image = new Image();
          image.onload=function(){
              var width = image.width;
              var height = image.height;
              if (width >= 200 & height >= 200){
				  bh=document.getElementById("bh").value;
                  alert("ͼƬ����Ҫ�������ϴ���ť�ϴ���");
				  document.getElementById("Submit").disabled=false;
              }else {
                  alert("ͼƬ�ߴ�Ӧ���ڣ�200px*200px��");
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