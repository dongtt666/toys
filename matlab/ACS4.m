%%------------ 增加开环极点 根轨迹右移 系统变不稳定
% 增加的极点越靠近原点，根轨迹右移或弯曲越明显
num=[1];
den = conv([1 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1];
den = conv([1 1],conv([1 0],[1 2]));
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1];
den = conv([1 4],conv([1 0],[1 2]));
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

figure;
num=[1];
den = conv([1 0 0],[1 2]);
G=tf(num,den);
rlocus(G);
xlabel('Re');
ylabel('Im');

% figure;
% num=[1];
% den = conv([1 3],conv([1 1],conv([1 0],[1 2])));
% G=tf(num,den);
% rlocus(G);
% xlabel('Re');
% ylabel('Im');
