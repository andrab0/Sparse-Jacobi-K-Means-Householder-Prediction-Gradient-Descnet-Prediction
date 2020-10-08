function [centroids] = clustering_pc(points, NC)
    [N D] = size(points);
    s = zeros(NC,D);
    
    for i = 1:NC

        for j = 1:D
            k = 1;

            while ( k <= N)
                x = i + (k-1)*NC;

                if( x <= N) 
                    s(i,j) += points(i + (k-1)*NC,j);
                    centroid_initial(i,j) = s(i,j)/k;
                endif
                k++;

            endwhile

        endfor

    endfor

    ok = 0; 
    while ( ok == 0)
        dist = zeros(N,NC);

        for i = 1:N

            for j = 1:NC
                dist(i,j) = norm(points(i,:) - centroid_initial(j,:));
            endfor

        endfor
        
        % scoaterea minimului de pe fiecare linie pentru
        % a putea asocia puncte fiecarui centroid
        [min_val , v] = min(dist,[],2);
        suma = zeros(N,D);
        centroid = zeros(NC,D);
        
        for i = 1:NC

            for j = 1:D
                k = 1; 
                count = 0;

                while (k <= N)

                    if (v(k) == i)
                        suma(i,j) += points(k,j);
                        count++;
                        centroids(i,j) = suma(i,j)/count;
                    endif
                    k++;

                endwhile

            endfor

        endfor

        if norm(centroids - centroid_initial) != 0
            centroid_initial = centroids;
        else
            ok = 1;
        endif

        if ok != 0
            break
        endif

    endwhile

endfunction
