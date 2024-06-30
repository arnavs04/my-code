k = 0;
num_points = zeros(1, 10000);
integralarea = zeros(1, 10000);
// monte carlo
for n = 1:10000
    num_points(n) = n;
    x = rand() * 2;
    y = rand() * 2;
    if (x^2 + y^2) < 4
        k = k + 1;
    end
    integralarea(n) = (4 * k) / n;
end

plot(num_points, integralarea);
title('Q2');
xlabel('Number of Points');
ylabel('Area under Integral');
grid on;