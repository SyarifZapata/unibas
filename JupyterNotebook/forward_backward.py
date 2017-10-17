import numpy as np

# P.A.x = L.U.x
#
# L.U.x = P.b       ForwardSubs --> U.x = y --> L.y = P.b
#                   BackWardSubs --> U.x = y
#
# y(i) = (b(i) - sum(A(i,j))/a(i,i)---> always 1

def forwardSubs(L, b, P):
    cols, rows = L.shape
    if P is not None:
        b = np.dot(P,b)
    y = np.zeros((cols, 1))
    for i in range(cols):
        s = 0
        for j in range(0,i):
            s = s + L[i,j] * y[j]

        y[i] = (b[i]-s)
    return y

def backwardSubs(U,y):
    cols, rows = U.shape

    x = np.zeros((cols, 1))
    for i in range(cols-1,-1,-1):

        s = 0
        for j in range(0,cols):
            s = s + U[i,j] * x[j]
        x[i] = (1/ U[i,i])*(y[i] - s)
    return x