# -*- coding: utf-8 -*-
"""
Created on Mon Oct 10 13:31:02 2022

@author: jrmfi
"""
circuito_trafo = {
                    'index':5,
                    'titulo':'Dados Gerador',
                    'id':'lista_d',
                    'dados': {
                                'Potência Aparante (kVA)': 0, 
                                'Tensão Primário (kV)':0, 
                                'Tensão Secundário (kV)':0,
                                'Reatância de Seq + (p.u.)':0, 
                                'Reatância de Seq 0 (p.u.)':0,
                            }
                    }

circuito_gerador = {
                    'index':4,
                    'titulo':'Dados Gerador',
                    'id':'lista_d',
                    'dados': {
                                'Potência Aparante (kVA)':0,
                                'Tensão Nominal (kV)':0, 
                                'Rotação Nominal (RPM)':0,
                                'Reatância de Seq (p.u.)':0,
                                'Reatância de Seq - (p.u.)':0, 
                                'Reatância de Seq 0 (p.u.)':0,
                                'Reatância de Seq + do Condutor(p.u.)':0, 
                                'Reatância de Seq 0 do Condutor(p.u.)':0,
                            }
                    }
pontos = {

            1: {
                'index':3,
                'titulo':'Ponto de ánalise',
                'id':'lista_c',
                'dados':{
                         'BARRA UG01': 'BARRA UG01',
                         'SAÍDA SE - BT TRAFO': 'SAÍDA SE - BT TRAFO',
                         'ENTRADA SE - AT TRAFO': 'ENTRADA SE - AT TRAFO',
                         'PONTO DE CONEXÃO':'PONTO DE CONEXÃO'
                         },
            },
            2:{
                'index':3,
                'titulo':'Ponto de ánalise',
                'id':'lista_c',
                'dados':{
                         'BARRA UG01': 'BARRA UG01',
                         'BARRA UG02': 'BARRA UG02',
                         'SAÍDA SE - BT TRAFO': 'SAÍDA SE - BT TRAFO',
                         'ENTRADA SE - AT TRAFO': 'ENTRADA SE - AT TRAFO',
                         'PONTO DE CONEXÃO':'PONTO DE CONEXÃO'
                         },
            },
            3:{
                'index':3,
                'titulo':'Ponto de ánalise',
                'id':'lista_c',
                'dados':{
                         'BARRA UG01': 'BARRA UG01',
                         'BARRA UG02': 'BARRA UG02', 
                         'SAÍDA SE - BT TRAFO 01':'SAÍDA SE - BT TRAFO 01', 
                         'ENTRADA SE - AT TRAFO 01':'ENTRADA SE - AT TRAFO 01', 
                         'SAÍDA SE - BT TRAFO': 'SAÍDA SE - BT TRAFO',
                         'ENTRADA SE - AT TRAFO': 'ENTRADA SE - AT TRAFO',
                         'PONTO DE CONEXÃO':'PONTO DE CONEXÃO'
                         },
            },
            4:{
                'index':3,
                'titulo':'Ponto de ánalise',
                'id':'lista_c',
                'dados':{
                         'BARRA UG01': 'BARRA UG01',
                         'BARRA UG02':'BARRA UG02',
                         'BARRA UG03':'BARRA UG03', 
                         'BARRA UG04':'BARRA UG04',
                         'SAÍDA SE - BT TRAFO': 'SAÍDA SE - BT TRAFO',
                         'ENTRADA SE - AT TRAFO': 'ENTRADA SE - AT TRAFO',
                         'PONTO DE CONEXÃO':'PONTO DE CONEXÃO'
                         },
            },
            5:{
                'index':3,
                'titulo':'Ponto de ánalise',
                'id':'lista_c',
                 'dados':{
                         'BARRA UG01': 'BARRA UG01',
                         'BARRA UG02':'BARRA UG02',
                         'BARRA UG03':'BARRA UG03', 
                         'BARRA UG04':'BARRA UG04',
                         'SAÍDA SE - BT TRAFO 01': 'SAÍDA SE - BT TRAFO 01',
                         'ENTRADA SE - AT TRAFO 01': 'ENTRADA SE - AT TRAFO 01',
                         'SAÍDA SE - BT TRAFO 02':'SAÍDA SE - BT TRAFO 02',
                         'ENTRADA SE - AT TRAFO 02':'ENTRADA SE - AT TRAFO 02',
                         'PONTO DE CONEXÃO':'PONTO DE CONEXÃO'
                         },
            }
    }
circuito = {
            'index': 2,
            'titulo':'Escolha a configuração do circuito',
            'id':'lista_b',
            'dados': {
                        '1TE + 1UG': 1, 
                        '1TE + 2UG': 2,
                        '2TE + 2UG': 3, 
                        '1TE + 4UG': 4, 
                        '2TE + 4UG': 5,
                    }
            }

concessionaria = {
                    'index': 1,
                    'titulo': 'Escolha a concessionária de energia',
                    'id':'lista_a',
                    'dados': {
                                'CELESC 13,8 kV':{'Sb': 100e6,'Vb':13.8e3}, 
                                'CELESC 23,1 kV':{'Sb': 100e6,'Vb':21.1e3}, 
                                'COPEL':{'Sb': 100e6,'Vb':34.5e3}, 
                                'CPFL':{'Sb': 100e6,'Vb':23.1e3}, 
                                'ENERGISA':{'Sb': 100e6,'Vb':34.5e3}, 
                                'RGE 13,8 kV':{'Sb': 100e6,'Vb':13.8e3}, 
                                'RGE 23,1 kV':{'Sb': 100e6,'Vb':23.1e3},
                            }
                }


configuracoes = {
                    1: {'concessionaria':None, 'valor': 1},
                    2: {'circuito':None, 'valor': 1},
                    3: {'circuito':None, 'valor': 1},
                    4: {'circuito':None, 'valor': 1},
                    5: {'circuito':None, 'valor': 1},

}