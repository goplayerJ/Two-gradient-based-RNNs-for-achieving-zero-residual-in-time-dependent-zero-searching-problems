%TGNNÄ£ÐÍ
function output2=GnnACRightHandSideSylvesterEqNo2(t,x)
    c2=1;
    X=(reshape(x,2,2))';
    AA1=A1(t);
    dotAA1=dotA1(t);
    rB1=B1(t);
% dotAA1=dotA1(t);
%     kronA1=[AA1(1,1),0,AA1(1,2),0;AA1(2,1),0,AA1(2,2),0;0,AA1(1,1),0,AA1(1,2);0,AA1(2,1),0,AA1(2,2)];
%     kronA1=[A1(t),zeros(2,2);zeros(2,2),A1(t)];
%     kronA1=kron((A1(t)*A1(t)')',eye(2))
%     rB1=reshape(B1(t),4,1)
    output21=-c2*(AA1)'*(AA1*X-rB1);
    output2=reshape(output21',4,1);
    t
end