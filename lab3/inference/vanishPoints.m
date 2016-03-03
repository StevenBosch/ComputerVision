function vanishPoints = vanishPoints(data)

    linFunctions = zeros(length(data(:,1)),2);
    
    % Determine the linear function per set of points
    for ind = 1:length(data(:,1))
        linFunctions(ind,1) = (data(ind,2)-data(ind,4))/(data(ind,1)-data(ind,3)); % Determine the slope
        linFunctions(ind,2) = data(ind,2)-(linFunctions(ind,1)*data(ind, 1));
    end
    
    % Calculate multiple vanishing points as intersection of the linear
    % functions
    vanishPoints = zeros((factorial(length(data(:,1)))/factorial(length(data(:,1))-2))/2, 2);
    
    counter = 0;
    for ind = 1:length(data(:,1))
        for ind2 = 1:length(data(:,1))
            if(ind~=ind2)
                counter = counter + 1;
                vanishPoints(counter, 1) = (linFunctions(ind, 2) - linFunctions(ind2, 2))/(linFunctions(ind2, 1) - linFunctions(ind, 1));
                vanishPoints(counter, 2) = linFunctions(ind, 1) * vanishPoints(counter, 1) + linFunctions(ind,2);
            end
        end
    end