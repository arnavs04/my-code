values = zeros(1, 10000);
points = zeros(1, 10000);
k = 0;
// monte carlo
for n = 1:10000
    points(n) = n;
    x = rand();
    y = rand();
    circle = x^2 + y^2;
    if circle <= 1
        k = k + 1;
    end
    values(n) = (4 * k) / n;
end

plot(points, values);
title('Estimation of \pi');
xlabel('Number of Points');
ylabel('Value');
grid on;