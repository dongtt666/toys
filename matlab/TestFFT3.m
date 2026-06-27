clear all
clear
clc

N=100;
i=0.1:0.1:10;
x=sin(i);
subplot(2,2,1);
plot(x);

for j=1:1:100
    s = sum(x.*sin(-2*pi/N*10*i*j));
    c = sum(x.*cos(2*pi/N*10*i*j));
    %fprintf('%.4f   %.4fi\n',c,s);
    r(j)=sqrt(s*s+c*c);
end

rf=fft(x);
subplot(2,2,2)
plot(rf);
subplot(2,2,3)
plot(r);
subplot(2,2,4)
plot(abs(rf));

%fprintf('Standard FFT:\n');
%rf'
max(abs(rf))
max(r)