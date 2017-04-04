function C = strassen(A,B)
n = length(A);
    if length(A) ~= length(B)
        warning('matrix are not equal in size')
        C = eye(n);
        return 
    end
    
    if n == 1 
        C = A*B;
    else 
        A = mat2cell(A, [n/2 n/2], [n/2 n/2]);
        B = mat2cell(B, [n/2 n/2], [n/2 n/2]);
        temp1111=strassen(A{1,1},B{1,1});
        temp1122=strassen(A{1,1},B{2,2});
        temp2211=strassen(A{2,2},B{1,1});
        temp2222=strassen(A{2,2},B{2,2});
        temp2111 = strassen(A{2,1},B{1,1});
        temp1112 = strassen(A{1,1},B{1,2});
        temp1222=strassen(A{1,2},B{2,2});
        temp2221=strassen(A{2,2},B{2,1});
        
        P1= temp1111+temp1122+temp2211+temp2222;
        P2= temp2111+temp2211;
        P3=temp1112-temp1122; 
        P4=temp2221-temp2211;
        P5=temp1122+temp1222;
        P6=temp2111+strassen(A{2,1},B{1,2})-temp1111-temp1112;
        P7=strassen(A{1,2},B{2,1})+temp1222-temp2221-temp2222;
        
        C = [(P1 + P4 -P5 +P7), (P3 + P5);(P2 + P4), (P1 + P3 - P2 + P6)];
    end
end