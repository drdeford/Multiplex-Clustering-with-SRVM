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
from generate import er_multi

sizes = [30,32,41,39]

probs = [[.5,.05,.05,.05],[.05,.5,.05,.05],[.05,.05,.5,.05],[.05,.05,.05,.5]]

G = nx.stochastic_block_model(sizes, probs)

n = 100
k=5
p=.05
G = er_multi(n,k,p)

pos = nx.circular_layout(nx.erdos_renyi_graph(n,p))

#pos = {x:(pos[x[0]][0],pos[x[0]][1],x[1]) for x in G.nodes()}

pos = {x:pos[x[0]] for x in G.nodes()}

LM = (nx.laplacian_matrix(G)).todense()
#LM = (nx.normalized_laplacian_matrix(G)).todense()

LMva, LMve = LA.eigh(LM)

##plt.figure()
#plt.plot(np.sort(LMva),'*')
#plt.show()

#k=5

nc = 2

X = LMve[:,0:nc]


kmeans = KMeans(n_clusters=nc, random_state=0).fit(X)



for i in range(k):

    plt.figure()
    nx.draw(G.subgraph([x for x in G.nodes() if x[1]==i]),pos={z:(pos[z][0],pos[z][1]) for z in [x for x in G.nodes() if x[1]==i]}, node_color = list(kmeans.labels_)[i*n:(i+1)*n], cmap = 'tab20')
    plt.show()




