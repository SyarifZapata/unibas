import numpy as np
import numpy.linalg as linalg

A = np.array([[5, 0], [-2, 2], [3,-1]])
b1 = np.array([[3],[2],[-1]])

# for Overdetermined system. A.T * A.x = A.T .b
# J = A.T * A
# r = A.T * b

print(A , "\n")
print(b1 , "\n")

J = np.dot(A.T, A)
print(J)
r = np.dot(A.T, b1)
print()
print(r)
U, s, V = linalg.svd(J)


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

# x = J_inverse * r

J_inverse = np.invert(J)
print()
print(J)

x = np.dot(J, r)
print()
print(x)


