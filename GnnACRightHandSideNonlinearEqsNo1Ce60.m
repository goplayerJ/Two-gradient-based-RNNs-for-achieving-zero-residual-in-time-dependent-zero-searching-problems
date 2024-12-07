function output=GnnACRightHandSideNonlinearEqsNo1Ce60(t,x)
    a=20;
    Jdfdx = Jacobiandfdx4x(t,x);
    f=NonlinearEqsNo1(t,x);
    df=Diff_dfdtNonlinearEqsNo1(t,x);
    c=exp(t/a)+a;
    AdaptiveCoef=AdaptiveCoefNonlinearEqsNo1(1,t,x);
    output=-20*AdaptiveCoef*Jdfdx*f;%AFMbcfunction(f);
%     output=-20*Jdfdx'*f;%gnn
%     output=Jdfdx^(-1)*(-c*Jdfdx*Jdfdx'*f-df);%mgnn1

    t
end