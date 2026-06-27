from socket import *
serverPort = 9000
serverSocket = socket(AF_INET,SOCK_DGRAM)
serverSocket.bind(('127.0.0.1',serverPort))
print "The server is ready to receive..."
while True:
    msg,clientAddress = serverSocket.recvfrom(2048)
    print msg
    modifiedMsg = msg.upper()
    serverSocket.sendto(modifiedMsg,clientAddress)

serverSocket.close()
