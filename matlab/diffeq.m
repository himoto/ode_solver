function dydt = diffeq(t,y)
    
    a = 1.0;
    b = 0.1;
    c = 1.5;
    d = 0.75;

    dydt = zeros(2,1);

    dydt(1) = a*y(1) - b*y(1)*y(2);
    dydt(2) = -c*y(2) + d*b*y(1)*y(2);
    
end

