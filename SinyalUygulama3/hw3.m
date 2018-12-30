close all;
clear all;
clc;

img = imread('poi.jpg');

%% 1.A ��kk�, RGB2Gray

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


%% 1.B ��kk�, resmi x=120, y=75 �tele
% [x, y, z] = size(img);
% 
% xshift = 120;
% yshift = 75;
% 
% shifted(1+xshift : x+xshift, 1+yshift: y+yshift, :) = img;
% 
% subplot(1,2,1), imshow(img), title('original');
% subplot(1,2,2), imshow(shifted), title('shifted');


%% 1.C ��kk�, [50 125] oranla RGB resmi tekrar boyutland�r g�ster
% scale = [50 125];
% Y1 = imresize(img, scale);
% imshow(Y1);


%% 1.D ��kk�, RGB resminizi x=35, y=186 oranla imtranslate ile �teleyiniz
% Y = imtranslate(img,[35, 186]);
% imshow(Y);


%% 1.E ��kk�,RGB resminizi ? = ?38 ve ? = 245 a��s�yla d�nd�r
% 
% Y1 = imrotate(img, -38);
% Y2 = imrotate(img, 245);
% 
% subplot(1,2,1), imshow(Y1), title('angle = -38');
% subplot(1,2,2), imshow(Y2), title('angle = 245');


%% 1.F ��kk�, Gri seviyeli ayn� boyutlu iki resim al�n�z ve bu resimlerin fark�n� al, yorum yap�n
% Resimler gri seviyeli, yani tek boyutlu (rgb boyutlar� yok),
% Resimler matris olarak ele al�n�p kar��l�kl� pixel de�erleri ��kar�l�yor.
% Burada I1 den I2 de�erleri ��kar�lm��t�r. Al�nan fark i�leminde
% de�erlerin  a yakla�mas�ndan dolay� parlakl��� daha azalm��t�r.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 - I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Difference');


%% 1.G ��kk�, Bir �nceki ad�mdaki iki resimi toplay�n�z, yorum yap�n
% Resimler gri seviyeli, yani tek boyutlu (rgb boyutlar� yok),
% Resimler matris olarak ele al�n�p kar��l�kl� pixel de�erleri toplan�yor.
% Burada I1 den I2 de�erleri toplanm��t�r. Yap�lan toplama i�leminde pixel de�erler
% 255 e yakla�t���ndan resmin parlakl��� daha artm��t�r.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 + I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Sum');


%% 1.H ��kk�, bu iki resmi kullanarak �arp�n�z ve g�steriniz, yorum yap�n
% Yap�lan toplama i�leminde pixel de�erler 255 e yakla�t���ndan resmin 
% parlakl��� daha da artm��t�r.

% I1 = imread('1.jpg');
% I2 = imread('2.jpg');
% 
% Y1 = I1 .* I2;
% 
% subplot(1,3,1), imshow(I1), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(Y1), title('Multiplication');

%% 1.I ��kk�, RGB bir resminizi 0.008 skaler ve 2.5  ile carp
%  bu iki farkl� skaler degerle carpt�ktan sonra
%  olusan yeni resimler hakk�nda yorum yap�n

% 0.008 ile �arp�lan resimin pixel de�eri 0 a yakla��p g�r�nt� kararacakt�r
% 2.5 ile �arp�lan resimin pixel de�erleri 255 e yakla��p g�r�nt�
% parlakla�acakt�r.
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


%% 3. soru, resmi griye �evir ve n=4 ve n=16 olarak �rnekle ve yorumla.
% yap�lan i�lem sonucunda �rnekleme de�eri art�k�a resmin netli�i
% bozulmu�tur.

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
