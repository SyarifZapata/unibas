import numpy as np
import numpy.linalg as linalg
import matplotlib.pyplot as plt


data = np.genfromtxt('data.dat')
A = np.zeros((2,2))
c = np.zeros((2,1))

print(data)

Ax_squared = 0
Ax = 0
rows,cols = data.shape

c1 = 0
c2 = 0

for i in range (rows):
    Ax_squared = Ax_squared + np.power(data[i, 0], 2)
    Ax = Ax + data[i,0]
    c1 = c1 + (data[i,0]*data[i,1])
    c2 = c2 + data[i,1]


A[0,0] = Ax_squared
A[1,0] = Ax
A[0,1] = Ax
A[1,1] = rows

c[0,0] = c1
c[1,0] = c2

[U,s,Vt] = linalg.svd(A)

print("A is like this: ")
print(A)
print()
print(c)

print()
print(U)
print()
print(s)
print()
print(Vt)

sInv = np.zeros((2,2))
sInv = sInv.T
sInv[0,0] = 1/s[0]
sInv[1,1] = 1/s[1]

print()
print(sInv)

Ainv = np.dot(Vt.T,sInv)
Ainv = np.dot(Ainv,U.T)

print()
print(Ainv)

b = np.dot(Ainv, c)

print()
print(b)
print()

y = (b[0]*data[:,0])+b[1]
y_orig = (-2*data[:,0])

sumSquaredResiduals = 0
for i in range(rows):
    sumSquaredResiduals = sumSquaredResiduals + np.power(y[i]-(b[0]*data[i,0]+b[1]),2)
print('residuals')
print(np.sqrt(sumSquaredResiduals))

plt.plot(data[:,0],data[:,1],label='noised given data')
plt.plot(data[:,0],y, label='calculated Result')
plt.plot(data[:,0],y_orig, label='Original Function')
legend = plt.legend(loc='upper right', shadow=True)
plt.show()