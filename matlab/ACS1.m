%G1(s) = 1/(2s+1)
%G2(s) = 25/(s^2+3s+25)
%求在阶跃函数和脉冲函数作用下的输出响应
% step() impulse() or lsim()

%G1(s) = 1/(2s+1)
num1=[1];
den1=[2 1];
G1=tf(num1,den1);
%G2(s) = 25/(s^2+3s+25)
num2=[25];
den2=[1 3 25];
G2=tf(num2,den2);
% plot the figure for G1(s)
figure(1);
subplot(2,1,1);
step(G1);
xlabel('时间(sec)');
ylabel('输出响应');
title('一阶系统单位阶跃响应');

subplot(2,1,2);
impulse(G1);
xlabel('时间(sec)');
ylabel('输出响应');
title('一阶系统单位阶跃响应');

% plot the figure for G2(s)
figure(2);
subplot(2,1,1);
step(G2);
xlabel('时间(sec)');
ylabel('输出响应');
title('二阶系统单位阶跃响应');

subplot(2,1,2);
impulse(G2);
xlabel('时间(sec)');
ylabel('输出响应');
title('二阶系统单位阶跃响应');