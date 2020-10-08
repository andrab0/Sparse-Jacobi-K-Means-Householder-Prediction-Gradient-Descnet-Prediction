function [w] = learn(X, y, lr, epochs)
    [nr_poze nr_caracteristici_poza] = size(X);

    media = mean(X);
    deviatia = std(X);
    X = (X - media) ./ deviatia;

    X1 = [X, ones(nr_poze, 1)];
    [nr_linii_X1 nr_col_X1] = size(X1);

    batch_size = 64;
    count_bins = nr_caracteristici_poza / 3;
    lungime_w = 3 * count_bins + 1;
    w = rand(lungime_w, [1, -1]) / 10;

    for epoch = 1:epochs
        indici = randi(nr_linii_X1, [batch_size, 1]);

        X_batch = X1(indici, :);
        y_batch = y(indici);

        for i = 1:lungime_w
            k = X_batch * w - y_batch;
            suma = k' * X_batch(:, i);
            % suma = (X_batch * w - y_batch) * X_batch(:,i);
            w(i) = w(i) - lr * (1 / nr_poze) * suma;
        endfor

    endfor

endfunction
