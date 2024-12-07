function output=MGNNcequ6(t,x)
    c=6;c1=1;
    AdaptiveCoef=AdaptiveCoefSylvesterEqNo1(c,t,x);
    output=-AdaptiveCoef*c1*P1(t).'*(P1(t)*x-d1(t));
end