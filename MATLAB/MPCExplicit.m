function uout = MPCExplicit(ed,ed_dot,ephi,ephi_dot,vx,k,s_dot,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16)
%   EMPC on YALMIP with LTI system
    yalmip('clear')
    persistent isFirstRun;
    persistent dgn;
    persistent J;
    persistent sol;
    persistent uopt;
    persistent Uz;
    
    L = [m1   m5   m9    m13;
         m2   m6   m10   m14;
         m3   m7   m11   m15;
         m4   m8   m12   m16];

    G = [-0.2633;
         -0.2555;
         -0.2637;
          0.2496];
    if isempty(isFirstRun) || isnan(isFirstRun) || isFirstRun == 0
        isFirstRun = 1;
        yalmip('clear')

        % Model data
        A = [1    1.0101     1        1;
             1    0.8528     4.5409   0.9991;
             1    1          1        1.0101;
             1    0.9996     1.0041   0.8462];
        B = [1.4114;
             1.3414;
             1.4098;
             1.3641];

        nx = 4; % Number of states
        nu = 1; % Number of inputs

        % Prediction horizon
        N = 4;
        % States x(k), ..., x(k+N)
        x = sdpvar(repmat(nx,1,N),repmat(1,1,N));
        % Inputs u(k), ..., u(k+N) (last one not used)
        u = sdpvar(repmat(nu,1,N),repmat(1,1,N));
        
        J{N} = norm(x{N},1);
        for k = N-1:-1:1    

            % Feasible region
             constraints = [-0.1744 <= u{k} <=  0.1744,
                            [-0.1;-0.2;-0.05;-0.15] <= x{k}    <= [0.1;0.2;0.05;0.15],
                            [-0.1;-0.2;-0.05;-0.15] <= x{k+1}  <= [0.1;0.2;0.05;0.15]];   
            % Dynamics
            constraints = [constraints, x{k+1} == A*x{k}+B*u{k}];

            % Cost in value iteration
            objective = max(norm([x{k};u{k}],inf),J{k+1}); 

            % Solve one-step problem    
            [sol{k},dgn{k},Uz{k},J{k},uopt{k}] = solvemp(constraints,objective,[],x{k},u{k});
        end
        
%-----------------------------------------------------------
        x = [ed;ed_dot;ephi;ephi_dot];
        xx = x;
%         xx = L * x;
        [i,j] = isinside(sol{1}{1}.Pn,xx);
        if i == 0
            u_real = 0;
        else
            u_real = sol{1}{1}.Fi{j(1)} * xx + sol{1}{1}.Gi{j(1)};
        end
        uout = u_real;
%-----------------------------------------------------------
    else
        
%-----------------------------------------------------------
                x = [ed;ed_dot;ephi;ephi_dot];
        xx = x;
%         xx = L * x;
        [i,j] = isinside(sol{1}{1}.Pn,xx);
        if i == 0
            u_real = 0;
        else
            u_real = sol{1}{1}.Fi{j(1)} * xx + sol{1}{1}.Gi{j(1)};
        end
        uout = u_real;
%-----------------------------------------------------------
    end
    
end