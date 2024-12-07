%激励函数为hyperbolic的MGNN模型
function output=GnnACRightHandSideSylvesterEqNo3(t,x)%function output=GnnACRightHandSideSylvesterEqNo1(t,x)---采用power-sigmoid作为激励函数的MGNN模型--
%function output=GnnACRightHandSideSylvesterEqNo2(t,x)--TGNN模型
    c=6;c1=1;
    AdaptiveCoef=AdaptiveCoefSylvesterEqNo1(c,t,x);
    X=(reshape(x,2,2))';
    AA1=A1(t);
    dotAA1=dotA1(t);
    rB1=B1(t);
    %output=-AdaptiveCoef*c1*A1(t).'*AFMhyperbolic(A1(t)*x-B1(t));%output=-AdaptiveCoef*c1*A1(t).'*A1(t)*x-B1(t);--MGNN模型
    output11=-AdaptiveCoef*c1*(AA1)'*AFMhyperbolic(AA1*X-rB1);%采用hyperbolic作为激励函数的MGRNN
    output=reshape(output11',4,1);
    t
end