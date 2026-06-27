from socket import *
serverName = '127.0.0.1'
serverPort = 9000
clientSocket = socket(AF_INET,SOCK_DGRAM)
msg = raw_input('Input lowercase sentences:')
clientSocket.sendto(msg,(serverName,serverPort))
modifiedMsg,serverAddress = clientSocket.recvfrom(2048)
print modifiedMsg
clientSocket.close()
