function output = assignment2
 clf
filename = 'RedBullStratosData180.xlsx';
dataArray = xlsread(filename);   %reads the data numerically 
 
%prep data
B = any(dataArray,2);    %logic of rows, if all elements = NaN -> row = 0
dataArray = dataArray(B,:);   %: -> delete rows logic 1

%constants
ABV_SEA = 38969; %in meters

%variables
altitude = dataArray(2:end,4);
airSpeed = dataArray(2:end,5);
airSpeed = airSpeed ./ (3.6);   %adjust for units 

elapsedTime = dataArray(2:end,11);
    
timeCap = 60;
timeDataCap = find(elapsedTime>timeCap);
timeDataCap = timeDataCap(1);


%% Functions
%part 1
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


%part 2
function res = freefall2(t, X)
    p = X(1);      % the first element is position
    v = X(2);      % the second element is velocity

    dpdt = v;                          
    dvdt = acceleration2(t, p, v);

    res = [dpdt; dvdt];    % pack the results in a column vector
end    

function res = acceleration2(t, p, v)
    a_grav = -9.8;              % acceleration of gravity in m/s^2
    c = 0.2;                    % drag constant
    m = 75;                     % mass in kg
    f_drag = c * v^2;           % drag force in N
    a_drag = f_drag / m;        % drag acceleration in m/s^2
    res = a_grav + a_drag;      % total acceleration
end


%% Part 1: plots

[freefallt, freefally] = ode45(@freefall, [0 60], [ABV_SEA 0]);

%Position
figure(1)    
    hold on
    plot(freefallt, freefally(:,1), '-o')   % we want to grab only the data on dpdt
    plot(elapsedTime(1:timeDataCap), altitude(1:timeDataCap))
    
    title('Position vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Position')
    ylim('auto')
    legend('Modeled Position','Actual Position')
    hold off
    
%Velocity
figure(2)
    hold on
    plot(freefallt, abs(freefally(:,2)),'-o')
    plot(elapsedTime(1:timeDataCap), airSpeed(1:timeDataCap))
    
    title('Velocity vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Velocity')
    ylim('auto')
    legend('Modeled Velocity','Actual Velocity')
    hold off
    
%acceleration
figure(3)
    derivedMdelAcc = abs(diff(freefally(:,2)) ./ diff(freefallt));  %.^2
    derivedActualAcc = diff(airSpeed) ./ diff(elapsedTime);
    
    hold on
    plot(freefallt(1:end-1), derivedMdelAcc, '-o')
%     tempholdy = medfilt1(derivedActualAcc,9);
    plot(elapsedTime(1:timeDataCap), derivedActualAcc(1:timeDataCap))%tempholdy(1:timeDataCap))
    
    title('Acceleration vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Acceleration')
    ylim('auto')
    legend('Modeled Acceleration','Actual Acceleration')
    hold off

    
%% Part 2: Drag

[freefallt2, freefally2] = ode45(@freefall2, [0 60], [ABV_SEA 0]);

figure(4)    
    hold on
    plot(freefallt2, freefally2(:,1), '-o')   % we want to grab only the data on dpdt
    plot(elapsedTime, altitude)
    
    title('Position vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Position')
    ylim('auto')
    legend('Modeled Position','Actual Position')
    hold off

figure(5)
    hold on
    plot(freefallt2, abs(freefally2(:,2)),'-o')
    plot(elapsedTime, airSpeed)
    
    title('Velocity vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Velocity')
    ylim('auto')
    legend('Modeled Velocity','Actual Velocity')
    hold off
    
figure(6)
    derivedMdelAcc = abs(diff(freefally2(:,2)) ./ diff(freefallt2));
    
    hold on
    plot(freefallt2(1:end-1), derivedMdelAcc, '-o')
    plot(elapsedTime(1:end-1), derivedActualAcc)
    
    title('Acceleration vs Time')
    xlabel('Time')
    xlim([0 60])
    ylabel('Acceleration')
    ylim([-150 150])
    legend('Modeled Acceleration','Actual Acceleration')
    hold off

    
%% Part 3
% [rho,a,T,P,nu,ZorH] = stdatmo(altitude);


%splice original altidue and time array into their corresponding
%atmospheres. Appened each atmosphere section  with stdatmo data and then
%call plot with this
% -not sure how to plot this, are we just going to concanate each section
% then plot or just call plot for each atomspher level

%feed this new array into ode45 and the plotting function

%lecture
%drag function A = crossetional area
%use ode events to stop a simulation, maybe use it to stop modeling early


%% Part 4



end
