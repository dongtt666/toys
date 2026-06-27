%%------------ 增加左复平面开环零点 根轨迹左移 系统变稳定
% 增加的零点越靠近虚轴，根轨迹左移越明显
num=[1];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1 2];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1 1];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1 0.5];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1 0.1];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');