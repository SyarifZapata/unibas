import numpy as np

A = np.array([[16,-4,-12],[-4,5,5],[-12,5,19]])
print(A)

# A = L*L.T

def cholesky(A):
    rows,cols = A.shape

    #Check if the matrix dimensions are equal
    if rows != cols:
        print('Matrix dimensions are not equal')

    #Create n x n zeros matrix
    L = np.zeros((rows,rows))

    for i in range(0,rows):
        #traverse only the left triangular matrix elements
        for j in range (0,i+1):
            if i == 0 and j ==0:
                L[0,0] = np.sqrt(A[1,1])

            else:
                if j == i:
                    s = 0
                    for k in range(0,i):
                        s = s + np.power([i,k],2)

                    L[i,i] = np.sqrt(A[i,i]-s)

cholesky(A)