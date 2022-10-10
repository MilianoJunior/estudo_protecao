# -*- coding: utf-8 -*-
"""
Created on Mon Oct 10 09:12:07 2022

@author: jrmfi
"""

import cmath 
import numpy as np

# declarações das variaveis

pi = cmath.pi

angulo_120 = 2*pi/3

angulo_180 = pi

fator_complex = 1j

# calculo

alfa1=1*cmath.exp((fator_complex *120*pi)/180)
alfa1_p = cmath.polar(alfa1)

# conversão

def R2P(x):
    return abs(x), np.angle(x, deg=True)

print('---------------')
print('Calculando Alfa')
print('Alfa 1, complex: ', alfa1,' polar radianos: ',alfa1_p, 'angulo degradiano: ',R2P(alfa1))

# construindo a matriz

# alfa2 = complex(alfa1.real ,-alfa1.imag)
# parametro_1 = R2P(1 + 0j)
# parametro_2 = R2P(alfa2))
# parametro_3 = R2P(alfa1)

# T1 = [[parametro_1],[parametro_2],[parametro_3]]
# print('---------------')
# print('Gerando Uma matriz: ')
# print(T1)

# Trabalhando com Numpy
# documentação: https://numpy.org/doc/stable/reference/generated/numpy.imag.html

aux = 1+ 0j

T2 = np.array([[aux, aux, aux],
               [aux, alfa, aux],
               [aux, aux, aux]])

print(T2)

# Criando uma matriz identidade

matriz_eye = np.eye(2, dtype=int)
