%% ENSC180-Assignment2

% Student Name 1: Jia Jun Li

% Student 1 #: 301238737

% Student 1 userid (email): jjl39@sfu.ca

% Student Name 2: Minji Ju

% Student 2 #: 301240719

% Student 2 userid (email): mju@sfu.ca
        
% Below, edit to list any people who helped you with the assignment, 
%      or put ‘none’ if nobody helped (the two of) you.

% Helpers: Hadi Moein, Craig Scratchley,Stackoverflow, MathWorks:MATLAB Documentation/Help

%% Instructions:
% * Put your name(s), student number(s), userid(s) in the above section.
% * Edit the "Helpers" line.  
% * Your group name should be "A2_<userid1>_<userid2>" (eg. A2_stu1_stu2)
% * Form a group 
%   as described at:  https://courses.cs.sfu.ca/docs/students
% * Replace "% <place your work here>" below, or similar, with your own answers and work.
% * You can copy your work from your other functions and (live) scripts and as needed.  
% * Nagvigate to the "PUBLISH" tab (located on top of the editor)
%   * Choose pdf as "Output file format" under "Edit Publishing Options..."
%   * Click "Publish" button. Ensure a report is automatically generated
% * You will submit THIS file (assignment2.m),    
%   and the PDF report (assignment2.pdf).
% Craig Scratchley, Spring 2017

%% main

function main

clf
filename = 'RedBullStratosData180.xlsx';
dataArray = xlsread(filename);   %reads the data numerically 
 
%prep data
B = any(dataArray,2);    %logic of rows, if all elements = NaN -> row = 0
dataArray = dataArray(B,:);   %: -> delete rows logic 1

%constants
abvSea = 38969; %in meters change to all caps _ for space

%column labeling varibles 
altitude = dataArray(:,4);
airSpeed = dataArray(:,5);
elapsedTime = dataArray(:,11);

% <any() was used here to test along the rows of the data and generate a logical col vector. 
%This was used to remove all rows of ONLY NaN. Heartrate data ensured a row was always non-zero unless all entries were NaN >

%% Part 1
% How accurate is the model for the first portion of the minute? 
% <Very accurate up until 40s, from there are model deviated from the actual result.>

% How accurate is the model for the last portion of that first minute? 
% <Heavy deviates from the actual result.>

% Comment on the acceleration calculated from the measured data. 
% Is there any way to smooth the acceleration calculated from the data?
% <We could apply a regeression onto the acceleration data. This would still produce an accurate model of 
%the data since the deviation of acceleration isn't that great. 

