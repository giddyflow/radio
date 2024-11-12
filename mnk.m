%% линейная регрессия мнк
%% входные параметры
x = 0:500;
y = cos(0.1 * x);
k = 5; 
n = length(x);
%% расчёт линейного мнк
X = zeros(n, k);
for i = 1:k                         % y = b0 + b1 * x + b2 * x^2
    X(:, i) = x.^(i-1); 
end
b = X\y';
y_predict = X * b;


%% визуализация результатов линейного мнк
plot(y, 'LineWidth', 2, 'Color', 'red');
hold on
plot(y_predict, 'LineWidth', 1, 'Color', 'blue')
grid on
hold off
legend('модель', 'мнк')

