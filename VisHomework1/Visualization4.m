clear
clc
load database1.txt;
figure

M=size(database1);
A(:,:,1) = database1*255;%R 0-255
A(:,:,2) = ones(M(1),M(2));%G
A(:,:,3) = ones(M(1),M(2));%B
P = uint8(A);
imagesc(P);
axis square;
set(gca,'XTick',[],'YTick',[]);

row_cmap = 100;  %color finess
color_map1=zeros(row_cmap,3);  %define color matrix
color_r = 0:1/(row_cmap-1):1; 
color_g = 0:1/(row_cmap-1):1;
color_b = 0:1/(row_cmap-1):1;
color_map1(:,1) = color_r; 
%color_map1(:,2) = color_g;
colormap(color_map1);
colorbar;

text(1000,10,'FA Values')

