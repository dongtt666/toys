[x1,Fs,bits]=wavread('phone.wav');
sound(x1,Fs,bits);%播放声音
figure(1);
subplot(211);
plot(x1); %做原始语音信号的时域图形
title('原始语音信号');
xlabel('时间 n');
ylabel('音量 n');
y1=fft(x1); %做length(x1)点的FFT
y1=fftshift(y1);%平移，是频率中心为0
derta_Fs = Fs/length(x1);%设置频谱的间隔，分辨率 。
subplot(212);
plot([-Fs/2:derta_Fs: Fs/2-derta_Fs],abs(y1));%画出原始语音信号的频谱图，这里保证了x轴的点数必须和y轴点数一致
title('原始语音信号的频谱');
grid on;