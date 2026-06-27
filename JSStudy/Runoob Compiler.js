//Map Table
--------------------------------------
    runcode        Compiler        
      0            "python2"        
	  1            "ruby"        
      3            "php"        
	  4            "Node"        
	  5            "Scala"        
	  6            "go"        
	  7            "c/cpp"        
      8            "java"        
      9            "VB.NET"        
	  10           "c#"        
      11           "bash"        
	  12           "object-c"        
      14           "perl"        
      15           "python3"        
	  16           "swift"        
      17           "Lua"        
      18           "Pascal"        
--------------------------------------

//Grneral:
Request URL:https://tool.runoob.com/compile.php
Request Method:POST
Status Code:200 OK
Remote Address:121.40.20.157:443

//Request Headers:
POST /compile.php HTTP/1.1
Host: tool.runoob.com
Connection: keep-alive
Content-Length: 149
//Accept: */*//
Origin: https://c.runoob.com
User-Agent: Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
Referer: https://c.runoob.com/compile/12
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.8

//Response Headers
Connection:close
Content-Type:application/json
Date:Thu, 06 Apr 2017 06:53:15 GMT
Server:Tengine/1.3.0
Transfer-Encoding:chunked
X-Powered-By:PHP/5.5.9-1ubuntu4.11

//Response:
{"output":"Hello World",
"langid":"7",
"code":"#include <iostream>\nusing namespace std;\n\nint main()\n{\n   cout << \"Hello World\";\n   return 0;\n}",
"errors":"",
"time":" .42\n"
}


//Necessary Header:
Origin:https://c.runoob.com
Referer:https://c.runoob.com/compile/12

//https

//Format
POST "https://tool.runoob.com/compile.php",
{code:code,language:runcode}

eg. code:"#include <iostream>\nusing namespace std;\n\nint main()\n{\n   cout << \"Hello World\";\n   return 0;\n}"
$.post("https://tool.runoob.com/compile.php",{
	code:"#include <iostream>\nusing namespace std;\n\nint main()\n{\n   cout << \"Hello World\";\n   return 0;\n}",
	language:7
},function(data,status){
	alert("数据: \n" + data.output + "\n状态: " + status);
});


btn.click(function() {
	code = editor.getValue();
	runcode = 0;
	$.post("https://tool.runoob.com/compile.php",{code:code,language:runcode},function(data){
		if(runcode==18) {
			data.output = data.output.replace("Free Pascal Compiler version 2.6.2-8 [2014/01/22] for x86_64\nCopyright (c) 1993-2012 by Florian Klaempfl and others\n", "");
			data.errors = data.errors.replace("/usr/bin/ld.bfd: warning: /usercode/link.res contains output sections; did you forget -T?\n", "");
		}
		$("#compiler-textarea-result").val(data.output + data.errors);
	});
});
	  
	  
	  

	  