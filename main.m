% ----------| Main Program |-----------------------------------------------
%     Chemical Engineering Department
%     Author: Daniel Z. Juca
% ------------------------ | init | ---------------------------------------
    close all
    clear
    clear Iterations
    clc
    format shortG
% ---------- global constants ---------------------------------------------
    Global   = globalDataFcn();
    Global   = boundaryFlowFcn(Global, 0.0);   
% -------------------------------------------------------------------------
    NoN      = Global.NoN;
% ---------- initial condition --------------------------------------------
    u0       = initialConditionsFcn(Global);
% ---------- time simulation (s) ------------------------------------------
    z0       = 0.0; 
    zf       = Global.z;
    zout     = linspace(z0,zf,100)';
% ---------- Implicit (sparse stiff) integration --------------------------
    reltol   = 1.0e-6; abstol = 1.0e-6;  
    options  = odeset('RelTol',reltol,'AbsTol',abstol,'NonNegative',NoN);
    odeModel = @(z,u)odeFcn(z,u,Global);
    [z,u]    = ode15s(odeModel,zout,u0,options);
% -------------------------------------------------------------------------

    [X_CO2_r, ~] = xi_Fcn(z, u, Global);
    X_CO2_exp    = Global.X_CO2_exp;

    if X_CO2_r(end) > X_CO2_exp

        factor   = 0.1;
        Global   = boundaryFlowFcn(Global, factor); 
        u0       = initialConditionsFcn(Global);
        odeModel = @(z,u)odeFcn(z,u,Global);
        [z,u]    = ode15s(odeModel,zout,u0,options);

    else

%--------------------------------------------------------------------------
        factor   = 0.0;

        while factor < 0.9   % ========> [0.5 - 0.9]

                factor     = round(factor + 0.1, 1);
                Global     = boundaryFlowFcn(Global, factor);
                u0         = initialConditionsFcn(Global);
                odeModel   = @(z,u)odeFcn(z,u,Global);
                [z,u]      = ode15s(odeModel,zout,u0,options);
                [X_CO2_temp, ~] = xi_Fcn(z, u, Global);
                
                % Comprueba si X_CO2 se ha estabilizado
                if X_CO2_temp(end) > X_CO2_exp
                    disp(['X_CO2 se ha estabilizado en factor = ', ...
                           num2str(factor)]);
                    break;
                end

        end   
%--------------------------------------------------------------------------
    end
% -------------------------------------------------------------------------

                   g_pressure_Fcn(z, u, Global)
    z_flow       = g_flow_Fcn(z, u, Global);
    z_x_CO2_x_H2 = g_conversion_Fcn(z, u, Global);
    z_s_CH3OH    = g_selectivity_Fcn(z, u, Global);
    z_y          = g_yield_Fcn(z, u, Global);

% -------------------------------------------------------------------------

    [a, ghsv_1_ref, x_GHSV] = x_ghsv_Fcn(z, u, Global);  

% -------------------------------------------------------------------------

    [s, S_CH3OH_ref, s_x]   = s_x_Fcn(z, u, Global);

% ---------------------------| End Program |-------------------------------