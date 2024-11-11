
% enhanced_constraints_function.m
% Expanded constraints including pressure drop, flow rate limits, and geometric constraints

function [c, ceq] = enhanced_constraints_function(x)
    % Unpack variables
    shell_diameter = x(1);
    tube_pitch = x(2);
    tube_length = x(3);
    tube_count = x(4);
    shell_mass_flow_rate = x(5);
    tube_mass_flow_rate = x(6);

    % Shell-side and tube-side pressure drop constraints
    max_pressure_drop_shell = 100; % Pa (shell)
    max_pressure_drop_tube = 80; % Pa (tube)
    pressure_drop_shell = shell_diameter * tube_pitch * 0.1; % Shell-side simplified
    pressure_drop_tube = tube_length * tube_count * 0.05; % Tube-side simplified

    % Constraints on mass flow rate
    max_flow_rate_shell = 10; % kg/s
    max_flow_rate_tube = 15; % kg/s

    % Inequality constraints (c <= 0)
    c = [pressure_drop_shell - max_pressure_drop_shell;
         pressure_drop_tube - max_pressure_drop_tube;
         shell_mass_flow_rate - max_flow_rate_shell;
         tube_mass_flow_rate - max_flow_rate_tube];

    % No equality constraints (ceq = 0)
    ceq = [];
end
