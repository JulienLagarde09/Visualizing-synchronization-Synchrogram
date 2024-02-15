%% How to visualize n:m phase synchronization
%%
%% using the synchrogram method from Rosenblum et al.
% Sch√fer, C., Rosenblum, M. G., Abel, H. H., & Kurths, J. (1999). 
% Synchronization in the human cardiorespiratory system. Physical Review E, 60(1), 857.

clear all; close all

omega_x = 1;omega_y = 5;
t = 0:0.01:100;% time vector
x = 1*sin(omega_x*t); y = 1*sin(omega_y*t);% 2 waves

phi_x = angle(hilbert(x));% continuous phase(t) of the slower wave (x)
[pval, pdates] = findpeaks(y);% peaks values and dates of peaks of the faster wave (y)
sync = phi_x(pdates);% values of phase of the slower at dates of peaks of the faster

figSig = figure('Name','Synchrogram');
subplot(211)
plot(x,'r'),hold on,plot(y,'b')
subplot(212)
plot(sync,'o')