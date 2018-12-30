clc;
close all;
clear all;

a = 1/2; % alpha
b = 3/5; % beta

% ************************************* %
% 1.g�n a
% 2.g�n a + a*b
% 3.g�n a + b(a+a*b)
% 4.g�n a + b(a + b(a+a*b))
% ...
% y[n] = u[n] + b*y[n-1], u[n]=a
% ************************************* %

% A) Bu ilac� 1 y�l 10 g�n, yani 375 g�n alan hastan�n kan�nda bulunan doz
% miktar� ka� mg? a=1/4 ve b=3/5 i�in: 466.875000000000,
% A se�ene�inde sonucun bulunmas�n� sa�layan fonksiyon a�a��da verilmi�tir;
% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end

days = input('X g�n alan hastan�n kan�nda bulunan doz miktar� ka� mg? ');
[itResultA, ~] = calcDoseAmountIteratively(days, a, b);


% B) Tasarlanan sistemin genel denklemi, y[n] = u[n] + b*y[n-1], u[u]=a
% Sistemin iterative fonksiyon hali a�a��dad�r. Fonksiyon g�n say�s�, alpha
% ve beta de�erlerini al�p, result ��kt�s�nda toplam harcanan ila�
% miktar�n�, dailyDoses ��kt�s�nda ise g�nl�k t�ketilen ila� miktar�n�
% g�sterir. B�ylece result ile toplam t�ketilen ila� miktar�n� al�rken,
% dailyDoses'u stem ile grafik olarak g�sterebiliriz.

% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end




% C) Sistem ait recursive ve iterative fonksiyonlar a�a��da verilmi�tir.

% Recursive olarak ila� dozaj�n�n hesaplanmas�.
% function recResult = calcDoseAmountRecursively(days, a, b)
%     if days <=1
%         recResult = a;
%     else
%         recResult = (a + calcDoseAmountIteratively(days-1, a, b) * (b/days)) * days;
%     end
% end

% Iterative olarak ila� dozaj�n�n hesaplanmas�.

% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end


% D) 200 g�un sonra kanda bulunan toplam dozaj miktar�n� b
% ve c�de yazd�?g�n�z kodlar ile sonucu bul.
% Burada timer komutunu �al��t�ramad�m, daha do�rusu timer komutunu
% �al��t�r�p fonksiyondan d�nen sonu�lar� nas�l alaca��m� bilemedi�im i�in
% tic toc komutu ile ge�en s�reyi hesaplatt�m
tic;
[itResultD, ~] = calcDoseAmountIteratively(200, a, b);
elapsedTimeIterativeD = toc;

tic;
recResultD = calcDoseAmountRecursively(200, a, b);
elapsedTimeRecursiveD = toc;





% E)(a=1/4, b=3/5)  -  (a=1/2, b=3/5)  -  (a=1/4, b=3/4) degerlerindeyken 
% kandaki ilac dozu miktar�/gun oran�n�n grafigini ciziniz.
% Grafikte x ekseninde gunleri, y ekseninde al�nan toplam doz miktar�n� 
% ve birimini gosterek ciziniz. 3 farkl� degerin sonuclar�n�
% tek bir grafik uzerinde gosteriniz.

days = input('E se�ene�i i�in g�n say�s�n� girin? ');

a1=1/4;
b1=3/5;
[ResultE1, dailyDosesE1] = calcDoseAmountIteratively(days, a1, b1);

a2=1/2;
b2=3/5;
[ResultE2, dailyDosesE2] = calcDoseAmountIteratively(days, a2, b2);

a3=1/4;
b3=3/4;
[ResultE3, dailyDosesE3] = calcDoseAmountIteratively(days, a3, b3);

figure;
stem(dailyDosesE1);
hold on;
stem(dailyDosesE2);
hold on;
stem(dailyDosesE3);
hold off;
title('Result'), xlabel('Days'), ylabel('Amount of Dose');
legend({'a=1/4, b=3/5','a=1/2, b=3/5', 'a=1/4, b=3/4'},'Location','southwest');

