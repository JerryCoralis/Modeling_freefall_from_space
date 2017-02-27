function output = assignment2
 
filename = 'RedBullStratosData180.xlsx';
dataArray = xlsread(filename);   %reads the data numerically 
 
%prep data
B = any(dataArray,2);    %logic of rows, if all elements = NaN -> row = 0
dataArray = dataArray(B,:);   %: -> delete rows logic 1


%variables
abvSea = 38969; %in meters

%labeling columns 
minTime = dataArray(:,1);
sTime = dataArray(:,2);
msTime= dataArray(:,3);
altitude = dataArray(:,4)
elapsedTime = dataArray(:,11)
tempdydx = diff(elapsedTime(:))./diff(altitude(:))


%nested functions
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

%plotting position
    figure(1)
    hold on
    [freefallt,freefally] = ode45(@freefall, [0 60], [abvSea 0]);
    
    plot(freefallt, freefally, '-o')
    plot(elapsedTime(1:280), altitude(1:280), '-')
    hold off
     
    figure(2)
    hold on
%     plot(elapsedTime(2:end), tempdydx(1:end-1), 'g-o')
    plot(elapsedTime,gradient(altitude));
    xlim([0 60])
    hold off
    
%     [t,y] = ode45(@acceleration, [0 600], [abvSea 0]);
%     plot(t,y,'-o')

end
