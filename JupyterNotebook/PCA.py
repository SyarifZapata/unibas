import pandas as pd
from numpy.testing import assert_array_almost_equal
import pylab as plt
import seaborn as sb
from pylab import rcParams

from sklearn import decomposition

rcParams['figure.figsize'] = 5, 4
sb.set_style('whitegrid')

variable_names = ['a','b','c','d','e']
data = pd.read_csv('hald.csv', sep=",", header=None, names=variable_names)
# print(data, "\n")

X = data.ix[:,0:4].values

print(X,"\n")

# create a PCA model with n=? principal components
pca = decomposition.PCA()
pca.fit(X)

# get the components from transforming the original data
scores = pca.transform(X)

print(scores,"\n")

# X_reconstructed = pca.inverse_transform(scores)
# print(X_reconstructed, "\n")
#
# X_projected2 = scores.dot(pca.components_) + pca.mean_
# print(X_projected2,'\n')
#
#
# # print(X_projected,'\n')
# assert_array_almost_equal(X_reconstructed, X_projected2)
#
# #
# loss = ((X_reconstructed - X) ** 2).mean()
# print(loss, "\n")
#
# dim1 = 1
# dim2 = 3
#
# plt.figure()
# plt.scatter(X[:,dim1],X[:,dim2],marker='x',c='r',label='original')
# plt.scatter(X_reconstructed[:,dim1],X_reconstructed[:,dim2],marker='.',c='b',label='reconstructed')
# plt.legend()
# plt.xlabel('X1')
# plt.ylabel('X2')
# plt.title("PCA")
# plt.show()

