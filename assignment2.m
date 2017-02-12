function output = assignment2(arg1,arg2,arg3)

filename = 'RedBullStratosData180.xlsx';
[num] = xlsread(filename);
disp(num)




end 
% readtable(filename)
% importdata(filename)

% abvSea = 38969.4;

%testing out tables 
% A = [1; 2; 3; 4; 5; 6];
% B = [{'NaN'}, {'b'}, {'c'}, {'d'}, {'e'}, {'f'}];
% C = [100; 200; 300; 400; 500; 600];

% titles = {'r1'; 'row1'; '3'; '4'; '5'; '6'};
% T = table(A,B,C,'RowNames', titles);
% disp(T)
% T([1,2],:)=[]; %removes r1,r2 subs these for elements contain NaN later?

num = table2array(num);

B = any(num=='NaN',2);  %arg2 is dim, 2=operate on a row by row basis 1 = column by column


if any(B==1,2)  %this is a logic check 
    num(B,:) = [];
disp(num)
end
    
