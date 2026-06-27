clear all
clear
clc

N=100;
i=0.1:0.1:10;
x=sin(i);
subplot(2,2,1);
plot(x);
for j=1:1:N
    %c = sum(x.*cos(2*pi/N*10*i*j));
    c(j) = sqrt(2/N)*sum(x.*cos(pi/N*(10*i+0.5)*j));
    %fprintf('%.4f   %.4fi\n',c,s);
end

rf=dct(x);
subplot(2,2,2)
plot(c);
subplot(2,2,3)
plot(abs(c));
subplot(2,2,4)
plot(abs(rf));

%fprintf('Standard FFT:\n');
%rf'
max(abs(rf))
max(abs(c))