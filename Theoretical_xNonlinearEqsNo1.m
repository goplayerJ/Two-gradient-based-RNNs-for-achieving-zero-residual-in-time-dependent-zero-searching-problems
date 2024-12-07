function rx=Theoretical_xNonlinearEqsNo1(tspan2)
    rx1=exp(1./(tspan2+1));
    rx2=sin(tspan2);
    rx3=2-exp(2./(tspan2+1))+sin(tspan2).^2;
    rx4=tspan2-2;
    rx=[rx1' rx2' rx3' rx4'];%    rx=[rx1' rx2' rx3' rx4'];
end