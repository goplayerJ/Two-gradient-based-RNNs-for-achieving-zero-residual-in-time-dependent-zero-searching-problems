%MGNN采用power-sigmoid作为激励函数
function output=GnnACRightHandSideSylvesterEqNo1(t,x)
    c=1;c1=5;
    AdaptiveCoef=AdaptiveCoefSylvesterEqNo1(c,t,x);
    X=(reshape(x,2,2))';
    AA1=A1(t);
    dotAA1=dotA1(t);
    rB1=B1(t);
    k=exp(2*t)+0.5;
    db=dotB1(t);
%     kronA1=kron((A1(t)*A1(t)')',eye(2))
%     rB1=reshape(B1(t),4,1)
%     output=-AdaptiveCoef*c1*P1(t).'*AFMpowersigmoid(P1(t)*x-d1(t));%若采用不加激励函数的MGNN--output=-AdaptiveCoef*c1*P1(t).'*(P1(t)*x-d1(t));
%     output11=-k*AdaptiveCoef*1*(AA1)'*(AA1*X-rB1);%不加激励函数的MGRNN
%     output11=-AdaptiveCoef*c1*(AA1)'*AFMpowersigmoid(AA1*X-rB1);%采用power-sigmoid作为激励函数的MGRNN
%%%%
% output11=-c1*(AA1)'*(AA1*X-rB1);%gnn
% output11=AA1^(-1)*(db-dotAA1*X-c1*(AA1*X-rB1));%ZNN
output11=AA1^(-1)*(db-dotAA1*X-c1*AA1*AA1'*(AA1*X-rB1));%MZNN
    output=reshape(output11',4,1);
    t
end