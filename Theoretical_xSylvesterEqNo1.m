%赋值A,B,C后的Sylvester方程的理论解
function rx=Theoretical_xSylvesterEqNo1(t)
%     rx1=exp(tspan);
%     rx2=-exp(-tspan);
%     rx3=exp(-tspan);
%     rx4=exp(tspan);
    rx1=1+sin(t);
    rx2=-2*cos(t);
    rx3=cos(t);
    rx4=1+2*sin(t);
    rx=[rx1; rx2; rx3; rx4];
end