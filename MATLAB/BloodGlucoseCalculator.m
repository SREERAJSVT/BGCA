function app = BloodGlucoseCalculator()
% Create UI Figure
    app.figure = uifigure('Name', 'Blood Glucose Calculator', 'Position', [100 100 800 600]);
% Create UI Panels for better organization
    app.parametersPanel = uipanel(app.figure, 'Title', 'Parameters', 'Position', [20 380 360 200]);
    app.foodPanel = uipanel(app.figure, 'Title', 'Food Data', 'Position', [420 380 360 200]);
    app.activityPanel = uipanel(app.figure, 'Title', 'Activity', 'Position', [20 280 360 80]);
    app.plotPanel = uipanel(app.figure, 'Title', 'Glucose Plot', 'Position', [20 20 760 250]);
% Parameter Inputs
  app.GLabel = uilabel(app.parametersPanel, 'Text', 'G (Initial Glucose):', 'Position', [20 160 120 20]);
    app.GEdit = uieditfield(app.parametersPanel, 'Value', '140', 'Position', [150 160 80 20]); % Value is now a string
    app.VLabel = uilabel(app.parametersPanel, 'Text', 'V (Volume):', 'Position', [20 120 120 20]);
    app.VEdit = uieditfield(app.parametersPanel, 'Value', '194.4', 'Position', [150 120 80 20]); % Value is now a string
    app.alphaNoLabel = uilabel(app.parametersPanel, 'Text', 'α (No Activity):', 'Position', [20 80 120 20]);
    app.alphaNoEdit = uieditfield(app.parametersPanel, 'Value', '0.009', 'Position', [150 80 80 20]); % Value is now a string
    app.alphaYesLabel = uilabel(app.parametersPanel, 'Text', 'α (With Activity):', 'Position', [20 40 120 20]);
    app.alphaYesEdit = uieditfield(app.parametersPanel, 'Value', '0.015', 'Position', [150 40 80 20]); % Value is now a string
    app.omegaLabel = uilabel(app.parametersPanel, 'Text', 'ω (Omega):', 'Position', [20 0 120 20]);
    app.omegaEdit = uieditfield(app.parametersPanel, 'Value', '0.008', 'Position', [150 0 80 20]); % Value is now a string
    % Food Data Inputs (Using a table)
    app.foodTable = uitable(app.foodPanel, 'ColumnName', {'Food', 'extG (mg/dl)', 'b'}, ...
        'Data', {
            'Whole Wheat Bread', 295, 1.223782;
            'Brown Rice', 295, 1.223782;
            'Black Beans', 215, 0.891909;
            'Lentils', 210, 0.871167;
            'Oatmeal', 205, 0.850425
        },'ColumnEditable',true,...
        'Position', [20 20 320 160]);
% Activity Dropdown
    app.activityLabel = uilabel(app.activityPanel, 'Text', 'Physical Activity:', 'Position', [20 40 100 20]);
    app.activityDropdown = uidropdown(app.activityPanel, 'Items', {'No', 'Yes'}, 'Value', 'No', 'Position', [130 40 100 20]);
% Plot Axes
    app.glucoseAxes = uiaxes(app.plotPanel, 'Position', [20 20 720 210]);
    app.glucoseAxes.YLim = [80 240];        % Set y-axis limits to 80-240
    app.glucoseAxes.YTick = 80:20:240; % Set y-axis ticks at intervals of 20
    app.glucoseAxes.XLim = [0 300]; % set x axis limit
    app.glucoseAxes.XTick = [0 100 200 300]; %Set x axis ticks
    app.glucoseAxes.XLabel.String = 'Time (Minutes)';
    app.glucoseAxes.YLabel.String = 'Glucose (mg/dl)';
    hold(app.glucoseAxes,'on')
% Simulate Button
    app.simulateButton = uibutton(app.figure, 'Text', 'Simulate', 'Position', [20 265 100 30],...
        'ButtonPushedFcn', @(src,event) updatePlot(app));

    % Add listeners for input changes - Corrected for older MATLAB versions
    addlistener(app.GEdit, 'ValueChanged', @(src,event) updatePlot(app));
    addlistener(app.VEdit, 'ValueChanged', @(src,event) updatePlot(app));
    addlistener(app.alphaNoEdit, 'ValueChanged', @(src,event) updatePlot(app));
    addlistener(app.alphaYesEdit, 'ValueChanged', @(src,event) updatePlot(app));
    addlistener(app.omegaEdit, 'ValueChanged', @(src,event) updatePlot(app));
    
    %Workaround for older matlab version where DataChanged is not available
    app.foodTable.CellEditCallback = @(src,event) updatePlot(app);
    
    addlistener(app.activityDropdown, 'ValueChanged', @(src,event) updatePlot(app));

    updatePlot(app); % Initial plot Code Dev By ecmastermind.com. sreeraj/
end
function updatePlot(app)
    G = str2double(app.GEdit.Value);
    V = str2double(app.VEdit.Value);
    omega = str2double(app.omegaEdit.Value);
    alphaNo = str2double(app.alphaNoEdit.Value);
    alphaYes = str2double(app.alphaYesEdit.Value);
    activity = app.activityDropdown.Value;

    if strcmp(activity, 'Yes')
        alpha = alphaYes;
    else
        alpha = alphaNo;
    end

    foodData = app.foodTable.Data;
    time = [0, 100, 200, 300];

    cla(app.glucoseAxes);
    hold(app.glucoseAxes, 'on');

    for i = 1:size(foodData, 1)
        extG = foodData{i, 2}; % Extract numeric value from cell
        b = foodData{i, 3};   % Extract numeric value from cell

        % CORRECTED GLUCOSE CALCULATION (Explicitly convert to double)
        glucose = G + (double(b) * (double(extG) - G)) .* (1 - exp(-alpha * time));
        glucose = glucose .* exp(-omega * time);

        plot(app.glucoseAxes, time, glucose, 'LineWidth', 1);
    end

    hold(app.glucoseAxes, 'off');
    legend(app.glucoseAxes, foodData(:, 1), 'Location', 'best');
    app.glucoseAxes.YLim = [80 240];        % Set y-axis limits to 80-240
    app.glucoseAxes.YTick = 80:20:240; % Set y-axis ticks at intervals of 20
    app.glucoseAxes.XLim = [0 300]; % set x axis limit
    app.glucoseAxes.XTick = [0 100 200 300]; %Set x axis ticks
    app.glucoseAxes.XLabel.String = 'Time (Minutes)';
    app.glucoseAxes.YLabel.String = 'Glucose (mg/dl)';
    grid(app.glucoseAxes, 'on');
end