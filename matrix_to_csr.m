function [values, colind, rowptr] = matrix_to_csr(A)
    [n n] = size(A);

    nz = 1;

    for i = 1:n
        k = 0;

        for j = 1:n

            if (A(i, j) != 0)
                k++;
                values(nz) = A(i, j);
                colind(nz) = j;

                if (k == 1)
                    rowptr(i) = nz;
                endif

                nz++;
            endif

        endfor

    endfor

    rowptr(n + 1) = nz;

endfunction
