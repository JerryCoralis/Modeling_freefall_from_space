function output = assignment2(arg1,arg2,arg3)
 
filename = 'RedBullStratosData180.xlsx';
dataArray = xlsread(filename);   %reads the data numerically 
 
%prep data
B = any(dataArray,2);    %logic of rows, if all elements = NaN -> row = 0
dataArray = dataArray(B,:);   %: -> delete rows logic 1
 
%labeling columns 
minTime = dataArray(:,1);
sTime = dataArray(:,2);
msTime= dataArray(:,3);
altitude = dataArray(:,4);
elapsedTime = dataArray(:,11);
abvSea = 38969;

%ode45
tspan = [0 elapsedTime(end)];
yi = abvSea;
g = 9.81;

[t,y] = ode45(@(t,y) -(1/2*g*t^2), tspan, yi);    %variable yi is unused here.
plot(t,y,'-o')
