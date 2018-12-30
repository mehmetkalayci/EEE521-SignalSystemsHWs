clc;
close all;
clear all;

% S1-A
% fs = 100000; % 100 kHZ sample rate
% t = 0:1/fs:1.5; % time
% x1 = sawtooth(2*pi*100*t); % 100 hz amp
% 
% plot(t,x1)
% axis([0 0.2 -2 2])
% xlabel('Time (sec)')
% ylabel('Amplitude') 
% title('Sawtooth Periodic Wave')
% grid on



% S1-b
% fs = 1000000; % 1 MHz sample rate
% t = 0:1/fs:1.5; % time
% x1 = square(2*pi*20*t); % 20Hz amp
% 
% plot(t,x1)
% axis([0 0.2 -2 2])
% xlabel('Time (sec)')
% ylabel('Amplitude') 
% title('Sawtooth Periodic Wave')
% grid on


% S1-c
% fs = 100000; % 100 kHz sample rate
% t = -1:1/fs:1; % time
% x1 = tripuls(t,100e-3); % 100 ms
% 
% plot(t,x1)
% axis([-0.1 0.1 -0.2 1.2])
% xlabel('Time (sec)')
% ylabel('Amplitude')
% title('Triangular Aperiodic Pulse')
% grid on


% S1-d
% fs = 10000; % 10 kHz sample rate
% t = -1:1/fs:1; % time
% x1 = rectpuls(t,50e-3); % 50 ms
% 
% plot(t,x1)
% axis([-0.1 0.1 -0.2 1.2])
% xlabel('Time (sec)')
% ylabel('Amplitude')
% title('Triangular Aperiodic Pulse')
% grid on


%S1-e
% tc = gauspuls('cutoff',50e3,0.5,[],-60); % 50kHz, 0.5, -60
% t = -tc : 10e-6 : tc; % 10MHz sample rate
% yi = gauspuls(t,50e3,0.5); % 50kHz, 0.5
% plot(t,yi)
% 
% xlabel('Time (ms)')
% ylabel('Amplitude')
% title('Gaussian Pulse')
% grid on


%S1-f
% fs = 200E9;                    % sample freq 200ghz
% D = [2.5 10 17.5]' * 1e-9;     % pulse delay times 7.5ns
% t = 0 : 1/fs : 2500/fs;        % signal evaluation time
% w = 2e-9;                      % width of each pulse 2ns
% yp = pulstran(t,D,@rectpuls,w);
% 
% plot(t*2e9,yp);
% axis([0 25 -0.2 1.2])
% xlabel('Time (ns)')
% ylabel('Amplitude')
% title('Rectangular Train')
% grid on


%S1-g
% T = 0 : 1/50e3 : 10e-3;
% D = [0 : 1/1e3 : 10e-3 ; 0.6.^(0:10)]'; % 0.6 attenuate
% Y = pulstran(T,D,@gauspuls,10E3,.5);
% 
% plot(T*1e3,Y)
% xlabel('Time (ms)')
% ylabel('Amplitude')
% title('Gaussian Pulse Train')


% S2
% t = (-5:0.2:5)';
% 
% impulse = t==0;
% unitstep = t>=0;
% ramp = t.*unitstep;
% 
% subplot(3,2,1)
% plot(t, impulse)
% xlabel('t')
% ylabel('x(t)')
% title('Impulse CT')
% 
% subplot(3,2,2)
% stem(t, impulse)
% xlabel('n')
% ylabel('x[n]')
% title('Impulse DT')
% 
% subplot(3,2,3)
% plot(t, unitstep)
% xlabel('t')
% ylabel('x(t)')
% title('Unit Step CT')
% 
% subplot(3,2,4)
% stem(t, unitstep)
% xlabel('n')
% ylabel('x[n]')
% title('Unit Step DT')
% 
% subplot(3,2,5)
% plot(t, ramp)
% xlabel('t')
% ylabel('x(t)')
% title('Ramp CT')
% 
% subplot(3,2,6)
% stem(t, ramp)
% xlabel('n')
% ylabel('x[n]')
% title('Ramp DT')


%S3
% fs=1000; % 1kHz
% f=20; %20 Hz
% t=0:1/fs:1;
% 
% sinsignal=sin(2*pi*f*t);
% subplot(2,1,1);
% plot(t,sinsignal);
% title('sin');
% 
% cossignal=cos(2*pi*f*t);
% subplot(2,1,2);
% plot(t,cossignal);
% title('cos');
% grid on;
% %%
% n=-100:1:100;
% x1=cos(2*pi*n/36);
% x2=sin(2*pi*n/36);
% figure
% subplot(2,1,1);
% title('cos 2*pi*n/36');
% stem(n,x1)
% 
% subplot(2,1,2);
% title('sin 2*pi*n/36');
% stem(n,x2)



% S4
% t=-5:1:5;
% g_even=(g(t)+g(-t))/2;
% g_odd=(g(t)-g(-t))/2;
% 
% plot(t,g_even);
% title('even');
% 
% figure
% plot(t,g_odd);
% title('odd');


% S5
% n=-100:100;
% y=(0.9.^abs(n)).*sin(2*pi*n/4);
% sum(abs(y.^2))


% % S6
% fs2k=2000; % 2kHz
% fs10k=10000; % 2kHz
% 
% f=1000; %1 kHz
% t=0:1/fs2k:10;
% 
% sinsignal=sin(2*pi*f*t);
% subplot(2,2,1);
% plot(t,sinsignal);
% title('sin fs=2k');
% 
% cossignal=sin(2*pi*f*t);
% subplot(2,2,2);
% plot(t,cossignal);
% title('cos fs=2k');
% 
% 
% t=0:1/fs10k:10;
% 
% sinsignal=sin(2*pi*f*t);
% subplot(2,2,3);
% plot(t,sinsignal);
% title('sin fs=10k');
% 
% cossignal=sin(2*pi*f*t);
% subplot(2,2,4);
% plot(t,cossignal);
% title('cos fs=10k');



% S7
% n = 0:1:100;
% x = 4+cos(2*pi*n/24);
% 
% y1 = x(1:2:length(x));
% y2 = x(1:10:length(x));
% 
% subplot(2,2,1);
% stem(n,x);
% xlabel('time');
% ylabel('amplitude');
% title('input signal');
% 
% subplot(2,2,2);
% stem(y1);
% xlabel('time');
% ylabel('amplitude');
% title('downsampling n=2');
% 
% subplot(2,2,3);
% stem(y2);
% xlabel('time');
% ylabel('amplitude');
% title('downsampling n=10');
