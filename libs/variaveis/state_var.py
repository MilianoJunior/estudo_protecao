# -*- coding: utf-8 -*-
from libs.variaveis.variaveis import *

class SingletonMeta(type):
    """
    The Singleton class can be implemented in different ways in Python. Some
    possible methods include: base class, decorator, metaclass. We will use the
    metaclass because it is best suited for this purpose.
    """

    _instances = {}

    def __call__(cls, *args, **kwargs):
        """
        Possible changes to the value of the `__init__` argument do not affect
        the returned instance.
        """
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]


class StateVar(metaclass=SingletonMeta):
    
    def __init__(self):
        self.configuracoes = configuracoes
        self.concessionaria = concessionaria
        self.circuito = circuito
        self.pontos = pontos
        self.circuito_gerador = circuito_gerador
        self.circuito_trafo = circuito_trafo
    
    def add_state(self, index, var, value):
        values = [var, value]
        for i, key in enumerate(self.configuracoes[index].keys()):
            self.configuracoes[index].update({key: values[i]})
            
    def get_var(self):
        return self.configuracoes