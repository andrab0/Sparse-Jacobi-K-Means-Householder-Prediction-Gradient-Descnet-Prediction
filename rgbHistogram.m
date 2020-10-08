function [sol] = rgbHistogram(path_to_image, count_bins)
    I = imread(path_to_image);
    R = I(:, :, 1);
    G = I(:, :, 2);
    B = I(:, :, 3);

    scala = 256 / count_bins;

    count_R = zeros(1, count_bins);
    count_G = zeros(1, count_bins);
    count_B = zeros(1, count_bins);

    for i = 1:count_bins + 1
        edges(i) = (i - 1) * scala;
    endfor

    N_R = histc(R, edges);

    for i = 1:count_bins
        count_R(i) = sum(N_R(i, :));
    endfor

    N_G = histc(G, edges);

    for i = 1:count_bins
        count_G(i) = sum(N_G(i, :));
    endfor

    N_B = histc(B, edges);

    for i = 1:count_bins
        count_B(i) = sum(N_B(i, :));
    endfor

    sol = [count_R, count_G, count_B];

endfunction
