function [cost] = compute_cost_pc(points, centroids)
    [N D] = size(points);
    [NC D] = size(centroids);

    dist = zeros(N, NC);

    for i = 1:N

        for j = 1:NC
            dist(i, j) = norm(points(i, :) - centroids(j, :));
        endfor

    endfor

    [min_val, v] = min(dist, [], 2);
    cost = sum(min_val);

endfunction
