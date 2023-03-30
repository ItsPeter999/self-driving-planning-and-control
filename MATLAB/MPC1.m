function uout = MPC1(ed,ed_dot,ephi,ephi_dot,vx,k,s_dot,m,a,b,cf,cr,Iz)
%   MPC on YALMIP
    yalmip('clear')
    persistent u_real;
    persistent controller;
    vx = 9.5;
    a = 1.265;
    b = 1.682;
    cf = -175016;
    cr = -130634;
    Iz = 4095;
    m = 2020;
    if isempty(u_real) || isnan(u_real)
        u_real = 0;
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
    %   the ss is x(k+1) = A*x(k) + B*u(k) + G*d (G*d is the disturbance)

        nx = 4;
        nu = 1;
        Q = [50  0   0   0;
             0   5   0   0;
             0   0   50  0;
             0   0   0   5;];
        R = 2;
        N = 5;

        u = sdpvar(repmat(nu,1,N),repmat(1,1,N));
        x = sdpvar(repmat(nx,1,N+1),repmat(1,1,N+1));
        d = k*s_dot;
        pastu = sdpvar(1);
    %   define constraints and objective
        constraints = [-0.0148*0.4 <= diff([pastu u{:}]) <= 0.0148*0.4];
        objective = 0;
        for k = 1:N
            objective = objective + x{k}'*Q*x{k}+u{k}'*R*u{k};
            constraints = [constraints, x{k+1} == A*x{k}+B*u{k}+G*d];
            constraints = [constraints, -0.1744 <= u{k}<= 0.1744];
        end
        objective = objective + x{N+1}'*Q*x{N+1};

        parameters_in = {x{1},pastu};
        solutions_out = {[u{:}], [x{:}]};

        controller = optimizer(constraints, objective,sdpsettings('solver','gurobi'),parameters_in,solutions_out);
        x = [ed;ed_dot;ephi;ephi_dot];

        inputs = {x,u_real};
        [solutions,diagnostics] = controller{inputs}; 
        U = solutions{1};
        u_real = U(1);
        uout = u_real;
    else 
        x = [ed;ed_dot;ephi;ephi_dot];

        inputs = {x,u_real};
        [solutions,diagnostics] = controller{inputs};
        U = solutions{1};
        u_real = U(1);
        uout = u_real;
    end
    
end