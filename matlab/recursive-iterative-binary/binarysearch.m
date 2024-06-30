function c2 = binary_search_iterative(arr, n, x)
    c2 = 0;
    left = 1;
    right = n;
    while left <= right
        mid = floor((left + right) / 2);
        c2 = c2 + 1;
        if arr(mid) == x
            c2 = c2 + 1;
            return;
        elseif arr(mid) < x
            c2 = c2 + 1;
            left = mid + 1;
        else
            right = mid - 1;
        end
    end
end

function c1 = binary_search_recursive(arr, left, right, x)
    c1 = 0;
    if right >= left
        mid = floor((left + right) / 2);
        c1 = c1 + 1;
        if arr(mid) == x
            c1 = c1 + 1;
            return;
        elseif arr(mid) > x
            c1 = c1 + 1;
            c1 = c1 + binary_search_recursive(arr, left, mid - 1, x);
        else
            c1 = c1 + binary_search_recursive(arr, mid + 1, right, x);
        end
    end
end

k = 1;
for n = 1:1000
    xne(k) = n;
    for j = 1:n
        arr(j) = j;
    end
    left = 1;
    right = n;
    c1 = 0;
    c2 = 0;
    for i = 1:n
        x = arr(randi(n, 1));
        c1 = c1 + binary_search_recursive(arr, left, right, x);
        c2 = c2 + binary_search_iterative(arr, n, x);
    end
    c1 = c1 / n;
    c2 = c2 / n;
    ycb(k) = c1;
    ycd(k) = c2;
    k = k + 1;
end

plot(xne, ycb, xne, ycd);
title('Binary Search');
xlabel('Number of Elements');
ylabel('Comparisons');
legend('Recursive', 'Iterative');
grid on;