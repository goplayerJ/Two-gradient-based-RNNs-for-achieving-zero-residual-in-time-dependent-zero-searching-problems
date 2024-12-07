function ac=AdaptiveCoefNonlinearEqsNo1(c,t,x)

    f=NonlinearEqsNo1(t,x);

    Jdfdx = Jacobiandfdx4x(t,x);

    D_f = Diff_dfdtNonlinearEqsNo1(t,x);

    ac=1*abs(f'*D_f)/norm(Jdfdx*f)^2;%c*abs(f'*D_f)/norm(Jdfdx*f)^2

end