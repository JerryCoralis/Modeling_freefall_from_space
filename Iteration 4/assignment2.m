function output = assignment2
 clf
filename = 'RedBullStratosData180.xlsx';
dataArray = xlsread(filename);   %reads the data numerically 
 
%prep data
B = any(dataArray,2);    %logic of rows, if all elements = NaN -> row = 0
dataArray = dataArray(B,:);   %: -> delete rows logic 1

%constants
abvSea = 38969; %in meters

%variables
altitude = dataArray(:,4);
airSpeed = dataArray(:,5);
elapsedTime = dataArray(:,11);

timeDataCap = find(elapsedTime>90);
timeDataCap = timeDataCap(1);

%% Functions
    function res = freefall(t, X)
    p = X(1);      % the first element is position
    v = X(2);      % the second element is velocity

    dpdt = v;                          
    dvdt = acceleration(t, p, v);

    res = [dpdt; dvdt];    % pack the results in a column vector
    end

    function res = acceleration(t, p, v)
    g = -9.8;      % acceleration of gravity in m/s^2
    res = g;
    end

%% Part 1: plots
%Position
    figure(1)    
    hold on
    [freefallt,freefally] = ode45(@freefall, [0 100], [abvSea 0]);
    plot(freefallt, freefally(:,1), '-o')   % we want to grab only the data on dpdt
    plot(elapsedTime(1:timeDataCap), altitude(1:timeDataCap))
    
    title('Position vs Time')
    xlabel('Time')
    xlim('auto')
    ylabel('Position')
    ylim('auto')
    legend('Modeled Position','Actual Position')
    hold off
    
%Velocity
    figure(2)
    hold on
    plot(freefallt, abs(freefally(:,2)),'-o')
    plot(elapsedTime, (airSpeed))
    
    title('Velocity vs Time')
    xlabel('Time')
    xlim('auto')
    ylabel('Velocity')
    ylim('auto')
    legend('Modeled Velocity','Actual Velocity')
    hold off
    
 %acceleration
    figure(3)
    derivedAccModel = abs(diff(freefally(:,2)) ./ diff(freefallt));
    derivedAccAct = diff(airSpeed) ./ diff(elapsedTime);
    
    hold on
    plot(freefallt(1:end-1), derivedAccModel, '-o')
    plot(elapsedTime(1:end-1), derivedAccAct)
    
    title('Acceleration vs Time')
    xlabel('Time')
    xlim('auto')
    ylabel('Acceleration')
    ylim('auto')
    legend('Modeled Acceleration','Actual Acceleration')
    hold off

%% Part 2
end
