function Jdfdx = Jacobiandfdx4x(t,x)
    if length(x)<=1
        Jdfdx=1;
    else
        syms ut
        n=length(x);    
        ux = sym('ux',[1 n]); 
        f=NonlinearEqsNo1(ut,ux);
        J=jacobian(f,ux);
        ut=t;
        ux1=x(1);
        ux2=x(2);
        ux3=x(3);
        ux4=x(4);
        Jdfdx=eval(J);
    end
end