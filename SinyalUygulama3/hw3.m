close all;
clear all;
clc;

img = imread('poi.jpg');

%% 1.A þýkký, RGB2Gray

%Y1 = rgb2gray(img); % method 1

% method 2
% for i=1:256
%     for j=1:256
%         r = img(:,:,1);
%         g = img(:,:,2);
%         b = img(:,:,3);
%         avg = (r+g+b)/3;
%         
%         Y1(i, j) = (r(i, j) + g(i, j) + b(i, j))/3;
%     end
% end
%figure, imshow(Y1);


%% 1.B þýkký, resmi x=120, y=75 ötele
% [x, y, z] = size(img);
% 
% xshift = 120;
% yshift = 75;
% 
% shifted(1+xshift : x+xshift, 1+yshift: y+yshift, :) = img;
% 
% subplot(1,2,1), imshow(img), title('original');
% subplot(1,2,2), imshow(shifted), title('shifted');


%% 1.C þýkký, [50 125] oranla RGB resmi tekrar boyutlandýr göster
% scale = [50 125];
% Y1 = imresize(img, scale);
% imshow(Y1);


%% 1.D þýkký, RGB resminizi x=35, y=186 oranla imtranslate ile öteleyiniz
% Y = imtranslate(img,[35, 186]);
% imshow(Y);


%% 1.E þýkký,RGB resminizi ? = ?38 ve ? = 245 açýsýyla döndür
% 
% Y1 = imrotate(img, -38);
% Y2 = imrotate(img, 245);
% 
% subplot(1,2,1), imshow(Y1), title('angle = -38');
% subplot(1,2,2), imshow(Y2), title('angle = 245');


%% 1.F þýkký, Gri seviyeli ayný boyutlu iki resim alýnýz ve bu resimlerin farkýný al, yorum yapýn
% Resimler gri seviyeli, yani tek boyutlu (rgb boyutlarý yok),
% Resimler matris olarak ele alýnýp karþýlýklý pixel deðerleri çýkarýlýyor.
% Burada I1 den I2 deðerleri çýkarýlmýþtýr. Alýnan fark iþleminde
% deðerlerin  a yaklaþmasýndan dolayý parlaklýðý daha azalmýþtýr.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 - I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Difference');


%% 1.G þýkký, Bir önceki adýmdaki iki resimi toplayýnýz, yorum yapýn
% Resimler gri seviyeli, yani tek boyutlu (rgb boyutlarý yok),
% Resimler matris olarak ele alýnýp karþýlýklý pixel deðerleri toplanýyor.
% Burada I1 den I2 deðerleri toplanmýþtýr. Yapýlan toplama iþleminde pixel deðerler
% 255 e yaklaþtýðýndan resmin parlaklýðý daha artmýþtýr.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 + I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Sum');


%% 1.H þýkký, bu iki resmi kullanarak çarpýnýz ve gösteriniz, yorum yapýn
% Yapýlan toplama iþleminde pixel deðerler 255 e yaklaþtýðýndan resmin 
% parlaklýðý daha da artmýþtýr.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 .* I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Multiplication');

%% 1.I þýkký, RGB bir resminizi 0.008 skaler ve 2.5  ile carp
%  bu iki farklý skaler degerle carptýktan sonra
%  olusan yeni resimler hakkýnda yorum yapýn

% 0.008 ile çarpýlan resimin pixel deðeri 0 a yaklaþýp görüntü kararacaktýr
% 2.5 ile çarpýlan resimin pixel deðerleri 255 e yaklaþýp görüntü
% parlaklaþacaktýr.
% 
% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% I1 = I1 .* 0.008;
% I2 = I2 .* 2.5;
% 
% 
% subplot(1,2,1), imshow(I1), title('Image 1');
% subplot(1,2,2), imshow(I2), title('Image 2');


%% 3. soru, resmi griye çevir ve n=4 ve n=16 olarak örnekle ve yorumla.
% yapýlan iþlem sonucunda örnekleme deðeri artýkça resmin netliði
% bozulmuþtur.

% for i=1:256
%     for j=1:256
%         r = img(:,:,1);
%         g = img(:,:,2);
%         b = img(:,:,3);
%         avg = (r+g+b)/3;
%         
%         Y1(i, j) = (r(i, j) + g(i, j) + b(i, j))/3;
%     end
% end
% 
% n=4;
% [x y z] =size(Y1);
% 
% im1 = zeros(100);
% 
% for i=1:n:x
%     for j=1:n:y
%         for k=0:n-1
%             for l=0:n-1
%                 im1(i+k,j+l)=Y1(i,j);
%             end
%         end
%     end
% end
% 
% im2 = zeros(100);
% 
% for i=1:n:x
%     for j=1:n:y
%         for k=0:n-1
%             for l=0:n-1
%                 im2(i+k,j+l)=Y1(i,j);
%             end
%         end
%     end
% end
% 
% subplot(1,3,1), imshow(uint8(Y1)), title('Gray Image');
% subplot(1,3,2), imshow(uint8(im1)), title('Sampled Image 1 n=4');
% subplot(1,3,3), imshow(uint8(im2)), title('Sampled Image 2 n=16');
