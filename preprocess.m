function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    path_to_cats = strcat(path_to_dataset, 'cats/');
    imgs_cats = getImgNames(path_to_cats);
    [N1 M1] = size(imgs_cats);

    path_to_not_cats = strcat(path_to_dataset, 'not_cats/');
    imgs_not_cats = getImgNames(path_to_not_cats);
    [N2 M2] = size(imgs_not_cats);

    X = zeros(N1 + N2, count_bins * 3);
    y = zeros(N1 + N2, 1);

    path_to_imgs_cats = strcat(path_to_cats, imgs_cats);
    path_to_imgs_not_cats = strcat(path_to_not_cats, imgs_not_cats);
    c = path_to_imgs_cats;
    d = path_to_imgs_not_cats;

    if (histogram == 'RGB')

        for (i = 1:N1)
            A(i, :) = rgbHistogram(c(i, :), count_bins);
        endfor

        for (j = 1:N2)
            B(j, :) = rgbHistogram(d(j, :), count_bins);
        endfor

    else

        if (histogram == 'HSV')

            for (i = 1:N1)
                A(i, :) = hsvHistogram(c(i, :), count_bins);
            endfor

            for (j = 1:N2)
                B(j, :) = hsvHistogram(d(j, :), count_bins);
            endfor

        endif

    endif

    X = [A; B];
    y(1:N1, 1) = 1;
    y(N1 + 1:N1 + N2, 1) = -1;
endfunction
