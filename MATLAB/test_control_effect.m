%% 规划控制效果测试
% states initialize
t_all = 45;
num = size(LQR_ed,1);
grid = t_all / num;
% speed & steering angle
num2 = size(LQR_angle,1);
grid2 = t_all / num2;

%% 全局路径对比
% 控制效果对比：LQR红色，MPC蓝色，全局路径绿色
% plot(LQR_x_host,LQR_y_host,'r',MPC_x_host,MPC_y_host,'b',MPC_x_host_2,MPC_y_host,'k',EMPC_x_host,EMPC_y_host,'m',global_path_x,global_path_y, 'g');
% legend('LQR', 'MPC', 'MPC2','EMPC','ideal');

%% DYC
plot(grid:grid:t_all,LQR_ed,'r',grid:grid:t_all,before_DYC,'g');
legend('after','before');

%% 跟踪效果对比
% 方向盘转角（输入u）
% plot(grid2:grid2:t_all,LQR_angle,'r',grid2:grid2:t_all,MPC_angle,'b',grid2:grid2:t_all,MPC_angle_2,'k',grid2:grid2:t_all,EMPC_angle,'m');
% legend('LQR', 'MPC', 'MPC2','EMPC');

% 车速
% plot(grid2:grid2:t_all,LQR_speed,'r',grid2:grid2:t_all,MPC_speed,'b',grid2:grid2:t_all,MPC_speed_2,'k',grid2:grid2:t_all,EMPC_speed,'m');
% legend('LQR', 'MPC', 'MPC2','EMPC');

% 横向误差
% plot(grid:grid:t_all,LQR_ed,'r',grid:grid:t_all,MPC_ed,'b',grid:grid:t_all,MPC_ed_2,'k',grid:grid:t_all,EMPC_ed,'m');
% legend('LQR', 'MPC', 'MPC2','EMPC');
% plot(grid:grid:t_all,LQR_ed,'r',grid:grid:t_all,MPC_ed,'b',grid:grid:t_all,MPC_ed_2,'k');
% legend('LQR', 'MPC', 'MPC2');

% 角度误差
% plot(0.012:0.012:45,LQR_ephi,'r',0.012:0.012:45,MPC_ephi,'b',0.012:0.012:45,MPC_ephi_2,'k',0.012:0.012:45,EMPC_ephi,'m');
% legend('LQR', 'MPC', 'MPC2','EMPC');





%% LQR
% 跟踪效果(红色实际，绿色理想)
% plot(LQR_x_host,LQR_y_host,'r',LQR_x_ref,LQR_y_ref,'g');
% legend('real','ideal');

% plot(grid:grid:t_all,LQR_ed,'r');
% legend('LQR');

% 绘制理想轨迹
% plot(LQR_x_ref,LQR_y_ref,'g');
% legend('ideal path');

%% MPC
% 跟踪效果（蓝色实际，绿色理想）
% plot(MPC_x_host,MPC_y_host,'b',MPC_x_ref,MPC_y_ref,'g');
% legend('real','ideal');

% 绘制理想轨迹
% plot(MPC_x_ref,MPC_y_ref,'g');
% legend('ideal path');

%% MPC2
% 跟踪效果（蓝色实际，绿色理想）
% plot(MPC_x_host_2,MPC_y_host_2,'k',MPC_x_ref_2,MPC_y_ref_2,'g');
% legend('real','ideal');

% 绘制理想轨迹
% plot(MPC_x_ref,MPC_y_ref,'g');
% legend('ideal path');

%% EMPC
% 跟踪效果（蓝色实际，绿色理想）
% plot(EMPC_x_host,EMPC_y_host,'m',EMPC_x_ref,EMPC_y_ref,'g');
% legend('real','ideal');

% 绘制理想轨迹
% plot(EMPC_x_ref,EMPC_y_ref,'g');
% legend('ideal path');


