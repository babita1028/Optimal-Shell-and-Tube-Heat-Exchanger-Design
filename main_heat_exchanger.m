
% main_heat_exchanger.m
% Main script to initialize variables, run optimization, and perform enhanced sensitivity analysis

clear; clc;

% Set bounds for variables (examples; adjust as needed for your design)
lb = [0.5, 0.02, 1.5, 100, 1, 5]; % Lower bounds [shell diameter, tube pitch, tube length, tube count, shell mass flow rate, tube mass flow rate]
ub = [1.0, 0.05, 4.0, 200, 7, 15]; % Upper bounds

% Initial guess
x0 = (lb + ub) / 2;

% Optimization options
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');

% Run optimization with expanded design parameters
[x_opt, fval] = fmincon(@enhanced_objective_function, x0, [], [], [], [], lb, ub, @enhanced_constraints_function, options);

% Display optimized design variables
disp('Optimized Variables:');
disp(x_opt);
disp('Optimized Cost and Exergy Destruction:');
disp(fval);

% Run enhanced sensitivity analysis with graphical output
enhanced_sensitivity_analysis(lb, ub, x_opt);
