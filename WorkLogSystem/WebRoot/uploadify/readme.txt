uploader ： uploadify.swf 文件的相对路径，该swf文件是一个带有文字BROWSE的按钮，点击后淡出打开文件对话框，默认值：uploadify.swf。 
script ：   后台处理程序的相对路径 。默认值：uploadify.php 
checkScript ：用来判断上传选择的文件在服务器是否存在的后台处理程序的相对路径 
fileDataName ：设置一个名字，在服务器处理程序中根据该名字来取上传文件的数据。默认为Filedata 
method ： 提交方式Post 或Get 默认为Post 
scriptAccess ：flash脚本文件的访问模式，如果在本地测试设置为always，默认值：sameDomain  
folder ：  上传文件存放的目录 。 
queueID ： 文件队列的ID，该ID与存放文件队列的div的ID一致。 
queueSizeLimit ： 当允许多文件生成时，设置选择文件的个数，默认值：999 。 
multi ： 设置为true时可以上传多个文件。 
auto ： 设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传 。 
fileDesc ： 这个属性值必须设置fileExt属性后才有效，用来设置选择文件对话框中的提示文本，如设置fileDesc为“请选择rar doc pdf文件”，打开文件选择框效果如下图：

2010-01-05_220920

fileExt ： 设置可以选择的文件的类型，格式如：'*.doc;*.pdf;*.rar' 。 
sizeLimit ： 上传文件的大小限制 。 
simUploadLimit ： 允许同时上传的个数 默认值：1 。 
buttonText ： 浏览按钮的文本，默认值：BROWSE 。 
buttonImg ： 浏览按钮的图片的路径 。 
hideButton ： 设置为true则隐藏浏览按钮的图片 。 
rollover ： 值为true和false，设置为true时当鼠标移到浏览按钮上时有反转效果。 
width ： 设置浏览按钮的宽度 ，默认值：110。 
height ： 设置浏览按钮的高度 ，默认值：30。 
wmode ： 设置该项为transparent 可以使浏览按钮的flash背景文件透明，并且flash文件会被置为页面的最高层。 默认值：opaque 。 
cancelImg ：选择文件到文件队列中后的每一个文件上的关闭按钮图标，如下图：

2010-01-05_220626

上面介绍的key值的value都为字符串或是布尔类型，比较简单，接下来要介绍的key值的value为一个函数，可以在选择文件、出错或其他一些操作的时候返回一些信息给用户。

onInit : 做一些初始化的工作。

onSelect ：选择文件时触发，该函数有三个参数

event:事件对象。
queueID：文件的唯一标识，由6为随机字符组成。
fileObj：选择的文件对象，有name、size、creationDate、modificationDate、type 5个属性。