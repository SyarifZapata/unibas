import pandas as pd
import numpy as np

data = pd.read_csv('hald.csv', sep=",", header=None)
rows,cols = data.shape
print(cols,"\n")

# Covariance Matrix
# A = 1/n X.T * X
A = (data.T).dot(data)
A = A.multiply(1/cols)
print(A)
eigVal, eigVec = np.linalg.eig(A)
print(eigVal, "\n")
print(eigVec, "\n")

