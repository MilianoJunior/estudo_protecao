# -*- coding: utf-8 -*-
"""
Created on Mon Oct 10 12:47:23 2022

@author: jrmfi
"""
from libs.variaveis.state_var import StateVar
import numpy as np

class Calculos:
    
    def __init__(self):
        self.variaveis = StateVar()
    
    def resolucao(self):
        config = self.variaveis.get_var()
        for key, value in config.items():
            print(key)
            print(value)
            print('--------------')
    
    def soma(self, a, b):
        return a + b