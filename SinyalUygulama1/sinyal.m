clc;
close all;
clear all;

a = 1/2; % alpha
b = 3/5; % beta

% ************************************* %
% 1.gün a
% 2.gün a + a*b
% 3.gün a + b(a+a*b)
% 4.gün a + b(a + b(a+a*b))
% ...
% y[n] = u[n] + b*y[n-1], u[n]=a
% ************************************* %

% A) Bu ilacý 1 yýl 10 gün, yani 375 gün alan hastanýn kanýnda bulunan doz
% miktarý kaç mg? a=1/4 ve b=3/5 için: 466.875000000000,
% A seçeneðinde sonucun bulunmasýný saðlayan fonksiyon aþaðýda verilmiþtir;
% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end

days = input('X gün alan hastanýn kanýnda bulunan doz miktarý kaç mg? ');
[itResultA, ~] = calcDoseAmountIteratively(days, a, b);


% B) Tasarlanan sistemin genel denklemi, y[n] = u[n] + b*y[n-1], u[u]=a
% Sistemin iterative fonksiyon hali aþaðýdadýr. Fonksiyon gün sayýsý, alpha
% ve beta deðerlerini alýp, result çýktýsýnda toplam harcanan ilaç
% miktarýný, dailyDoses çýktýsýnda ise günlük tüketilen ilaç miktarýný
% gösterir. Böylece result ile toplam tüketilen ilaç miktarýný alýrken,
% dailyDoses'u stem ile grafik olarak gösterebiliriz.

% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end




% C) Sistem ait recursive ve iterative fonksiyonlar aþaðýda verilmiþtir.

% Recursive olarak ilaç dozajýnýn hesaplanmasý.
% function recResult = calcDoseAmountRecursively(days, a, b)
%     if days <=1
%         recResult = a;
%     else
%         recResult = (a + calcDoseAmountIteratively(days-1, a, b) * (b/days)) * days;
%     end
% end

% Iterative olarak ilaç dozajýnýn hesaplanmasý.

% function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
%     doseAmount(1) = a;
%     for i=2:days
%         doseAmount(i) = (a + (b * doseAmount(i-1)))
%     end
%     result = sum(doseAmount);
%     dailyDoses = doseAmount;
% end


% D) 200 g¨un sonra kanda bulunan toplam dozaj miktarýný b
% ve c’de yazdý?gýnýz kodlar ile sonucu bul.
% Burada timer komutunu çalýþtýramadým, daha doðrusu timer komutunu
% çalýþtýrýp fonksiyondan dönen sonuçlarý nasýl alacaðýmý bilemediðim için
% tic toc komutu ile geçen süreyi hesaplattým
tic;
[itResultD, ~] = calcDoseAmountIteratively(200, a, b);
elapsedTimeIterativeD = toc;

tic;
recResultD = calcDoseAmountRecursively(200, a, b);
elapsedTimeRecursiveD = toc;





% E)(a=1/4, b=3/5)  -  (a=1/2, b=3/5)  -  (a=1/4, b=3/4) degerlerindeyken 
% kandaki ilac dozu miktarý/gun oranýnýn grafigini ciziniz.
% Grafikte x ekseninde gunleri, y ekseninde alýnan toplam doz miktarýný 
% ve birimini gosterek ciziniz. 3 farklý degerin sonuclarýný
% tek bir grafik uzerinde gosteriniz.

days = input('E seçeneði için gün sayýsýný girin? ');

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

