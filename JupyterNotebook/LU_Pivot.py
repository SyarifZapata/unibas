import numpy as np

def lu(A):

    cols,rows = A.shape

    id_mat = np.zeros((cols,rows))
    pivot = np.identity(cols)

    print()

    k = -1
    for j in range(cols):
        max = np.argmax(abs(A[:,j]))

        if max != j & max !=k:
            k = max
            A[[j,max]] = A[[max,j]]
            id_mat[[j,max]] = id_mat[[max,j]]
            pivot[[j,max]] = pivot[[max,j]]

        for i in range(j,cols - 1):
            id_mat[i + 1, j] = A[i + 1, j] / A[j, j]
            A[i+1, :] = A[i+1, :] - (A[i+1, j] / A[j, j]) * A[j, :]

    np.fill_diagonal(id_mat,1)
    return id_mat,A,pivot

# there is another algorthim like the