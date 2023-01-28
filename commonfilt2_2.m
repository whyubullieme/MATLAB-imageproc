
function [y]=commonfilt2_2(x,N)
y=x;
k=floor(N/2);%中心点旁边对称点的数目
[m,n]=size(x);
for i=k+1:m-k
    for j=k+1:n-k
        z=x(i-k:i+k,j-k:j+k);
        y(i,j)=median(z(:));
    end
end
