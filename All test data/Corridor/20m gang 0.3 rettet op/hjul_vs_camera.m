clear;
clc;
close;

%% plot

% _____________________________vælg de to tilhørende filer ______________
Name_1 = 'camera_pose.csv';
Name_2 = 'robo_tpose.csv';


camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);
A_1 = table2array(camera_pos_1);
A_2 = table2array(pos_robot_2);

% If any of the data needs too be cut in the plot?
cut=0;
% Afstand til punkt der skal danne vinkel (husk det er gennemsnittet optil punktet)
d = 2;
% for regressionen
cut_1 = 1500;


% Definerer
tal = 0;
theta = 0;
theta_1 = 0;
theta_2 = 0;
theta_3 = 0;
y_1 = 0;
x_c_1 = 0;
y_c_1 = 0;



% regner vinkler og korigerer
x = zeros(length(A_1),1);
y = zeros(length(A_1),1);
L = length(A_1);

for i = 1:L
    y_c_1 = (-A_1(i,3)); 
    
    
    if  y_c_1 >= d && tal == 0       
        theta = (atan((0 - mean(x(1:i,1)))/mean(y(1:i,1))));
        tal = tal + 1;
        
    end
   
    x(i,1) = cos(theta) * A_1(i,1) + sin(theta) * (-A_1(i,3));
    y(i,1) = -sin(theta)*A_1(i,1) + cos(theta) * (-A_1(i,3));
      
end



% Danner en regration
x_reg = A_1(1:end-cut_1,1);
y_reg = (-A_1(1:end-cut_1,3));

mdl1 = fitlm(x_reg,y_reg);

% fulde lineære regration
x_reg = A_1(1:end-cut,1);
y_reg = (-A_1(1:end-cut,3));

mdl2 = fitlm(x_reg,y_reg);



% plot time  
    title('Camera vs Hjul')
    hold on
    
    plot(A_1(1:end-cut,1),-A_1(1:end-cut,3))
    plot(A_2(1:end-cut,1), A_2(1:end-cut,2))
    plot(x(1:end-cut,1), y(1:end-cut,1))
%     r = plot(mdl1) ;
%     delete(r(1))
%     r2 = plot(mdl2) ;
%     delete(r2(1))
    
    
    xlabel('x') 
    ylabel('y')
    legend({'Camera','Hjul','camera_corigeret','Regration', 'fulde Regression'},'Location','southwest')
    hold off



%% 5m
cut =0;
% Type Names of CSV-files
Name_1 = '5.1 camera_pose.csv';
Name_2 = '5.1 robot_pose.csv';
Name_3 = '5.2 camera_pose.csv';
Name_4 = '5.2 robot_pose.csv';
Name_5 = '5.3 camera_pose.csv';
Name_6 = '5.3 robot_pose.csv';
Name_7 = '5.4 camera_pose.csv';
Name_8 = '5.4 robot_pose.csv';
Name_9 = '5.5 camera_pose.csv';
Name_10 = '5.5 robot_pose.csv';
Name_11 = '5.6 camera_pose.csv';
Name_12 = '5.6 robot_pose.csv';
Name_13 = '5.7 camera_pose.csv';
Name_14 = '5.7 robot_pose.csv';
Name_15 = '5.8 camera_pose.csv';
Name_16 = '5.8 robot_pose.csv';
Name_17 = '5.9 camera_pose.csv';
Name_18 = '5.9 robot_pose.csv';
Name_19 = '5.10 camera_pose.csv';
Name_20 = '5.10 robot_pose.csv';


% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);

camera_pos_11= readtable(Name_11, 'ReadVariableNames',true);
[N11,M11]      = size(camera_pos_11);

camera_pos_13= readtable(Name_13, 'ReadVariableNames',true);
[N13,M13]      = size(camera_pos_13);

camera_pos_15= readtable(Name_15, 'ReadVariableNames',true);
[N15,M15]      = size(camera_pos_15);

camera_pos_17= readtable(Name_17, 'ReadVariableNames',true);
[N17,M17]      = size(camera_pos_17);

camera_pos_19= readtable(Name_19, 'ReadVariableNames',true);
[N19,M19]      = size(camera_pos_19);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);

% converts it to an array
A_11 = table2array(camera_pos_11);

% converts it to an array
A_13 = table2array(camera_pos_13);

% converts it to an array
A_15 = table2array(camera_pos_15);


% converts it to an array
A_17 = table2array(camera_pos_17);

% converts it to an array
A_19 = table2array(camera_pos_19);




% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);

pos_robot_12= readtable(Name_12, 'ReadVariableNames',true);
[N12,M12]      = size(pos_robot_12);

pos_robot_14= readtable(Name_14, 'ReadVariableNames',true);
[N14,M14]      = size(pos_robot_14);

pos_robot_16= readtable(Name_16, 'ReadVariableNames',true);
[N16,M16]      = size(pos_robot_16);

pos_robot_18= readtable(Name_18, 'ReadVariableNames',true);
[N18,M18]      = size(pos_robot_18);

pos_robot_20= readtable(Name_20, 'ReadVariableNames',true);
[N20,M20]      = size(pos_robot_20);

% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);

% converts it to an array
A_12 = table2array(pos_robot_12);

% converts it to an array
A_14 = table2array(pos_robot_14);

% converts it to an array
A_16 = table2array(pos_robot_16);

% converts it to an array
A_18 = table2array(pos_robot_18);

% converts it to an array
A_20 = table2array(pos_robot_20);


% _______________________________indsætter og regenr ______________________________________

x_faktisk_1 = -0.11;
x_faktisk_2 = 0;
x_faktisk_3 = 0;
x_faktisk_4 = 0;
x_faktisk_5 = 0;
x_faktisk_6 = 0;
x_faktisk_7 = -0.02;
x_faktisk_8 = -0.03;
x_faktisk_9 = 0;
x_faktisk_10 = -0.02;

% x_faktisk_1 = 0;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;
% x_faktisk_6 = 0;
% x_faktisk_7 = 0;
% x_faktisk_8 = 0;
% x_faktisk_9 = 0;
% x_faktisk_10 = 0;

y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;
y_faktisk_6 = 0;
y_faktisk_7 = 0;
y_faktisk_8 = 0;
y_faktisk_9 = 0;
y_faktisk_10 = 0;


y_faktisk_rob1 = 0;
y_faktisk_rob2 = 0;
y_faktisk_rob3 = 0;
y_faktisk_rob4 = 0;
y_faktisk_rob5 = 0;
y_faktisk_rob6 = 0;
y_faktisk_rob7 = 0;
y_faktisk_rob8 = 0;
y_faktisk_rob9 = 0;
y_faktisk_rob10 = 0;



slutpos_cam_5 = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5; 
    A_11(end-cut,1)-x_faktisk_6, -A_11(end-cut,3)-y_faktisk_6; 
    A_13(end-cut,1)-x_faktisk_7, -A_13(end-cut,3)-y_faktisk_7; 
    A_15(end-cut,1)-x_faktisk_8, -A_15(end-cut,3)-y_faktisk_8; 
    A_17(end-cut,1)-x_faktisk_9, -A_17(end-cut,3)-y_faktisk_9;
    A_19(end-cut,1)-x_faktisk_10, -A_19(end-cut,3)-y_faktisk_10];



