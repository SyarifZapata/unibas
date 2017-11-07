import pandas as pd
import numpy as np
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis

variable_names = ["sepallength","sepalwidth"]
setosa = pd.read_csv('setosa.csv', sep=",", header=None ,names=variable_names)
setosa_centered = setosa - setosa.mean()
print(setosa_centered, "\n")

variable_names = ["sepallength","sepalwidth"]
virginica = pd.read_csv('virginica.csv', sep=",", header=None ,names=variable_names)
virginica_centered = virginica - virginica.mean()
print(virginica_centered, "\n")

frames = [setosa_centered, virginica_centered]
A = pd.concat(frames)
print(A,"\n")
y = np.zeros((100))
y[0:50] = 1
y[50:100] = 2
print(y,"\n")

lda = LinearDiscriminantAnalysis(n_components=2)
X_r2 = lda.fit(A, y).transform(A)
print(X_r2)




#
# label_dict = {1: 'Setosa', 2: 'Virginica'}
