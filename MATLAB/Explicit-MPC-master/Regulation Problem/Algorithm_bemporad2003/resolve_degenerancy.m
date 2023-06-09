function  [ G_tio, W_tio, S_tio, index, flag] = resolve_degenerancy(G, W, S, H, F, A, b, Nu, Nstate, Lcand, tol)
%[ G_tio, W_tio, S_tio, index, flag, flag_x_nan] = resolve_degenerancy(G, W, S, H, F, A, b, Nu, Nstate, Lcand, tol)
%
%Resolve degeneration with an optimization problem
%Inputs:
%       A, b - matrices that define the polyhedral Ax <= b
%
%       G, W, S, H and F - from the cost function: 
%                          Vz(x) = 0.5*z'*H*z 
%                                 through z 
%                                 subject to G*z <= W + S*x(t)
%
%       Nstate - number of states of the system
%
%       Nu - control horizon
%
%       Lcand - contraints that generated the degeneration
%
%       tol - tolerance to consider something zero
%
%Outputs:
%       G_tio, W_tio, S_tio - rows of G, W and S associated with the active
%       constraints without degeneration
%
%       index -  list of active constraints without degeneration
%
%       flag - indicates if the optimization problem is infesiable
%
%Algoritm based on the paper "An Algorithm for Multi-Parametric Quadratic Programming and 
% Explicit MPC Solutions" by P. Tondel, T.A. Johansen, and A. Bemporad. 
    


%     Reconstroi Regi�o que originou a que esta sendo avaliada
%     Rebuild original region
    indices_old = [];
%     if length(Lcand) == 1
%         indices_old = [];
%         A = -S;
%         b = W;
%         origem = (1:size(G,1))';
%         type = ones(size(G,1),1);
%         [A, b, type, origem] = remove_redundant_constraints(A, b, type, origem, Nu, Nstate);
%     else
%         indices_old = Lcand(1:(end-1),:);
%         [ G_tio, W_tio, S_tio] = build_active_const(G, W, S, indices_old);
%         [A, b, type, origem] = define_region(G, W, S, G_tio, W_tio, S_tio, H, tol);
%         [A, b, type, origem] = remove_redundant_constraints(A, b, type, origem, Nu, Nstate);
%     end
    %%%
    %indices_old
    %Lcand
    %A = Lcand{1,2};
    %b = Lcand{1,3};
    index = [];
    G_tio = [];
    W_tio = [];
    S_tio = [];

    [xc , r, diagnostics] = chebychev_ball(A, b, G, W, S, H, F, Nu, Nstate);
    
    if  diagnostics.problem > 0
        flag = 1;
    else
        [z0, diagnostics] = optimal_z_mp_QP(G, W, S, H, F, xc, Nu);
        if diagnostics.problem > 0
            flag = 1;
        else
            G_test = [];
            for i = 1: length(Lcand)
                G_test = [G_test ; G(Lcand(i),:)];
            end
            
            
            %Equacao 18, 19 e 20
            lambda = sdpvar(length(Lcand),1,'full');
            
            objective = -lambda(end);
            LMI = [];
            LMI = [LMI; H*z0 + G_test'*lambda == 0];
            LMI = [LMI; lambda >= 0];
            
            options=sdpsettings;
            options.solver='sedumi';
            options.verbose = 0;
            diagnostics = optimize(LMI,objective,options);
            
            
            if diagnostics.problem > 0
                flag = 1;
            else
                lambda = double(lambda);
                flag = 0;
                index = [];
                for i = 1:length(Lcand)
                    if lambda(i) == Inf
                        flag = 1;
                    elseif lambda(i) > 0
                        index = [index; Lcand(i)];
                        G_tio = [G_tio; G(Lcand(i),:)];
                        S_tio = [S_tio; S(Lcand(i),:)];
                        W_tio = [W_tio; W(Lcand(i),:)];
                    end
                end
            end
            
        end
    end     
end

