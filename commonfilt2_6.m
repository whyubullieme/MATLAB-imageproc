function [y]=commonfilt2_6(x,N)
y=x;
k=floor(N/2);%中心点旁边对称点的数目
[m,n]=size(x);
for i=k+1:m-k
    for j=k+1:n-k
        %z=x(i-k:i+k,j-k:j+k);
        %y(i,j)=median(z(:));
        z1=zeros(1,2*k+1);
        z2=zeros(1,2*k+1);
        z3=zeros(1,2*k+1);
        z4=zeros(1,2*k+1);
        k1=1;k2=1;k3=1;k4=1;
        %垂直方向上
        for i1=i;
            for j1=j-k:j+k
                z1(1,k1) = x(i1,j1);
                k1=k1+1;
            end
        end
        %水平方向上
        for j1=j;
            for i1=i-k:i+k
                z2(1,k2) = x(i1,j1);
                k2=k2+1;
            end
        end
        %45°方向
        for i1=-k:k
            z3(1,k3) = x(i+i1,j+i1);
            k3=k3+1;
        end
        %135°方向
        for i1=-k:k
            z3(1,k4) = x(i+i1,j-i1);
            k4=k4+1;
        end
        %求各个矩阵的中值
        zmed1=median(z1);%垂直方向
        zmed2=median(z2);%水平方向
        zmed3=median(z3);%45°方向
        zmed4=median(z4);%135°方向
        y(i,j)=median( [median( [x(i,j),zmed2,zmed1 ]),median( [x(i,j),zmed3,zmed4 ]),x(i,j) ]);
    end
end
