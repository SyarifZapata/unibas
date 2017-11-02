import numpy as np
import numpy.linalg as linalg
import matplotlib.pyplot as plt

data = np.genfromtxt('data2.dat')
rows,cols = data.shape
A = np.zeros((rows,3))
y = np.zeros((rows,1))

for i in range(rows):
    A[i,0] = np.power(data[i,0],2)
    A[i,1] = data[i,0]
    A[i,2] = 1
    y[i] = data[i,1]

[U,s,Vt] = linalg.svd(A)
print(U)
print()
print(s)
print("Vt")
print(Vt)
print()

print("Condition number:")
print(np.dot(linalg.norm(linalg.pinv(A)),linalg.norm(A)))
print(linalg.cond(A))
print(s[0]/s[2])

sInv = np.zeros((rows,3))
sInv = sInv.T
sInv[0,0] = 1/A[0,0]
sInv[1,1] = 1/A[1,1]
sInv[2,2] = 1/A[2,2]

print()
print(sInv)

Ainv = np.dot(Vt.T,sInv)
Ainv = np.dot(Ainv,U.T)

print(y)

b = np.dot(Ainv, y)

print()
print(b)

#sum squared residual = sum (yi - f(x))^2
sumSquaredResiduals = 0
for i in range(rows):
    sumSquaredResiduals = sumSquaredResiduals + np.power(y[i]-((A[i,0]*b[0])+(A[i,1]*b[1])+b[2]),2)

print("residual")
print(np.sqrt(sumSquaredResiduals))
print(data[:,1])


Uzeroed = np.delete(U,cols-1,1)
VZeroed = np.delete(Vt,cols-1,0)
sInvZerod = np.zeros((rows-1,2))
sInvZerod = sInvZerod.T
sInvZerod[0,0] = 1/A[0,0]
sInvZerod[1,1] = 1/A[1,1]

print()
print(sInv)
print()


Ainv = np.dot(VZeroed.T,sInvZerod)
Ainv = np.dot(Ainv,Uzeroed.T)


print(y)

b = np.dot(Ainv, y)
print()
print(b)

sZerod = np.zeros((rows-1,2))
sZerod[0,0] = 1/A[0,0]
sZerod[1,1] = 1/A[1,1]

Azerod = np.dot(Uzeroed,sZerod)
Azerod = np.dot(Azerod,VZeroed)

print("Condition number:")
print(linalg.cond(Azerod))
print(s[0]/s[1])


