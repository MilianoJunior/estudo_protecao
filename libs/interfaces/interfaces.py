# Projeto de Conclusão de Curso Engenharia Elétrica - Estudo de Caso - Usina Hidrelétrica PCH JASP
# Estudo de Proteção - Geradores, Transformadores, Usina, Subestação, Linha de Transmissão
# Gabriel Vinícius Gasparetto

from kivymd.uix.card import  MDCard
from kivymd.uix.list import OneLineListItem
from kivymd.uix.list import  MDList
from kivymd.uix.button import MDRaisedButton
from kivymd.uix.screen import MDScreen
from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.uix.label import MDLabel
from kivymd.uix.scrollview import MDScrollView
from kivy.uix.scrollview import ScrollView
from kivy.uix.checkbox import CheckBox
from kivymd.uix.textfield import MDTextField
from random import uniform
from functools import partial
# meus módulos
from libs.variaveis.state_var import StateVar
from libs.calculos.calcular import Calculos

class EstudoProtecao(MDScreen):

        
    def __init__(self, name, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.name = name
        self.variaveis = StateVar()

    def __call__(self):
        # layouts #############################################################
        
        layout_principal = MDBoxLayout(md_bg_color="#C3C3C3", 
                                        orientation='vertical',
                                        padding=[10,10,10,10],
                                        spacing = 10,
                                        size_hint=[1,1],
                                        adaptive_height= True)        
        box_aux_scroll =  MDBoxLayout(md_bg_color="#C3C3C3",
                                      orientation='vertical',
                                      size_hint_y=None,
                                      spacing = 10)
        box_aux_scroll.bind(minimum_height=box_aux_scroll.setter('height'))
        scroll = ScrollView(size_hint=(1, None), size=(800, 700))
        
        # widgtes #############################################################
        
            # Display----------------------------------------------------------
        display_menu = self.display()
        
            # Botão calcular---------------------------------------------------
        button = MDRaisedButton(text='Calcular',
                                md_bg_color="0F2983",
                                pos_hint= {'center_x': .5, 'center_y': .0})
        
            # menu escolha concessionária--------------------------------------
        options = self.variaveis.concessionaria
        size = ['400dp','400dp']
        position = (0.5,0.1)
        choice_concessionaria  = self.gerar_menu(options, size, position,1)
            # menu escolha circuito--------------------------------------------
        options = self.variaveis.circuito
        size = ['400dp','360dp']
        position = (0.5,0.1)
        choice_circuito  = self.gerar_menu(options, size, position,2)
            # menu escolha circuito submenu -----------------------------------------
        options = self.variaveis.pontos[self.variaveis.configuracoes[2]['valor']]
        size = ['400dp','360dp']
        position = (0.5,0.1)
        choice_circuito_sub  = self.gerar_menu(options, size, position,2)

        size = ['400dp','600dp']
        options = self.variaveis.circuito_gerador
        position = (0.5,0.1)
        choice_gerador  = self.gerar_menu_inputs(options, size, position,2)

        options = self.variaveis.circuito_trafo
        size = ['400dp','500dp']
        position = (0.5,0.1)
        choice_trafo  = self.gerar_menu_inputs(options, size, position,2)

        
        button.fbind('on_press',self.logica_a)
        # self.ids['choice_circuito_sub'] = choice_circuito_sub
        self.ids['box_aux_scroll'] = box_aux_scroll 
        # add layout principal
        layout_principal.add_widget(display_menu)
        layout_principal.add_widget(button)
        box_aux_scroll.add_widget(choice_concessionaria)
        box_aux_scroll.add_widget(choice_circuito)
        box_aux_scroll.add_widget(choice_circuito_sub)
        box_aux_scroll.add_widget(choice_gerador)
        box_aux_scroll.add_widget(choice_trafo)
        scroll.add_widget(box_aux_scroll)
        layout_principal.add_widget(scroll)
        self.add_widget(layout_principal)
        return self
    def composite_scroll(self):
        print('lista C: ',self.ids['lista_c'])
        options = self.variaveis.pontos[self.variaveis.configuracoes[2]['valor']]
        # lista_obj = MDList()
        # self.ids[options['id']] = lista_obj
        self.ids['lista_c'].clear_widgets()
        for key, value in options['dados'].items():
            print(key, value)
        #     r, g, b = [uniform(0.2, 1.0) for j in range(3)]
        #     checkbox = CheckBox(size_hint= (None, None),
        #                         size= ("40dp", "40dp"),
        #                         pos_hint= {'center_x': .9, 'center_y': .5},
        #                         color=(r, g, b,1),
        #                         group=options['index'])
        #     checkbox.bind(active=partial(self.on_checkbox_active, options['index'], key, value))
        #     lista = OneLineListItem(text=key)
        #     lista.add_widget(checkbox)
        #     self.ids['lista_c'].add_widget(lista)
        # # print('---------------')
        # # print(options)
        # # print('---------------')
        # for child in self.ids['lista_c'].children:
        #     print(child)
        # self.ids['box_aux_scroll'].clear_widgets()
                    # menu escolha concessionária--------------------------------------

        # for child in self.ids['box_aux_scroll'].children[:]:
        #     print(child)
        # self.ids['box_aux_scroll'].remove_widget(self.ids['choice_circuito_sub'])

        #     # menu escolha circuito submenu -----------------------------------------
        # print(self.variaveis.configuracoes[2]['valor'])
        
        # size = ['400dp','360dp']
        # position = (0.5,0.1)
        # choice_circuito_sub  = self.gerar_menu(options, size, position,2)
        # print('options', options)
        
        # self.ids['box_aux_scroll'].add_widget(choice_circuito_sub)

    def logica_a(self,*args):
        obj = Calculos()
        obj.resolucao()
        # print(self.variaveis.configuracoes)


    def gerar_menu(self, options, size, pos, group):
        menu = MDCard(
                    orientation='vertical',
                    line_color=(0.2, 0.2, 0.2, 0.8),
                    padding=[10,10,10,10],
                    spacing=10,
                    size_hint=(None, None),
                    size = (size[0],size[1]),
                    focus_behavior=True,
                    pos_hint={"center_x": pos[0], "center_y": pos[1]},
                    md_bg_color="#FFFFFF",
                    unfocus_color="#FFFFFF",
                    focus_color="#92CCDE",
                )
        titulo =  MDLabel(
                        text= options['titulo'],
                        halign="center",
                        theme_text_color='Custom',
                        font_style='H6',
                        text_color= "#333333",
                )
        menu.add_widget(titulo)
        lista_obj = MDList()
        self.ids[options['id']] = lista_obj
        for key, value in options['dados'].items():
            r, g, b = [uniform(0.2, 1.0) for j in range(3)]
            checkbox = CheckBox(size_hint= (None, None),
                                size= ("40dp", "40dp"),
                                pos_hint= {'center_x': .9, 'center_y': .5},
                                color=(r, g, b,1),
                                group=options['index'])
            checkbox.bind(active=partial(self.on_checkbox_active, options['index'], key, value))
            lista = OneLineListItem(text=key)
            lista.add_widget(checkbox)
            lista_obj.add_widget(lista)
        menu.add_widget(lista_obj)
        return menu
    
    def gerar_menu_inputs(self,options, size, pos, group):
        menu = MDCard(
                    orientation='vertical',
                    line_color=(0.2, 0.2, 0.2, 0.8),
                    padding=[10,10,10,10],
                    spacing=10,
                    size_hint=(None, None),
                    size = (size[0],size[1]),
                    focus_behavior=True,
                    pos_hint={"center_x": pos[0], "center_y": pos[1]},
                    md_bg_color="#FFFFFF",
                    unfocus_color="#FFFFFF",
                    focus_color="#00FA9A",
                )
        titulo =  MDLabel(
                    text=options['titulo'],
                    halign="center",
                    theme_text_color='Custom',
                    font_style='H6',
                    text_color= "#333333",
                )
        menu.add_widget(titulo)
        lista_obj = MDList()
        for key, value in options['dados'].items():
            r, g, b = [uniform(0.2, 1.0) for j in range(3)]
            inputs = MDTextField(hint_text=key)
            inputs.bind(text=partial(self.on_checkbox_active, options['index'], key, value ))
            lista_obj.add_widget(inputs)
        menu.add_widget(lista_obj)
        
        return menu

    def display(self):
        configuracoes = StateVar().get_var()
        display_menu = MDCard(  orientation='vertical',
                                line_color=(0.2, 0.2, 0.2, 0.8),
                                padding=[10,10,10,10],
                                spacing=10,
                                size_hint=(None, None),
                                size = (800,200),
                                focus_behavior=True,
                                pos_hint={"center_x": .5, "center_y": .5},
                                md_bg_color="#FFFFFF",
                                unfocus_color="#FFFFFF",
                                focus_color="#92CCDE",
                    )
        for key, value in configuracoes.items():
            linha = MDBoxLayout(md_bg_color="#C3C3C3", 
                                    orientation='horizontal',
                                    padding=[1,1,1,1],
                                    spacing = 0,
                                    size_hint=[1,1],
                                    adaptive_width=False)
            for k, val in value.items():
                print(value, k, val)
                val = str(0) if val is None else str(int(val)+1)
                print(val)
                item =  MDLabel(text=k,
                                halign="center",
                                theme_text_color='Custom',
                                font_style='Body1',
                                text_color= "#333333",
                                size_hint=(.2,1))
                descricao = MDLabel(text=val,
                                    halign="center",
                                    theme_text_color='Custom',
                                    font_style='Caption',
                                    text_color= "#333333",
                                    size_hint=(.4,1))
                linha.add_widget(item)
                linha.add_widget(descricao)
            display_menu.add_widget(linha)

        return display_menu
    def on_checkbox_active(self, index, var, value, *args):
        print(index, var, value)
        self.variaveis.add_state(index, var, value)
        # self.composite_scroll()
        # print(args)


    def on_text_inputs(self, *args):
        print('On text: ',args)


    