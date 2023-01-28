function [y]=commonfilt2_1(x,N)
y=x;
k=floor(N/2);%中心点旁边对称点的数目
k0=floor( (N*N)/2 )+1;
[m,n]=size(x);

for i=k+1:m-k
    for j=k+1:n-k
        z=x(i-k:i+k,j-k:j+k);
        z1=z(1:end);%矩阵z转化为行向量z1
        %a*a个数冒泡排序法
        for i1=1:1:(N^2-1)
            for j1=1:1:(N^2-i1)
                if z1(1,j1) > z1(1,j1+1)
                    z0=z1(1,j1);
                    z1(1,j1)=z1(1,j1+1);
                    z1(1,j1+1)=z0;
                end
            end
        end
        y(i,j)=z1(1,k0);%z1中的中值
    end
end
