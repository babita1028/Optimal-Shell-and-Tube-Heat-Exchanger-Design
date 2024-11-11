
% enhanced_objective_function.m
% Objective function for cost and exergy destruction with detailed calculations

function f = enhanced_objective_function(x)
    % Define parameters for cost calculation
    a1 = 8200; a2 = 259.2; a3 = 0.91; % Capital cost coefficients
    C_fuel = 0.14; % Fuel cost ($/kWh)
    Hr = 8232; % Hours per year
    i = 0.1; ny = 10; % Discount rate and equipment life

    % Extract design variables from input x
    shell_diameter = x(1);
    tube_pitch = x(2);
    tube_length = x(3);
    tube_count = x(4);
    shell_mass_flow_rate = x(5);
    tube_mass_flow_rate = x(6);
    
    % Capital cost estimation
    A = pi * shell_diameter * tube_length * tube_count; % Surface area
    C_cap = a1 + a2 * A^a3; % Capital cost

    % Operational cost estimation using pumping power for both sides
    pumping_power = (shell_mass_flow_rate / 0.8) + (tube_mass_flow_rate / 0.8);
    C_OPD = pumping_power * C_fuel * Hr; % Operating cost

    % Maintenance cost estimation (percentage of capital cost)
    C_maintenance = 0.2 * C_cap;

    % Exergy destruction rate estimation
    exergy_destruction_rate_shell = shell_mass_flow_rate * shell_diameter * tube_pitch * 0.05; % Shell side
    exergy_destruction_rate_tube = tube_mass_flow_rate * tube_pitch * tube_length * 0.05; % Tube side
    CExD = (exergy_destruction_rate_shell + exergy_destruction_rate_tube) * C_fuel;

    % Total cost (objective)
    f = C_cap + C_OPD + C_maintenance + CExD;
end
