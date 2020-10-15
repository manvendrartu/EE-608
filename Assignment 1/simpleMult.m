
%Written by Manvendra Singh
function [z,flops1] = simpleMult(x,y)
flops1=0;
n=0;
z=zeros(size(x,1),size(y,2));
if (size(x,2)~=size(y,1))
    error('invalid matrix selection');
    
else
    for i=1:size(x,1)
        for j=1:size(y,2)
            [z(i,j),flops]=simpleDot(x(i,:),y(:,j));
            flops1= flops1+flops; 
       end
    end
    disp(' check')
     check=norm(z-x*y)
end
