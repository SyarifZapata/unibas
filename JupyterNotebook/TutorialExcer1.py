import numpy as np
import pandas as pd
from numpy.linalg import *

# Read the Data
df_setosa = pd.read_csv('setosa.csv',header=None, sep=",")
df_virginica = pd.read_csv('virginica.csv',header=None, sep=",")


# format it to np array. [:,0;] means all row and columns 0 until end
data_setosa = df_setosa.ix[:,0:].values
data_virginica = df_virginica.ix[:,0:].values

# .shape[0] is the number of rows or the 'n'
n_set = data_setosa.shape[0]
n_vir = data_virginica.shape[0]

# concatenate the both data, axis=0 means vertically
data = np.concatenate((data_setosa, data_virginica), axis=0)

# total n is now 100
n = n_set + n_vir

# centering data. We need this to find out the covariance matrix. 1/n-1 (a.T*a) where a is the deviation matrix
mn = np.mean(data,0) # col mean
mData = data - mn


# create response vector b. the question is why b should be 1/n
b = np.zeros((n,1))
b[0:n_set,0] = 1/n_set
b[n_set:n,0] = -1/n_vir


# solve mData*c = b
# economy SVD, automatically throw the zero elements
U,S,Vt = svd(mData, full_matrices=False)



S_pseudo = np.zeros((2,2))
S_pseudo[0,0] = 1/S[0]
S_pseudo[1,1] = 1/S[1]

# A^-1 = V*S.pseudeInverse*U.T
c = Vt.T.dot(S_pseudo.T).dot(U.T).dot(b)
print("\nResult based on mData:\n", c, "\n")

## Plotting
import matplotlib.pyplot as plt
plt.figure(figsize=(10,10))
plt.plot(mData[:n_set,0], mData[:n_set,1] ,'ob', mData[n_set:,0],mData[n_set:,1],'or')
plt.legend(['setosa', 'virginica'])

#c and ortho c
c_x = [0,c[0]]
c_y = [0, c[1]]

c_ortho_x = [0,-c[1]]
c_ortho_y = [0, c[0]]

coefficients_c = np.polyfit(c_x,c_y,1)
polynomial = np.poly1d(coefficients_c)
x_axis = np.linspace(-2,2)
y_axis = polynomial(x_axis)
plt.plot(x_axis, y_axis, "--")

coefficients_c_ortho = np.polyfit(c_ortho_x,c_ortho_y,1)
polynomial = np.poly1d(coefficients_c_ortho)
x_axis2 = np.linspace(-2,2)
y_axis2 = polynomial(x_axis2)
plt.plot(x_axis2, y_axis2, "b-")

plt.axes().set_aspect('equal')
plt.grid()

plt.show()

