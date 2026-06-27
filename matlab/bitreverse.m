function a=bitreverse(Nbit, num)
%Nbit = 4;
%num = 8;
a = 0;
b = bitshift(1,Nbit-1);
for i = 1:Nbit;
if((bitand(num,1)) == 1)
a = bitor(a,b);
end
num = bitshift(num,-1);
b = bitshift(b,-1);
end;