import pandas as pd
import numpy as np
from numpy.testing import assert_array_almost_equal
import matplotlib.pyplot as plt
import pylab as plt
import seaborn as sb
from IPython.display import Image
from IPython.core.display import  HTML
from pylab import rcParams

import sklearn
from sklearn import decomposition
from sklearn.decomposition import PCA
from sklearn import datasets

# matplotlib inline
rcParams['figure.figsize'] = 5, 4
sb.set_style('whitegrid')

# iris = datasets.load_iris()
# X = iris.data
# print(X)
# variable_names = iris.feature_names
# print(X[1:10], "\n")

variable_names = ['a','b','c','d','e']
data = pd.read_csv('hald.csv', sep=",", header=None, names=variable_names)

X = data
print(data)


pca = decomposition.PCA()
iris_pca = pca.fit_transform(X)
print(pca.explained_variance_ratio_,"\n")
print(pca.explained_variance_ratio_.sum(), "\n")

comps = pd.DataFrame(pca.components_,columns=variable_names)
print(comps, "\n")

# X_projected = pca.inverse_transform(iris_pca)
X_projected = pca.inverse_transform(-0.525867)
X_projected2 = iris_pca.dot(pca.components_) + pca.mean_
print(X_projected2,'\n')


print(X_projected,'\n')
# assert_array_almost_equal(X_projected, X_projected2)
sb.heatmap(comps)
plt.show()

# loss = ((X_projected2 - X_projected) ** 2).mean()
# print(loss)

