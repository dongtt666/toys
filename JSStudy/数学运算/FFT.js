<script language=javascript>
//快速傅里叶变换
//由2005年编写的圆周率计算程序中提取
//2103.12,许剑伟于莆田
Number.prototype.toFixed=function(m){ //IE6.0的toFixed()有Bug,所以重写
  var n=this, f='', p=Math.pow(10,m); //p为10进制移位量;
  if(n<0) n = -n, f = '-';   //把负数转为正数
  var a=Math.floor(n),b=n-a; //分离整数与小数
  b = Math.round(b*p );      //移位并四舍五入
  if(b>=p) a++,b-=p;         //进位
  if(m) b = '.'+(p+b+'').substr(1,m); //小数部分左边补0
  else b = '';
  return f+a+b;
};

var Ha=[];
var Hb=[];
function fc1(k,N2,m){//m单元与m+N/2单元进行正向蝶形计算(复数计算),N2序列长度的一半,k与N2用于计算W(N,K)
  var Wr,Wi,cr,ci,s;
  var n = m+N2;
  s = Math.PI*k/N2;
  Wr = Math.cos(s);  Wi = Math.sin(s); //得到W(N,k)
  cr = Ha[n]*Wr-Hb[n]*Wi;
  ci = Ha[n]*Wi+Hb[n]*Wr;
  Ha[n] = Ha[m]-cr;  Hb[n] = Hb[m]-ci;
  Ha[m] = Ha[m]+cr;  Hb[m] = Hb[m]+ci;
}
function fc2(k,N2,m){//m单元与m+N/2单元进行反向蝶形计算(复数计算),N2序列长度的一半,k与N2用于计算W(N,K)
  var Wr,Wi,cr,ci,s;
  var n = m+N2;
  s = -Math.PI*k/N2;
  Wr=Math.cos(s);  Wi = Math.sin(s); //得到W(N,k)
  cr = Ha[m]-Ha[n];
  ci = Hb[m]-Hb[n];
  Ha[m] = Ha[m]+Ha[n]; Hb[m] = Hb[m]+Hb[n];
  Ha[n] = cr*Wr-ci*Wi; Hb[n] = cr*Wi+ci*Wr;
}

function rev(n,B){ //倒序
var i,k=0,m=0;
while(B>2){ B>>=1, k++; }
for(i=0;i<=k;i++){
   m += (n&1)<<(k-i);
   n >>= 1;
}
return m;
}
function FFT(B){ //FFT正换
var i,j,m,c;
for(i=0;i<B;i++){ //输入数组做倒序处理
  j = rev(i,B);
  if(j<=i) continue;
  c=Ha[i],Ha[i]=Ha[j],Ha[j]=c;
  c=Hb[i],Hb[i]=Hb[j],Hb[j]=c;
}
for(m=1;m<B;m+=m) //fft正变换
   for(i=0;i<B;i+=m+m)
     for(j=0;j<m;j++)
       fc1(j,m,i+j);
}
function iFFT(B){ //FFT反变换
var i,j,m,c;
for(m=B/2;m>=1;m/=2) //fft反变换
   for(i=0;i<B;i+=m+m)
     for(j=0;j<m;j++)
       fc2(j,m,i+j);
for(i=0;i<B;i++){ //输出数组做倒序处理
  j = rev(i,B);
  if(j<=i) continue;
  c=Ha[i],Ha[i]=Ha[j],Ha[j]=c;
  c=Hb[i],Hb[i]=Hb[j],Hb[j]=c;
}
for(i=0;i<B;i++) Ha[i]/=B,Hb[i]/=B;
}

//*****测试**********
var B=8;//序列长度,须是2的N次方
for(i=0;i<B;i++){
  c =i/B*2*Math.PI;
  Ha[i]=Math.cos(c);
if(i<B/2) Ha[i]=1;else Ha[i]=0;
  Hb[i]=0;
}
//alert(Ha);
FFT(B);
//iFFT(B);
for(i=0;i<B;i++){
Ha[i]=Ha[i].toFixed(9);
Hb[i]=Hb[i].toFixed(9);
}
document.write(Ha+'<br>'+Hb);



</script>