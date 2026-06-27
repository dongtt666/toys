% 负反馈系统：Gp(s)=1/(s^2+2s+4)  H(s)=1/(s+1)
% 判断系统稳定性
% feedback() roots() eig() or series() parallel()
Gp=tf([1],[1 2 4]);
H=tf(1,[1 1]);
G=feedback(Gp,H);
p=eig(G)
%plot(p);

%闭环特征多项式 D(s)=s^4+3s^3+3s^2+2s+3 判断其稳定性
den=[1 3 3 2 3];
p=roots(den)
%plot(p);