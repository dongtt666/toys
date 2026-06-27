def TestUrlOpen2():
  import urllib
  page = urllib.urlopen("http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=")
  lines = page.readlines()
  page.close()
  document = ""
  for line in lines :
    document = document + line.decode('utf-8')
    print line

##  from xml.dom.minidom import parseString
##  dom =parseString(document)
##  strings = dom.getElementsByTagName("string")
##  print (strings[6].childNodes[0].data + " " + strings[7].childNodes[0].data)

TestUrlOpen2()
