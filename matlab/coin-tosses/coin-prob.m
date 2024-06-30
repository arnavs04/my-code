k = 1;
for n = 1:100:10000
    xne(k) = n; 
    A = round(rand(1, n)); 
    ycb(k) = sum(A) / n; 
    k = k + 1;
end

plot(xne, ycb);
title('Coin Tosses');
xlabel('Number of Tosses');
ylabel('Probability');
grid on;