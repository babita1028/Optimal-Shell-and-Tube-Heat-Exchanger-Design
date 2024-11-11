
% enhanced_sensitivity_analysis.m
% Script to perform sensitivity analysis with graphical output on design parameters

function enhanced_sensitivity_analysis(lb, ub, x_opt)
    % Variation range for sensitivity analysis
    variation_percent = [-10, -5, 0, 5, 10]; % ± percentage variation
    parameter_names = {'Shell Diameter', 'Tube Pitch', 'Tube Length', 'Tube Count', 'Shell Mass Flow Rate', 'Tube Mass Flow Rate'};
    
    % Initialize results storage
    results = zeros(length(variation_percent), length(x_opt));

    % Loop over each design variable for sensitivity analysis
    for i = 1:length(x_opt)
        x_temp = x_opt;
        for j = 1:length(variation_percent)
            % Apply variation
            x_temp(i) = x_opt(i) * (1 + variation_percent(j) / 100);
            % Ensure variable within bounds
            x_temp(i) = max(min(x_temp(i), ub(i)), lb(i));
            
            % Evaluate objective function
            results(j, i) = enhanced_objective_function(x_temp);
        end
        
        % Plot sensitivity results for each parameter
        figure;
        plot(variation_percent, results(:, i), '-o');
        title(['Sensitivity Analysis of ', parameter_names{i}]);
        xlabel('Variation (%)');
        ylabel('Objective Function Value');
        grid on;
    end
    disp('Enhanced Sensitivity Analysis with Graphical Output Completed.');
end
