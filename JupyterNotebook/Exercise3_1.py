import numpy as np
import numpy.linalg as linalg

A = np.array([[4, 0, 7], [-2, 2, 3]])
U, s, V = linalg.svd(A)

print(A , "\n")
# Left singular matrix
# U column is orthogonal
print("U Matrix:")
print(U , "\n")
# Diagonal Matrix with non zero element on the diagonal
# First element is the largest and the right most element is the smallest
print("s Vector: ")
print(s , "\n")
print("V matrix:")
# Right singular matrix
print(V , "\n")

print(np.dot(U[:,0], U[:,1]))



