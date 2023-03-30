function uout = MPC2(ed,ed_dot,ephi,ephi_dot,vx,k,s_dot,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16)
%   MPC on YALMIP
    yalmip('clear')
    persistent u_real;
    persistent controller;    
    L = [m1   m2   m3   m4;
         m5   m6   m7   m8;
         m9   m10  m11  m12;
         m13  m14  m15  m16];
    %   积分法，速度9.5
    G = [-0.2633;
         -0.2555;
         -0.2637;
          0.2496];
    if isempty(u_real) || isnan(u_real)
        u_real = 0;
    %   积分法，速度9.5
        A = [1    1.0101     1        1;
             1    0.8528     4.5409   0.9991;
             1    1          1        1.0101;
             1    0.9996     1.0041   0.8462];
        B = [1.4114;
             1.3414;
             1.4098;
             1.3641];
    %   the ss is x(k+1) = A*x(k) + B*u(k) + G*d (G*d is the disturbance)

        nx = 4;
        nu = 1;
        Q = [50  0   0   0;
             0   10   0   0;
             0   0   50  0;
             0   0   0   1;];
        R = 2;
        N = 10;

        u = sdpvar(repmat(nu,1,N),repmat(1,1,N));
        x = sdpvar(repmat(nx,1,N+1),repmat(1,1,N+1));
        pastu = sdpvar(1);
        d = sdpvar(1);
    %   define constraints and objective
        constraints = [-0.0148*0.4 <= diff([pastu u{:}]) <= 0.0148*0.4];
        objective = 0;
        for k = 1:N
            objective = objective + x{k}'*Q*x{k}+u{k}'*R*u{k};
            constraints = [constraints, x{k+1} == A*x{k}+B*u{k}+G*d];
            constraints = [constraints, -0.1744 <= u{k}<= 0.1744];
        end
        objective = objective + x{N+1}'*Q*x{N+1};

        parameters_in = {x{1},pastu,d};
        solutions_out = {[u{:}], [x{:}]};

        controller = optimizer(constraints, objective,sdpsettings('solver','gurobi'),parameters_in,solutions_out);
        
        
        
%-----------------------------------------------------------
        x = [ed;ed_dot;ephi;ephi_dot];
        x = L * x;
        inputs = {x,u_real,k*s_dot};
        [solutions,diagnostics] = controller{inputs}; 
        U = solutions{1};
        u_real = U(1);
        uout = u_real;
%-----------------------------------------------------------
    else
        
%-----------------------------------------------------------
        x = [ed;ed_dot;ephi;ephi_dot];
        x = L * x;
        inputs = {x,u_real,k*s_dot};
        [solutions,diagnostics] = controller{inputs};
        U = solutions{1};
        u_real = U(1);
        uout = u_real;
%-----------------------------------------------------------
    end
    
end