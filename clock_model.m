clc
close all
clear all
%% модель с постоянным дрифтом
t = 0:1000;

% drift = 1e-9; % скорость изменения времени (скорость изменения ошибки)
% shift = 1; % начальное положение
% 
% delta(:,1) = [shift; drift];
% 
% for i = 2:length(t)
%     F = [1 t(i) - t(i - 1); 0 1];
%     delta(:,i) = F * delta(:, i - 1);
%     t_clock(i) = t(i) + delta(1, i);
% end
% figure
% subplot(121)
% plot(t)
% hold on
% plot(t_clock)
% grid on
% hold off
%% модель с шумом дрифта
shift = 1e-9;
drift = 1e-11;
delta(:,1) = [shift; drift];
sigma = 7e-10;
for i = 2:length(t)
    F = [1 t(i) - t(i - 1); 0 1];
    G = [0; t(i) - t(i-1)];
    delta(:,i) = F * delta(:, i - 1) + G * normrnd(0, sigma);
    t_clock(i) = t(i) + delta(1,i);
end

figure(1)
subplot(121)
plot(delta(1,:))
subplot(122)
plot(delta(2,:))
grid on

figure(2)
subplot(121)
plot(t_clock)
hold on
plot(t)
hold off
subplot(122)
plot(t_clock - t)
grid on

% 
% subplot(122)
% plot(t)
% hold on
% plot(t_clock)
% grid on
% hold off
