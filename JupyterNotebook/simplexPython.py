import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as plt

np.set_printoptions(precision = 4, suppress = True)

def array(arr, dims = None):
    arr = np.array(arr, dtype = "float64")
    if dims != None:
        arr = arr.reshape(dims)
    return arr

def simplex(matrix):
    matrix = matrix.copy()
    while True:
        #:-1 heisst anfang bis lezte index -1
        pcol = matrix[0, :-1].argmax()
        print("pcol:",pcol)
        if matrix[0, pcol] <= 0:
            return matrix
        # -1 ist die letzte index
        prow = 1 + (matrix[1:, -1] / matrix[1:, pcol]).argmax()
        print(prow)
        pivot, pel = matrix[:, pcol].copy(), matrix[prow, pcol]
        print("pel", pel)
        for i in range(len(matrix)):
            if i != prow:
                matrix[i, :] = matrix[i, :] - (matrix[i, pcol] / matrix[prow, pcol]) * matrix[prow, :]
        matrix[prow, :] = matrix[prow, :] / -pel
        matrix[:, pcol] = pivot / pel
        matrix[prow, pcol] = 1 / pel

M = array([[13, 23, 0], [-4, -4, 160], [-35, -20, 1190], [-5, -15, 480]])
print(M)
print(simplex(M))