
% test_x = [1, 2, 3, 4, 5];
% test_v = [1, 4 ,9, 16, 25];
% 
% x_ref = interp1(test_x,test_v,1:0.01:1.24);
% 
% 

% testtttttttttt = [  1
%                     2
%                     3
%                     4];



A = [1 1 3;
     2 5 3;
     1 5 2];
B = [3;
     2;
     4];
C = [4;
     5;
     3];
T = B' * A * B + C;

