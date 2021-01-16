clear;
clc;
close;

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



% Type Names of CSV-files
Name_1 = 'camera_pose.csv';
Name_2 = 'robo_tpose.csv';


camera_pos= readtable(Name_1, 'ReadVariableNames',true);
[N1,M1]      = size(camera_pos);

% converts it to an array
A_1 = table2array(camera_pos);

% Fil 2
pos_robot= readtable(Name_2, 'ReadVariableNames',true);
[N2,M2]      = size(pos_robot);
pos_robot1 = pos_robot(:,1:end-1);

% converts it to an array
A_2 = table2array(pos_robot1);




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
    %plot(x(1:end-cut,1), y(1:end-cut,1))
    %r = plot(mdl1) ;
    %delete(r(1))
    %r2 = plot(mdl2) ;
    %delete(r2(1))
    
    
    xlabel('x') 
    ylabel('y')
    legend({'Camera','Hjul','camera_corigeret','Regration', 'fulde Regression'},'Location','southwest')
    hold off

    
    
    