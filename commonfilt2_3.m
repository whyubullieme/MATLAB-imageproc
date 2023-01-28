function [y]=commonfilt2_3(x,N)
y=x;
k=floor(N/2);%中心点旁边对称点的数目
[m,n]=size(x);
for i=k+1:m-k
    for j=k+1:n-k
        z=x(i-k:i+k,j-k:j+k);
        zmin=min(z(:));
        zmax=max(z(:));
        zmed=median(z(:));
        if  x(i,j) == zmin | x(i,j) == zmax
           y(i,j) = zmed;
        end
        %中心灰度值介于最大值最小值之间，则不变
    end
end
