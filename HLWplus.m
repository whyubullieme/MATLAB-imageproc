img=imread('5g.png');
img=rgb2gray(img);
subplot(331),imshow(img);%title('灰度化后图像');
F=fftshift(fft2(img));
subplot(332),imshow(log(abs(F)+1),[]);%title('频域图像');
[M,N]=size(F);
subplot(333),plot(abs(F(:,round(N/2))));%title('中心竖直线上频谱');
subplot(334),plot(abs(F(:,round(M/2))));%title('中心水平线上频谱');
u=0:M-1;v=0:N-1;
[V,U]=meshgrid(v,u);
D0=12;
n=3;
u0=196;u1=207;
D1=abs(U-u0);
D2=abs(U-u1);
H=1./(1+(D0^2./(D1.*D2)).^n);
G=F.*H;
v0=120;v1=180;
D1=abs(V-v0);
D2=abs(V-v1);
H=1./(1+(100^2./(D1.*D2)).^n);
G=G.*H;
subplot(335),imshow(abs(H),[]);%title('滤波器图像表示');
subplot(336),mesh(H);%title('滤波器透视图');
subplot(337),imshow(log(abs(G)+1),[]);%title('滤波后的频域图像');
g=real(ifft2(ifftshift(G)));
g1= commonfilt2_4(g,5);
g1= commonfilt2_4(g1,5);
g1= commonfilt2_4(g1,5);
g1= commonfilt2_4(g1,5);
g1= commonfilt2_4(g1,5);
subplot(338),imshow(g,[]);%title('滤波图像');
%subplot(339),imshow(g1,[]),title('滤波图像');
%SM1 = sum(g1(:));
SM = sum(g(:));%记录灰度值