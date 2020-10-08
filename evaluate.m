function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X, y] = preprocess(path_to_testset, histogram, count_bins);
    [nr_elem_y nr_col_y] = size(y);
    [nr_linii_X nr_col_X] = size(X);

    media = mean(X);
    deviatia = std(X);
    X = (X - media) ./ deviatia;

    semne_y = sign(y);

    X(:, nr_col_X + 1) = 1;

    k = X * w;
    semne_k = sign(k);
    count = 0;

    for i = 1:nr_linii_X

        if ((semne_k(i) == 1 && semne_y(i) == 1) || (semne_k(i) == -1 && semne_y(i) == -1))
            count++;
        endif

    endfor

    percentage = count / nr_elem_y;
endfunction
