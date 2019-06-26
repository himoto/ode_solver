function dydt = diffeq(t,y)

    global rabbit;
    global fox;
    
    a = 1.0;
    b = 0.1;
    c = 1.5;
    d = 0.75;

    dydt = zeros(2,1);

    dydt(rabbit) = a*y(rabbit) - b*y(rabbit)*y(fox);
    dydt(fox) = -c*y(fox) + d*b*y(rabbit)*y(fox);
    
end

