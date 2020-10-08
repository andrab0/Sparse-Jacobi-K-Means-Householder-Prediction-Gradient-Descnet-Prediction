function [sol] = hsvHistogram(path_to_image, count_bins)
    I = imread(path_to_image);

    scala = 1.01 / count_bins;

    for i = 1:count_bins + 1
        edges(i) = (i - 1) * scala;
    endfor

    [H S V] = rgbTOhsv(I);

    count_H = zeros(1, count_bins);
    count_S = zeros(1, count_bins);
    count_V = zeros(1, count_bins);

    N_H = histc(H, edges);

    for i = 1:count_bins
        count_H(i) = sum(N_H(i, :));
    endfor

    N_S = histc(S, edges);

    for i = 1:count_bins
        count_S(i) = sum(N_S(i, :));
    endfor

    N_V = histc(V, edges);

    for i = 1:count_bins
        count_V(i) = sum(N_V(i, :));
    endfor

    sol = [count_H, count_S, count_V];
end
