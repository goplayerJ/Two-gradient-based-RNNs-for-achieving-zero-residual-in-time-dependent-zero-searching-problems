function f=NonlinearEqsNo1(t,x)
    f1=log(x(1))-1/(t+1);
    f2=x(1)*x(2)-exp(1/(t+1))*sin(t);
    f3=x(1)^2-sin(t)*x(2)+x(3)-2;
    f4=x(1)^2-x(2)^2+x(3)+x(4)-t;
    f=[f1; f2; f3; f4];
end