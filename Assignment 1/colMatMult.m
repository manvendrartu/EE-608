
%This is matrix multiplication program in which we use column vectors of
%one matrix and multiply it with other matrix one bye one.
%Written by Manvendra Singh
function[z,flops] = colMatMult(x,y)
flops=0;
z=zeros(size(x,1),size(y,2));
if (size(x,2)~=size(y,1))
    error('Invalid matrix selection');
else
    for j=1:size(y,2)
        for k=1:size(x,2)
            for i=1:size(x,1)
                flops =flops+2;
                z(i,j)=x(i,k)*y(k,j)+z(i,j);
                
            end
        end
    end
%     disp(' check')
%      check=norm(z-x*y)    
end
