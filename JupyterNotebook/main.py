import numpy as np
from LU_Pivot import lu
from forward_backward import forwardSubs,backwardSubs

A = np.array([[1.0, 0.0, -5.0], [-6.0, 2.0, 9.0], [2.0, -3.0, 2.0]])
print(A)

b = np.array([[-23,54,2]])
b = b.T
print(b)

L,U,P = lu(A)
print(L)
print()
print(U)
print()
print(P)
print()


y = forwardSubs(L,b,P)
print(backwardSubs(U,y))



