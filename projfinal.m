close all
clear all
clc

% cam = webcam;
% preview(cam);
% snapshot(cam);

img = imread('teste2.jpg');
img = rgb2gray(img);
img = imresize(img, [300, 300]);

img = getBoard(img);
figure, imshow(img);

% borders = edge(img,'canny', 0.5);
% [H,theta,rho] = hough(borders);
% peaks = houghpeaks(H,5);
% lines = houghlines(img,theta,rho,peaks);
% 
% figure(1), imshow(imadjust(rescale(H)),'XData',theta,'YData',rho, 'InitialMagnification','fit');
% title('Transformada de Hough no tabuleiro do jogo da velha');
% xlabel('\theta'), ylabel('\rho');
% 
% axis on, axis normal, hold on
% 
% x = theta(peaks(:,2));
% y = rho(peaks(:,1));
% plot(x,y,'s','color','red');
% hold off
% 
% figure(2), imshow(img);
% hold on
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    plot(xy(1,1),xy(1,2),'x','LineWidth',5,'Color','red');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',5,'Color','red');
% end
% 
% hold off

board = zeros(3, 3);



function board = getBoard(img)
    corners = detectHarrisFeatures(img);
    x_c = corners.Location(:,2);
    y_c = corners.Location(:,1);
    board = img(min(x_c):max(x_c),min(y_c):max(y_c));
end


