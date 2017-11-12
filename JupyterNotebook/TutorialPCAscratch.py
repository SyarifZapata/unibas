import numpy as np

# nReductionDimension, how many dimension you want to have
def pca(data,nRedDim = 0):

    # STEP 1: centring the data. the data will be spread close to the origin
    m = np.mean(data,axis=0)
    data -= m

    # STEP 2. find out the sample cov mat
    # 1/(n-1) a.T*a where a is deviation matrix. (a centered matrix). why should data be transposed??
    C = np.cov(data.T)

    # Compute eVal, eVec, sort in desc order
    # the higest eigenValue is the primary component.
    # Wie figure out the eigenvectors & values of the covariance matrix
    evals, evecs = np.linalg.eig(C)
    # argsort gives you small to big
    indices = np.argsort(evals)
    # we sort flip the data so the highest comes first.
    # This is method using in python to sort.
    indices = indices[::-1]
    evecs = evecs[:,indices]
    evals = evals[indices]

    if nRedDim > 0:
        evecs = evecs[:, :nRedDim]

    # generate new data matrix
    # why we have to transpose the evecs and the data? because of multiplication?
    x = np.dot(evecs.T, data.T)

    # reconstruct data
    # Formula (eVecs * data).T + mean
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


