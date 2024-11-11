
% validation_results.m
% Script for comparing optimized results with benchmark values for validation

function validation_results(x_opt, benchmark_values)
    % Calculate percentage deviation from benchmarks
    deviation = abs(x_opt - benchmark_values) ./ benchmark_values * 100;
    
    % Display results
    disp('Validation Results - Deviation from Benchmark (%)');
    disp(array2table(deviation, 'VariableNames', {'Deviation (%)'}, ...
                     'RowNames', {'Shell Diameter', 'Tube Pitch', 'Tube Length', 'Tube Count', ...
                                  'Shell Mass Flow Rate', 'Tube Mass Flow Rate'}));
end
