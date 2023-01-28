function [y]=commonfilt2_4(x,N)
[m,n]=size(x);
y=x;
k=floor(N/2);%中心点旁边对称点的数目
%按照文献取参数
a=5;b=7;
TA=20;TB=4;

for i=k+1:m-k
    for j=k+1:n-k
        z=x(i-k:i+k,j-k:j+k);
        z1=z(1:end);%将矩阵z转化为列向量
        z1=sort(z1);%对列向量z1排序，从小到大,1:N^2
        zmin=min(z(:));
        zmax=max(z(:));
        zmed=median(z(:));
        %若中心点处于最小值 最大值之间，则灰度值不变
        %若中心点等于最小值，即疑似噪声点
        if x(i,j) == zmin
            if z1(1,1+a)-x(i,j) >= TA
               y(i,j) = zmed;
            else
               if abs( z1(1,1+b)-z1(1,N^2-b) )<= TB %平坦区
                  y(i,j) = zmed;
                %否则的话则为边缘细节区，灰度值不变
               end
            end
        end
       %若中心点等于最大值，即疑似噪声点
       if x(i,j) == zmax
            if x(i,j)-z1(1,N^2-a) >= TA
               y(i,j) = zmed;
            else
               if abs( z1(1,1+b)-z1(1,N^2-b) )<= TB %平坦区
                  y(i,j) = zmed;
                %否则的话则为边缘细节区，灰度值不变
               end
           end
       end
    end
end
