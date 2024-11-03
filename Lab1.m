clc
clear
close all

% production planning problem & reallocation of resources

%% Task 1

% maximize profit and optimal reallocation of the working hours

% 1st step: Define the decision variables
% x_i: The quantity of product pi, i = 1,2,3,4
% t_jA: The number of hours transfered from stage j to A, j ∈ {B,C}

% 2nd step: Create the objective function
% max F = 12x1 + 25.5x2 + 13x3 + 20x4

% 3rd step: Build the contraints
% t_BA + t_CA + 160 >= 2*x1 + 2*x2 + 3*x3 + 1*x4
% 200 - t_BA >= 2*x1 + 4*x2 + 3*x3 + 2*x4
% 80 - t_CA >= 4*x1 + 6*x2 + 1*x3 + 5*x4
% t_BA <= 0.2*200 
% t_CA <= 0.3*80
% 0.9*x2 <= x1 -> -x1+0.9x2 <=0
% x1 <= 1.15*x4 -> x1-1.15*x4 <=0
% x1 <= 50
% x2 <= 60
% x3 <= 85
% x4 <= 75
% xi ∈ N, i = 1,...,4
% t_jA ∈ N, j ∈ {B,C}

f = [-12 -25.5 -13 -20 0 0]; % we have to change the sign because linprog func finds the minimum, but we want to find the maximum
% order in all matrixes is very important!
% max f <=> min(-f)
% min f <=> max(-f)
% [x1 x2 x3 x4 t1 t2] - this is the order! 
% t1 is t_BA, t2 is t_CA, we put 0 because they do not appear in the objective function
a1 = [2 2 3 1 -1 -1]; %sign is changing because we have to do expression <= 0
a2 = [2 4 3 2 1 0]; 
a3 = [3 6 1 5 0 1];
a4 = [-1 0.9 0 0 0 0];
a5 = [1 0 0 -1.15 0 0];  

A = [a1; a2; a3; a4; a5];
B = [160 200 80 0 0];
UB = [50 60 85 75 0.2*200 0.3*80]; %upper bound
LB = zeros(1,6); % we dont have lower bound

% [X, obj] = linprog(f, A, B, [], [], LB, UB); % empty brackets because we don't have equality constraints
%obj = -obj; % we need to maximize, but linprog only minimize
% we don't need to produce anything from P1, P2, and we don't need to
% transfer any hours from C to A, we only produce P3 and P4 and have to 
% transfer hours from B to A 

% assume that the products and the working hours are not divisible
% use intlinprog
[X, obj] = intlinprog(f, [1,2,3,4,5,6], A, B, [], [], LB, UB); 
obj = -obj;
% we don't need to produce anything from P1, P2, and we don't need to
% transfer any hours from C to A, we only produce P3 and P4 and have to 
% transfer hours from B to A AND from C to A - now it's a bit different
% from simple linprog

%% Task 2

% [x1 x2 x3 x4 t1 t2] - this is the order! 

f = [32 82 91 70 0 0];

%part from task 1
a1 = [2 2 3 1 -1 -1]; 
a2 = [2 4 3 2 1 0]; 
a3 = [3 6 1 5 0 1];
a4 = [-1 0.9 0 0 0 0];
a5 = [1 0 0 -1.15 0 0];  
A = [a1; a2; a3; a4; a5];
B = [160 200 80 0 0];
UB = [50 60 85 75 0.2*200 0.3*80]; %upper bound
LB = zeros(1,6); % we dont have lower bound

Aeq = [12 25.5 13 20 0 0];
Beq = obj; %834

[X2, obj2] = intlinprog(f, (1:6), A, B, Aeq, Beq, LB, UB);
% same solution, we cannot reduce the carbon emissions

%% Task 3

%same like in task 1
f = [-12 -25.5 -13 -20 0 0];
a1 = [2 2 3 1 -1 -1]; 
a2 = [2 4 3 2 1 0]; 
a3 = [3 6 1 5 0 1];
a4 = [-1 0.9 0 0 0 0];
a5 = [1 0 0 -1.15 0 0]; 

a6 = [32 82 91 70 0 0];
A = [a1; a2; a3; a4; a5; a6];
B = [160 200 80 0 0 4500];

UB = [50 60 85 75 0.2*200 0.3*80]; %upper bound
LB = zeros(1,6); % we dont have lower bound

[X3, obj3] = intlinprog(f, (1:6), A, B, [], [], LB, UB);
obj3 = -obj3;

% generate this graph CO2/profit -> loop with adjusting CO2 parameter with
% step 10,100, whatever, increasing parameter and just plot scores for
% profit

CO2_values = [];
obj3_values = [];

for CO2 = 0:100:5000
    % Update the last value in matrix B
    B(end) = CO2;
    
    % Solve the optimization problem
    [X3, obj3] = intlinprog(f, (1:6), A, B, [], [], LB, UB);
    obj3 = -obj3; 
    
    % Store the results
    CO2_values = [CO2_values CO2];
    obj3_values = [obj3_values obj3];
end

plot(obj3_values, CO2_values, 'k.');
xlabel('Profit');
ylabel('CO2');
title('Profit in the function of CO2');

