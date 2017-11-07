
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
import pandas as pd

df = pd.read_csv("hald.csv",header=None,sep=',')
points = df.ix[:,0:3].values

# create a PCA model with n=? principal components
pca = PCA(n_components=1)
pca.fit(points)

# get the components from transforming the original data
scores = pca.transform(points)

# reconstruction form n dimensional scores
reconstructed = pca.inverse_transform(scores)

#print("after:")
#print(scores)

#print("before:")
#print(points)

#print("in the end:")
#print(reconstructed)

#print("residual")
residual = points-reconstructed
#print(residual)

dim1 = 1
dim2 = 3

plt.figure()
plt.scatter(points[:,dim1],points[:,dim2],marker='x',c='r',label='original')
plt.scatter(reconstructed[:,dim1],reconstructed[:,dim2],marker='.',c='b',label='reconstructed')
plt.legend()
plt.xlabel('X1')
plt.ylabel('X2')
plt.title("PCA")
plt.show()