def TestUrlOpen():
  import urllib
  page = urllib.urlopen("http://211.66.136.32/webservice/WebService1.asmx/HelloWorld")
  lines = page.readlines()
  page.close()
  document = ""
  for line in lines :
    document = document + line.decode('utf-8')

  from xml.dom.minidom import parseString
  dom =parseString(document)
  strings = dom.getElementsByTagName("double")
  print strings[0].childNodes[0].data
  print strings[0].getAttribute("xmlns")
