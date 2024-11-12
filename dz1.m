
T = 10e-3;
t = 0:T:30;
alpha = 0.2;
sigma_a = 2;

F = [1 T 0;
    0 1 T;
    0 0 exp(-alpha*T)];
G = [0; 0; sigma_a * sqrt(1 - exp(-2*alpha*T))];

x = zeros(3, 1);
x(:, 1) = [0; 0; sigma_a];


for k = 2:length(t)
    x(:,k) = F * x(:,k - 1) + G * normrnd(0, 1);
end

figure(1)
subplot(131)
plot(x(1,:),'Color','green', 'LineWidth', 2)
grid on
xlabel('Время, с')
ylabel('Расстояние, м')

subplot(132)
plot(x(2,:),'Color','red', 'LineWidth', 2)
grid on
xlabel('Время, с')
ylabel('Скорость, м/с')

subplot(133)
plot(x(3,:),'Color','blue', 'LineWidth', 1)
grid on
xlabel('Время, с')
ylabel('Скорость, м/с^2')