%---------------------------------------------------------initial condition
function []=GNNACNonlinearEqsNo1(tspan, interval)
    tspan0=tspan(1):interval:tspan(2);
    Theoretical_x=Theoretical_xNonlinearEqsNo1(tspan0);
    Theoretical_x_1=Theoretical_x(:,1);
    Theoretical_x_2=Theoretical_x(:,2);
    Theoretical_x_3=Theoretical_x(:,3);
    Theoretical_x_4=Theoretical_x(:,4);
    figure (1);
    subplot(2,2,1);
    plot(tspan0,Theoretical_x_1,'b-','LineWidth',1.5);
%     text(0.1,2.85,'x1');
%     text(9.5,1.25,'t');
%     axis([0 10 1 3]);
    hold on;
    subplot(2,2,2);
    plot(tspan0,Theoretical_x_2,'b-','LineWidth',1.5);
%     text(0.1,3.5,'x1');
%     text(9.5,-1.2,'t');
%     axis([0 10 -2 4]);
    hold on;
    subplot(2,2,3);
    plot(tspan0,Theoretical_x_3,'b-','LineWidth',1.5);
%     text(0.1,3.8,'x1');
%     text(9.5,-8,'t');
%     axis([0 10 -10 5]);
    hold on;
    subplot(2,2,4);
    plot(tspan0,Theoretical_x_4,'b-','LineWidth',1.5);
%     text(0.1,8.8,'x1');
%     text(9.5,-3,'t');
%     axis([0 10 -5 10]);
    hold on;    
%                 
%     figure(2); 
%     text(0.1,4.65,'x1');
%     text(9.5,0.8,'t');
%     axis([0 10 0 5]);
%     hold on 
% 
%     figure(3);
%     text(0.1,2.85,'x1');
%     text(9.5,1.25,'t');
%     axis([0 10 0 5]);
%     hold on
%     
%     figure(4);
%     text(0.1,2.85,'x1');
%     text(9.5,1.25,'t');
%     axis([0 10 0 8]);
%     hold on    
    
    options=odeset();

    for i=1:1
%         d=0:0;
        for j=1:length(i)
            x0 =1*ones(1,4);% [1+d(j)/6; (2+d(j))/3; -5+d(j)/2; -d(j)/3]'
%             [Calc_tCe30,Calc_xCe30]=ode45(@GnnACRightHandSideNonlinearEqsNo1Ce30,tspan0,x0,options);
            [Calc_tCe60,Calc_xCe60]=ode45(@GnnACRightHandSideNonlinearEqsNo1Ce60,tspan0,x0,options);
%             [Calc_tGAMMAe60,Calc_xGAMMAe60]=ode45(@GnnRightHandSideNonlinearEqsNo1GAMMAe1,tspan0,x0,options);
            figure (1);subplot(2,2,1);plot(Calc_tCe60,Calc_xCe60(:,1),'r--','LineWidth',2.5);hold on
            figure (1);subplot(2,2,2);plot(Calc_tCe60,Calc_xCe60(:,2),'r--','LineWidth',2.5);hold on
            figure (1);subplot(2,2,3);plot(Calc_tCe60,Calc_xCe60(:,3),'r--','LineWidth',2.5);hold on
            figure (1);subplot(2,2,4);plot(Calc_tCe60,Calc_xCe60(:,4),'r--','LineWidth',2.5);hold on
%             
%             clear nerrCe30;
%             clear nerrCe60;
%             clear nerrGAMMAe60;            
% 
%             Theoretical_xCe30=Theoretical_xNonlinearEqsNo1(Calc_tCe30');
%             for k=1:length(Calc_tCe30)
%                 errCe30=Theoretical_xCe30(k,:)-Calc_xCe30(k,:);
%                 nerrCe30(k)=norm(errCe30,'fro');
%             end            
%             figure(2); 
%             plot(Calc_tCe30,nerrCe30,'b','LineWidth',1.5);
%             hold on 
% 
            Theoretical_x=Theoretical_xNonlinearEqsNo1(Calc_tCe60');
            for k=1:length(Calc_tCe60)
                errCe60=Theoretical_x(k,:)-Calc_xCe60(k,:);
                nerrCe60(k)=norm(errCe60,'fro');
            end            
            figure(3); 
            plot(Calc_tCe60,nerrCe60,'b','LineWidth',1.5);
            hold on
% 
%             Theoretical_xGAMMAe60=Theoretical_xNonlinearEqsNo1(Calc_tGAMMAe60');
%             for k=1:length(Calc_tGAMMAe60)
%                 errGAMMAe60=Theoretical_xGAMMAe60(k,:)-Calc_xGAMMAe60(k,:);
%                 nerrGAMMAe60(k)=norm(errGAMMAe60,'fro');
%             end            
%             figure(4); 
%             plot(Calc_tGAMMAe60,nerrGAMMAe60,'r','LineWidth',1.5);
%             hold on
%             figure(4); 
%             plot(Calc_tCe60,nerrCe60,'b','LineWidth',2);
%             hold on
        end
    end
    
%     figure_FontSize=30;
%     set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
%     set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
%     set(findobj('FontSize',10),'FontSize',figure_FontSize);
end