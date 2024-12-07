function D_f = Diff_dfdtNonlinearEqsNo1(t,x)
    syms u
    f=NonlinearEqsNo1(u,x);
    D_f=diff(f);
    u=t;
    D_f=eval(D_f);
end