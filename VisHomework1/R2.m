clear
clc
load database1.txt;
M=size(database1);
A(:,:,1) = database1*255;%R 0-255
A(:,:,2) = zeros(M(1),M(2));%G
A(:,:,3) = zeros(M(1),M(2));%B
P = uint8(A);
imagesc(P);
axis square;
set(gca,'XTick',[],'YTick',[]);
legend('sin(x)','cos(x)')
legend('boxoff')
%imwrite(P,'matdata.bmp','bmp');   % p = imread('matdata.bmp'); imagesc(p);