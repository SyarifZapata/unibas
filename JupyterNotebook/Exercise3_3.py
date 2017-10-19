import numpy as np
import numpy.linalg as linalg

n = 4
A = np.zeros((n,n))
b = np.zeros((n,1))

for i in range(n):
    sum = 0
    for j in range(n):
        A[i,j] = 1/((100*(i+1)) + (0.01*(j+1)))
        sum = sum + A[i,j]
    b[i] = sum

U, s, V = linalg.svd(A)

print(A)
print()
print("U Matrix:")
print(U , "\n")
# Diagonal Matrix with non zero element on the diagonal
# First element is the largest and the right most element is the smallest
print("s Vector: ")
print(s , "\n")
print("V matrix:")
# Right singular matrix
print(V , "\n")
print()

print(b)
print()
print("Condition number:")
print(np.dot(linalg.norm(linalg.pinv(A)),linalg.norm(A)))
# print(linalg.cond(A))

#zeroing
# U1 = np.array(U[:,0]).reshape(4,1)
Uzeroed = np.delete(U,3,1)
sZeroed = s[0:3]
print()
print(sZeroed)
sTemp = np.zeros((3,3))
print()
np.fill_diagonal(sTemp,sZeroed)
sZeroed = sTemp
print()
VZeroed = np.delete(V,3,0)
B = np.dot(Uzeroed,sZeroed)
B = np.dot(B,VZeroed)

# U = np.concatenate((U[:,0],U[:,1]),axis=1)
# print()
print(Uzeroed)
print()
print(sZeroed)
print()
print(VZeroed)
print()
print(A)
print()
print(B)
print()
print(np.ndim(B))
print(s[0]/s[2])

x1 = np.dot(linalg.pinv(A), b)
print()
print(x1)
x2 = np.dot(linalg.pinv(B),b)
print(x2)


