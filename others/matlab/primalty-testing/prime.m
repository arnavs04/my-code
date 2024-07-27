n = 44; 
k = 0; 
iterations = []; 
probability = []; 
flag = false; 

for i = 1:10000
    iterations = [iterations i];
    fact = randi([1, n-1]);
    rem = mod(n, fact);
    if rem ~= 0
        k = k + 1;
    end
    probability = [probability k/i];
end

disp(k/10000);
plot(iterations, probability);
xlabel("Number of Iterations");
ylabel("Prime Probability");
title("Primality Testing using Randomized Algorithm");
grid on;