slutpos_rob_5 = [A_2(end-cut,1)-x_faktisk_1, A_2(end-cut,2)-y_faktisk_rob1; 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_rob2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_rob3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_rob4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_rob5; 
    A_12(end-cut,1)-x_faktisk_6, A_12(end-cut,2)-y_faktisk_rob6; 
    A_14(end-cut,1)-x_faktisk_7, A_14(end-cut,2)-y_faktisk_rob7; 
    A_16(end-cut,1)-x_faktisk_8, A_16(end-cut,2)-y_faktisk_rob8; 
    A_18(end-cut,1)-x_faktisk_9, A_18(end-cut,2)-y_faktisk_rob9;
    A_20(end-cut,1)-x_faktisk_10, A_20(end-cut,2)-y_faktisk_rob10];


% ________________________________ Regner _______________________________
Gennemsnit_cam_5 = mean(slutpos_cam_5)
Varians_cam_5 = var(slutpos_cam_5)
Kovarians_cam_5 = cov(slutpos_cam_5)
Staandard_var_cam_5 = std(slutpos_cam_5)


Gennemsnit_rob_5 = mean(slutpos_rob_5)
Varians_rob_5 = var(slutpos_rob_5)
Kovarians_rob_5 = cov(slutpos_rob_5)
Staandard_var_rob_5 = std(slutpos_rob_5)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_5(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_5(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_5(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_5(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_5(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_5(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_5(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_5(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_5(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_5(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')

%% 10m 

% Type Names of CSV-files
Name_1 = '10.1 camera_pose.csv';
Name_2 = '10.1 robot_pose.csv';
Name_3 = '10.2 camera_pose.csv';
Name_4 = '10.2 robot_pose.csv';
Name_5 = '10.3 camera_pose.csv';
Name_6 = '10.3 robot_pose.csv';
Name_7 = '10.4 camera_pose.csv';
Name_8 = '10.4 robot_pose.csv';
Name_9 = '10.5 camera_pose.csv';
Name_10 = '10.5 robot_pose.csv';
Name_11 = '10.6 camera_pose.csv';
Name_12 = '10.6 robot_pose.csv';
Name_13 = '10.7 camera_pose.csv';
Name_14 = '10.7 robot_pose.csv';
Name_15 = '10.8 camera_pose.csv';
Name_16 = '10.8 robot_pose.csv';
Name_17 = '10.9 camera_pose.csv';
Name_18 = '10.9 robot_pose.csv';
Name_19 = '10.10 camera_pose.csv';
Name_20 = '10.10 robot_pose.csv';


% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);

camera_pos_11= readtable(Name_11, 'ReadVariableNames',true);
[N11,M11]      = size(camera_pos_11);

camera_pos_13= readtable(Name_13, 'ReadVariableNames',true);
[N13,M13]      = size(camera_pos_13);

camera_pos_15= readtable(Name_15, 'ReadVariableNames',true);
[N15,M15]      = size(camera_pos_15);

camera_pos_17= readtable(Name_17, 'ReadVariableNames',true);
[N17,M17]      = size(camera_pos_17);

camera_pos_19= readtable(Name_19, 'ReadVariableNames',true);
[N19,M19]      = size(camera_pos_19);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);

% converts it to an array
A_11 = table2array(camera_pos_11);

% converts it to an array
A_13 = table2array(camera_pos_13);

% converts it to an array
A_15 = table2array(camera_pos_15);


% converts it to an array
A_17 = table2array(camera_pos_17);

% converts it to an array
A_19 = table2array(camera_pos_19);




% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);

pos_robot_12= readtable(Name_12, 'ReadVariableNames',true);
[N12,M12]      = size(pos_robot_12);

pos_robot_14= readtable(Name_14, 'ReadVariableNames',true);
[N14,M14]      = size(pos_robot_14);

pos_robot_16= readtable(Name_16, 'ReadVariableNames',true);
[N16,M16]      = size(pos_robot_16);

pos_robot_18= readtable(Name_18, 'ReadVariableNames',true);
[N18,M18]      = size(pos_robot_18);

pos_robot_20= readtable(Name_20, 'ReadVariableNames',true);
[N20,M20]      = size(pos_robot_20);

% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);

% converts it to an array
A_12 = table2array(pos_robot_12);

% converts it to an array
A_14 = table2array(pos_robot_14);

% converts it to an array
A_16 = table2array(pos_robot_16);

% converts it to an array
A_18 = table2array(pos_robot_18);

% converts it to an array
A_20 = table2array(pos_robot_20);


% _______________________________indsætter og regenr ______________________________________

x_faktisk_1 = 0;
x_faktisk_2 = -0.25;
x_faktisk_3 = - 0.120;
x_faktisk_4 = 0.10;
x_faktisk_5 = 0.05;
x_faktisk_6 = 0;
x_faktisk_7 = -0.01;
x_faktisk_8 = -0.16;
x_faktisk_9 = -0.17;
x_faktisk_10 = -0.30;

% x_faktisk_1 = 0;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;
% x_faktisk_6 = 0;
% x_faktisk_7 = 0;
% x_faktisk_8 = 0;
% x_faktisk_9 = 0;
% x_faktisk_10 = 0;

y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;
y_faktisk_6 = 0;
y_faktisk_7 = 0;
y_faktisk_8 = 0;
y_faktisk_9 = 0;
y_faktisk_10 = 0;

%y_faktisk_rob1 = 10-9.985
y_faktisk_rob1 = 0;
y_faktisk_rob2 = 0;
y_faktisk_rob3 = 0;
y_faktisk_rob4 = 0;
y_faktisk_rob5 = 0;
y_faktisk_rob6 = 0;
y_faktisk_rob7 = 0;
y_faktisk_rob8 = 0;
y_faktisk_rob9 = 0;
y_faktisk_rob10 = 0;


slutpos_cam_10 = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5; 
    A_11(end-cut,1)-x_faktisk_6, -A_11(end-cut,3)-y_faktisk_6; 
    A_13(end-cut,1)-x_faktisk_7, -A_13(end-cut,3)-y_faktisk_7; 
    A_15(end-cut,1)-x_faktisk_8, -A_15(end-cut,3)-y_faktisk_8; 
    A_17(end-cut,1)-x_faktisk_9, -A_17(end-cut,3)-y_faktisk_9;
    A_19(end-cut,1)-x_faktisk_10, -A_19(end-cut,3)-y_faktisk_10];



slutpos_rob_10 = [A_2(end-cut,1)-x_faktisk_1, A_2(end-cut,2)-y_faktisk_rob1; 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_rob2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_rob3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_rob4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_rob5; 
    A_12(end-cut,1)-x_faktisk_6, A_12(end-cut,2)-y_faktisk_rob6; 
    A_14(end-cut,1)-x_faktisk_7, A_14(end-cut,2)-y_faktisk_rob7; 
    A_16(end-cut,1)-x_faktisk_8, A_16(end-cut,2)-y_faktisk_rob8; 
    A_18(end-cut,1)-x_faktisk_9, A_18(end-cut,2)-y_faktisk_rob9;
    A_20(end-cut,1)-x_faktisk_10, A_20(end-cut,2)-y_faktisk_rob10];



% ________________________________ Regner _______________________________
Gennemsnit_cam_10 = mean(slutpos_cam_10)
Varians_cam_10 = var(slutpos_cam_10)
Kovarians_cam_10 = cov(slutpos_cam_10)
Staandard_var_cam_10 = std(slutpos_cam_10)


Gennemsnit_rob_10 = mean(slutpos_rob_10)
Varians_rob_10 = var(slutpos_rob_10)
Kovarians_rob_10 = cov(slutpos_rob_10)
Staandard_var_rob_10 = std(slutpos_rob_10)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_10(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_10(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_10(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_10(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_10(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_10(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_10(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_10(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_10(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_10(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')



%% 10m-Slowly

% Type Names of CSV-files
Name_1 = '10.1-Slowly camera_pose.csv';
Name_2 = '10.1-Slowly robot_pose.csv';
Name_3 = '10.2-Slowly camera_pose.csv';
Name_4 = '10.2-Slowly robot_pose.csv';
Name_5 = '10.3-Slowly camera_pose.csv';
Name_6 = '10.3-Slowly robot_pose.csv';
Name_7 = '10.4-Slowly camera_pose.csv';
Name_8 = '10.4-Slowly robot_pose.csv';
Name_9 = '10.5-Slowly camera_pose.csv';
Name_10 = '10.5-Slowly robot_pose.csv';


% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);


% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);


% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);


% _______________________________indsætter og regenr ______________________________________

% x_faktisk_1 = -0.11;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;


x_faktisk_1 = 0;
x_faktisk_2 = 0;
x_faktisk_3 = 0;
x_faktisk_4 = 0;
x_faktisk_5 = 0;


y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;


slutpos_cam_10_Slowly = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5]; 


slutpos_rob_10_Slowly = [A_2(end-cut,1)-y_faktisk_1, A_2(end-cut,2); 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_5];



% ________________________________ Regner _______________________________
Gennemsnit_cam_10_Slowly = mean(slutpos_cam_10_Slowly)
Varians_cam_10_Slowly = var(slutpos_cam_10_Slowly)
Kovarians_cam_10_Slowly = cov(slutpos_cam_10_Slowly)
Staandard_var_cam_10_Slowly = std(slutpos_cam_10_Slowly)


Gennemsnit_rob_10_Slowly = mean(slutpos_rob_10_Slowly)
Varians_rob_10_Slowly = var(slutpos_rob_10_Slowly)
Kovarians_rob_10_Slowly = cov(slutpos_rob_10_Slowly)
Staandard_var_rob_10_Slowly = std(slutpos_rob_10_Slowly)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_10_Slowly(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_10_Slowly(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_10_Slowly(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_10_Slowly(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_10_Slowly(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_10_Slowly(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_10_Slowly(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_10_Slowly(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_10_Slowly(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_10_Slowly(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')


%% 10m-Individual

% Type Names of CSV-files
Name_1 = '10.1-Individual camera_pose.csv';
Name_2 = '10.1-Individual robot_pose.csv';
Name_3 = '10.2-Individual camera_pose.csv';
Name_4 = '10.2-Individual robot_pose.csv';
Name_5 = '10.3-Individual camera_pose.csv';
Name_6 = '10.3-Individual robot_pose.csv';
Name_7 = '10.4-Individual camera_pose.csv';
Name_8 = '10.4-Individual robot_pose.csv';


% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);



% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);


% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);


% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);


% _______________________________indsætter og regenr ______________________________________

% x_faktisk_1 = -0.11;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;


x_faktisk_1 = 0;
x_faktisk_2 = 0;
x_faktisk_3 = 0;
x_faktisk_4 = 0;


y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;


slutpos_cam_10_Individual = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4];


slutpos_rob_10_Individual = [A_2(end-cut,1)-y_faktisk_1, A_2(end-cut,2); 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_4];


% ________________________________ Regner _______________________________
Gennemsnit_cam_10_Individual = mean(slutpos_cam_10_Individual)
Varians_cam_10_Individual = var(slutpos_cam_10_Individual)
Kovarians_cam_10_Individual = cov(slutpos_cam_10_Individual)
Staandard_var_cam_10_Individual = std(slutpos_cam_10_Individual)


Gennemsnit_rob_10_Individual = mean(slutpos_rob_10_Individual)
Varians_rob_10_Individual = var(slutpos_rob_10_Individual)
Kovarians_rob_10_Individual = cov(slutpos_rob_10_Individual)
Staandard_var_rob_10_Individual = std(slutpos_rob_10_Individual)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_10_Individual(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_10_Individual(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_10_Individual(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_10_Individual(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_10_Individual(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_10_Individual(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_10_Individual(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_10_Individual(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_10_Individual(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_10_Individual(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')




%% 10m-Dog

% Type Names of CSV-files
Name_1 = '10.1-Dog camera_pose.csv';
Name_2 = '10.1-Dog robot_pose.csv';
Name_3 = '10.2-Dog camera_pose.csv';
Name_4 = '10.2-Dog robot_pose.csv';
Name_5 = '10.3-Dog camera_pose.csv';
Name_6 = '10.3-Dog robot_pose.csv';
Name_7 = '10.4-Dog camera_pose.csv';
Name_8 = '10.4-Dog robot_pose.csv';
Name_9 = '10.5-Dog camera_pose.csv';
Name_10 = '10.5-Dog robot_pose.csv';
Name_11 = '10.6-Dog camera_pose.csv';
Name_12 = '10.6-Dog robot_pose.csv';
Name_13 = '10.7-Dog camera_pose.csv';
Name_14 = '10.7-Dog robot_pose.csv';
Name_15 = '10.8-Dog camera_pose.csv';
Name_16 = '10.8-Dog robot_pose.csv';
Name_17 = '10.9-Dog camera_pose.csv';
Name_18 = '10.9-Dog robot_pose.csv';
Name_19 = '10.10-Dog camera_pose.csv';
Name_20 = '10.10-Dog robot_pose.csv';

% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);

camera_pos_11= readtable(Name_11, 'ReadVariableNames',true);
[N11,M11]      = size(camera_pos_11);

camera_pos_13= readtable(Name_13, 'ReadVariableNames',true);
[N13,M13]      = size(camera_pos_13);

camera_pos_15= readtable(Name_15, 'ReadVariableNames',true);
[N15,M15]      = size(camera_pos_15);

camera_pos_17= readtable(Name_17, 'ReadVariableNames',true);
[N17,M17]      = size(camera_pos_17);

camera_pos_19= readtable(Name_19, 'ReadVariableNames',true);
[N19,M19]      = size(camera_pos_19);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);

% converts it to an array
A_11 = table2array(camera_pos_11);

% converts it to an array
A_13 = table2array(camera_pos_13);

% converts it to an array
A_15 = table2array(camera_pos_15);


% converts it to an array
A_17 = table2array(camera_pos_17);

% converts it to an array
A_19 = table2array(camera_pos_19);




% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);

pos_robot_12= readtable(Name_12, 'ReadVariableNames',true);
[N12,M12]      = size(pos_robot_12);

pos_robot_14= readtable(Name_14, 'ReadVariableNames',true);
[N14,M14]      = size(pos_robot_14);

pos_robot_16= readtable(Name_16, 'ReadVariableNames',true);
[N16,M16]      = size(pos_robot_16);

pos_robot_18= readtable(Name_18, 'ReadVariableNames',true);
[N18,M18]      = size(pos_robot_18);

pos_robot_20= readtable(Name_20, 'ReadVariableNames',true);
[N20,M20]      = size(pos_robot_20);

% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);

% converts it to an array
A_12 = table2array(pos_robot_12);

% converts it to an array
A_14 = table2array(pos_robot_14);

% converts it to an array
A_16 = table2array(pos_robot_16);

% converts it to an array
A_18 = table2array(pos_robot_18);

% converts it to an array
A_20 = table2array(pos_robot_20);


% _______________________________indsætter og regenr ______________________________________

x_faktisk_1 = -0.20;
x_faktisk_2 = 0.025;
x_faktisk_3 = -0.24;
x_faktisk_4 = 0.05;
x_faktisk_5 = -0.11;
x_faktisk_6 = 0.045;
x_faktisk_7 = 0.10;
x_faktisk_8 = 0.05;
x_faktisk_9 = -0.22;
x_faktisk_10 = -0.06;

% x_faktisk_1 = 0;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;
% x_faktisk_6 = 0;
% x_faktisk_7 = 0;
% x_faktisk_8 = 0;
% x_faktisk_9 = 0;
% x_faktisk_10 = 0;

y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;
y_faktisk_6 = 0;
y_faktisk_7 = 0;
y_faktisk_8 = 0;
y_faktisk_9 = 0;
y_faktisk_10 = 0;


slutpos_cam_10_Dog = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5; 
    A_11(end-cut,1)-x_faktisk_6, -A_11(end-cut,3)-y_faktisk_6; 
    A_13(end-cut,1)-x_faktisk_7, -A_13(end-cut,3)-y_faktisk_7; 
    A_15(end-cut,1)-x_faktisk_8, -A_15(end-cut,3)-y_faktisk_8; 
    A_17(end-cut,1)-x_faktisk_9, -A_17(end-cut,3)-y_faktisk_9;
    A_19(end-cut,1)-x_faktisk_10, -A_19(end-cut,3)-y_faktisk_10];



slutpos_rob_10_Dog = [A_2(end-cut,1)-y_faktisk_1, A_2(end-cut,2); 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_5; 
    A_12(end-cut,1)-x_faktisk_6, A_12(end-cut,2)-y_faktisk_6; 
    A_14(end-cut,1)-x_faktisk_7, A_14(end-cut,2)-y_faktisk_7; 
    A_16(end-cut,1)-x_faktisk_8, A_16(end-cut,2)-y_faktisk_8; 
    A_18(end-cut,1)-x_faktisk_9, A_18(end-cut,2)-y_faktisk_9;
    A_20(end-cut,1)-x_faktisk_10, A_20(end-cut,2)-y_faktisk_10];


% ________________________________ Regner _______________________________
Gennemsnit_cam_10_Dog = mean(slutpos_cam_10_Dog)
Varians_cam_10_Dog = var(slutpos_cam_10_Dog)
Kovarians_cam_10_Dog = cov(slutpos_cam_10_Dog)
Staandard_var_cam_10_Dog = std(slutpos_cam_10_Dog)


Gennemsnit_rob_10_Dog = mean(slutpos_rob_10_Dog)
Varians_rob_10_Dog = var(slutpos_rob_10_Dog)
Kovarians_rob_10_Dog = cov(slutpos_rob_10_Dog)
Staandard_var_rob_10_Dog = std(slutpos_rob_10_Dog)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_10_Dog(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_10_Dog(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_10_Dog(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_10_Dog(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_10_Dog(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_10_Dog(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_10_Dog(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_10_Dog(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_10_Dog(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_10_Dog(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')


%% 15m

% Type Names of CSV-files
Name_1 = '15.1 camera_pose.csv';
Name_2 = '15.1 robot_pose.csv';
Name_3 = '15.2 camera_pose.csv';
Name_4 = '15.2 robot_pose.csv';
Name_5 = '15.3 camera_pose.csv';
Name_6 = '15.3 robot_pose.csv';
Name_7 = '15.4 camera_pose.csv';
Name_8 = '15.4 robot_pose.csv';
Name_9 = '15.5 camera_pose.csv';
Name_10 = '15.5 robot_pose.csv';
Name_11 = '15.6 camera_pose.csv';
Name_12 = '15.6 robot_pose.csv';
Name_13 = '15.7 camera_pose.csv';
Name_14 = '15.7 robot_pose.csv';
Name_15 = '15.8 camera_pose.csv';
Name_16 = '15.8 robot_pose.csv';
Name_17 = '15.9 camera_pose.csv';
Name_18 = '15.9 robot_pose.csv';
Name_19 = '15.10 camera_pose.csv';
Name_20 = '15.10 robot_pose.csv';

% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);

camera_pos_11= readtable(Name_11, 'ReadVariableNames',true);
[N11,M11]      = size(camera_pos_11);

camera_pos_13= readtable(Name_13, 'ReadVariableNames',true);
[N13,M13]      = size(camera_pos_13);

camera_pos_15= readtable(Name_15, 'ReadVariableNames',true);
[N15,M15]      = size(camera_pos_15);

camera_pos_17= readtable(Name_17, 'ReadVariableNames',true);
[N17,M17]      = size(camera_pos_17);

camera_pos_19= readtable(Name_19, 'ReadVariableNames',true);
[N19,M19]      = size(camera_pos_19);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);

% converts it to an array
A_11 = table2array(camera_pos_11);

% converts it to an array
A_13 = table2array(camera_pos_13);

% converts it to an array
A_15 = table2array(camera_pos_15);


% converts it to an array
A_17 = table2array(camera_pos_17);

% converts it to an array
A_19 = table2array(camera_pos_19);



% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);

pos_robot_12= readtable(Name_12, 'ReadVariableNames',true);
[N12,M12]      = size(pos_robot_12);

pos_robot_14= readtable(Name_14, 'ReadVariableNames',true);
[N14,M14]      = size(pos_robot_14);

pos_robot_16= readtable(Name_16, 'ReadVariableNames',true);
[N16,M16]      = size(pos_robot_16);

pos_robot_18= readtable(Name_18, 'ReadVariableNames',true);
[N18,M18]      = size(pos_robot_18);

pos_robot_20= readtable(Name_20, 'ReadVariableNames',true);
[N20,M20]      = size(pos_robot_20);

% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);

% converts it to an array
A_12 = table2array(pos_robot_12);

% converts it to an array
A_14 = table2array(pos_robot_14);

% converts it to an array
A_16 = table2array(pos_robot_16);

% converts it to an array
A_18 = table2array(pos_robot_18);

% converts it to an array
A_20 = table2array(pos_robot_20);


% _______________________________indsætter og regenr ______________________________________

x_faktisk_1 = -0.25;
x_faktisk_2 = 0;
x_faktisk_3 = -0.10;
x_faktisk_4 = -0.26;
x_faktisk_5 = -0.12;
x_faktisk_6 = -0.79;
x_faktisk_7 = -0.14;
x_faktisk_8 = 0.03;
x_faktisk_9 = -0.30;
x_faktisk_10 = -0.08;

% x_faktisk_1 = 0;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;
% x_faktisk_6 = 0;
% x_faktisk_7 = 0;
% x_faktisk_8 = 0;
% x_faktisk_9 = 0;
% x_faktisk_10 = 0;

y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;
y_faktisk_6 = 0;
y_faktisk_7 = 0;
y_faktisk_8 = 0;
y_faktisk_9 = 0;
y_faktisk_10 = 0;


slutpos_cam_15 = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5; 
    A_11(end-cut,1)-x_faktisk_6, -A_11(end-cut,3)-y_faktisk_6; 
    A_13(end-cut,1)-x_faktisk_7, -A_13(end-cut,3)-y_faktisk_7; 
    A_15(end-cut,1)-x_faktisk_8, -A_15(end-cut,3)-y_faktisk_8; 
    A_17(end-cut,1)-x_faktisk_9, -A_17(end-cut,3)-y_faktisk_9;
    A_19(end-cut,1)-x_faktisk_10, -A_19(end-cut,3)-y_faktisk_10];



slutpos_rob_15 = [A_2(end-cut,1)-y_faktisk_1, A_2(end-cut,2); 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_5; 
    A_12(end-cut,1)-x_faktisk_6, A_12(end-cut,2)-y_faktisk_6; 
    A_14(end-cut,1)-x_faktisk_7, A_14(end-cut,2)-y_faktisk_7; 
    A_16(end-cut,1)-x_faktisk_8, A_16(end-cut,2)-y_faktisk_8; 
    A_18(end-cut,1)-x_faktisk_9, A_18(end-cut,2)-y_faktisk_9;
    A_20(end-cut,1)-x_faktisk_10, A_20(end-cut,2)-y_faktisk_10];


% ________________________________ Regner _______________________________
Gennemsnit_cam_15 = mean(slutpos_cam_15)
Varians_cam_15 = var(slutpos_cam_15)
Kovarians_cam_15 = cov(slutpos_cam_15)
Staandard_var_cam_15 = std(slutpos_cam_15)


Gennemsnit_rob_15 = mean(slutpos_rob_15)
Varians_rob_15 = var(slutpos_rob_15)
Kovarians_rob_15 = cov(slutpos_rob_15)
Staandard_var_rob_15 = std(slutpos_rob_15)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_15(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_15(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_15(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_15(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_15(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_15(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_15(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_15(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_15(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_15(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')


%% 20m

% Type Names of CSV-files
Name_1 = '20.1 camera_pose.csv';
Name_2 = '20.1 robot_pose.csv';
Name_3 = '20.2 camera_pose.csv';
Name_4 = '20.2 robot_pose.csv';
Name_5 = '20.3 camera_pose.csv';
Name_6 = '20.3 robot_pose.csv';
Name_7 = '20.4 camera_pose.csv';
Name_8 = '20.4 robot_pose.csv';
Name_9 = '20.5 camera_pose.csv';
Name_10 = '20.5 robot_pose.csv';
Name_11 = '20.6 camera_pose.csv';
Name_12 = '20.6 robot_pose.csv';
Name_13 = '20.7 camera_pose.csv';
Name_14 = '20.7 robot_pose.csv';
Name_15 = '20.8 camera_pose.csv';
Name_16 = '20.8 robot_pose.csv';
Name_17 = '20.9 camera_pose.csv';
Name_18 = '20.9 robot_pose.csv';
Name_19 = '20.10 camera_pose.csv';
Name_20 = '20.10 robot_pose.csv';

% _____________________ indlæser filerne______________________________

camera_pos_1= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos_1);

camera_pos_3= readtable(Name_3, 'ReadVariableNames',true);
[N3,M3]      = size(camera_pos_3);

camera_pos_5= readtable(Name_5, 'ReadVariableNames',true);
[N5,M5]      = size(camera_pos_5);

camera_pos_7= readtable(Name_7, 'ReadVariableNames',true);
[N7,M7]      = size(camera_pos_7);

camera_pos_9= readtable(Name_9, 'ReadVariableNames',true);
[N9,M9]      = size(camera_pos_9);

camera_pos_11= readtable(Name_11, 'ReadVariableNames',true);
[N11,M11]      = size(camera_pos_11);

camera_pos_13= readtable(Name_13, 'ReadVariableNames',true);
[N13,M13]      = size(camera_pos_13);

camera_pos_15= readtable(Name_15, 'ReadVariableNames',true);
[N15,M15]      = size(camera_pos_15);

camera_pos_17= readtable(Name_17, 'ReadVariableNames',true);
[N17,M17]      = size(camera_pos_17);

camera_pos_19= readtable(Name_19, 'ReadVariableNames',true);
[N19,M19]      = size(camera_pos_19);


% converts it to an array
A_1 = table2array(camera_pos_1);

% converts it to an array
A_3 = table2array(camera_pos_3);

% converts it to an array
A_5 = table2array(camera_pos_5);

% converts it to an array
A_7 = table2array(camera_pos_7);

% converts it to an array
A_9 = table2array(camera_pos_9);

% converts it to an array
A_11 = table2array(camera_pos_11);

% converts it to an array
A_13 = table2array(camera_pos_13);

% converts it to an array
A_15 = table2array(camera_pos_15);


% converts it to an array
A_17 = table2array(camera_pos_17);

% converts it to an array
A_19 = table2array(camera_pos_19);



% Fil 2
pos_robot_2= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot_2);

pos_robot_4= readtable(Name_4, 'ReadVariableNames',true);
[N4,M4]      = size(pos_robot_4);

pos_robot_6= readtable(Name_6, 'ReadVariableNames',true);
[N6,M6]      = size(pos_robot_6);

pos_robot_8= readtable(Name_8, 'ReadVariableNames',true);
[N8,M8]      = size(pos_robot_8);

pos_robot_10= readtable(Name_10, 'ReadVariableNames',true);
[N10,M10]      = size(pos_robot_10);

pos_robot_12= readtable(Name_12, 'ReadVariableNames',true);
[N12,M12]      = size(pos_robot_12);

pos_robot_14= readtable(Name_14, 'ReadVariableNames',true);
[N14,M14]      = size(pos_robot_14);

pos_robot_16= readtable(Name_16, 'ReadVariableNames',true);
[N16,M16]      = size(pos_robot_16);

pos_robot_18= readtable(Name_18, 'ReadVariableNames',true);
[N18,M18]      = size(pos_robot_18);

pos_robot_20= readtable(Name_20, 'ReadVariableNames',true);
[N20,M20]      = size(pos_robot_20);

% converts it to an array
A_2 = table2array(pos_robot_2);

% converts it to an array
A_4 = table2array(pos_robot_4);

% converts it to an array
A_6 = table2array(pos_robot_6);

% converts it to an array
A_8 = table2array(pos_robot_8);

% converts it to an array
A_10 = table2array(pos_robot_10);

% converts it to an array
A_12 = table2array(pos_robot_12);

% converts it to an array
A_14 = table2array(pos_robot_14);

% converts it to an array
A_16 = table2array(pos_robot_16);

% converts it to an array
A_18 = table2array(pos_robot_18);

% converts it to an array
A_20 = table2array(pos_robot_20);


% _______________________________indsætter og regenr ______________________________________

x_faktisk_1 = 0.01;
x_faktisk_2 = -0.34;
x_faktisk_3 = 0.5;
x_faktisk_4 = 0.12;
x_faktisk_5 = 0.07;
x_faktisk_6 = -0.30;
x_faktisk_7 = -0.10;
x_faktisk_8 = -0.25;
x_faktisk_9 = -0.30;
x_faktisk_10 = 0.00;

y_faktisk_1 = 0;
y_faktisk_2 = 0;
y_faktisk_3 = 0;
y_faktisk_4 = 0;
y_faktisk_5 = 0;
y_faktisk_6 = -0.02;
y_faktisk_7 = -0.005;
y_faktisk_8 =  0.005;
y_faktisk_9 = -0.01;
y_faktisk_10 = 0;

% x_faktisk_1 = 0;
% x_faktisk_2 = 0;
% x_faktisk_3 = 0;
% x_faktisk_4 = 0;
% x_faktisk_5 = 0;
% x_faktisk_6 = 0;
% x_faktisk_7 = 0;
% x_faktisk_8 = 0;
% x_faktisk_9 = 0;
% x_faktisk_10 = 0;

% y_faktisk_1 = 0;
% y_faktisk_2 = 0;
% y_faktisk_3 = 0;
% y_faktisk_4 = 0;
% y_faktisk_5 = 0;
% y_faktisk_6 = 0;
% y_faktisk_7 = 0;
% y_faktisk_8 = 0;
% y_faktisk_9 = 0;
% y_faktisk_10 = 0;


slutpos_cam_20 = [A_1(end-cut,1)-x_faktisk_1, -A_1(end-cut,3)-y_faktisk_1; 
    A_3(end-cut,1)-x_faktisk_2, -A_3(end-cut,3)-y_faktisk_2;
    A_5(end-cut,1)-x_faktisk_3, -A_5(end-cut,3)-y_faktisk_3; 
    A_7(end-cut,1)-x_faktisk_4, -A_7(end-cut,3)-y_faktisk_4;
    A_9(end-cut,1)-x_faktisk_5, -A_9(end-cut,3)-y_faktisk_5; 
    A_11(end-cut,1)-x_faktisk_6, -A_11(end-cut,3)-y_faktisk_6; 
    A_13(end-cut,1)-x_faktisk_7, -A_13(end-cut,3)-y_faktisk_7; 
    A_15(end-cut,1)-x_faktisk_8, -A_15(end-cut,3)-y_faktisk_8; 
    A_17(end-cut,1)-x_faktisk_9, -A_17(end-cut,3)-y_faktisk_9;
    A_19(end-cut,1)-x_faktisk_10, -A_19(end-cut,3)-y_faktisk_10];



slutpos_rob_20 = [A_2(end-cut,1)-y_faktisk_1, A_2(end-cut,2); 
    A_4(end-cut,1)-x_faktisk_2, A_4(end-cut,2)-y_faktisk_2; 
    A_6(end-cut,1)-x_faktisk_3, A_6(end-cut,2)-y_faktisk_3; 
    A_8(end-cut,1)-x_faktisk_4, A_8(end-cut,2)-y_faktisk_4;
    A_10(end-cut,1)-x_faktisk_5, A_10(end-cut,2)-y_faktisk_5; 
    A_12(end-cut,1)-x_faktisk_6, A_12(end-cut,2)-y_faktisk_6; 
    A_14(end-cut,1)-x_faktisk_7, A_14(end-cut,2)-y_faktisk_7; 
    A_16(end-cut,1)-x_faktisk_8, A_16(end-cut,2)-y_faktisk_8; 
    A_18(end-cut,1)-x_faktisk_9, A_18(end-cut,2)-y_faktisk_9;
    A_20(end-cut,1)-x_faktisk_10, A_20(end-cut,2)-y_faktisk_10];


% ________________________________ Regner _______________________________
Gennemsnit_cam_20 = mean(slutpos_cam_20)
Varians_cam_20 = var(slutpos_cam_20)
Kovarians_cam_20 = cov(slutpos_cam_20)
Staandard_var_cam_20 = std(slutpos_cam_20)


Gennemsnit_rob_20 = mean(slutpos_rob_20)
Varians_rob_20 = var(slutpos_rob_20)
Kovarians_rob_20 = cov(slutpos_rob_20)
Staandard_var_rob_20 = std(slutpos_rob_20)

% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(slutpos_cam_20(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')
subplot(2,2,2)
hist(slutpos_rob_20(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Wheel x deviation')
subplot(2,2,3)
hist(slutpos_cam_20(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')
subplot(2,2,4)
hist(slutpos_rob_20(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Wheel y deviation')

figure
subplot(2,1,1)
qqplot(slutpos_cam_20(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(slutpos_cam_20(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(slutpos_cam_20(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(slutpos_cam_20(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(slutpos_cam_20(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(slutpos_cam_20(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')


%% array til værdier og print i csv



Value_array = [Gennemsnit_cam_5(1), Gennemsnit_cam_5(2), Varians_cam_5(1), Varians_cam_5(2), Staandard_var_cam_5(1), Staandard_var_cam_5(2), min(slutpos_cam_5(1:end,1)), min(slutpos_cam_5(1:end,2)), max(slutpos_cam_5(1:end,1)), max(slutpos_cam_5(1:end,2));
    Gennemsnit_cam_10(1), Gennemsnit_cam_10(2), Varians_cam_10(1), Varians_cam_10(2), Staandard_var_cam_10(1), Staandard_var_cam_10(2), min(slutpos_cam_10(1:end,1)), min(slutpos_cam_10(1:end,2)), max(slutpos_cam_10(1:end,1)), max(slutpos_cam_10(1:end,2));
    Gennemsnit_cam_15(1), Gennemsnit_cam_15(2), Varians_cam_15(1), Varians_cam_15(2), Staandard_var_cam_15(1), Staandard_var_cam_15(2), min(slutpos_cam_15(1:end,1)), min(slutpos_cam_15(1:end,2)), max(slutpos_cam_15(1:end,1)), max(slutpos_cam_15(1:end,2));
    Gennemsnit_cam_20(1), Gennemsnit_cam_20(2), Varians_cam_20(1), Varians_cam_20(2), Staandard_var_cam_20(1), Staandard_var_cam_20(2), min(slutpos_cam_20(1:end,1)), min(slutpos_cam_20(1:end,2)), max(slutpos_cam_20(1:end,1)), max(slutpos_cam_20(1:end,2));
    Gennemsnit_cam_10_Individual(1), Gennemsnit_cam_10_Individual(2), Varians_cam_10_Individual(1), Varians_cam_10_Individual(2), Staandard_var_rob_10_Individual(1), Staandard_var_rob_10_Individual(2), min(slutpos_cam_10_Individual(1:end,1)), min(slutpos_cam_10_Individual(1:end,2)), max(slutpos_cam_10_Individual(1:end,1)), max(slutpos_cam_10_Individual(1:end,2));
    Gennemsnit_cam_10_Dog(1), Gennemsnit_cam_10_Dog(2), Varians_cam_10_Dog(1), Varians_cam_10_Dog(2), Staandard_var_cam_10_Dog(1), Staandard_var_cam_10_Dog(2), min(slutpos_cam_10_Dog(1:end,1)), min(slutpos_cam_10_Dog(1:end,2)), max(slutpos_cam_10_Dog(1:end,1)), max(slutpos_cam_10_Dog(1:end,2));
    Gennemsnit_cam_10_Slowly(1), Gennemsnit_cam_10_Slowly(2), Varians_cam_10_Slowly(1), Varians_cam_10_Slowly(2), Staandard_var_cam_10_Slowly(1), Staandard_var_cam_10_Slowly(2), min(slutpos_cam_10_Slowly(1:end,1)), min(slutpos_cam_10_Slowly(1:end,2)), max(slutpos_cam_10_Slowly(1:end,1)), max(slutpos_cam_10_Slowly(1:end,2));   
]

csvwrite('camera_stat.csv',Value_array)



Value_array_rob = [Gennemsnit_rob_5(1), Gennemsnit_rob_5(2), Varians_rob_5(1), Varians_rob_5(2), Staandard_var_rob_5(1), Staandard_var_rob_5(2), min(slutpos_rob_5(1:end,1)), min(slutpos_rob_5(1:end,2)), max(slutpos_rob_5(1:end,1)), max(slutpos_rob_5(1:end,2));
    Gennemsnit_rob_10(1), Gennemsnit_rob_10(2), Varians_rob_10(1), Varians_rob_10(2), Staandard_var_rob_10(1), Staandard_var_rob_10(2), min(slutpos_rob_10(1:end,1)), min(slutpos_rob_10(1:end,2)), max(slutpos_rob_10(1:end,1)), max(slutpos_rob_10(1:end,2));
    Gennemsnit_rob_15(1), Gennemsnit_rob_15(2), Varians_rob_15(1), Varians_rob_15(2), Staandard_var_rob_15(1), Staandard_var_rob_15(2), min(slutpos_rob_15(1:end,1)), min(slutpos_rob_15(1:end,2)), max(slutpos_rob_15(1:end,1)), max(slutpos_rob_15(1:end,2));
    Gennemsnit_rob_20(1), Gennemsnit_rob_20(2), Varians_rob_20(1), Varians_rob_20(2), Staandard_var_rob_20(1), Staandard_var_rob_20(2), min(slutpos_rob_20(1:end,1)), min(slutpos_rob_20(1:end,2)), max(slutpos_rob_20(1:end,1)), max(slutpos_rob_20(1:end,2));
    Gennemsnit_rob_10_Individual(1), Gennemsnit_rob_10_Individual(2), Varians_rob_10_Individual(1), Varians_rob_10_Individual(2), Staandard_var_rob_10_Individual(1), Staandard_var_rob_10_Individual(2), min(slutpos_rob_10_Individual(1:end,1)), min(slutpos_rob_10_Individual(1:end,2)), max(slutpos_rob_10_Individual(1:end,1)), max(slutpos_rob_10_Individual(1:end,2));
    Gennemsnit_rob_10_Dog(1), Gennemsnit_rob_10_Dog(2), Varians_rob_10_Dog(1), Varians_rob_10_Dog(2), Staandard_var_rob_10_Dog(1), Staandard_var_rob_10_Dog(2), min(slutpos_rob_10_Dog(1:end,1)), min(slutpos_rob_10_Dog(1:end,2)), max(slutpos_rob_10_Dog(1:end,1)), max(slutpos_rob_10_Dog(1:end,2));
    Gennemsnit_rob_10_Slowly(1), Gennemsnit_rob_10_Slowly(2), Varians_rob_10_Slowly(1), Varians_rob_10_Slowly(2), Staandard_var_rob_10_Slowly(1), Staandard_var_rob_10_Slowly(2), min(slutpos_rob_10_Slowly(1:end,1)), min(slutpos_rob_10_Slowly(1:end,2)), max(slutpos_rob_10_Slowly(1:end,1)), max(slutpos_rob_10_Slowly(1:end,2));   
]


csvwrite('rob_stat.csv',Value_array_rob)























%% Gammelt projekt
clc;
clear;
cut = 0;



%% 5 m
d5_1x = -0.054047;
d5_1y = 4.8996;

d5_2x = 0.014597;
d5_2y = 5.2037;

d5_3x = 0.012473;
d5_3y = 4.9885;

d5_4x = 0.013406;
d5_4y = 5.0935;

d5_5x = -0.10693;
d5_5y = 4.9157;

d5_6x = -0.053132;
d5_6y = 4.9467;

d5_7x = -0.10067;
d5_7y = 4.9445;

d5_8x = -0.24569;
d5_8y = 4.7471;

d5_9x = -0.28281;
d5_9y = 4.7341;

d5_10x = -0.018478;
d5_10y = 4.4355;





array_d5 = [d5_1x, d5_1y; d5_2x, d5_2y; d5_3x, d5_3y; d5_4x, d5_4y;
d5_5x, d5_5y; d5_6x, d5_6y; d5_7x, d5_7y; d5_8x, d5_8y; d5_9x, d5_9y; 
d5_10x, d5_10y];  

 


% ________________________________ Regner _______________________________


Gennemsnit_kun_cam_5 = mean(array_d5)
Varians_kun_cam_5 = var(array_d5)
Kovarians_kun_cam_5 = cov(array_d5)
Staandard_var_kun_cam_5 = std(array_d5)



% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(array_d5(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')

subplot(2,2,3)
hist(array_d5(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')


figure
subplot(2,1,1)
qqplot(array_d5(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(array_d5(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(array_d5(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(array_d5(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(array_d5(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(array_d5(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')




%% 10 m
d10_1x = -0.24845;
d10_1y = 10.3256;

d10_2x = -0.11499;
d10_2y = 10.2399;

d10_3x = -0.11283;
d10_3y = 9.7811 ;

d10_4x = -0.15071;
d10_4y = 9.7997;

d10_5x = -0.32384;
d10_5y = 9.898;

d10_6x = -0.52762;
d10_6y = 10.2896;

d10_7x = -0.01662;
d10_7y = 9.8532;

d10_8x = -0.38081;
d10_8y = 10.4976;

d10_9x = -0.34549;
d10_9y = 10.2327;

d10_10x = -0.62342;
d10_10y = 9.8898;





array_d10 = [d10_1x, d10_1y; d10_2x, d10_2y; d10_3x, d10_3y; d10_4x, d10_4y;
d10_5x, d10_5y; d10_6x, d10_6y; d10_7x, d10_7y; d10_8x, d10_8y; d10_9x, d10_9y; 
d10_10x, d10_10y];  


% ________________________________ Regner _______________________________


Gennemsnit_kun_cam_10 = mean(array_d10)
Varians_kun_cam_10 = var(array_d10)
Kovarians_kun_cam_10 = cov(array_d10)
Staandard_var_kun_cam_10 = std(array_d10)



% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(array_d10(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')

subplot(2,2,3)
hist(array_d10(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')


figure
subplot(2,1,1)
qqplot(array_d10(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(array_d10(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(array_d10(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(array_d10(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(array_d10(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(array_d10(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')



%% 15 m
d15_1x = 0.28763;
d15_1y = 15.7873;

d15_2x = 0.30999;
d15_2y = 14.9048;

d15_3x = -0.59687;
d15_3y =  14.623;

d15_4x = -0.12156;
d15_4y = 15.5228;

d15_5x = -0.24146;
d15_5y = 15.062;

d15_6x = -1.6234;
d15_6y = 14.3198;

d15_7x = -0.59981;
d15_7y = 14.705;

d15_8x = -1.1486;
d15_8y = 14.9191;

d15_9x = -0.53455;
d15_9y = 15.4002;

d15_10x = -0.20435;
d15_10y = 15.4297;





array_d15 = [d15_1x, d15_1y; d15_2x, d15_2y; d15_3x, d15_3y; d15_4x, d15_4y;
d15_5x, d15_5y; d15_6x, d15_6y; d15_7x, d15_7y; d15_8x, d15_8y; d15_9x, d15_9y; 
d15_10x, d15_10y];  



% ________________________________ Regner _______________________________


Gennemsnit_kun_cam_15 = mean(array_d15)
Varians_kun_cam_15 = var(array_d15)
Kovarians_kun_cam_15 = cov(array_d15)
Staandard_var_kun_cam_15 = std(array_d15)



% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(array_d15(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')

subplot(2,2,3)
hist(array_d15(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')


figure
subplot(2,1,1)
qqplot(array_d15(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(array_d15(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(array_d15(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(array_d15(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(array_d15(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(array_d15(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')


%% 20 m
d20_1x = -0.37513;
d20_1y = 20.5815;

d20_2x = 1.2079;
d20_2y = 21.8925;

d20_3x = -0.12919;
d20_3y = 19.8129;

d20_4x = 0.20375;
d20_4y = 21.0362;

d20_5x = -0.68946;
d20_5y = 21.1007;

d20_6x = -0.5666;
d20_6y = 20.5506;

d20_7x = -0.48682;
d20_7y = 20.6667;

d20_8x = 0.15954;
d20_8y = 19.6325;

d20_9x = -0.44647;
d20_9y = 20.0695;

d20_10x = -1.0067;
d20_10y = 20.3096;





array_d20 = [d20_1x, d20_1y; d20_2x, d20_2y; d20_3x, d20_3y; d20_4x, d20_4y;
d20_5x, d20_5y; d20_6x, d20_6y; d20_7x, d20_7y; d20_8x, d20_8y; d20_9x, d20_9y; 
d20_10x, d20_10y];  






% ________________________________ Regner _______________________________


Gennemsnit_kun_cam_20 = mean(array_d20)
Varians_kun_cam_20 = var(array_d20)
Kovarians_kun_cam_20 = cov(array_d20)
Staandard_var_kun_cam_20 = std(array_d20)



% __________________________________ Plotter Histogrammer ______________

figure
subplot(2,2,1)
hist(array_d20(1:end-cut,1))
xlabel('x') 
ylabel('Probability')
title('Camenra x deviation')

subplot(2,2,3)
hist(array_d20(1:end-cut,2))
xlabel('y') 
ylabel('Probability')
title('Camenra y deviation')


figure
subplot(2,1,1)
qqplot(array_d20(1:end-cut,2))
title('QQ-plot for Camemara Pos y')
subplot(2,1,2)
qqplot(array_d20(1:end-cut,1))
title('QQ-plot for Camemara Pos x')


figure
subplot(2,1,1)
histfit(array_d20(1:end-cut,2),10)
title('Normal Distribution from Histogram y')
subplot(2,1,2)
histfit(array_d20(1:end-cut,1),10)
title('Normal Distribution from Histogram x')

figure
subplot(2,1,1)
histfit(array_d20(1:end-cut,2))
title('Normal Distribution from Histogram fittet Together y')
subplot(2,1,2)
histfit(array_d20(1:end-cut,1))
title('Normal Distribution from Histogram fittet Together x')




%% Aaray til værdier samt print til array  



Value_array = [Gennemsnit_kun_cam_5(1), Gennemsnit_kun_cam_5(2), Varians_kun_cam_5(1), Varians_kun_cam_5(2), Staandard_var_kun_cam_5(1), Staandard_var_kun_cam_5(2), min(array_d5(1:end,1)), min(array_d5(1:end,2)), max(array_d5(1:end,1)), max(array_d5(1:end,2));
    Gennemsnit_kun_cam_10(1), Gennemsnit_kun_cam_10(2), Varians_kun_cam_10(1), Varians_kun_cam_10(2), Staandard_var_kun_cam_10(1), Staandard_var_kun_cam_10(2), min(array_d10(1:end,1)), min(array_d10(1:end,2)), max(array_d10(1:end,1)), max(array_d10(1:end,2));
    Gennemsnit_kun_cam_15(1), Gennemsnit_kun_cam_15(2), Varians_kun_cam_15(1), Varians_kun_cam_15(2), Staandard_var_kun_cam_15(1), Staandard_var_kun_cam_15(2), min(array_d15(1:end,1)), min(array_d15(1:end,2)), max(array_d15(1:end,1)), max(array_d15(1:end,2));
    Gennemsnit_kun_cam_20(1), Gennemsnit_kun_cam_20(2), Varians_kun_cam_20(1), Varians_kun_cam_20(2), Staandard_var_kun_cam_20(1), Staandard_var_kun_cam_20(2), min(array_d20(1:end,1)), min(array_d20(1:end,2)), max(array_d20(1:end,1)), max(array_d20(1:end,2));   
]

csvwrite('kun_camera_stat_minus_odo.csv',Value_array)

