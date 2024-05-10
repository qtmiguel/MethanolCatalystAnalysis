function Global = globalDataFcn()

% globalDataFcn is a function to set up all constant values in the program.

% -------------------------------------------------------------------------

% The folllowing are the values that the user can change to run the program
% ID           = this is a number identifier
% Reference    = this is a reference to the paper
% Catalyst     = this is the catalyst used in the experiment
% PRESSURE     = this is the reactor pressure [bar]
% TEMPERATURE  = this is the bed temperature [K]
% H2_CO2_ratio = this is the fed (H2/CO2) ratio
% X_CO2_exp    = this is the experimental CO2 conversion
% S_CH3OH_exp  = this is the experimental selectivity of CH3OH
% GHSV_exp     = this is the experimental gas hourly space velocity [h-1]

% -------------------------------------------------------------------------

      ID            = 18;
      Reference     = '[21]';
      Catalyst      = '5%PdZn(1:5)/TiO2';
      PRESSURE      = 2*10; 
      TEMPERATURE   = (273.15 + 250); 
      H2_CO2_ratio  = 3;    
      X_CO2_exp     = 10.1/100;  
      S_CH3OH_exp   = 40/100;  
      GHSV_exp      = 38304;  

% -------------------------------------------------------------------------
% The following are values related to the reactor and the catalyst

      X_H2_exp              = 0.06;  %                                   []
      UNIVERSAL_CONSTANT_1  = 8.314472e-5; % UC-R            [m3.bar/mol.K]
      r_id                  = 0.30;  %  reactor internal diameter       [m] 
      z_id_ratio            = 3;     % (height/internal diameter) ratio  []
      E_b                 = 0.50;        % Bed porosity                  []
      E_p                 = 0.35;        % Bed particle                  []
      E_t                 = E_b + (1 - E_b)*E_p; % total bed porosity    []
      mu                  =  0.25*2.36E-5+ 0.75*1.24E-5;% viscosity  [Pa.s]
      rho_cat             = 1450;        % Catalyst bulk density    [kg/m3]
      r_p                 = 2e-4;        % Average particle radius      [m]
      GRAVITY               = 9.81;        % Gravity                 [m/s2]
      UNIVERSAL_CONSTANT_2  = 8.314463;    % UC-R                 [J/mol.K]
      REF_TEMPERATURE       = 503;         % Reference temperature      [K]
      iterations          = Iterations.getInstance();% number of iterations

% -------------------------------------------------------------------------
% The following are values related to the kinetics of the reaction

        k1_0  = 0.000314; %                              [mol.bar/s.kg_cat]
        Ea_1  = 3.22E4;   %                                         [J/mol]
        k2_0  = 0.0074;   %                              [mol.bar/s.kg_cat]
        Ea_2  = 6.47E4;   %                                         [J/mol]
        k3_0  = 0.000451; %                              [mol.bar/s.kg_cat]
        Ea_3  = 2.52E4;   %                                         [J/mol]

        KCO_0  = 0.0128;  %                                         [bar-1]
        DH_CO  = -1.34E4; %                                         [J/mol]

        KCO2_0 = 0.0615;  %                                         [bar-1]
        DH_CO2 = -1.26E3; %                                         [J/mol]

        KH2O_KH2_0 = 7.66;    %                                     [bar-1]
        DH_H2O_H2  = -1.01E5; %                                     [J/mol]

% -------------------- | General Data |------------------------------------
% All the values are stored in the Global structure

      Global.Reference    = Reference;
      Global.Catalyst     = Catalyst;
      Global.ID           = ID;
      Global.H2_CO2_ratio = H2_CO2_ratio;
      Global.R_1          = UNIVERSAL_CONSTANT_1;   
      Global.R_2          = UNIVERSAL_CONSTANT_2; 
      Global.P            = PRESSURE;
      Global.g            = GRAVITY;  
      Global.T            = TEMPERATURE;
      Global.T_ref        = REF_TEMPERATURE;
      Global.GHSV         = GHSV_exp;
      Global.GHSV_exp     = GHSV_exp;
      Global.X_CO2_exp    = X_CO2_exp;
      Global.X_H2_exp     = X_H2_exp;
      Global.S_CH3OH_exp  = S_CH3OH_exp;
      Global.r_id         = r_id;
      Global.z_id_ratio   = z_id_ratio;
      Global.E_b          = E_b;
      Global.E_p          = E_p;
      Global.E_t          = E_t;
      Global.mu           = mu;
      Global.rho_cat      = rho_cat;
      Global.r_p          = r_p;
      Global.iterations   = iterations;
      Global.k1_0         = k1_0;
      Global.Ea_1         = Ea_1;
      Global.k2_0         = k2_0;
      Global.Ea_2         = Ea_2;
      Global.k3_0         = k3_0;
      Global.Ea_3         = Ea_3;
      Global.KCO_0        = KCO_0;
      Global.DH_CO        = DH_CO;
      Global.KCO2_0       = KCO2_0;
      Global.DH_CO2       = DH_CO2;
      Global.KH2O_KH2_0   = KH2O_KH2_0;
      Global.DH_H2O_H2    = DH_H2O_H2;

% -------------------------------------------------------------------------

      MS                  = 1E-1;
      KLDF                = 0.1;
      Global.MS           = MS;
      Global.KLDF         = KLDF;
      Global.NoN          = 5;

% -------------------------------------------------------------------------
end