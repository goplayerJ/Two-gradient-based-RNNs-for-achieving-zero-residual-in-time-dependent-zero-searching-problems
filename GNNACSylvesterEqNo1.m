 %Sylvester方程赋值A,B,C后的理论解
function []=GNNACSylvesterEqNo1(tspan, interval)
    tspan2=tspan(1):interval:tspan(2);
    rx=Theoretical_xSylvesterEqNo1(tspan2);
    xstar11=rx(1,:);
    xstar12=rx(2,:);
    xstar21=rx(3,:);
    xstar22=rx(4,:);
    figure (1);subplot(2,2,1);plot(tspan2,xstar11,'r','LineWidth',1.5);hold on
    figure (1);subplot(2,2,2);plot(tspan2,xstar12,'r','LineWidth',1.5);hold on
    figure (1);subplot(2,2,3);plot(tspan2,xstar21,'r','LineWidth',1.5);hold on
    figure (1);subplot(2,2,4);plot(tspan2,xstar22,'r','LineWidth',1.5);hold on
    options=odeset();
    %用TGNN或者MGNN求解Sylvester方程的计算解
    for i=1:1    
        d=1:1;%d=4:7;    %d=1:8;给出8个任意初值，绘制8条曲线
        for j=1:length(d)
             x0=9*ones(4,1);%x0 = [d(j)/2 4-d(j) -8+d(j) -6+d(j)]';
            [T,X]=ode45(@GnnACRightHandSideSylvesterEqNo1,tspan,x0,options);%运行以power-sigmoid作为激励函数的MGNN模型
            %若运行不加激励函数的MGNN需要将函数GnnACRightHandSideSylvesterEqNo1的表达式变为output=-AdaptiveCoef*c1*P1(t).'*（P1(t)*x-d1(t)）
            %[T1,X1]=ode45(@GnnACRightHandSideSylvesterEqNo2,tspan,x0,options);%运行TGNN模型
           
            %[T2,X2]=ode45(@GnnACRightHandSideSylvesterEqNo3,tspan,x0,options);%运行以hyperbolic sine作为激励函数的MGNN模型
                       
            figure (1);subplot(2,2,1);plot(T,X(:,1),'b','LineStyle',':','LineWidth',2.5);hold on
            figure (1);subplot(2,2,2);plot(T,X(:,2),'b','LineStyle',':','LineWidth',2.5);hold on
            figure (1);subplot(2,2,3);plot(T,X(:,3),'b','LineStyle',':','LineWidth',2.5);hold on
            figure (1);subplot(2,2,4);plot(T,X(:,4),'b','LineStyle',':','LineWidth',2.5);hold on%绘制状态变量x11,x12,x21,x22
            
            clear nerr1;%清除变量neer1 
            %clear nerr2;%清除变量neer2
            %clear nerr3;%清除变量neer3
            
            for q=1:length(T)
                t=T(q);%将MGNN运行中的每一个时刻点提取出来
                A=A1(t);
                B=B1(t);
                %%C=C1(t2);%算出每一个时刻点的A,B,C
                x=[X(q,1) X(q,2);X(q,3) X(q,4)];%将算出来的计算解从列向量转成矩阵
                err1=A*x-B;%若为理论解err应为0，则将计算解带入Sylvester方程即可算出残差residual error
                nerr1(q)=norm(reshape(err1,4,1),'fro');%求MGNN残差的范数
            end
            
            %for g=1:length(T1)
                %t1=T1(g);
                %A=A1(t1);
                %B=B1(t1);
                %%C=C1(t1);
                %x1=[X1(g,1) X1(g,2);X1(g,3) X1(g,4)];
                %err2=A*x1-B;
                %nerr2(g)=norm(reshape(err2,4,1),'fro');%求TGNN残差的范数
            %end
           
            %for q=1:length(T2)
                %t2=T2(q);
                %A=A1(t2);
                %B=B1(t2);
                %%C=C1(t2);
                %x2=[X2(q,1) X2(q,3);X2(q,2) X2(q,4)];
                %err3=A*x2-B;
                %nerr3(q)=norm(reshape(err3,4,1),'fro');%求激励函数为hyperbolic sine的MGNN模型的残差范数
            %end
            figure(2); plot(T,nerr1,'b','LineWidth',1.5);hold on%绘制MGNN残差范数
            %figure(2); plot(T1,nerr2,'r');hold on%绘制TGNN残差范数
            %figure(2); plot(T2,nerr3,'r');hold on%绘制激励函数为hyperbolic sine的MGNN模型的残差范数
       end
   end
end