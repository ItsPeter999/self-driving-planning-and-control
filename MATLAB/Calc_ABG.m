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

%% 25
vx = 25;
Ac25 = [0     1                       0                   0;
       0      (cf+cr)/(m*vx)          -(cf+cr)/m          (a*cf-b*cr)/(m*vx);
       0      0                       0                   1;
       0      (a*cf-b*cr)/(Iz*vx)     -(a*cf-b*cr)/Iz     (a*a*cf+b*b*cr)/(Iz*vx);];
Bc25 = [0;
      -cf/m;
       0;
      -a*cf/Iz;];
Gc25 = [0;
      (a*cf-b*cr)/(m*vx)-vx;
       0;
      (a*a*cf+b*b*cr)/(Iz*vx);];
fun25 = exp(Ac25*tao);
A25 = exp(Ac25*Ts);
B25 = int(fun25,0,Ts)*Bc25;
G25 = int(fun25,0,Ts)*Gc25;
G25 = double(G25);
B25 = double(B25);




