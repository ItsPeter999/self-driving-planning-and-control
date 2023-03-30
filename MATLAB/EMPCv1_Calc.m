yalmip('clear')
    vx = 9.5;
    a = 1.265;
    b = 1.682;
    cf = -175016;
    cr = -130634;
    Iz = 4095;
    m = 2020;
    %   define desicrete ss matrics
        Ts = 0.01;
        Ac = [0     1                       0                   0;
             0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
             0      0                       0                   1;
             0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
        Bc = [0;
              -cf/m;
              0;
              -a*cf/Iz;];
        Gc = [0;
             (a*cf-b*cr)/(m*vx)-vx;
             0;
             (a*a*cf+b*b*cr)/(Iz*vx);];
        A = exp(Ac*Ts);
        syms tao;
        fun = exp(Ac*tao);
        B = int(fun,0,Ts)*Bc;
        G = int(fun,0,Ts)*Gc;
        B = double(B);
        G = double(G);

        

