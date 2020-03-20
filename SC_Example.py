# -*- coding: utf-8 -*-
"""
Created on Sun Jan  5 07:16:29 2020

@author: daryl
"""
from sklearn.cluster import KMeans
import networkx as nx
import matplotlib.pyplot as plt
import numpy.linalg as LA
import numpy as np

sizes = [30,32,41,39]

probs = [[.5,.05,.05,.05],[.05,.5,.05,.05],[.05,.05,.5,.05],[.05,.05,.05,.5]]

G = nx.stochastic_block_model(sizes, probs)



LM = (nx.laplacian_matrix(G)).todense()

LMva, LMve = LA.eigh(LM)

##plt.figure()
#plt.plot(np.sort(LMva),'*')
#plt.show()

k=4

X = LMve[:,0:k]


kmeans = KMeans(n_clusters=k, random_state=0).fit(X)

plt.figure()
nx.draw(G, node_color = kmeans.labels_, cmap = 'tab20')
plt.show()


"""import scipy.ndimage
img1 = scipy.ndimage.imread('./pricehall.jpg', mode='L')
img2 = scipy.ndimage.imread('./Pacific-University1.jpg', mode='L')
img3 = scipy.ndimage.imread('./Plogo.png', mode='L')
img1 = scipy.ndimage.imread('./izzy1.jpg', mode='L')
img2 = scipy.ndimage.imread('./skye1.jpg', mode='L')
img3 = scipy.ndimage.imread('./stata.jpg', mode='L')

#asddfimg

U, s, V = LA.svd(img3)


for n in range(2,200,5):
    #n=5 #make gif from several n
    
    
    
    
    Sig = np.mat(np.eye(n)*s[:n])
    newdata = U[:,:n]
    newv = V[:n,:]
    
    plt.figure()
    plt.imshow(np.dot(np.dot(newdata,Sig),newv),cmap='gray')
    plt.savefig(f'./statagif/n{n}.png')
    plt.close()
"""



