test_x1 = zeros(1000, 1);
test_y1 = zeros(1000, 1);

for i = 1 : 1000
    test_x1(i) = global_path_x(7 * i - 6);
    test_y1(i) = global_path_y(7 * i - 6);
end

