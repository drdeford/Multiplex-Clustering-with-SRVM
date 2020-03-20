# -*- coding: utf-8 -*-
"""
Created on Fri Mar 20 15:50:28 2020

@author: daryl
"""

import networkx as nx


def er_multi(n,k,p):
#n = 10
#
#k = 5
#
#p = .1

    nlist = [(i,j) for i in range(n) for j in range(k)]
    
    g = nx.Graph()
    
    g.add_nodes_from(nlist)
    
    vertlist = [((i,j),(i,l)) for i in range(n) for j in range(k-1) for l in range(j+1,k)]
    
    g.add_edges_from(vertlist)
    
    
    for i in range(k):
        temp = nx.erdos_renyi_graph(n, p)
        nx.relabel_nodes(temp,{x:(x,i) for x in temp.nodes()},False)
        g.add_edges_from(list(temp.edges()))

    return g
"""
er = nx.erdos_renyi_graph(100, 0.15)
ws = nx.watts_strogatz_graph(30, 3, 0.1)
ba = nx.barabasi_albert_graph(100, 5)
G = nx.stochastic_block_model(sizes, probs)
"""
#for 




