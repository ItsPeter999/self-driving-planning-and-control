%% define constants
a = 1.265;
b = 1.682;
cf = -175016;
cr = -130634;
Iz = 4095;
m = 2020;
Ts = 0.01;
syms tao;

%% 1
vx = 1;
Ac1 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc1 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc1 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun1 = exp(Ac1*tao);
A1 = exp(Ac1*Ts);
B1 = int(fun1,0,Ts)*Bc1;
G1 = int(fun1,0,Ts)*Gc1;
G1 = double(G1);
B1 = double(B1);
%% 3
vx = 3;
Ac3 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc3 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc3 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun3 = exp(Ac3*tao);
A3 = exp(Ac3*Ts);
B3 = int(fun3,0,Ts)*Bc3;
G3 = int(fun3,0,Ts)*Gc3;
G3 = double(G3);
B3 = double(B3);
%% 3
vx = 5;
Ac5 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc5 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc5 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun5 = exp(Ac5*tao);
A5 = exp(Ac5*Ts);
B5 = int(fun5,0,Ts)*Bc5;
G5 = int(fun5,0,Ts)*Gc5;
G5 = double(G5);
B5 = double(B5);
%% 7
vx = 7;
Ac7 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc7 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc7 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun7 = exp(Ac7*tao);
A7 = exp(Ac7*Ts);
B7 = int(fun7,0,Ts)*Bc7;
G7 = int(fun7,0,Ts)*Gc7;
G7 = double(G7);
B7 = double(B7);
%% 9
vx = 9;
Ac9 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc9 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc9 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun9 = exp(Ac9*tao);
A9 = exp(Ac9*Ts);
B9 = int(fun9,0,Ts)*Bc9;
G9 = int(fun9,0,Ts)*Gc9;
G9 = double(G9);
B9 = double(B9);
%% 11
vx = 11;
Ac11 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc11 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc11 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun11 = exp(Ac11*tao);
A11 = exp(Ac11*Ts);
B11 = int(fun11,0,Ts)*Bc11;
G11 = int(fun11,0,Ts)*Gc11;
G11 = double(G11);
B11 = double(B11);
%% 12
vx = 12;
Ac12 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc12 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc12 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun12 = exp(Ac12*tao);
A12 = exp(Ac12*Ts);
B12 = int(fun12,0,Ts)*Bc12;
G12 = int(fun12,0,Ts)*Gc12;
G12 = double(G12);
B12 = double(B12);
%% 13
vx = 13;
Ac13 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc13 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc13 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun13 = exp(Ac13*tao);
A13 = exp(Ac13*Ts);
B13 = int(fun13,0,Ts)*Bc13;
G13 = int(fun13,0,Ts)*Gc13;
G13 = double(G13);
B13 = double(B13);
%% 14
vx = 14;
Ac14 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc14 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc14 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun14 = exp(Ac14*tao);
A14 = exp(Ac14*Ts);
B14 = int(fun14,0,Ts)*Bc14;
G14 = int(fun14,0,Ts)*Gc14;
G14 = double(G14);
B14 = double(B14);
%% 15
vx = 15;
Ac15 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc15 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc15 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun15 = exp(Ac15*tao);
A15 = exp(Ac15*Ts);
B15 = int(fun15,0,Ts)*Bc15;
G15 = int(fun15,0,Ts)*Gc15;
G15 = double(G15);
B15 = double(B15);













