import numpy as np

def pca(data,nRedDim = 0):

    #centre data
    m = np.mean(data,axis=0)
    data -= m

    #sample cov mat

    C = np.cov(data.T)

    # Compute eVal, eVec, sort in desc order
    evals, evecs = np.linalg.eig(C)
    indices = np.argsort(evals)
    indices = indices[::-1]
    evecs = evecs[:,indices]
    evals = evals[indices]

    if nRedDim > 0:
        evecs = evecs[:, :nRedDim]

    # generate new data matrix
    x = np.dot(evecs.T, data.T)

    # reconstruct data
    y = np.dot(evecs,x).T+ m

    return x,y, evals, evecs

import pandas as pd

df_set = pd.read_csv('setosa.csv', header=None, sep=',')
df_vir = pd.read_csv('virginica.csv', header=None, sep=',')

data_set = df_set.ix[:,0:].values
data_vir = df_vir.ix[:,0:].values

data_set_orig = np.copy(data_set)
data_vir_orig = np.copy(data_vir)

n_set, p_set = data_set.shape
n_vir, p_vir = data_vir.shape

resultArray_set = pca(data_set, nRedDim=1)
reconstructed_set = resultArray_set[1]

resultArray_vir = pca(data_vir,nRedDim=1)
reconstructed_vir = resultArray_vir[1]

#plotting
import matplotlib.pyplot as plt

plt.figure()
plt.scatter(data_set_orig[:,0], data_set_orig[:,1], marker='x', c='r', label='original')
plt.scatter(reconstructed_set[:,0], reconstructed_set[:,1], marker='x', c='b', label='reconstructed')

plt.scatter(data_vir_orig[:,0], data_vir_orig[:,1], marker='x', c='r', label='original')
plt.scatter(reconstructed_vir[:,0], reconstructed_vir[:,1], marker='x', c='b', label='reconstructed')

plt.grid()
plt.legend()
plt.show()


