%%%PROJECT 1 - PART 2 - ELENA DE TOLEDO HERNÁNDEZ
%SECTION 3.2 - PROBLEM 3
%Find the positive minimum point of the function f(x)=x^-2*tanx
%by computing the zeros of f' using Secant method.

clear
clc

f = @(x) x^-2 *tan(x);
% df1 = f' computed by hand to rearrange the function and avoid difference of
%two close numbers
df1 = @(x) -(2*tan(x)-x*(sec(x))^2)/(x^3);

%Because we have done the first part of this project before, we know that
%the zero's we are interested in lie between -0.5 and 0.5. We will use the
%interval -0.5, -0.01
lamda = 10; %Arbitrary number so that it enters the loop
int = [-1, -0.1];
N = 0; %number of the current iteration
tolerance = 10^-6; %Set the desired tolerance
newint = [0,0];
last = 0;
fprintf('\niteration# \ta    \tb   \txn+1    \tdf1(xn+1)   \tlamda    \tnew interval')
while (N<100)&&(lamda > tolerance)&&( sign(sym(df1(int(1))))~=sign(sym(df1(int(2)))) )
    
    
    N = N+1;
    x = int(2)- (df1(int(2))*(int(2)-int(1)) /df1(int(2))-df1(int(1)));
    
    lamda = abs(int(2)-int(1));
    
    if df1(x)== 0
        N = 100;
    end
    
    if sign(sym(df1(x)))<0
        newint= [int(1),x];
    else
        newint = [x,int(2)];
    end
    fprintf('\n%d \t%f \t%f \t%f \t%f \t%f \t[%f,%f]',N,int(1),int(2),x,df1(x),lamda,newint(1),newint(2));
    
    if abs(last-x) < 10^-6
        N = 100;
    end
    
    int = newint;
    last = x;
    
    
        
end

fprintf('\nThe minima of f(x) is %f which is obtained at %f',x,f(x))

