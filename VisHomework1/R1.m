% Vis homework 1, realization 1
clear
clc
load database1.csv;
A=database1;

x=[0 1 1 0];
y=[0 0 1 1];  
H_F=fill(x,y,[0 0.1 0.2 0.6]);  

row_cmap = 100;  %color finess
color_map1=zeros(row_cmap,3);  %define color matrix
color_r = 0:1/(row_cmap-1):1; 
color_g = 0:1/(row_cmap-1):1;
color_b = 0:1/(row_cmap-1):1;
color_map1(:,1) = color_r; 
color_map1(:,2) = color_g;
colormap(color_map1);
colorbar;

Z = A;
b = bar3(Z);
colorbar;
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData',zdata);
    set(b(k),'Facecolor','interp');
end
grid off
legend('sin(x)','cos(x)','cos(x)')
legend('boxoff')
