import numpy as np
import numpy.linalg as linalg

A = np.array([[5, 0, 1], [-2, 2, 3]])
b1 = np.array([[3],[2]])
U, s, V = linalg.svd(A)

print(A , "\n")
print(b1 , "\n")
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

# A inverse = V (sInverse) U^t


zeros =np.zeros((2,3))
print(zeros)
np.fill_diagonal(zeros,s)

s_pinv = linalg.pinv(zeros)
print(s_pinv)
print("\n")
x = np.dot(V,s_pinv)
print(x)
print()
A_inversed = np.dot(x, U.T)
print(A_inversed)

print()
np.dot(A_inversed,b1)
print(b1)