part = 1;
%[T,Y] = ode45(@fall, % <...> 

% <call here your function to create your plots>
%plotComparisons(60, 'Part1 - Freefall', T, Y <, ...>  

%% Part 2
% Answer some questions here in these comments...
% Estimate your uncertainty in the mass that you have chosen (at the 
%     beginning of the jump). 
% <put your answer here in these comments>

% How sensitive is the velocity and altitude reached after 60 seconds to 
%    changes in the chosen mass?
% <put your answer here in these comments>

part = 2;
%[T,Y] = ode45(@fall, % <...> 

% <call here your function to create your plots>
%plotComparisons(<...>, 'Part2 - Simple Air Resistance', T, Y <, ...> 

%% Part 3
% Answer some questions here in these comments...
% Felix was wearing a pressure suit and carrying oxygen. Why? 
%     What can we say about the density of air in the stratosphere?
%     How is the density of air different at around 39,000 meters than it 
%     is on the ground?
% <put your answer here in these comments>

% What are the factors involved in calculating the density of air? 
%     How do those factors change when we end up at the ground but start 
%     at the stratosphere?  Please explain how calculating air density up 
%     to the stratosphere is more complicated than say just in the troposphere.
% <put your answer here in these comments>

% What method(s) can we employ to estimate [the ACd] product? 
% <put your answer here in these comments>

% What is your estimated [ACd] product?
% <put your answer here in these comments>
%
% [Given what we are told in the textbook about the simple drag constant, b,] 
%   does the estimate for ACd seem reasonable?
% <put your answer here in these comments>

part = 3;

% <place your work here>

%% Part 4
% Answer some questions here in these comments...
% What is the actual gravitational field strength around 39,000 meters? 
%   (See Tipler Volume 1 6e page 369.) 

% How sensitive is the altitude reached after 4.5 minutes to simpler and 
%   more complicated ways of modelling the gravitational field strength? 
% <put your answer here in these comments>

% What other changes could we make to our model? Refer to, or at least 
%   attempt to explain, the physics behind any changes that you propose. 
% <put your answer here in these comments>

% What is a change that we could make to our model that would result in 
%   insignificant changes to the altitude reached after 4.5 minutes? 
% <put your answer here in these comments>

% How can we decide what change is significant and what change is 
%   insignificant?
% <put your answer here in these comments>

% [What changes did you try out to improve the model?  (Show us your changes
%   even if they didn't make the improvement you hoped for.)]
% <put your answer here in these comments>

part = 4;

% <place your work here>

%% Part 5
% Answer some questions here in these comments...
% At what altitude does Felix pull the ripcord to deploy his parachute? 
% <put your answer here in these comments>

% Recalculate the ACd product with the parachute open, and modify your 
%   code so that you use one ACd product before and one after this altitude. 
%   According to this version of the model, what is the maximum magnitude 
%   of acceleration that Felix experiences? 
% <put your answer here in these comments>

%   How safe or unsafe would such an acceleration be for Felix?
% <put your answer here in these comments>

part = 5;

%Make a single acceleration-plot figure that includes, for each of the 
%model and the acceleration calculated from measurements, the moment when 
%the parachute opens and the following 10 or so seconds. If you have 
%trouble solving this version of the model, just plot the acceleration 
%calculated from measurements. 
% <place your work here>

%% Part 6 
% Answer some questions here in these comments...
% How long does it take for Felix’s parachute to open?
% <put your answer here in these comments>

part = 6;

%Redraw the acceleration figure from the previous Part but using the new 
%   model. Also, using your plotting function from Part 1, plot the 
%   measured/calculated data and the model for the entire jump from 
%   stratosphere to ground.
% <place your work here>

%% nested functions  
% nested functions below are required for the assignment.  
% see Downey Section 10.1 for discussion of nested functions

function res = fall(t, X)
    %FALL <Summary of this function goes here>
    %   <Detailed explanation goes here>

    % do not modify this function unless required by you for some reason! 

    p = X(1); % the first element is position
    v = X(2); % the second element is velocity

    dpdt = v; % velocity: the derivative of position w.r.t. time
    dvdt = acceleration(t, p, v); % acceleration: the derivative of velocity w.r.t. time

    res = [dpdt; dvdt]; % pack the results in a column vector
end

function res = acceleration(t, p, v)
    % <insert description of function here>
    % input...
    % t: time
    % p: position
    % v: velocity
    % output...
    % res: acceleration

    % do not modify this function unless required by you for some reason! 

    a_grav = gravityEst(p); 

    if part == 1 % variable part is from workspace of function main.
        res = -a_grav;
    else
        m = mass(t, v);
        b = drag(t, p, v, m);

        f_drag = b * v^2;
        a_drag = f_drag / m;
        res = -a_grav + a_drag;
    end
end

% Please paste in or type in code into the below functions as may be needed.

function a_grav = gravityEst(p)
    % estimate the acceleration due to gravity as a function of altitude, p
    A_GRAV_SEA = 9.807;  % acceleration of gravity at sea level in m/s^2

    % if part <= % fill in
        a_grav = A_GRAV_SEA;
    % else
        %...
    % end
end

function res = mass(t, v)
    % mass in kg of Felix and all his equipment
    %res = ...;  
end

function res = drag(t, p, v, m)
% <insert description of function here>

    if part == 2
        res = 0.2;
    else
        % air resistance drag = 1/2*rho*A*Cd
        %%%%%%%%%%% input your code here %%%%%%%%%%%%%%%%
        %ACd = ...

    end
end

%% Additional nested functions
% Nest any other functions below.  
%Do not put functions in other files when you submit.

% end of nested functions
end % closes function main.  