function [H S V] = rgbTOhsv(I)
    R = double(I(:, :, 1));
    G = double(I(:, :, 2));
    B = double(I(:, :, 3));

    R_1 = double(R ./ 255);
    G_1 = double(G ./ 255);
    B_1 = double(B ./ 255);

    C_max = max(R_1, max(G_1, B_1));
    C_min = min(R_1, min(G_1, B_1));
    delta = C_max - C_min;

    H = zeros(size(delta));

    X = find(C_max == R_1);
    H(X) = 60 * mod((G_1(X) - B_1(X)) ./ delta(X), 6);

    Y = find(C_max == G_1);
    H(Y) = 60 * ((B_1(Y) - R_1(Y)) ./ delta(Y) + 2);

    Z = find(C_max == B_1);
    H(Z) = 60 * ((R_1(Z) - G_1(Z)) ./ delta(Z) + 4);
    H(delta == 0) = 0;
    H = double(H / 360);

    S = zeros(size(C_max));
    S = double(delta ./ C_max);
    S(C_max == 0) = 0;
    V = C_max;

endfunction
