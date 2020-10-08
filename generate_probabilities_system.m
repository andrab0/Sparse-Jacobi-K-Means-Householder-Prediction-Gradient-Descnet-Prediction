function [A, b] = generate_probabilities_system(rows)
    index = 0;
    aux = rows;
    
    for i = 1:aux
       index = index + aux;
       aux--;
    endfor;

    A = zeros(index);

    %generarea valorilor de 6 pentru diagonala
    for i = 5:index-rows;
        A(i,i) = 6; 
    endfor

    %generarea valorilor de -1 pentru matrice
    for i = 2:index-rows

      for row = 1:index
          if( i >= (row*(row-1)/2 + 1) && i <= row*(row+1)/2 )
              A(i,i+row) = A(i,i+row+1) = -1;
              A(i+row,i) = A(i+row+1,i) = -1;
          endif

      endfor

    endfor
    
    %generarea valorilor de -1 pentru latura din stanga
    i = 1;
    for k = 1: rows;

        if ( i <= index )
            A(i,i) = 5;
            A(i,i+1) = -1;
            A(i+1,i) = -1;
        endif
        i = i+k;

    endfor

    %generarea valorilor de -1 pentru latura din dreapta
    i = 1;
    for k = 2:rows+1

        if(i <= index)

            if( i ~= 1)
                A(i,i) = 5;
                A(i,i-1) = -1;
                A(i,i-1) = -1;
            else
                A(i,i+2) = -1;
                A(i+2,i) = -1;
            endif

        endif
        i = i+k;

    endfor

    %generarea valorilor de -1 pentru latura de jos
    for i = index - rows+1: index-1
        A(i,i) = 5;  
        A(i,i+1) = -1;
        A(i+1,i) = -1;
    endfor

    %generarea valorilor de 4 de pe diagonala
    A(1,1) = A(index-rows+1, index-rows+1) = A(index,index) = 4; 
    
    for i = 5:index-rows

        if(A(i,i) == 6)
            A(i,i+1) = A(i+1,i) = -1;
        endif

    endfor
    
    %generarea vectorului b
    for k = 1 : index
        b(k) = 0;

        if ( k > (index - rows))
            b(k) = 1;
        endif
  
    endfor
    b = b';

endfunction