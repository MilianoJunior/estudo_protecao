// %% Projeto de Conclusão de Curso Engenharia Elétrica - Estudo de Caso - Usina Hidrelétrica PCH JASP
// %% Estudo de Proteção - Geradores, Transformadores, Usina, Subestação, Linha de Transmissão
// % % Gabriel Vinícius Gasparetto
// % deploytool
// clear; clc; format shortG;



// %% Seleção da Concessionária de Energia
choice_concessionaria = menu('Escolha a Concessionária de Energia','CELESC', 'COPEL', 'CPFL', 'ENERGISA', 'RGE');
if choice_concessionaria == 1
    Sb = 100e6;
    choice_Vb_Celesc = menu('Escolha a Tensão de Conexão','13,8 kV', '23,1 kV');
    if choice_Vb_Celesc == 1
        Vb = 13.8e3;
    else
        Vb = 23.1e3;
    end
elseif choice_concessionaria == 2
    Sb = 100e6;
    Vb = 34.5e3;
elseif choice_concessionaria == 3
    Sb = 100e6;
    Vb = 23.1e3;
elseif choice_concessionaria == 4
    Sb = 100e6;
    Vb = 34.5e3;
else
    Sb = 100e6;
    choice_Vb_RGE = menu('Escolha a Tensão de Conexão','13,8 kV', '23,1 kV');
    if choice_Vb_RGE == 1
        Vb = 13.8e3;
    else
        Vb = 23.1e3;
    end
end



%% Constantes Diversas
alfa=1*exp(j*120*pi/180); %Vetor fasor
T=[1 1 1; 1 alfa^2 alfa; 1 alfa alfa^2]; % Matriz multiplicadora do vetor fasor
f=60; %Frequencia
ang=char(8737); % string do simbolo de "ângulo"


%% Seleção da Configuração do Circuito
choice_config = menu('Escolha a Configuração do Circuito','1TE + 1UG', '1TE + 2UG', '2TE + 2UG', '1TE + 4 UG', '2TE + 4UG');
if choice_config == 1 %1TE + 1UG
    choice_ponto_config_1 = menu('Escolha o Ponto de Análise','BARRA UG01', 'SAÍDA SE - BT TRAFO', 'ENTRADA SE - AT TRAFO', 'PONTO DE CONEXÃO');
elseif choice_config == 2 %1TE + 2UG
    choice_ponto_config_2 = menu('Escolha o Ponto de Análise','BARRA UG01', 'BARRA UG02', 'SAÍDA SE - BT TRAFO', 'ENTRADA SE - AT TRAFO', 'PONTO DE CONEXÃO');
elseif choice_config == 3 %2TE + 2UG
    choice_ponto_config_3 = menu('Escolha o Ponto de Análise','BARRA UG01', 'BARRA UG02', 'SAÍDA SE - BT TRAFO 01', 'ENTRADA SE - AT TRAFO 01', 'SAÍDA SE - BT TRAFO 01', 'ENTRADA SE - AT TRAFO 01', 'PONTO DE CONEXÃO');
elseif choice_config == 4 %1TE + 4 UG
    choice_ponto_config_4 = menu('Escolha o Ponto de Análise','BARRA UG01', 'BARRA UG02', 'BARRA UG03', 'BARRA UG04', 'SAÍDA SE - BT TRAFO', 'ENTRADA SE - AT TRAFO', 'PONTO DE CONEXÃO');
elseif choice_config == 5 %2TE + 4 UG
    choice_ponto_config_5 = menu('Escolha o Ponto de Análise','BARRA UG01', 'BARRA UG02', 'BARRA UG03', 'BARRA UG04', 'SAÍDA SE - BT TRAFO 01', 'ENTRADA SE - AT TRAFO 01', 'SAÍDA SE - BT TRAFO 02', 'ENTRADA SE - AT TRAFO 02', 'PONTO DE CONEXÃO');
end


%% CONFIGURAÇÃO 1TE + 1UG
if choice_ponto_config_1 == 1
    ponto_config_1 = '1';
elseif choice_ponto_config_1 == 2
    ponto_config_1 = '2';
elseif choice_ponto_config_1 == 3
    ponto_config_1 = '3';
elseif choice_ponto_config_1 == 4
    ponto_config_1 = '4';
else
    ponto_config_1 = '5';
end    

if choice_config == 2 
promptUG1 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG1,dlg_title,num_lines,def);

Input01UG1 = str2num(answer{1});
Input02UG1 = str2num(answer{2});
Input03UG1 = str2num(answer{3});
Input04UG1 = str2num(answer{4});
Input05UG1 = str2num(answer{5});
Input06UG1 = str2num(answer{6});
Input07UG1 = str2num(answer{7});
Input08UG1 = str2num(answer{8});

% promptUG2 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
%              'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
%              'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
% dlg_title = 'Digite os Dados de Placa da UG01';
% num_lines = 1;
% def = {'','','','','','','',''};
% answer = inputdlg(promptUG2,dlg_title,num_lines,def);
% 
% Input01UG2 = str2num(answer{1});
% Input02UG2 = str2num(answer{2});
% Input03UG2 = str2num(answer{3});
% Input04UG2 = str2num(answer{4});
% Input05UG2 = str2num(answer{5});
% Input06UG2 = str2num(answer{6});
% Input07UG2 = str2num(answer{7});
% Input08UG2 = str2num(answer{8});

promptT1 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT1,dlg_title,num_lines,def);

Input01T1 = str2num(answer{1});
Input02T1 = str2num(answer{2});
Input03T1 = str2num(answer{3});
Input04T1 = str2num(answer{4});
Input05T1 = str2num(answer{5});
end 


%Dados de Referência - usar se precisar
% Máquina Geradora - UG01
% S_g1 = 1450e3;                                          %Potência     
% V_g1 = 2.3e3;                                           %Tensão terminal 
% x1_g1 = 0.147;                                          %Reatância de Sequência +  
% x2_g1 = 0.164;                                          %Reatância de Sequência -    
% x0_g1 = 0.014;                                          %Reatância de Sequência 0    
% xn_g1 = (V_g1/sqrt(3))/100;                             %Reatância de Neutro (0.03+j*0.08
% r1x1_cg1 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg1 = (2*((0.984338+j*1.1419)));                   %Impedância do condutor 95mm² - Sequência 0

S_g1     = Input01UG1;              %Potência     
V_g1     = Input02UG1;              %Tensão terminal 
x1_g1    = Input03UG1;              %Reatância de Sequência +  
x2_g1    = Input04UG1;              %Reatância de Sequência -    
x0_g1    = Input05UG1;              %Reatância de Sequência 0    
xn_g1    = (V_g1/sqrt(3))/100;      %Reatância de Neutro (0.03+j*0.08
r1x1_cg1 = Input06UG1;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg1 = 2*Input07UG1;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG02  
% S_g2 = 750e3;                     %Potência
% V_g2 = 2.3e3;                     %Tensão terminal   
% x1_g2 = 0.162;                    %Reatância de Sequência + 
% x2_g2 = 0.1730;                   %Reatância de Sequência -
% x0_g2 = 0.016;                    %Reatância de Sequência 0
% xn_g2 = (V_g2/sqrt(3))/100;       %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% % 
% % Máquina Geradora - UG02  
% S_g2     = Input01UG2;              %Potência
% V_g2     = Input02UG2;              %Tensão terminal   
% x1_g2    = Input03UG2;              %Reatância de Sequência + 
% x2_g2    = Input04UG2;              %Reatância de Sequência -
% x0_g2    = Input05UG2;              %Reatância de Sequência 0
% xn_g2 	 = (V_g2/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = Input06UG2;              %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg2 = 2*Input07UG2;            %Impedância do condutor 95mm² - Sequência 0

% %Transformador Elevador - Usina
S_t1  = Input01T1;            %Poência   
Vp_t1 = Input02T1;            %Tensão do Primário
Vs_t1 = Input03T1;            %Tensão do Secundário
x1_t1 = Input04T1;            %Reatância de Sequência +
x2_t1 = x1_t1;                %Reatância de Sequência -
x0_t1 = Input05T1;            %Reatância de Sequência 0
xn_t1 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro



%% CONFIGURAÇÃO 1TE + 2UG
if choice_ponto_config_2 == 1
    ponto_config_2 = '1';
elseif choice_ponto_config_2 == 2
    ponto_config_2 = '2';
elseif choice_ponto_config_2 == 3
    ponto_config_2 = '3';
elseif choice_ponto_config_2 == 4
    ponto_config_2 = '4';
else
    ponto_config_2 = '5';
end    

if choice_config == 1 
promptUG1 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG1,dlg_title,num_lines,def);

Input01UG1 = str2num(answer{1});
Input02UG1 = str2num(answer{2});
Input03UG1 = str2num(answer{3});
Input04UG1 = str2num(answer{4});
Input05UG1 = str2num(answer{5});
Input06UG1 = str2num(answer{6});
Input07UG1 = str2num(answer{7});
Input08UG1 = str2num(answer{8});

promptUG2 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG2,dlg_title,num_lines,def);

Input01UG2 = str2num(answer{1});
Input02UG2 = str2num(answer{2});
Input03UG2 = str2num(answer{3});
Input04UG2 = str2num(answer{4});
Input05UG2 = str2num(answer{5});
Input06UG2 = str2num(answer{6});
Input07UG2 = str2num(answer{7});
Input08UG2 = str2num(answer{8});

promptT1 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT1,dlg_title,num_lines,def);

Input01T1 = str2num(answer{1});
Input02T1 = str2num(answer{2});
Input03T1 = str2num(answer{3});
Input04T1 = str2num(answer{4});
Input05T1 = str2num(answer{5});
end 


%Dados de Referência - usar se precisar
% Máquina Geradora - UG01
% S_g1 = 1450e3;                                          %Potência     
% V_g1 = 2.3e3;                                           %Tensão terminal 
% x1_g1 = 0.147;                                          %Reatância de Sequência +  
% x2_g1 = 0.164;                                          %Reatância de Sequência -    
% x0_g1 = 0.014;                                          %Reatância de Sequência 0    
% xn_g1 = (V_g1/sqrt(3))/100;                             %Reatância de Neutro (0.03+j*0.08
% r1x1_cg1 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg1 = (2*((0.984338+j*1.1419)));                   %Impedância do condutor 95mm² - Sequência 0

S_g1     = Input01UG1;              %Potência     
V_g1     = Input02UG1;              %Tensão terminal 
x1_g1    = Input03UG1;              %Reatância de Sequência +  
x2_g1    = Input04UG1;              %Reatância de Sequência -    
x0_g1    = Input05UG1;              %Reatância de Sequência 0    
xn_g1    = (V_g1/sqrt(3))/100;      %Reatância de Neutro (0.03+j*0.08
r1x1_cg1 = Input06UG1;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg1 = 2*Input07UG1;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG02  
% S_g2 = 750e3;                     %Potência
% V_g2 = 2.3e3;                     %Tensão terminal   
% x1_g2 = 0.162;                    %Reatância de Sequência + 
% x2_g2 = 0.1730;                   %Reatância de Sequência -
% x0_g2 = 0.016;                    %Reatância de Sequência 0
% xn_g2 = (V_g2/sqrt(3))/100;       %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% 
% Máquina Geradora - UG02  
S_g2     = Input01UG2;              %Potência
V_g2     = Input02UG2;              %Tensão terminal   
x1_g2    = Input03UG2;              %Reatância de Sequência + 
x2_g2    = Input04UG2;              %Reatância de Sequência -
x0_g2    = Input05UG2;              %Reatância de Sequência 0
xn_g2 	 = (V_g2/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg2 = Input06UG2;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg2 = 2*Input07UG2;            %Impedância do condutor 95mm² - Sequência 0

% %Transformador Elevador - Usina
S_t1  = Input01T1;            %Poência   
Vp_t1 = Input02T1;            %Tensão do Primário
Vs_t1 = Input03T1;            %Tensão do Secundário
x1_t1 = Input04T1;            %Reatância de Sequência +
x2_t1 = x1_t1;                %Reatância de Sequência -
x0_t1 = Input05T1;            %Reatância de Sequência 0
xn_t1 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro





%% CONFIGURAÇÃO 2TE + 2UG
if choice_ponto_config_3 == 1
    ponto_config_3 = '1';
elseif choice_ponto_config_2 == 2
    ponto_config_3 = '2';
elseif choice_ponto_config_2 == 3
    ponto_config_3 = '3';
elseif choice_ponto_config_2 == 4
    ponto_config_3 = '4';
else
    ponto_config_3 = '5';
end    

if choice_config == 3 
promptUG1 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG1,dlg_title,num_lines,def);

Input01UG1 = str2num(answer{1});
Input02UG1 = str2num(answer{2});
Input03UG1 = str2num(answer{3});
Input04UG1 = str2num(answer{4});
Input05UG1 = str2num(answer{5});
Input06UG1 = str2num(answer{6});
Input07UG1 = str2num(answer{7});
Input08UG1 = str2num(answer{8});

promptUG2 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG2,dlg_title,num_lines,def);

Input01UG2 = str2num(answer{1});
Input02UG2 = str2num(answer{2});
Input03UG2 = str2num(answer{3});
Input04UG2 = str2num(answer{4});
Input05UG2 = str2num(answer{5});
Input06UG2 = str2num(answer{6});
Input07UG2 = str2num(answer{7});
Input08UG2 = str2num(answer{8});

promptT1 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador 01';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT1,dlg_title,num_lines,def);

Input01T1 = str2num(answer{1});
Input02T1 = str2num(answer{2});
Input03T1 = str2num(answer{3});
Input04T1 = str2num(answer{4});
Input05T1 = str2num(answer{5});
end 

promptT2 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador 02';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT2,dlg_title,num_lines,def);

Input01T2 = str2num(answer{1});
Input02T2 = str2num(answer{2});
Input03T2 = str2num(answer{3});
Input04T2 = str2num(answer{4});
Input05T2 = str2num(answer{5});
end 

%Dados de Referência - usar se precisar
% Máquina Geradora - UG01
% S_g1 = 1450e3;                                          %Potência     
% V_g1 = 2.3e3;                                           %Tensão terminal 
% x1_g1 = 0.147;                                          %Reatância de Sequência +  
% x2_g1 = 0.164;                                          %Reatância de Sequência -    
% x0_g1 = 0.014;                                          %Reatância de Sequência 0    
% xn_g1 = (V_g1/sqrt(3))/100;                             %Reatância de Neutro (0.03+j*0.08
% r1x1_cg1 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg1 = (2*((0.984338+j*1.1419)));                   %Impedância do condutor 95mm² - Sequência 0

S_g1     = Input01UG1;              %Potência     
V_g1     = Input02UG1;              %Tensão terminal 
x1_g1    = Input03UG1;              %Reatância de Sequência +  
x2_g1    = Input04UG1;              %Reatância de Sequência -    
x0_g1    = Input05UG1;              %Reatância de Sequência 0    
xn_g1    = (V_g1/sqrt(3))/100;      %Reatância de Neutro (0.03+j*0.08
r1x1_cg1 = Input06UG1;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg1 = 2*Input07UG1;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG02  
% S_g2 = 750e3;                     %Potência
% V_g2 = 2.3e3;                     %Tensão terminal   
% x1_g2 = 0.162;                    %Reatância de Sequência + 
% x2_g2 = 0.1730;                   %Reatância de Sequência -
% x0_g2 = 0.016;                    %Reatância de Sequência 0
% xn_g2 = (V_g2/sqrt(3))/100;       %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% 
% Máquina Geradora - UG02  
S_g2     = Input01UG2;              %Potência
V_g2     = Input02UG2;              %Tensão terminal   
x1_g2    = Input03UG2;              %Reatância de Sequência + 
x2_g2    = Input04UG2;              %Reatância de Sequência -
x0_g2    = Input05UG2;              %Reatância de Sequência 0
xn_g2 	 = (V_g2/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg2 = Input06UG2;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg2 = 2*Input07UG2;            %Impedância do condutor 95mm² - Sequência 0

% %Transformador Elevador - Usina
S_t1  = Input01T1;            %Poência   
Vp_t1 = Input02T1;            %Tensão do Primário
Vs_t1 = Input03T1;            %Tensão do Secundário
x1_t1 = Input04T1;            %Reatância de Sequência +
x2_t1 = x1_t1;                %Reatância de Sequência -
x0_t1 = Input05T1;            %Reatância de Sequência 0
xn_t1 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro

S_t2  = Input01T2;            %Poência   
Vp_t2 = Input02T2;            %Tensão do Primário
Vs_t2 = Input03T2;            %Tensão do Secundário
x1_t2 = Input04T2;            %Reatância de Sequência +
x2_t2 = x1_t2;                %Reatância de Sequência -
x0_t2 = Input05T2;            %Reatância de Sequência 0
xn_t2 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro


%% CONFIGURAÇÃO 1TE + 4UG
if choice_ponto_config_4 == 1
    ponto_config_4 = '1';
elseif choice_ponto_config_4 == 2
    ponto_config_4 = '2';
elseif choice_ponto_config_4 == 3
    ponto_config_4 = '3';
elseif choice_ponto_config_4 == 4
    ponto_config_4 = '4';
else
    ponto_config_4 = '5';
end    

if choice_config == 4 
promptUG1 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG1,dlg_title,num_lines,def);

Input01UG1 = str2num(answer{1});
Input02UG1 = str2num(answer{2});
Input03UG1 = str2num(answer{3});
Input04UG1 = str2num(answer{4});
Input05UG1 = str2num(answer{5});
Input06UG1 = str2num(answer{6});
Input07UG1 = str2num(answer{7});
Input08UG1 = str2num(answer{8});

promptUG2 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG02';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG2,dlg_title,num_lines,def);

Input01UG2 = str2num(answer{1});
Input02UG2 = str2num(answer{2});
Input03UG2 = str2num(answer{3});
Input04UG2 = str2num(answer{4});
Input05UG2 = str2num(answer{5});
Input06UG2 = str2num(answer{6});
Input07UG2 = str2num(answer{7});
Input08UG2 = str2num(answer{8});

promptUG3 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG03';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG3,dlg_title,num_lines,def);

Input01UG3 = str2num(answer{1});
Input02UG3 = str2num(answer{2});
Input03UG3 = str2num(answer{3});
Input04UG3 = str2num(answer{4});
Input05UG3 = str2num(answer{5});
Input06UG3 = str2num(answer{6});
Input07UG3 = str2num(answer{7});
Input08UG3 = str2num(answer{8});

promptUG4 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG04';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG4,dlg_title,num_lines,def);

Input01UG4 = str2num(answer{1});
Input02UG4 = str2num(answer{2});
Input03UG4 = str2num(answer{3});
Input04UG4 = str2num(answer{4});
Input05UG4 = str2num(answer{5});
Input06UG4 = str2num(answer{6});
Input07UG4 = str2num(answer{7});
Input08UG4 = str2num(answer{8});



promptT1 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT1,dlg_title,num_lines,def);

Input01T1 = str2num(answer{1});
Input02T1 = str2num(answer{2});
Input03T1 = str2num(answer{3});
Input04T1 = str2num(answer{4});
Input05T1 = str2num(answer{5});
end 


%Dados de Referência - usar se precisar
% Máquina Geradora - UG01
% S_g1 = 1450e3;                                          %Potência     
% V_g1 = 2.3e3;                                           %Tensão terminal 
% x1_g1 = 0.147;                                          %Reatância de Sequência +  
% x2_g1 = 0.164;                                          %Reatância de Sequência -    
% x0_g1 = 0.014;                                          %Reatância de Sequência 0    
% xn_g1 = (V_g1/sqrt(3))/100;                             %Reatância de Neutro (0.03+j*0.08
% r1x1_cg1 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg1 = (2*((0.984338+j*1.1419)));                   %Impedância do condutor 95mm² - Sequência 0

S_g1     = Input01UG1;              %Potência     
V_g1     = Input02UG1;              %Tensão terminal 
x1_g1    = Input03UG1;              %Reatância de Sequência +  
x2_g1    = Input04UG1;              %Reatância de Sequência -    
x0_g1    = Input05UG1;              %Reatância de Sequência 0    
xn_g1    = (V_g1/sqrt(3))/100;      %Reatância de Neutro (0.03+j*0.08
r1x1_cg1 = Input06UG1;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg1 = 2*Input07UG1;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG02  
% S_g2 = 750e3;                     %Potência
% V_g2 = 2.3e3;                     %Tensão terminal   
% x1_g2 = 0.162;                    %Reatância de Sequência + 
% x2_g2 = 0.1730;                   %Reatância de Sequência -
% x0_g2 = 0.016;                    %Reatância de Sequência 0
% xn_g2 = (V_g2/sqrt(3))/100;       %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% 
% Máquina Geradora - UG02  
S_g2     = Input01UG2;              %Potência
V_g2     = Input02UG2;              %Tensão terminal   
x1_g2    = Input03UG2;              %Reatância de Sequência + 
x2_g2    = Input04UG2;              %Reatância de Sequência -
x0_g2    = Input05UG2;              %Reatância de Sequência 0
xn_g2 	 = (V_g2/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg2 = Input06UG2;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg2 = 2*Input07UG2;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG03  
S_g3     = Input01UG3;              %Potência
V_g3     = Input02UG3;              %Tensão terminal   
x1_g3    = Input03UG3;              %Reatância de Sequência + 
x2_g3    = Input04UG3;              %Reatância de Sequência -
x0_g3    = Input05UG3;              %Reatância de Sequência 0
xn_g3 	 = (V_g3/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg3 = Input06UG3;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg3 = 2*Input07UG3;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG04  
S_g4     = Input01UG4;              %Potência
V_g4     = Input02UG4;              %Tensão terminal   
x1_g4    = Input03UG4;              %Reatância de Sequência + 
x2_g4    = Input04UG4;              %Reatância de Sequência -
x0_g4    = Input05UG4;              %Reatância de Sequência 0
xn_g4 	 = (V_g4/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg4 = Input06UG4;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg4 = 2*Input07UG4;            %Impedância do condutor 95mm² - Sequência 0

% %Transformador Elevador - Usina
S_t1  = Input01T1;            %Poência   
Vp_t1 = Input02T1;            %Tensão do Primário
Vs_t1 = Input03T1;            %Tensão do Secundário
x1_t1 = Input04T1;            %Reatância de Sequência +
x2_t1 = x1_t1;                %Reatância de Sequência -
x0_t1 = Input05T1;            %Reatância de Sequência 0
xn_t1 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro



%% CONFIGURAÇÃO 2TE + 4UG
if choice_ponto_config_5 == 1
    ponto_config_5 = '1';
elseif choice_ponto_config_4 == 2
    ponto_config_5 = '2';
elseif choice_ponto_config_4 == 3
    ponto_config_5 = '3';
elseif choice_ponto_config_4 == 4
    ponto_config_5 = '4';
else
    ponto_config_5 = '5';
end    

if choice_config == 5 
promptUG1 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG01';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG1,dlg_title,num_lines,def);

Input01UG1 = str2num(answer{1});
Input02UG1 = str2num(answer{2});
Input03UG1 = str2num(answer{3});
Input04UG1 = str2num(answer{4});
Input05UG1 = str2num(answer{5});
Input06UG1 = str2num(answer{6});
Input07UG1 = str2num(answer{7});
Input08UG1 = str2num(answer{8});

promptUG2 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG02';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG2,dlg_title,num_lines,def);

Input01UG2 = str2num(answer{1});
Input02UG2 = str2num(answer{2});
Input03UG2 = str2num(answer{3});
Input04UG2 = str2num(answer{4});
Input05UG2 = str2num(answer{5});
Input06UG2 = str2num(answer{6});
Input07UG2 = str2num(answer{7});
Input08UG2 = str2num(answer{8});

promptUG3 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG03';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG3,dlg_title,num_lines,def);

Input01UG3 = str2num(answer{1});
Input02UG3 = str2num(answer{2});
Input03UG3 = str2num(answer{3});
Input04UG3 = str2num(answer{4});
Input05UG3 = str2num(answer{5});
Input06UG3 = str2num(answer{6});
Input07UG3 = str2num(answer{7});
Input08UG3 = str2num(answer{8});

promptUG4 = {'Potência Aparante (kVA):', 'Tensão Nominal (kV):', 'Rotação Nominal (RPM):', 'Reatância de Seq + (p.u.):', ...
             'Reatância de Seq - (p.u.):', 'Reatância de Seq 0 (p.u.):', ...
             'Reatância de Seq + do Condutor(p.u.):', 'Reatância de Seq 0 do Condutor(p.u.):'};
dlg_title = 'Digite os Dados de Placa da UG04';
num_lines = 1;
def = {'','','','','','','',''};
answer = inputdlg(promptUG4,dlg_title,num_lines,def);

Input01UG4 = str2num(answer{1});
Input02UG4 = str2num(answer{2});
Input03UG4 = str2num(answer{3});
Input04UG4 = str2num(answer{4});
Input05UG4 = str2num(answer{5});
Input06UG4 = str2num(answer{6});
Input07UG4 = str2num(answer{7});
Input08UG4 = str2num(answer{8});



promptT1 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT1,dlg_title,num_lines,def);

Input01T1 = str2num(answer{1});
Input02T1 = str2num(answer{2});
Input03T1 = str2num(answer{3});
Input04T1 = str2num(answer{4});
Input05T1 = str2num(answer{5});
end 



promptT2 = {'Potência Aparante (kVA):', 'Tensão Primário (kV):', 'Tensão Secundário (kV):', ...
            'Reatância de Seq + (p.u.):', 'Reatância de Seq 0 (p.u.):'};
dlg_title = 'Digite os Dados do Transformador';
num_lines = 1;
def = {'','','','',''};
answer = inputdlg(promptT2,dlg_title,num_lines,def);

Input01T2 = str2num(answer{1});
Input02T2 = str2num(answer{2});
Input03T2 = str2num(answer{3});
Input04T2 = str2num(answer{4});
Input05T2 = str2num(answer{5});
end 



%Dados de Referência - usar se precisar
% Máquina Geradora - UG01
% S_g1 = 1450e3;                                          %Potência     
% V_g1 = 2.3e3;                                           %Tensão terminal 
% x1_g1 = 0.147;                                          %Reatância de Sequência +  
% x2_g1 = 0.164;                                          %Reatância de Sequência -    
% x0_g1 = 0.014;                                          %Reatância de Sequência 0    
% xn_g1 = (V_g1/sqrt(3))/100;                             %Reatância de Neutro (0.03+j*0.08
% r1x1_cg1 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% r0x0_cg1 = (2*((0.984338+j*1.1419)));                   %Impedância do condutor 95mm² - Sequência 0

S_g1     = Input01UG1;              %Potência     
V_g1     = Input02UG1;              %Tensão terminal 
x1_g1    = Input03UG1;              %Reatância de Sequência +  
x2_g1    = Input04UG1;              %Reatância de Sequência -    
x0_g1    = Input05UG1;              %Reatância de Sequência 0    
xn_g1    = (V_g1/sqrt(3))/100;      %Reatância de Neutro (0.03+j*0.08
r1x1_cg1 = Input06UG1;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg1 = 2*Input07UG1;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG02  
% S_g2 = 750e3;                     %Potência
% V_g2 = 2.3e3;                     %Tensão terminal   
% x1_g2 = 0.162;                    %Reatância de Sequência + 
% x2_g2 = 0.1730;                   %Reatância de Sequência -
% x0_g2 = 0.016;                    %Reatância de Sequência 0
% xn_g2 = (V_g2/sqrt(3))/100;       %Reatância de Neutro (0.02+j*0.06)
% r1x1_cg2 = (0.246084+j*0.285475)+(0.215751+j*0.130635); %Impedância do condutor 95mm² - Sequência + e -
% 
% Máquina Geradora - UG02  
S_g2     = Input01UG2;              %Potência
V_g2     = Input02UG2;              %Tensão terminal   
x1_g2    = Input03UG2;              %Reatância de Sequência + 
x2_g2    = Input04UG2;              %Reatância de Sequência -
x0_g2    = Input05UG2;              %Reatância de Sequência 0
xn_g2 	 = (V_g2/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg2 = Input06UG2;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg2 = 2*Input07UG2;            %Impedância do condutor 95mm² - Sequência 0


% Máquina Geradora - UG03  
S_g3     = Input01UG3;              %Potência
V_g3     = Input02UG3;              %Tensão terminal   
x1_g3    = Input03UG3;              %Reatância de Sequência + 
x2_g3    = Input04UG3;              %Reatância de Sequência -
x0_g3    = Input05UG3;              %Reatância de Sequência 0
xn_g3 	 = (V_g3/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg3 = Input06UG3;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg3 = 2*Input07UG3;            %Impedância do condutor 95mm² - Sequência 0

% Máquina Geradora - UG04  
S_g4     = Input01UG4;              %Potência
V_g4     = Input02UG4;              %Tensão terminal   
x1_g4    = Input03UG4;              %Reatância de Sequência + 
x2_g4    = Input04UG4;              %Reatância de Sequência -
x0_g4    = Input05UG4;              %Reatância de Sequência 0
xn_g4 	 = (V_g4/sqrt(3))/100;      %Reatância de Neutro (0.02+j*0.06)
r1x1_cg4 = Input06UG4;              %Impedância do condutor 95mm² - Sequência + e -
r0x0_cg4 = 2*Input07UG4;            %Impedância do condutor 95mm² - Sequência 0


% %Transformador Elevador 01 - Usina
S_t1  = Input01T1;            %Poência   
Vp_t1 = Input02T1;            %Tensão do Primário
Vs_t1 = Input03T1;            %Tensão do Secundário
x1_t1 = Input04T1;            %Reatância de Sequência +
x2_t1 = x1_t1;                %Reatância de Sequência -
x0_t1 = Input05T1;            %Reatância de Sequência 0
xn_t1 = (Vs_t1/sqrt(3))/100;  %Reatância de Neutro

% %Transformador Elevador 02 - Usina
S_t2  = Input01T2;            %Poência   
Vp_t2 = Input02T2;            %Tensão do Primário
Vs_t2 = Input03T2;            %Tensão do Secundário
x1_t2 = Input04T2;            %Reatância de Sequência +
x2_t2 = x1_t2;                %Reatância de Sequência -
x0_t2 = Input05T2;            %Reatância de Sequência 0
xn_t2 = (Vs_t2/sqrt(3))/100;  %Reatância de Neutro



%Dados de Curto-Circuito Ponto de Entrega - CELESC (já fornecidos em p.u.)
z1_pe=2.147+j*3.403;               %Impedância de Sequência + e -
z0_pe=3.005+j*10.732;              %Impedância de Sequência 0



%% Modelagem da LT
Eo=8.859e-9; %%em kM

choice_cabo_cond_LT = menu('Escolha o Condutor da LT','Condutor 1', 'Condutor 2', 'Condutor 3', 'Condutor 4', 'Condutor 5');
if choice_config == 1 %1TE + 1UG

% CÁLCULO DOS RAIOS MÉDIOS GEOMÉTRICOS
Ds=0.007975; %RMG CONDUTORES FASE
Ds_pr=1.535e-12; %RMG CONDUTOR PARA-RAIO

% CÁLCULO DAS ALTURAS DOS CONDUTORES FASE E PARA-RAIO
ha = (13)-(0.7*8.22); %ALTURA DO CONDUTOR DA FASE 'A'
hb = (13)-(0.7*8.22); %ALTURA DO CONDUTOR DA FASE 'B'
hc = (13)-(0.7*8.22); %ALTURA DO CONDUTOR DA FASE 'C'
hr = (13)-(0.7*12.9); %ALTURA DO CONDUTOR DO PARA-RAIO 'R'
%hs = hr; não possui Para-raio 'S'

rla=Ds ;
rlb=rla;
rlc=rla;
rl_pr=Ds_pr;

% CÁLCULO DAS DISTÂNCIAS DOS CONDUTORES FÍSICOS PARA OS DEMAIS
dAB = 0.4;
dBA = dAB;
dCB = 1.3;
dBC = dCB;
dAC = dAB + dBC;
dCA = dAC;
dAR = sqrt((1.70)^2+0.9^2);
dRA = dAR;
dBR = 1.70;
dRB = dBR;
dCR = sqrt((1.70)^2+0.8^2);
dRC = dCR;
%dCS = dAR; não possui Para-raio 'S'
%dSB = dBR; não possui Para-raio 'S'
%dAS = dCR; não possui Para-raio 'S'
%dSA = dCR; não possui Para-raio 'S'
%dBS = dBR; não possui Para-raio 'S'
%dSC = dAR; não possui Para-raio 'S'
%dRS = (2*7.63); não possui Para-raio 'S'
%dSR = dRS; não possui Para-raio 'S'

% CÁLCULO DAS DISTÂNCIAS DOS CONDUTORES FÍSICO PARA IMAGEM PARA OS DEMAIS
DAB = sqrt(((2*11.2)^2+(0.4)^2));
DBA = DAB;
DBC = sqrt(((2*11.2)^2+(1.3)^2));
DCB = DBC;
DAC = sqrt(((2*11.2)^2+(1.7)^2));
DCA = DAC;
DRC = sqrt(((2*12.9)^2+(0.87)^2));
DCR = DRC;
DAR = sqrt(((2*12.9)^2+(0.9)^2));
DRA = DAR;
DBR = (2*12.9)-1.7;
DRB = DBR;
%DAS = sqrt(((18.307/2+7.63)^2)+(9.146+21.5)^2); não possui Para-raio 'S'
%DSA = DAS; não possui Para-raio 'S'
%DBS = DBR; não possui Para-raio 'S'
%DCS = DAR; não possui Para-raio 'S'
%DRS = 45.627; não possui Para-raio 'S'
%DSB = DBR; não possui Para-raio 'S'
%DSC = DAR; não possui Para-raio 'S'
%DSR = DRS; não possui Para-raio 'S'

%CÁLCULO DAS DISTÂNCIAS NO EIXO 'X' PARA CÁLCULO DA MATRIZ [X]
dax = 0;
dabx = 0.4;
dacx = 1.7;
darx = 0.9;
dbx = 0;
dbax = 0.4;
dbcx = 1.3;
dbrx = 0.5;
dcx = 0;
dcax = 1.7;
dcbx = 1.3;
dcrx = 0.8;
drx = 0;
drax = 0.9;
drbx = 0.5;
drcx = 0.8;

% RESISTIVIDADE EM 60HZ PARA CONDUTORES FASE PEONY DE ALUMÍNIO (150mm²)
R_f=0.1898*(1+0.0039*35); 

% RESISTIVIDADE EM 60HZ PARA CONDUTORES DE PARA-RAIO HS 1/4"
R_pr=6.276;

% FREQUÊNCIA DO SISTEMA
f=60;

% TENSÃO DO SISTEMA
V_LT=Vb;

% RESISTIVIDADE DO SOLO
ro=150;

% DEFININDO A MATRIZ DAS DISTÂNCIAS DOS CONDUTORES FÍSICOS
d = [0 dAB dAC dAR;
    dBA 0 dBC dBR;
    dCA dCB 0 dCR; 
    dRA dRB dRC 0];

% DEFININDO A MATRIZ DAS DISTÂNCIAS DOS CONDUTORES IMAGEM
D = [2*ha DAB DAC DAR;
    DBA 2*hb DBC DBR;
    DCA DCB 2*hc DCR;
    DRA DRB DRC 2*hr];

% DEFININDO O VETOR DAS ALTURAS
h =[ha; hb; hc; hr];
rl=[rla; rlb; rlc; rl_pr];

% DETERMINAÇÃO DOS ELEMENTOS NO EIXO 'X' PARA MONTAGEM DA MATRIZ 'teta'
x=[dax dabx dacx darx;
    dbax dbx dbcx dbrx;
    dcax dcbx dcx dcrx; 
    drax drbx drcx drx];

% LÓGICA 'FOR' PARA CONDIÇÕES DE FORMAÇÃO DAS MATRIZES "L, TETA, p"
for k=1:4
    for m=1:4
        if k==m
            % DETERMINAÇÃO DOS ELEMENTOS DA DIAGONAL PRINCIPAL DA MATRIZ 'L'
            L(k,k)=2e-4*log(2*h(k)/rl(k)); %%(H/kM)
            
            % DETERMINAÇÃO DOS ELEMENTOS DA DIAGONAL PRINCIPAL DA MATRIZ 'teta'
            teta(k,k)=0;
            
            % DETERMINAÇÃO DOS ELEMENTOS DA DIAGONAL PRINCIPAL DA MATRIZ 'p'
            p(k,k)=5.62e-3*h(k)*sqrt(f/ro);
        else
            % DETERMINAÇÃO DOS ELEMENTOS FORA DA DIAGONAL PRINCIPAL DA MATRIZ 'L'
            L(k,m)=2e-4*log(D(k,m)/d(k,m)); %%(H/kM)
            
            % DETERMINAÇÃO DOS ELEMENTOS FORA DA DIAGONAL PRINCIPAL DA MATRIZ 'teta'
            teta(k,m)=atan(x(k,m)/(h(k)+h(m)));
            
            % DETERMINAÇÃO DOS ELEMENTOS FORA DA DIAGONAL PRINCIPAL DA MATRIZ 'p'
            p(k,m)=28.1004e-4*D(k,m)*sqrt(f/ro);
        end
    end
end

% DEFININDO A MATRIZ DAS RESISTÊNCIAS "R"
R=diag([R_f;R_f;R_f;R_pr]);

% LÓGICA 'FOR' PARA CONDIÇÕES DE FORMAÇÃO DAS MATRIZES "Q,P"
for k=1:4
    for m=1:4
        % DETERMINAÇÃO DA MATRIZ 'Q'
        Q(k,m)=-0.0386+0.5*log(2/p(k,m))+1/(3*sqrt(2))*p(k,m)*cos(teta(k,m));
        
        % DETERMINAÇÃO DA MATRIZ 'P'
        P(k,m)=pi/8-p(k,m)/(3*sqrt(2))*cos(teta(k,m))+p(k,m)^2/16*cos(2*teta(k,m))*(0.6728+log(2/p(k,m))+p(k,m)^2/16*teta(k,m)*sin(2*teta(k,m)));
    end
end

% RESISTÊNCIA CORRIGIDA PELO MÉTODO DE CARSON
R_corr=R+25.134e-4*f*P;

% INDUTÂNCIA CORRIGIDA PELO MÉTODO DE CARSON
XL_corr=2*pi*f*L+25.134e-4*f*Q;

% IMPEDÂNCIA DA LINHA DE TRANSMISSÃO CONSIDERANDO PARA-RAIOS
ZL=R_corr+j*XL_corr;

% REDUZINDO A MATRIZ RESISTÊNCIA CORRIGIDA DE 4X4 PARA 3X3
RL=R_corr(1:3,1:3)-R_corr(1:3,4)*inv(R_corr(4,4))*R_corr(4,1:3);

% REDUZINDO A MATRIZ INDUTÂNCIA CORRIGIDA DE 4X4 PARA 3X3
XL=XL_corr(1:3,1:3)-XL_corr(1:3,4)*inv(XL_corr(4,4))*XL_corr(4,1:3);

% IMPEDÂNCIA FINAL DA LINHA DE TRANSMISSÃO APÓS AS CORREÇÕES
Z=RL+j*XL;

% IMPEDÂNCIA DA FASE 'A'
ZA=Z(1,1)-(Z(1,2)+Z(1,3))/2;

% IMPEDÂNCIA DA FASE 'B'
ZB=Z(2,2)-(Z(2,1)+Z(2,3))/2;

% IMPEDÂNCIA DA FASE 'C'
ZC=Z(3,3)-(Z(3,1)+Z(3,2))/2;

% IMPEDÂNCIA DE SEQUÊNCIA '+' E '-'
Z_Pos_Neg_LT=(Z(1,1)+Z(2,2)+Z(3,3))/3-(Z(1,2)+Z(1,3)+Z(2,3))/3;

% IMPEDÂNCIA DE SEQUÊNCIA '0'
Z0_LT=(Z(1,1)+Z(2,2)+Z(3,3))/3+2*(Z(1,2)+Z(1,3)+Z(2,3))/3;

% DEFININDO OS VETORES DAS IMPEDÊNCIAS PARA DETERMINAR A IMPEDÂNCIAS FINAIS COM BASE NO COMPRIMENTO DA LINHA DE TRANSMISSÃO
Zft=3.*[ZA; ZB; ZC]; % IMPEDÂNCIA FINAL TOTAL DAS FASES 'A', 'B', 'C'
Zft_pn=3*Z_Pos_Neg_LT; %IMPEDÂNCIA FINAL TOTAL DE SEQUÊNCIA '+' E '-'
Zft0=3*Z0_LT; %IMPEDÂNCIA FINAL TOTAL DE SEQUÊNCIA '0'

% DETERMINAÇÃO DOS RAIOS MÉDIOS GEOMÉTRICOS DAS FASES E DOS PARA-RAIOS

D_esp=0.0254;

r_ext_cond=sqrt((0.007975)*(D_esp));
r_ext_pr=0.00635;
r_ext=[r_ext_cond; r_ext_cond; r_ext_cond; r_ext_pr];

% LÓGICA 'FOR' PARA CONDIÇÕES DE FORMAÇÃO DA MATRIZ AUXILIAR "A"
for k=1:4
    for m=1:4
        if k==m
            % DETERMINAÇÃO DOS ELEMENTOS DA DIAGONAL PRINCIPAL DA MATRIZ 'A'
            A(k,k)=1/(2*pi*Eo)*log(2*h(k)/r_ext(k)); %%(?/kM)qualquer coisa por kilometro, e adimensional
        else
             % DETERMINAÇÃO DOS ELEMENTOS FORA DA DIAGONAL PRINCIPAL DA MATRIZ 'A'
            A(k,m)=1/(2*pi*Eo)*log(D(k,m)/d(k,m)); %%(?/kM)
                    
        end
    end
end

% REDUZINDO A MATRIZ G DE 5X5 PARA 3X3
%G_red=G(1:3,1:3)-G(1:3,4:5)*inv(G(4:5,4:5))*G(4:5,1:3);
A_red=A(1:3,1:3)-A(1:3,4)*inv(A(4,4))*A(4,1:3);
G_red=inv(A_red);
%%G_corr=G(1:3,1:3)-G(1:3,4:5)*inv(G(4:5,4:5))*G(4:5,1:3);

% EFEITO DAS CAPACITÂNCIAS PRÓPRIAS DOS CONDUTORES FASE EM RELAÇÃO AO SOLO APÓS AS CORREÇÕES
Ca0_l=sum(G_red(1,:));
Cb0_l=sum(G_red(2,:));
Cc0_l=sum(G_red(3,:));

% CÁLCULO DA MATRIZ DAS CAPACITÂNCIAS APÓS AS CORREÇÕES
C_l=-G_red;

% CAPACITÂNCIA DA FASES "A, B, C" APÓS AS CORREÇÕES
C_A_l=Ca0_l+3/2*(C_l(1,2)+C_l(1,3));
C_B_l=Cb0_l+3/2*(C_l(2,1)+C_l(2,3));
C_C_l=Cc0_l+3/2*(C_l(3,1)+C_l(3,2));

% CÁLCULO DA CAPACITÂNCIA DE SEQUÊNCIA "+" APÓS AS CORREÇÕES
C_Pos_l=(C_A_l+C_B_l+C_C_l)/3;

% CÁLCULO DA CAPACITÂNCIA DE SEQUÊNCIA "0" APÓS AS CORREÇÕES
C_0_l=1/(A_red(1,1)+2*A_red(1,2));

% VETOR DAS CAPACITÂNCIAS DAS FASES "A, B, C" APÓS AS CORREÇÕES
C_fases=[C_A_l; C_B_l; C_C_l];

% CÁLCULO DA REATÂNCIA CAPACITIVA APÓS AS CORREÇÕES
Xc_l=1./(j*2*pi*60*C_fases);

% CÁLCULO DA REATÂNCIA DE SEQUÊNCIA "+" APÓS AS CORREÇÕES
XC_Pos_l=1./(j*2*pi*f*C_Pos_l);

% CÁLCULO DA REATÂNCIA DE SEQUÊNCIA "0" APÓS AS CORREÇÕES
X_0_l=1./(j*2*pi*f*C_0_l);

% CÁLCULO DA IMPEDÂNCIA SHUNT DE SEQUÊNCIA "+" APÓS AS CORREÇÕES
Z_Pos_sh=XC_Pos_l;

% CÁLCULO DA IMPEDÂNCIA SHUNT DE SEQUÊNCIA "0" APÓS AS CORREÇÕES
Z_0_sh=X_0_l;

% CÁLCULO DE ADMITÂNCIA DE SEQUÊNCIA "+" APÓS AS CORREÇÕES
Y_Pos_sh=inv(Z_Pos_sh);

% CÁLCULO DE ADMITÂNCIA DE SEQUÊNCIA "0" APÓS AS CORREÇÕES
Y_0_sh=inv(Z_0_sh);

% CÁLCULO DE SUSCEPTÂNCIA SHUNT TOTAL APÓS AS CORREÇÕES
Bsh=1./Xc_l;

% CÁLCULO DE SUSCEPTÂNCIA SHUNT DO INÍCIO E DO FINAL DA LINHA DE TRANSMISSÃO APÓS AS CORREÇÕES
Bsh_2=0.5*Bsh;

% CÁLCULO DA SUSCEPTÂNCIA SHUNT DE SEQUÊNCIA "+"
Bsh_pos=1/XC_Pos_l;
Bsh_pos_2=0.5*Bsh_pos;

% CÁLCULO DA SUSCEPTÂNCIA SHUNT DE SEQUÊNCIA "0"
Bsh_0=1/X_0_l;
Bsh_0_2=0.5*Bsh_0;

% DEFININDO OS VETORES DAS SUSCEPTÂNCIAS PARA DETERMINAR AS SUSCEPTÂNCIAS FINAIS COM BASE NO COMPRIMENTO DA LINHA DE TRANSMISSÃO
Bsh_pos_ft=3*Bsh_pos_2;
Bsh_0_ft=3*Bsh_0_2;
Bsh_2_ft=3*Bsh_2;

% MODELO INFINITESIMAL
n=1; %número de trechos
Z_tr=Zft_pn/n;
D_t=3/n;
Bsh_tr=((3*Bsh_pos)/(n+1));



%Linha de Transmissão - Usina -> SE de Conexão
% r1x1_lt = 0.6485+j*1.0820;            %Impedância de Sequência + e -
% r0x0_lt = 1.1647+j*5.0333;            %Impedância de Sequência 0
r1x1_lt = Zft_pn;            %Impedância de Sequência + e -
r0x0_lt = Zft0;            %Impedância de Sequência 0

%Tenões Base de Cada Trehco
Vb_I=Vb;                         %Tensão Base - Trecho 1
Vb_II=Vs_t1;                     %Tensão Base - Trecho 2 

%Correntes Base de Cada Trehco
Ib_I=((Sb)/(sqrt(3)*Vb_I));      %Corrente Base - Trecho 1
Ib_II=((Sb)/(sqrt(3)*Vb_II));    %Corrente Base - Trecho 2 

% Impedâncias Base de Cada Trecho
zb_I=((Vb_I)^2)/Sb;             %Impedância Base - Trecho 1
zb_II=((Vb_II)^2)/Sb;           %Impedância Base - Trecho 2



%% Novos valores em PU 
%Máquina Geradora - UG01
z1g1=j*x1_g1*((V_g1/Vb_II)^2)*(Sb/S_g1);
z2g1=z1g1;
z0g1=j*x0_g1*(V_g1/Vb_II)^2*(Sb/S_g1);
zng1=xn_g1*((V_g1/Vb_II)^2)*(Sb/S_g1);
zng1=xn_g1/zb_II;

%Máquina Geradora - UG02
z1g2=j*x1_g2*(V_g2/Vb_II)^2*(Sb/S_g2);
z2g2=z1g2;
z0g2=j*x0_g2*(V_g2/Vb_II)^2*(Sb/S_g2);
zng2=xn_g2/zb_II;

%Transformador Elevador - Usina
z1t1=j*x1_t1*(Vp_t1/Vb_I)^2*(Sb/S_t1);
z2t1=z1t1;
z0t1=j*x0_t1*(Vp_t1/Vb_I)^2*(Sb/S_t1);
znt1=xn_t1/zb_II;

%Linha de Transmissão
z1_lt = r1x1_lt/zb_I; 
z0_lt = r0x0_lt/zb_I;



%% Impedâncias equivalente nos Pontos de Falta
if choice_config == 1 % Configuração 1Trafo + 2UGs

    if choice_config_1 == 1
    %Sequência Positiva, Negativa e Zero - Ponto P1
    z1_p1=((((((z1g2+r1x1_cg2)*(z1t1+z1_lt+z1_pe))/((z1g2+r1x1_cg2)+(z1t1+z1_lt+z1_pe)))+(r1x1_cg2))*(z1g1))/(((((z1g2+r1x1_cg2)*(z1t1+z1_lt+z1_pe))/((z1g2+r1x1_cg2)+(z1t1+z1_lt+z1_pe)))+(r1x1_cg2))+(z1g1)));
    z2_p1=z1_p1;
    % z0_p1=(((3*zng2+z0g2)+(3*znt1+z0t1))*(3*zng1+z0g1))/(((3*zng2+z0g2)+(3*znt1+z0t1))+(3*zng1+z0g1));
    % z0_p1 = inv((1/(zng2+z0g2+r1x1_cg2))+(1/(znt1+z0t1+r1x1_cg1))+(1/(zng1+z0g1)));
    z0_p1=(((3*zng1+z0g1+r1x1_cg1)*(3*zng2+z0g2+r1x1_cg2))/((3*zng1+z0g1+r1x1_cg1)+(3*zng2+z0g2+r1x1_cg2))*(3*znt1+z0t1))/(((3*zng1+z0g1)*(3*zng2+z0g2+r1x1_cg2))/((3*zng1+z0g1+r1x1_cg1)+(3*zng2+z0g2+r1x1_cg1))+(3*znt1+z0t1));
    % z0_p1 = ((((3*zng2+z0g2+r1x1_cg2)*(r1x1_cg1))/((3*zng2+z0g2+r1x1_cg2)+(r1x1_cg1)))*(3*znt1+z0t1))/((((3*zng2+z0g2+r1x1_cg2)*(r1x1_cg1))/((3*zng2+z0g2+r1x1_cg2)+(r1x1_cg1)))+(3*znt1+z0t1));

    elseif choice_ponto == 2
    %Sequência Positiva, Negativa e Zero - Ponto P2
    z1_p2=((((((z1g1+r1x1_cg1)*(z1t1+z1_lt+z1_pe))/((z1g1+r1x1_cg1)+(z1t1+z1_lt+z1_pe)))+(r1x1_cg1))*(z1g2))/(((((z1g1+r1x1_cg1)*(z1t1+z1_lt+z1_pe))/((z1g1+r1x1_cg1)+(z1t1+z1_lt+z1_pe)))+(r1x1_cg1))+(z1g2)));;
    z2_p2=z1_p2;
    z0_p2=(((3*zng2+z0g2+r1x1_cg2)*(3*zng1+z0g1+r1x1_cg1))/((3*zng2+z0g2+r1x1_cg2)+(3*zng1+z0g1+r1x1_cg1))*(3*znt1+z0t1))/(((3*zng2+z0g2)*(3*zng1+z0g1+r1x1_cg1))/((3*zng2+z0g2+r1x1_cg2)+(3*zng1+z0g1+r1x1_cg2))+(3*znt1+z0t1));

	elseif choice_ponto == 3
    %Sequência Positiva, Negativa e Zero - Ponto P3
    z1_p3=((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2)))*(z1_lt+z1t1+z1_pe))/((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2))+(z1_lt+z1t1+z1_pe)));
    z2_p3=z1_p3;
    z0_p3=(((3*zng1+z0g1+r1x1_cg1)*(3*zng2+z0g2+r1x1_cg2))/((3*zng1+z0g1+r1x1_cg1)+(3*zng2+z0g2+r1x1_cg2))*(3*znt1+z0t1))/(((3*zng1+z0g1)*(3*zng2+z0g2+r1x1_cg2))/((3*zng1+z0g1+r1x1_cg1)+(3*zng2+z0g2+r1x1_cg1))+(3*znt1+z0t1));

    elseif choice_ponto == 4
    %Sequência Positiva, Negativa e Zero - Ponto P4
    z1_p4=((((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2)))+(z1t1))*(z1_lt+z1_pe))/(((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2)))+(z1t1))+(z1_lt+z1_pe)));
    z2_p4=z1_p4;
    z0_p4=z0_lt+z0_pe;

    else
    %Sequência Positiva, Negativa e Zero - Ponto P5
    z1_p5=(((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2)))+z1_lt+z1t1)*(z1_pe))/(((((z1g1+r1x1_cg1)*(z1g2+r1x1_cg2))/((z1g1+r1x1_cg1)+(z1g2+r1x1_cg2)))+z1_lt+z1t1)+(z1_pe));
    z2_p5=z1_p5;
    z0_p5=z0_lt+z0_pe;
    end
end




%% Resolução da falta
vf=1.0; %Tensão no ponto de falta

%PONTO P1
if ponto_1 == '1'
% fase-terra - Ponto P1
ia1_ft_p1=vf/(z1_p1+z2_p1+z0_p1); 
ia2_ft_p1=ia1_ft_p1;
ia0_ft_p1=ia1_ft_p1;
ifalta_ft_p1=3*ia0_ft_p1;
Ifalta_ft_p1=[abs(ifalta_ft_p1)*Sb/(sqrt(3)*Vb_II) angle(ifalta_ft_p1)*180/pi];
  
% bifasica - Ponto P1
ia1_ff_p1=vf/(z1_p1+z2_p1); 
Ia1_ff_p1=[abs(ia1_ff_p1) angle(ia1_ff_p1)*180/pi];
va1_ff_p1=vf-ia1_ff_p1*z1_p1;
va2_ff_p1=va1_ff_p1; 
va0_ff_p1=0;
ia2_ff_p1=-va2_ff_p1/z2_p1;
ia0_ff_p1=0;
ifalta_ff_p1=T*[ia0_ff_p1; ia1_ff_p1; ia2_ff_p1]; 
i_falta_ff_p1=ifalta_ff_p1(2,1);
Ifalta_ff_p1=[abs(i_falta_ff_p1)*Sb/(sqrt(3)*Vb_II) angle(i_falta_ff_p1)*180/pi];
 
% bifasica terra - Ponto P1
ia1_fft_p1=vf/(z1_p1+inv(1/z2_p1+1/z0_p1));
va1_fft_p1=vf-ia1_fft_p1*z1_p1;
va2_fft_p1=va1_fft_p1; 
va0_fft_p1=va1_fft_p1;
ia2_fft_p1=-va2_fft_p1/z2_p1; 
ia0_fft_p1=-va0_fft_p1/z0_p1;
Ia1_fft_p1=[abs(ia1_fft_p1) angle(ia1_fft_p1)*180/pi];
ifalta_fft_p1=3*ia0_fft_p1;
Ifalta_fft_p1=[abs(ifalta_fft_p1)*Sb/(sqrt(3)*Vb_II) angle(ifalta_fft_p1)*180/pi];
 
% trifásica - Ponto P1
ia1_3f_p1=vf/(z1_p1); 
ia2_3f_p1=0;
ia0_3f_p1=0;
Ia1_3f_p1=[abs(ia1_3f_p1) angle(ia1_3f_p1)*180/pi];
va1_3f_p1=vf-ia1_3f_p1*z1_p1;
ifalta_3f_p1=T*[ia0_3f_p1; ia1_3f_p1; ia2_3f_p1];
Ifalta_3f_p1=[abs(ia1_3f_p1)*Sb/(sqrt(3)*Vb_II) angle(ia1_3f_p1)*180/pi];
 
% Matriz para Display das Correntes no Ponto P1   
Ifalta_p1=[Ifalta_ft_p1 Ifalta_ff_p1 Ifalta_fft_p1 Ifalta_3f_p1]; % Em Ampéres
ifalta_p1=[ifalta_ft_p1 i_falta_ff_p1 ifalta_fft_p1 ia1_3f_p1]; % Em p.u.

  
 
% PONTO P2
elseif ponto == '2'
% fase-terra - Ponto P2
ia1_ft_p2=vf/(z1_p2+z2_p2+z0_p2); 
ia2_ft_p2=ia1_ft_p2;
ia0_ft_p2=ia1_ft_p2;
ifalta_ft_p2=3*ia0_ft_p2;
Ifalta_ft_p2=[abs(ifalta_ft_p2)*Sb/(sqrt(3)*Vb_II) angle(ifalta_ft_p2)*180/pi];
  
% bifasica - Ponto P2
ia1_ff_p2=vf/(z1_p2+z2_p2); 
Ia1_ff_p2=[abs(ia1_ff_p2) angle(ia1_ff_p2)*180/pi];
va1_ff_p2=vf-ia1_ff_p2*z1_p2;
va2_ff_p2=va1_ff_p2; 
va0_ff_p2=0;
ia2_ff_p2=-va2_ff_p2/z2_p2;
ia0_ff_p2=0;
ifalta_ff_p2=T*[ia0_ff_p2; ia1_ff_p2; ia2_ff_p2]; 
i_falta_ff_p2=ifalta_ff_p2(2,1);
Ifalta_ff_p2=[abs(i_falta_ff_p2)*Sb/(sqrt(3)*Vb_II) angle(i_falta_ff_p2)*180/pi];
 
% bifasica terra - Ponto P2
ia1_fft_p2=vf/(z1_p2+inv(1/z2_p2+1/z0_p2));
va1_fft_p2=vf-ia1_fft_p2*z1_p2;
va2_fft_p2=va1_fft_p2; 
va0_fft_p2=va1_fft_p2;
ia2_fft_p2=-va2_fft_p2/z2_p2; 
ia0_fft_p2=-va0_fft_p2/z0_p2;
Ia1_fft_p2=[abs(ia1_fft_p2) angle(ia1_fft_p2)*180/pi];
ifalta_fft_p2=3*ia0_fft_p2;
Ifalta_fft_p2=[abs(ifalta_fft_p2)*Sb/(sqrt(3)*Vb_II) angle(ifalta_fft_p2)*180/pi];

% trifásica - Ponto P2
ia1_3f_p2=vf/(z1_p2); 
ia2_3f_p2=0;
ia0_3f_p2=0;
Ia1_3f_p2=[abs(ia1_3f_p2) angle(ia1_3f_p2)*180/pi];
va1_3f_p2=vf-ia1_3f_p2*z1_p2;
ifalta_3f_p2=T*[ia0_3f_p2; ia1_3f_p2; ia2_3f_p2];
Ifalta_3f_p2=[abs(ia1_3f_p2)*Sb/(sqrt(3)*Vb_II) angle(ia1_3f_p2)*180/pi];
  
% Matriz para Display das Correntes no Ponto P2   
Ifalta_p2=[Ifalta_ft_p2 Ifalta_ff_p2 Ifalta_fft_p2 Ifalta_3f_p2]; % Em Ampéres
ifalta_p2=[ifalta_ft_p2 i_falta_ff_p2 ifalta_fft_p2 ia1_3f_p2]; % Em p.u.



% PONTO P3
elseif ponto == '3'
% fase-terra - Ponto P3
ia1_ft_p3=vf/(z1_p3+z2_p3+z0_p3); 
ia2_ft_p3=ia1_ft_p3;
ia0_ft_p3=ia1_ft_p3;
ifalta_ft_p3=3*ia0_ft_p3;
Ifalta_ft_p3=[abs(ifalta_ft_p3)*Sb/(sqrt(3)*Vb_II) angle(ifalta_ft_p3)*180/pi];

% bifasica - Ponto P3
ia1_ff_p3=vf/(z1_p3+z2_p3); 
Ia1_ff_p3=[abs(ia1_ff_p3) angle(ia1_ff_p3)*180/pi];
va1_ff_p3=vf-ia1_ff_p3*z1_p3;
va2_ff_p3=va1_ff_p3; 
va0_ff_p3=0;
ia2_ff_p3=-va2_ff_p3/z2_p3;
ia0_ff_p3=0;
ifalta_ff_p3=T*[ia0_ff_p3; ia1_ff_p3; ia2_ff_p3]; 
i_falta_ff_p3=ifalta_ff_p3(2,1);
Ifalta_ff_p3=[abs(i_falta_ff_p3)*Sb/(sqrt(3)*Vb_II) angle(i_falta_ff_p3)*180/pi];

% bifasica terra - Ponto P3
ia1_fft_p3=vf/(z1_p3+inv(1/z2_p3+1/z0_p3));
va1_fft_p3=vf-ia1_fft_p3*z1_p3;
va2_fft_p3=va1_fft_p3; 
va0_fft_p3=va1_fft_p3;
ia2_fft_p3=-va2_fft_p3/z2_p3; 
ia0_fft_p3=-va0_fft_p3/z0_p3;
Ia1_fft_p3=[abs(ia1_fft_p3) angle(ia1_fft_p3)*180/pi];
ifalta_fft_p3=3*ia0_fft_p3;
Ifalta_fft_p3=[abs(ifalta_fft_p3)*Sb/(sqrt(3)*Vb_II) angle(ifalta_fft_p3)*180/pi];

% trifásica - Ponto P3
ia1_3f_p3=vf/(z1_p3); 
ia2_3f_p3=0;
ia0_3f_p3=0;
Ia1_3f_p3=[abs(ia1_3f_p3) angle(ia1_3f_p3)*180/pi];
va1_3f_p3=vf-ia1_3f_p3*z1_p3;
ifalta_3f_p3=T*[ia0_3f_p3; ia1_3f_p3; ia2_3f_p3];
Ifalta_3f_p3=[abs(ia1_3f_p3)*Sb/(sqrt(3)*Vb_II) angle(ia1_3f_p3)*180/pi];
  
% Matriz para Display das Correntes no Ponto P2   
Ifalta_p3=[Ifalta_ft_p3 Ifalta_ff_p3 Ifalta_fft_p3 Ifalta_3f_p3]; % Em Ampéres
ifalta_p3=[ifalta_ft_p3 i_falta_ff_p3 ifalta_fft_p3 ia1_3f_p3];   % Em p.u.

  

% PONTO P4
elseif ponto == '4'
% fase-terra - Ponto P4
ia1_ft_p4=vf/(z1_p4+z2_p4+z0_p4); 
ia2_ft_p4=ia1_ft_p4;
ia0_ft_p4=ia1_ft_p4;
ifalta_ft_p4=3*ia0_ft_p4;
Ifalta_ft_p4=[abs(ifalta_ft_p4)*Sb/(sqrt(3)*Vb_I) angle(ifalta_ft_p4)*180/pi];
 
% bifasica - Ponto P4
ia1_ff_p4=vf/(z1_p4+z2_p4); 
Ia1_ff_p4=[abs(ia1_ff_p4) angle(ia1_ff_p4)*180/pi];
va1_ff_p4=vf-ia1_ff_p4*z1_p4;
va2_ff_p4=va1_ff_p4; 
va0_ff_p4=0;
ia2_ff_p4=-va2_ff_p4/z2_p4;
ia0_ff_p4=0;
ifalta_ff_p4=T*[ia0_ff_p4; ia1_ff_p4; ia2_ff_p4]; 
i_falta_ff_p4=ifalta_ff_p4(2,1);
Ifalta_ff_p4=[abs(i_falta_ff_p4)*Sb/(sqrt(3)*Vb_I) angle(i_falta_ff_p4)*180/pi];
 
% bifasica terra - Ponto P4
ia1_fft_p4=vf/(z1_p4+inv(1/z2_p4+1/z0_p4));
va1_fft_p4=vf-ia1_fft_p4*z1_p4;
va2_fft_p4=va1_fft_p4; 
va0_fft_p4=va1_fft_p4;
ia2_fft_p4=-va2_fft_p4/z2_p4; 
ia0_fft_p4=-va0_fft_p4/z0_p4;
Ia1_fft_p4=[abs(ia1_fft_p4) angle(ia1_fft_p4)*180/pi];
ifalta_fft_p4=3*ia0_fft_p4;
Ifalta_fft_p4=[abs(ifalta_fft_p4)*Sb/(sqrt(3)*Vb_I) angle(ifalta_fft_p4)*180/pi];
  
% trifásica - Ponto P4
ia1_3f_p4=vf/(z1_p4); 
ia2_3f_p4=0;
ia0_3f_p4=0;
Ia1_3f_p4=[abs(ia1_3f_p4) angle(ia1_3f_p4)*180/pi];
va1_3f_p4=vf-ia1_3f_p4*z1_p4;
ifalta_3f_p4=T*[ia0_3f_p4; ia1_3f_p4; ia2_3f_p4];
Ifalta_3f_p4=[abs(ia1_3f_p4)*Sb/(sqrt(3)*Vb_I) angle(ia1_3f_p4)*180/pi];
  
% Matriz para Display das Correntes no Ponto P4   
Ifalta_p4=[Ifalta_ft_p4 Ifalta_ff_p4 Ifalta_fft_p4 Ifalta_3f_p4]; % Em Ampéres
ifalta_p4=[ifalta_ft_p4 i_falta_ff_p4 ifalta_fft_p4 ia1_3f_p4]; % Em p.u.
  
  
  
% PONTO P5
elseif ponto == '5'
% fase-terra - Ponto P5
ia1_ft_p5=vf/(z1_p5+z2_p5+z0_p5); 
ia2_ft_p5=ia1_ft_p5;
ia0_ft_p5=ia1_ft_p5;
ifalta_ft_p5=3*ia0_ft_p5;
Ifalta_ft_p5=[abs(ifalta_ft_p5)*Sb/(sqrt(3)*Vb_I) angle(ifalta_ft_p5)*180/pi];
  
% bifasica - Ponto P5
ia1_ff_p5=vf/(z1_p5+z2_p5); 
Ia1_ff_p5=[abs(ia1_ff_p5) angle(ia1_ff_p5)*180/pi];
va1_ff_p5=vf-ia1_ff_p5*z1_p5;
va2_ff_p5=va1_ff_p5; 
va0_ff_p5=0;
ia2_ff_p5=-va2_ff_p5/z2_p5;
ia0_ff_p5=0;
ifalta_ff_p5=T*[ia0_ff_p5; ia1_ff_p5; ia2_ff_p5]; 
i_falta_ff_p5=ifalta_ff_p5(2,1);
Ifalta_ff_p5=[abs(i_falta_ff_p5)*Sb/(sqrt(3)*Vb_I) angle(i_falta_ff_p5)*180/pi];
 
% bifasica terra - Ponto P5
ia1_fft_p5=vf/(z1_p5+inv(1/z2_p5+1/z0_p5));
va1_fft_p5=vf-ia1_fft_p5*z1_p5;
va2_fft_p5=va1_fft_p5; 
va0_fft_p5=va1_fft_p5;
ia2_fft_p5=-va2_fft_p5/z2_p5; 
ia0_fft_p5=-va0_fft_p5/z0_p5;
Ia1_fft_p5=[abs(ia1_fft_p5) angle(ia1_fft_p5)*180/pi];
ifalta_fft_p5=3*ia0_fft_p5;
Ifalta_fft_p5=[abs(ifalta_fft_p5)*Sb/(sqrt(3)*Vb_I) angle(ifalta_fft_p5)*180/pi];
  
% trifásica - Ponto P5
ia1_3f_p5=vf/(z1_p5); 
ia2_3f_p5=0;
ia0_3f_p5=0;
Ia1_3f_p5=[abs(ia1_3f_p5) angle(ia1_3f_p5)*180/pi];
va1_3f_p5=vf-ia1_3f_p5*z1_p5;
ifalta_3f_p5=T*[ia0_3f_p5; ia1_3f_p5; ia2_3f_p5];
Ifalta_3f_p5=[abs(ia1_3f_p5)*Sb/(sqrt(3)*Vb_I) angle(ia1_3f_p5)*180/pi];
  
 % Matriz para Display das Correntes no Ponto P5   
Ifalta_p5=[Ifalta_ft_p5 Ifalta_ff_p5 Ifalta_fft_p5 Ifalta_3f_p5]; % Em Ampéres
ifalta_p5=[ifalta_ft_p5 i_falta_ff_p5 ifalta_fft_p5 ia1_3f_p5]; % Em p.u.
isec_p5_ft=[ia1_ft_p5 ia2_ft_p5 ia0_ft_p5];
isec_p5_ff=[ia1_ff_p5 ia2_ff_p5 ia0_ff_p5];
isec_p5_fft=[ia1_fft_p5 ia2_fft_p5 ia0_fft_p5];
isec_p5_3f=[ia1_3f_p5 ia2_3f_p5 ia0_3f_p5];
end






if ponto_1 == '1'
fprintf('\nCorrente de Faltas no Ponto 1 em [A] e Correntes de Sequência em [p.u.] \n')
fprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_ft_p1)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p1), imag(ia1_ft_p1))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p1), imag(ia0_ft_p1))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p1), imag(ia0_ft_p1))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(i_falta_ff_p1)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p1), imag(ia1_ff_p1))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p1), imag(ia0_ff_p1))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p1), imag(ia0_ff_p1))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_fft_p1)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p1), imag(ia1_fft_p1))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p1), imag(ia0_fft_p1))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p1), imag(ia0_fft_p1))
fprintf('\n');
fprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ia1_3f_p1)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p1), imag(ia1_3f_p1))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p1), imag(ia0_3f_p1))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p1), imag(ia0_3f_p1))

msg1 = cell(20,1);
msg{1}= sprintf('\nCorrente de Faltas no Ponto 1 em [A] e Correntes de Sequência em [p.u.] \n')
msg{2}= sprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_ft_p1)*180/pi)
msg{3}= sprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p1), imag(ia1_ft_p1))
msg{4}= sprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p1), imag(ia0_ft_p1))
msg{5}= sprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p1), imag(ia0_ft_p1))
msg{6}= sprintf('\n');
msg{7}= sprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(i_falta_ff_p1)*180/pi)
msg{8}= sprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p1), imag(ia1_ff_p1))
msg{9}= sprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p1), imag(ia0_ff_p1))
msg{10}= sprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p1), imag(ia0_ff_p1))
msg{11}= sprintf('\n');
msg{12}= sprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_fft_p1)*180/pi)
msg{13}= sprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p1), imag(ia1_fft_p1))
msg{14}= sprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p1), imag(ia0_fft_p1))
msg{15}= sprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p1), imag(ia0_fft_p1))
msg{16}= sprintf('\n');
msg{17}= sprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p1)*Sb/(sqrt(3)*Vb_II), ang, angle(ia1_3f_p1)*180/pi)
msg{18}= sprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p1), imag(ia1_3f_p1))
msg{19}= sprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p1), imag(ia0_3f_p1))
msg{20}= sprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p1), imag(ia0_3f_p1))
h1 = msgbox([msg])



elseif ponto == '2'   
fprintf('\nCorrente de Faltas no Ponto 2 em [A] e Correntes de Sequência em [p.u.] \n')
fprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p2)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_ft_p2)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p2), imag(ia1_ft_p2))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p2), imag(ia0_ft_p2))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p2), imag(ia0_ft_p2))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p2)*Sb/(sqrt(3)*Vb_II), ang, angle(i_falta_ff_p2)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p2), imag(ia1_ff_p2))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p2), imag(ia0_ff_p2))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p2), imag(ia0_ff_p2))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p2)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_fft_p2)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p2), imag(ia1_fft_p2))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p2), imag(ia0_fft_p2))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p2), imag(ia0_fft_p2))
fprintf('\n');
fprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p2)*Sb/(sqrt(3)*Vb_II), ang, angle(ia1_3f_p2)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p2), imag(ia1_3f_p2))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p2), imag(ia0_3f_p2))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p2), imag(ia0_3f_p2))

elseif ponto == '3'   
fprintf('\nCorrente de Faltas no Ponto 3 em [A] e Correntes de Sequência em [p.u.] \n')
fprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p3)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_ft_p3)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p3), imag(ia1_ft_p3))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p3), imag(ia0_ft_p3))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p3), imag(ia0_ft_p3))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p3)*Sb/(sqrt(3)*Vb_II), ang, angle(i_falta_ff_p3)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p3), imag(ia1_ff_p3))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p3), imag(ia0_ff_p3))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p3), imag(ia0_ff_p3))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p3)*Sb/(sqrt(3)*Vb_II), ang, angle(ifalta_fft_p3)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p3), imag(ia1_fft_p3))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p3), imag(ia0_fft_p3))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p3), imag(ia0_fft_p3))
fprintf('\n');
fprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p3)*Sb/(sqrt(3)*Vb_II), ang, angle(ia1_3f_p3)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p3), imag(ia1_3f_p3))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p3), imag(ia0_3f_p3))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p3), imag(ia0_3f_p3))    

elseif ponto == '4'   
fprintf('\nCorrente de Faltas no Ponto 2 em [A] e Correntes de Sequência em [p.u.] \n')
fprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p4)*Sb/(sqrt(3)*Vb_I), ang, angle(ifalta_ft_p4)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p4), imag(ia1_ft_p4))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p4), imag(ia0_ft_p4))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p4), imag(ia0_ft_p4))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p4)*Sb/(sqrt(3)*Vb_I), ang, angle(i_falta_ff_p4)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p4), imag(ia1_ff_p4))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p4), imag(ia0_ff_p4))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p4), imag(ia0_ff_p4))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p4)*Sb/(sqrt(3)*Vb_I), ang, angle(ifalta_fft_p4)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p4), imag(ia1_fft_p4))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p4), imag(ia0_fft_p4))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p4), imag(ia0_fft_p4))
fprintf('\n');
fprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p4)*Sb/(sqrt(3)*Vb_I), ang, angle(ia1_3f_p4)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p4), imag(ia1_3f_p4))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p4), imag(ia0_3f_p4))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p4), imag(ia0_3f_p4))    

elseif ponto == '5'     
fprintf('\nCorrente de Faltas no Ponto 5 em [A] e Correntes de Sequência em [p.u.] \n')
fprintf('\nFALTA MONOFÁSICA =        %11.2f %s %+1.4f  [A]\n', abs(ifalta_ft_p5)*Sb/(sqrt(3)*Vb_I), ang, angle(ifalta_ft_p5)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ft_p5), imag(ia1_ft_p5))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ft_p5), imag(ia0_ft_p5))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ft_p5), imag(ia0_ft_p5))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA =          %11.2f %s %+1.4f [A]\n', abs(i_falta_ff_p5)*Sb/(sqrt(3)*Vb_I), ang, angle(i_falta_ff_p5)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_ff_p5), imag(ia1_ff_p5))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_ff_p5), imag(ia0_ff_p5))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_ff_p5), imag(ia0_ff_p5))
fprintf('\n');
fprintf('\nFALTA BIFÁSICA-TERRA =    %11.2f %s %+1.4f [A]\n', abs(ifalta_fft_p5)*Sb/(sqrt(3)*Vb_I), ang, angle(ifalta_fft_p5)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_fft_p5), imag(ia1_fft_p5))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_fft_p5), imag(ia0_fft_p5))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_fft_p5), imag(ia0_fft_p5))
fprintf('\n');
fprintf('\nFALTA TRIFÁSICA =         %11.2f %s %+1.4f  [A]\n', abs(ia1_3f_p5)*Sb/(sqrt(3)*Vb_I), ang, angle(ia1_3f_p5)*180/pi)
fprintf('->Sequência Positiva      %11.5f %11.5f [p.u.] ', (ia1_3f_p5), imag(ia1_3f_p5))
fprintf('\n->Sequência Negativa      %11.5f %11.5f [p.u.] ', (ia0_3f_p5), imag(ia0_3f_p5))
fprintf('\n->Sequência Zero          %11.5f %11.5f [p.u.] ', (ia0_3f_p5), imag(ia0_3f_p5))
end



%% Fluxo de Potência

%Tipo 1- Carga 2- Tensão 3-Referência

%Barras     num_barra Tipo    Tensão     Fase(graus)   PGerada     QGerada  PCarga  QCarga    cap_paralelo 
barra =      [1         2       1.00        0.0         2.40        1.80     0.0      0.00       0.0
              2         3       1.00        0.0         2.25        1.08     0.0      0.000      0.0
              3         2       1.00        0.0         2.65        1.36     0.0      0.000      0.0
              4         1       1.00        0.0         0.0         0.00     0.0      0.000      0.0
              5         1       1.00        0.0         0.0         0.00     1.5      0.499      0.0
              6         1       1.00        0.0         0.0         0.00     0.0      0.000      0.0
              7         1       1.00        0.0         0.0         0.00     0.0      0.000      0.0
              8         1       1.00        0.0         0.0         0.00     0.0      0.000      0.0
              9         1       1.00        0.0         0.0         0.00     0.0      0.100      0.0
             10         1       1.00        0.0         0.0         0.00     0.0      0.000      0.0
             11         1       1.00        0.0         0.0         0.00     1.54     0.479      0.0
             12         1       1.00        0.0         0.0         0.00     1.16     0.571      0.0
             13         1       1.00        0.0         0.0         0.00     1.06     0.571      0.0
             14         1       1.00        0.0         0.0         0.00     1.26     0.050      0.0];
 
%OrigemDestino           R        X           C       Fase gama (graus) 
trechos  =       [
 1   4               0.0000000  0.051429    0.0000     0  
 2   8               0.0000000  0.100000    0.0000     0
 4   5               0.0082231  0.032004    0.0000     0
 4   7               0.0082590  0.035767    0.0000     0
 4   8               0.0093006  0.026526    0.0000     0
 5   6               0.0341600  0.07215     0.0000     0   
 6   3               0.0000000  0.054286    0.0000     0
 6   10              0.0088059  0.028318    0.0000     0   
 7   10              0.0168850  0.060217    0.0000     0   
 7   11              0.0950000  0.000000    0.0000     0
 8   9               0.0217010  0.053928    0.0000     0
 9   10              0.0201510  0.065595    0.0000     0
 9   14              0.0000000  0.070000    0.0000     0
 10  12              0.0000000  0.077778    0.0000     0
 10  13              0.0000000  0.12857     0.0000     0];
     
%	Determinação da dimensão das matrizes

[num_barras, colun1] = size(barra);
[num_trechos , colun2] = size(trechos);

%	Obtenção dos dados de barra

for k = 1:num_barras  %Para resolver a letra c deve-se manualmente colocar a linha adicional
        cod_barra(k) = barra(k,1); %Codificação da linha
        tipo(k) = barra(k,2); %Indica tipo de barra: PQ, PV, ou Vteta
        V(k)  = barra(k,3); %Tensão na barra em pu
        teta(k)  = barra(k,4) * pi/180; %teta em radianos
        Pesp_g(k)   = barra(k,5); %Potência ativa especificada gerada
        Qesp_g(k)   = barra(k,6); %Potência reativa especificada gerada
        Pesp_c(k)   = barra(k,7); %Potência ativa especificada carga
        Qesp_c(k)   = barra(k,8); %Potência reativa especificada carga
        Cap_paralelo(k) = barra(k,9); %Capacitor em paralelo com a barra (basta adicionar valores para resolver a letra b)
        Pesp(k) = Pesp_g(k) - Pesp_c(k); %Potência ativa especificada (gerador - carga)
        Qesp(k) = Qesp_g(k) - Qesp_c(k); %Potência reativa especificada (gerador - carga)
        n_iteracoes(barra(k,1)) = k; %Número de iterações
end

%	Obtenção dos dados do trecho entre as barras

for a = 1:num_trechos
	barra_origem(a)   = trechos(a,1); %Determina origem
	barra_destino(a) =  trechos(a,2); %Determina destino
	r(a)    = trechos(a,3); %Resitência
	x(a)    = trechos(a,4); %Reatância
	bs(a)   = trechos(a,5) / 2; %Montagem dos capacitores shunt no modelo pi
    gama(a) = trechos(a,6)*pi/180; %Ângulo de defasagem nas barras em radianos (dado em graus)
end

Y = zeros(num_barras,num_barras); %Cria um vetor de zeros para a admitancia com a dimensão do sistema

%Matriz de admitâncias

for k = 1:num_barras
	Y(k,k) = i*Cap_paralelo(k);
end

for a = 1:num_trechos %Montagem da matriz de admitâncias a partir dos dados fornecidos da linha e sistema
        k = barra_origem(a);
        m = barra_destino(a);
        y(a) = 1/(r(a) + i*x(a));
        Y(k,k) = Y(k,k) + y(a) + i*bs(a);
        Y(m,m) = Y(m,m) + y(a) + i*bs(a);
        Y(k,m) = Y(k,m) - y(a);
        Y(m,k) = Y(m,k) - y(a);
end
% MatrizZ = 
% for k=1:barra_origem(a)
%   for m=1:barra_destino(a)
%     for i=1:2
%       if MatrizZ(m,i)== k
%         ybarra(k,k)=ybarra(k,k)+inv(MatrizZ(m,3))+MatrizZ(m,4);
%       end
%     end
%   end
% end

G = real(Y); %Parte real de Y - matriz de condutâncias
B = imag(Y); %Parte imaginária de Y - matriz de susceptâncias

for k=1:14
    for m=1:14
        modY(k,m)=(sqrt(G(k,m)^2+B(k,m)^2)); %Cálculo do módulo de Y
    end
end

for k=1:14
    for m=1:14
        if G(k,m)>0
            faseY(k,m)=(atan(B(k,m)/G(k,m))); %Cálculo da fase de Y
            else
            faseY(k,m)=0; %Prevenção contra indeterminação no caso de divisão por zero
        end
    end
end

v1p = ones(num_barras,1);  %Cria uma matriz de uns com num_barras linhas e 1 coluna)
v1q = ones(num_barras,1);  %Cria uma matriz de uns com num_barras linhas e 1 coluna)
v2p = zeros(num_barras,1); %Cria uma matriz de zeros com num_barras linhas e 1 coluna)
v2q = zeros(num_barras,1); %Cria uma matriz de zeros com num_barras linhas e 1 coluna)
v3p = zeros(num_barras,1); %Cria uma matriz de zeros com num_barras linhas e 1 coluna)
v3q = zeros(num_barras,1); %Cria uma matriz de zeros com num_barras linhas e 1 coluna)
deltaP = 10^10; %Limite máximo para a condição
deltaQ = 10^10; %Limite máximo para a condição
ite=0; %Inicializa a variável que será incrementada a cada iteração
max_ite=100; %Número máximo de iterações

while deltaP > 1e-2 || deltaQ > 1e-2 || ite<2
    
    %Potências da carga calculada
    for k=1:num_barras 
        Pcalc_c(k) = G(k,k)*(V(k)^2);
        Qcalc_c(k) = -B(k,k)*(V(k)^2);
    end
    
    for a=1:num_trechos
        k = barra_origem(a);
        m = barra_destino(a);
               
        g = real(y(a)); %condutância do trecho km
        b = imag(y(a)); %susceptância do trecho km
        
        %Cálculo das potências que fluem entre as barras
        Pcalc_c(k) = Pcalc_c(k) + V(k)*V(m)*(-g*cos(teta(k) - teta(m) + gama(a))-b*sin(teta(k) - teta(m) + gama(a)));
        Pcalc_c(m) = Pcalc_c(m) + V(k)*V(m)*(-g*cos(teta(k) - teta(m) + gama(a))+b*sin(teta(k) - teta(m) + gama(a)));
        Qcalc_c(k) = Qcalc_c(k) + V(k)*V(m)*(-g*sin(teta(k) - teta(m) + gama(a))+b*cos(teta(k) - teta(m) + gama(a)));
        Qcalc_c(m) = Qcalc_c(m) - V(k)*V(m)*(-g*sin(teta(k) - teta(m) + gama(a))-b*cos(teta(k) - teta(m) + gama(a)));
        
    end
    
    DELTA_P = zeros(num_barras,1); %Cria uma matriz de zeros com o número de linhas do sistema e uma coluna
    DELTA_Q = zeros(num_barras,1); %Cria uma matriz de zeros com o número de linhas do sistema e uma coluna
    deltaP=0; %Coloca o a variável condicional igual a zero
    deltaQ=0; %Coloca o a variável condicional igual a zero
    contP=0; %Inicializa contador
    contQ=0; %Inicializa contador
    
    for k=1:num_barras
        Pprog(k)=(v1p(k)+v2p(k)*V(k)+v3p(k)*(V(k)^2))*Pesp(k); %dimensiona a matriz
        Qprog(k)=(v1q(k)+v2q(k)*V(k)+v3q(k)*(V(k)^2))*Qesp(k); %dimensiona a matriz
        if tipo(k)~=3 %desconsidera a barra de oscilação
            DELTA_P(k) = Pprog(k) - Pcalc_c(k);
            if abs(DELTA_P(k)) > deltaP %Estabelece a tolerância
                deltaP=DELTA_P(k);
                contP=cod_barra(k);
            end
        end
        if tipo(k)<=1 %considera somente as barras de carga
            DELTA_Q(k) = Qprog(k) - Qcalc_c(k);
            if abs(DELTA_Q(k)) > deltaQ %Estabelece a tolerância
                deltaQ=DELTA_Q(k);
                contQ=cod_barra(k);
            end
        end
    end
    
    DELTA_PQ = [DELTA_P;DELTA_Q]; %Montagem da matriz de variações
    
    if abs(deltaP)>1e-2 || abs(deltaQ)>1e-2 %Condição para cálculo da Jacobiana
        
        %Cálculo da Jacobiana
        
        %Jacobiana=|   H    |    N    |
        %          |   M    |    L    |
        
        H = zeros(num_barras,num_barras); %Cria as matrizes com suas dimensões
        M = zeros(num_barras,num_barras); %Cria as matrizes com suas dimensões
        N = zeros(num_barras,num_barras); %Cria as matrizes com suas dimensões
        L = zeros(num_barras,num_barras); %Cria as matrizes com suas dimensões
        
        %Cálculo das diagonais
        for k=1:num_barras
            H(k,k) = -Qcalc_c(k)-(V(k)^2)*B(k,k);
            if tipo(k)==3
                H(k,k) = 10^15; %Válido para barra de oscilação (fase constante)
            end
            N(k,k) = (Pcalc_c(k)+(V(k)^2)*G(k,k))/V(k) - (v2p(k)+2*v3p(k)*V(k)*Pesp(k));
            M(k,k) = Pcalc_c(k)-(V(k)^2)*G(k,k);
            L(k,k) = (Qcalc_c(k)-(V(k)^2)*B(k,k))/V(k) - (v2p(k)+2*v3p(k)*V(k)*Qesp(k));
            if tipo(k)>=2 %Válido para barra de tensão e oscilação (fase constante)
                L(k,k)=10^15;
            end
        end
        
        for a=1:num_trechos
            k = barra_origem(a);
            m = barra_destino(a);
            
            %Componentes de H (Derivada da potência ativa em relação aos ângulos)
            H(k,m) = H(k,m)+(V(k)^2)*(G(k,m)*sin(teta(k) - teta(m) + gama(a))-B(k,m)*cos(teta(k) - teta(m) + gama(a)));
            H(m,k) = H(m,k)+(V(k)*V(m)*(-G(k,m)*sin(teta(k) - teta(m) + gama(a))-B(k,m)*cos(teta(k) - teta(m) + gama(a))));
        
            %Componentes de N (Derivada da potência ativa em relação às tensões)
            N(k,m) = N(k,m)+(V(k)*(G(k,m)*cos(teta(k) - teta(m) + gama(a))+B(k,m)*sin(teta(k) - teta(m) + gama(a))));
            N(m,k) = N(m,k)+(V(m)*(G(k,m)*cos(teta(k) - teta(m) + gama(a))-B(k,m)*sin(teta(k) - teta(m) + gama(a))));
        
            %Componentes de M (Derivada da potência reativa em relação aos ângulos)
            M(k,m) = M(k,m)-V(k)*V(m)*(G(k,m)*cos(teta(k) - teta(m) + gama(a))+B(k,m)*sin(teta(k) - teta(m) + gama(a)));
            M(m,k) = M(m,k)-V(k)*V(m)*(G(k,m)*cos(teta(k) - teta(m) + gama(a))-B(k,m)*sin(teta(k) - teta(m) + gama(a)));
            
            %Componentes de L (Derivada da potência reativa em relação às tensões)
            L(k,m) = L(k,m)+V(k)*(G(k,m)*sin(teta(k) - teta(m) + gama(a))-B(k,m)*cos(teta(k) - teta(m) + gama(a)));
            L(m,k) = L(m,k)-V(m)*(G(k,m)*sin(teta(k) - teta(m) + gama(a))+B(k,m)*cos(teta(k) - teta(m) + gama(a)));
        
        end
        
        Jacobiana = [ H N ; M L ]; %Estruturação da matriz Jacobiana
        DELTA_V = inv(Jacobiana)*DELTA_PQ; %Cálculo da matriz de variação de V e teta
        
        V = V + DELTA_V(num_barras+1:2*num_barras)'; %atualização das tensões
        teta = teta + DELTA_V(1:num_barras)'; %atualização dos ângulos
        
        ite = ite+1;
        
        if ite>max_ite %Condição de limite de iterações (evitar loop infinito)
            deltaP=0;
            deltaQ=0;
            fprintf('Limite de iterações excedido');
        end
    end           
end %fim while  

%Resolução do segundo subsistema

%Cálculo das potências
for k=1:num_barras
    Pcalc_c(k) = G(k,k)*(V(k)^2);
    Qcalc_c(k) = -B(k,k)*(V(k)^2);
end

for a=1:num_trechos
    
    k = barra_origem(a);
    m = barra_destino(a);
    
    g=real(y(a));
    b=imag(y(a));
    
    Pcalc_c(k) = Pcalc_c(k) + V(k)*V(m)*(-g*cos(teta(k) - teta(m) + gama(a))-b*sin(teta(k) - teta(m) + gama(a)));
    Pcalc_c(m) = Pcalc_c(m) + V(k)*V(m)*(-g*cos(teta(k) - teta(m) + gama(a))+b*sin(teta(k) - teta(m) + gama(a)));
    Qcalc_c(k) = Qcalc_c(k) + V(k)*V(m)*(-g*sin(teta(k) - teta(m) + gama(a))+b*cos(teta(k) - teta(m) + gama(a)));
    Qcalc_c(m) = Qcalc_c(m) - V(k)*V(m)*(-g*sin(teta(k) - teta(m) + gama(a))-b*cos(teta(k) - teta(m) + gama(a)));
 
end
                


%Fluxo de potência

for a=1:num_trechos
    
     k = barra_origem(a);
     m = barra_destino(a);
     
     g=real(y(a));
     b=imag(y(a));
     
     %Potência entre as barras
     Pkm(a) = (V(k)^2)*g-V(k)*V(m)*(g*cos(teta(k) - teta(m) + gama(a))+b*sin(teta(k) - teta(m) + gama(a)));
     Pmk(a) = (V(m)^2)*g-V(k)*V(m)*(g*cos(teta(k) - teta(m) + gama(a))-b*sin(teta(k) - teta(m) + gama(a)));
     Qkm(a) = -(V(k)^2)*(b+bs(a))+V(k)*V(m)*(b*cos(teta(k) - teta(m) + gama(a))-g*sin(teta(k) - teta(m) + gama(a)));
     Qmk(a) = -(V(m)^2)*(b+bs(a))+V(k)*V(m)*(b*cos(teta(k) - teta(m) + gama(a))+g*sin(teta(k) - teta(m) + gama(a)));
     
end

%	Resultados Obtidos
%Tensões, ângulos e potências
fprintf('\nNúmero de iterações\n')
ite
fprintf('\nTensões, ângulos e potências\n')
fprintf('\nResultados Obtidos\n')

fprintf('\nTensão nas barras (pu)\n')
V

fprintf('\nÂngulo teta em graus\n')
teta=teta*180/pi;
teta

fprintf('\nPotência ativa calculada (pu)\n')
Pcalc_c

fprintf('\nPotência reativa calculada (pu)\n')
Qcalc_c

%Fluxo de potência

fprintf('\nFluxo de Potência\n')

fprintf('\n    De   Para     Pkm      Qkm\n')
for a = 1:num_trechos
	fprintf(' |%3d %6d %9.2f %8.2f |\n',barra_origem(a),barra_destino(a),Pkm(a)*100,Qkm(a)*100)
end






%% Estudo de Estabilidade - Modelo de Heffron & Phillips para sistema MBI

% Programa para simulação da estabilidade de um gerador síncrono ligado a
% uma barra infinita (Modelo Linear de "Heffron & Phillips" do sistema MBI).
% Declaração dos dados do gerador
%  Variáveis elétricas e mecânicas para modelagem da MS 
%
w0=377;  % Freq. síncrona [rad/s]
H=5;
M=2*H;   % Momento de inercia do bloco girante [pu]
D=0;     % Coeficiente de amortecimento inerente do sistema
d=D;
tld0=6.0;% Cte de tempo transitória de circuito aberto [s]
xld=0.5; % Reatância transitória de eixo direto [pu]
xd=1.7;  % Reatância síncrona de eixo direto [pu]
xq=1.64; % Reatância síncrona de eixo direto [pu]

% Dados da linha de transmissão

re=0;      % Resistência do equivalente do sistema de transmisão [pu]
xtr=0.1;   % Reatância do transformador [pu]
x1=0.1;    % Reatância da linha de transmissão 1 [pu]
x2=0.2;    % Reatância da linha de transmissão 2 [pu]

% OBS: a forma com que são ligadas as LT podem ser alteradas a seguir.

% xe=x1+x2+xtr;              % LT em série
% xe=inv(1/x1+1/x2)+xtr;     % LT em paralelo
% xe=xtr+x1;                 % Só LT 1 e trafo
% xe=xtr+x2;                 % Só LT 2 e trafo

xe=0.2;

%% Dados do ponto de operação

vt=1.0;         % Tensão terminal da MS [pu] (Definida como 1 pu)
cosfi=1.0;      % Fator de potência [pu]
pe=1.5;         % Potência elétrica gerada [pu]
tm=pe;
pe=0:0.01:tm; % Variação da Pot. Elétrica para plotar gráfico

cor='b';
% Dados do regulador de tensão

kr=20;          % Ganho do regulador de tensão de tensão
tr=0.001;       % Constante de tempo do RAT estático
tb=0.1;         % Constante de tempo do RAT rotativo

% Simulações

ncosfi=length(cosfi);
np=length(pe);
for jj=1:ncosfi;
    for i=1:np;
% vt=1; %ativar a linha se gerar o vetor pe
qe=pe(i)*tan(acos(cosfi(jj)));
st=pe(i)+j*qe;          % Potência complexa gerada
it=(st/vt)';            % Corrente no sistema
vinf=vt-j*xe*it;
ea=vt+j*xq*it;
el=vt+j*xld*it;                 % Tensão interna transitória da MS
delta=angle(ea)-angle(vinf);    % Ângulo de carga (defasagem da tensão interna e da barra infinita)

% colocando a tensão da barra infinita na referência

x=angle(vinf);
vinf=abs(vinf);
vt=abs(vt)*(cos(-x)+j*sin(-x));
it=(st/vt)';
ea=vt+j*xq*it;
el=vt+j*xld*it;
vs=vt-j*x1*it;

% sistema de coordenadas (r,m)

vinfr=real(vinf);
vinfm=imag(vinf);
vinfrm=vinfr+j*vinfm;
vr=real(vt);
vm=imag(vt);
vtrm=vr+j*vm;
ir=real(it);
im=imag(it);
itrm=ir+j*im;
ear=real(ea);
eam=imag(ea);
earm=ear+j*eam;
elr=real(el);
elm=imag(el);
elrm=elr+j*elm;
vsr=real(vs);
vsm=imag(vs);
vsrm=vsr+j*vsm;

delta=angle(ea);

T=[sin(delta) -cos(delta);cos(delta) sin(delta)];
T1=inv(T);
xx=T*[vinfr;vinfm];
vinfd=xx(1);
vinfq=xx(2);
xx=T*[vr;vm];
vd=xx(1);
vq=xx(2);
xx=T*[vsr;vsm];
vsd=xx(1);
vsq=xx(2);
xx=T*[ir;im];
id=xx(1);
iq=xx(2);
xx=T*[ear;eam];
ead=xx(1);
eaq=xx(2);
xx=T*[elr;elm];
eld=xx(1);
elq=xx(2);

% sistema de coordenadas (d,q)

vinfdq=vinfd+j*vinfq;
vtdq=vd+j*vq;
vsdq=vsd+j*vsq;
itdq=id+j*iq;
eldq=eld+j*elq;
eadq=ead+j*eaq;

% Calculo das constantes do Modelo de H&P

k1(i,jj)=(xq-xld)/(xld+xe)*iq*vinf*sin(delta)+((xq-xld)*id+elq)*vinf*cos(delta)/(xq+xe);
k2(i,jj)=(xq+xe)/(xld+xe)*iq;
k3(i,jj)=(xld+xe)/(xd+xe);
k4(i,jj)=(xd-xld)/(xld+xe)*vinf*sin(delta);
k5(i,jj)=vd/abs(vtdq)*xq/(xq+xe)*vinf*cos(delta)-vq/abs(vtdq)*xld/(xld+xe)*vinf*sin(delta);
k6(i,jj)=vq/abs(vtdq)*xe/(xld+xe);
%
wn(i,jj)=sqrt(w0*k1(i,jj)/M);
qsi(i,jj)=0.5*d/sqrt(k1(i,jj)*w0*M);
end;
end;

temax=abs(el)*abs(vinf)/(xe+xld);

trel=0.5*(abs(vinf)^2*(xq-xld)/((xld+xe)*(xq+xe)));

delta=0:0.01:pi; % Valores de Delta para a curva de potência
for l=1:length(delta);
   tmec(l)=tm;
   ter(l)=temax*sin(delta(l))+trel*sin(2*delta(l));
   qrel(l)=trel*sin(2*delta(l));
   tclassico(l)=temax*sin(delta(l));
end;
rg=180/pi; % Transformação de radianos para graus
deltag=delta*rg;
% figure(99);plot(deltag,tmec,'k',deltag,ter,cor,deltag,qrel,'m',deltag,tclassico,'b','LineWidth',2);grid;hold on


if np == 1;
% Representação do sistema em espaço de estados
%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Sem RAT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% x = [w   delta   E'q]
% u = [Tmec   Efd]
% ys = [w(1)   delta(2)   E'q(3)   Vt(4)   Te(5)]
%
As=[-d/M       -k1(i,jj)/M       -k2(i,jj)/M;
      w0             0                 0    ; 
       0     -k4(i,jj)/tld0  -1/(k3(i,jj)*tld0)];
%
Bs=[1/M 0; 0 0; 0 1/tld0];
%
Cs=[1      0          0    ; % w(1)
   0       1          0    ; % delta(2)
   0       0          1    ; % elq(3)
   0   k5(i,jj)   k6(i,jj) ; % vt(4)
   0   k1(i,jj)   k2(i,jj)]; % te(5)
%
Ds=[0 0;0 0;0 0;0 0;0 0];

%%%%%%%%%%%%%%%%%%%%%%%%%% Com RAT Lento %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = [w   delta   E'q   Efd   x]
% u = [Tmec   Vref]
% y = [w(1)   delta(2)   E'q(3)   Efd(4)   x(5)   Vt(6)   Te(7)]
%
Al=[-d/M  -k1(i,jj)/M        -k2(i,jj)/M          0      0  ;
   w0           0                 0               0      0  ;
   0     -k4(i,jj)/tld0    -1/(k3(i,jj)*tld0)  1/tld0    0  ;
   0            0                 0            -1/tb   1/tb ;
   0     -kr*k5(i,jj)/tr   -kr*k6(i,jj)/tr        0   -1/tr];
%
Bl=[1/M 0;0 0;0 0;0 0;0 kr/tr];
%
Cl=[1       0           0       0    0 ; % w(1)
   0        1           0       0    0 ; % delta(2)
   0        0           1       0    0 ; % elq(3)
   0        0           0       1    0 ; % efd(4)
   0        0           0       0    1 ; % x(5)
   0    k5(i,jj)    k6(i,jj)    0    0 ; % vt(6)
   0    k1(i,jj)    k2(i,jj)    0    0]; % te(7)
%
Dl=[0 0;0 0;0 0;0 0;0 0;0 0;0 0];

%%%%%%%%%%%%%%%%%%% Com RAT Estático (rápido) %%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = [w   delta   E'q   Efd]
% u = [Tmec   Vref]
% y = [w(1)   delta(2)   E'q(3)   Efd(4)   Vt(5)   Te(6)]
%
A=[-d/M    -k1(i,jj)/M         -k2(i,jj)/M          0  ;
   w0           0                   0               0  ;
   0    -k4(i,jj)/tld0     -1/(k3(i,jj)*tld0)    1/tld0;
   0    -kr*k5(i,jj)/tr     -kr*k6(i,jj)/tr      -1/tr];

B=[1/M 0;0 0;0 0;0 kr/tr];

C=[1        0            0       0 ; % w(1)
   0        1            0       0 ; % delta(2)
   0        0            1       0 ; % elq(3)
   0        0            0       1 ; % efd(4)
   0    k5(i,jj)     k6(i,jj)    0 ; % vt(5)
   0    k1(i,jj)     k2(i,jj)    0]; % te(6)

D=[0 0;0 0;0 0;0 0;0 0;0 0];

% Simulações
% simulação: degrau de 0.05 pu em Tmec

t=0:0.01:15;                % vetor de tempo
u5=0.05*ones(size(t))';     % vetor de amplitude 0.05 pu (degrau)
u0=zeros(size(t))';         % vetor de entradas sem perturbação

% sistema sem RAT
% x = [w   delta   E'q]
% u = [Tmec   Efd]
% y = [w(1)   delta(2)   E'q(3)   Vt(4)   Te(5)]

us=[u5 u0 ];
ys=lsim(As,Bs,Cs,Ds,us,t);  % Solução do sistema linear no domínio do tempo para sistema sem RAT

% com RAT lento
% x = [w   delta   E'q   Efd   x]
% u = [Tmec   Vref]
% y = [w(1)   delta(2)   E'q(3)   Efd(4)   x(5)   Vt(6)   Te(7)]

ul=[u5 u0];
yl=lsim(Al,Bl,Cl,Dl,ul,t);  % Solução do sistema linear no domínio do tempo para sistema com RAT Lento

% com RAT estático (rápido)

% x = [w   delta   E'q   Efd]
% u = [Tmec   Vref]
% y = [w(1)   delta(2)   E'q(3)   Efd(4)   Vt(5)   Te(6)]

u=[u5 u0 ];
y=lsim(A,B,C,D,u,t);        % Solução do sistema linear no domínio do tempo para sistema com RAT Estático
%
end;
% Significado das variáveis
% w - velocidade angular do rotor
% delta - angulo de carga do gerador
% E'q - tensão interna do gerador no eixo de quadratura
% Efd - tensão no enrolamento de campo
% Tmec - torque mecânico
% Vref - tensão considerada como referência do regulador automático de tensão
% Vt - tensão nos terminais da máquina síncrona
% Te - torque elétrico (potência elétrica)

% %% COM RAT ESTÁTICO
% figure(11);hold on;plot(t,y(:,1)*377,   cor,'lineWidth',1.5);grid on;legend ('Var. Velocidade Ângular [rad/s]','Location','northeast');
% figure(12);hold on;plot(t,y(:,2)*180/pi,cor,'lineWidth',1.5);grid on;legend ('Var. Ângular [graus]','Location','northeast');
% figure(13);hold on;plot(t,y(:,3),       cor,'lineWidth',1.5);grid on;legend ('Tensão Interna Eq [pu]','Location','northeast');
% figure(14);hold on;plot(t,y(:,4),       cor,'lineWidth',1.5);grid on;legend ('Tensão de Campo Efd [pu]','Location','northeast');
% figure(15);hold on;plot(t,y(:,5),       cor,'lineWidth',1.5);grid on;legend ('Tensão Terminal [pu]','Location','northeast');
% figure(16);hold on;plot(t,y(:,6),       cor,'lineWidth',1.5);grid on;legend ('Torque Elétrico [pu]','Location','northeast');
% % 
% %% SEM RAT
% figure(21);hold on;plot(t,ys(:,1)*377,   cor,'lineWidth',1.5);grid on;legend ('Var. Velocidade Ângular [rad/s]','Location','northeast');
% figure(22);hold on;plot(t,ys(:,2)*180/pi,cor,'lineWidth',1.5);grid on;legend ('Var. Ângular [graus]','Location','northeast');
% figure(23);hold on;plot(t,ys(:,3),       cor,'lineWidth',1.5);grid on;legend ('Tensão Interna Eq [pu]','Location','northeast');
% figure(24);hold on;plot(t,ys(:,4),       cor,'lineWidth',1.5);grid on;legend ('Tensão Terminal [pu]','Location','northeast');
% figure(25);hold on;plot(t,ys(:,5),       cor,'lineWidth',1.5);grid on;legend ('Torque Elétrico [pu]','Location','northeast');
% 
% xs=eig(As);[real(xs(:)) imag(xs(:)) abs(xs(:))/(2*pi) -real(xs(:))./abs(xs(:))]
% x=eig(A);[real(x(:)) imag(x(:)) abs(x(:))/(2*pi) -real(x(:))./abs(x(:))]



%% Seleção do Modelo de Relé de Proteção a ser utilizado
choice_rele_prot = menu('Selecione o Modelo de Relé de Proteção','ABB - REF615', 'ABB - REG615', 'SIEMENS - 7SR5111', 'SEL - 751A', 'SEL - 700G');

%Funções 50/51, 50N/51N, 27, 59, 59N, 81U/O/dfdt, 78, 32R, 67, 25/25CS, 51V, 46, 24, 40, 49T, 87, 21, 79
%81dfdt, 78, 67, 25/25CS, 46, 40, 87, 21, 79 

if choice_rele_prot == 1
    rele_prot = '1';
elseif choice_rele_prot == 2
    rele_prot = '2';
elseif choice_rele_prot == 3
    rele_prot = '3';
elseif choice_rele_prot == 4
    rele_prot = '4';
else
    rele_prot = '5';
end

if rele_prot == '1'
    choice_21 = menu('Deseja ajustar a Função 21?','Sim', 'Não');
    
end
    Aj_21 = 0;
    Aj_24 = 0;
    %A24 = (t*((M-1)^2))/0.18;
    %M = Xleak*(UN/(Inr3)); - excitation level 
    %Pelo REF615 -> M = (E/fm)/((Un/Fn)*(VoltMaxCont/100))
    Aj_25CS = 0;
    Aj_27_N1 = Input02UG1*0.9;
    Aj_27_N2 = Input02UG1*0.5;
    Aj_32R = 0;
    %A32R = ((0.2*1150)/1450)*(2300/2300)*(363.98/1000);
    Aj_40 = 0;
    %xd = 101,7
    %x'd = 19
    %Offset = x'd/2 -> -9,5
    %Diâmetro = xd = 101,7
    %Displacement = 0%
    %Operate delay time = 600ms
    Aj_46 = 0;
    %A46 = 1.08*In
    Aj_49T = 0;
    %A49T = t/(In*((I^2-Ip)/(I^2-Ib)));
    Aj_50_N1 = 0;
        %ANSI 50/51
        
choice_5051 = menu('Deseja ajustar as Funções 50/51?','Sim', 'Não');
if choice_5051 == 1 %1TE + 1UG
    choice_curva = menu('Escolha a Curva ANSI','VI', 'EI', 'NI', 'LI' ,'SI');
end
%%% AJUSTES DE FASE %%%

% Seleção da curva IEC a ser utilizada
% curva = 'vi'; % Muito inversa
%curva = 'ei'; % Extremamente inversa
%curva = 'ni'; % Normalmente inversa
%curva = 'li'; % Inversa longa
%curva = 'si'; % Inversa

% Dados da UG01
% S = 1450e3;
% Vn = 2.3e3;
% R3 = sqrt(3);
% In = S/(R3*Vn);

% Corrente de Curto-Circuito na barra da Caixa de Ligação do Gerador
% Icc3f = 7.017e3;
% icc1f = 0.297e3;

% Parâmetros de corrente
RTC = 200; % Escolha do TC: 1000 - 5A, RTC = 1000/5 -> 200
Fs = 1.15; % Fator de sobrecorrente
Ipk = (Fs*In)/RTC; % Corrente de Pick-Up do relé (secundário)
Iac = Ipk*RTC; % Corrente de acionamento (primário)
M=Icc3f/(RTC*Ipk); % Múltiplo da corrente de acionamento

% Cálculos para Unidade Temporizada 
if choice_curva == 'vi' 
    a = 13.5; % Constante da norma
    b = 1; % Constante da norma
    T = 0.250; % Tempo de atuação
    dt = (((Icc3f/Iac)-1)*T)/a;
elseif choice_curva == 'ei'
    a = 80; % Constante da norma
    b = 2; % Constante da norma
    T = 0.250; % Tempo de atuação
    dt = (((Icc3f/Iac)-1)*T)/a;
elseif choice_curva == 'ni'
    a = 0.14; % Constante da norma
    b = 0.02; % Constante da norma
    T = 0.250; % Tempo de atuação
    dt = (((Icc3f/In)-1)*T)/a;
elseif choice_curva == 'li'
    a = 120; % Constante da norma
    b = 1; % Constante da norma
    T = 0.250; % Tempo de atuação
    dt = (((Icc3f/Iac)-1)*T)/a;
elseif choice_curva == 'si'
    a = 0.05; % Constante da norma
    b = 0.04; % Constante da norma
    T = 0.250; % Tempo de atuação
    dt = (((Icc3f/Iac)-1)*T)/a;
end

% Cálculos para Unidade Instantânea

Ftd = round((Icc3f/Iac)*0.65); % Fator de sobrecarga 
Ipktd = Ftd*Ipk; % Corrente de Pick-Up (secundário)
Iactd = RTC*Ipktd; % Corrente de acionamento (primário)
% *** verificar se a condição Iactd < Icc3f é satisfeita ***

%Para os ajustes de neutro, considerar 0.3*Ifase
    Aj_50_N2 = 0;
    Aj_50BF = 0;
    Aj_50N_N1 = 0.3;
    Aj_50N_N2 = 0.3;
    Aj_51_N1 = 0;
    Aj_51_N2 = 0;
    Aj_51N_1 = 0;
    Aj_51N_2 = 0;
    Aj_51V = 0;
    %A51V = 1.15*In
    %Para o ajuste de tempo: IEC Def Time, 350ms
    Aj_59_N1 = Input02UG1*1.07;
    Aj_59_N2 = Input02UG1*1.10;
    Aj_59N = Input02UG1;
    Aj_67_N1 = 0;
    Aj_67_N2 = 0;
    Aj_67N_N1 = 0;
    Aj_67N_N2 = 0;
    Aj_68 = 0;
    Aj_78 = 0;
%     Conforme estudo de estabilidade
    Aj_79 = 0;
    Aj_81U_N1 = 0;
    %A81U_1 = (60*248.4)/276; %(0,90% - 54 Hz)
    Aj_81U_N2 = 0;
    %A81U_2 = (60*234.6)/276; %(0,85% - 51 Hz
    Aj_81O_N1 = 0;
    %A81O_1 = (60*303.6)/276; %(1,10% - 66 Hz)
    Aj_81O_N2 = 0;
    %A81O_2 = (60*345)/276; %(1,25% - 75 Hz)
    Aj_81dfdt = 0;
%     Conforme estudo de estabilidade
    Aj_87 = 0;
end

%% Coordenogramas e Demais Gráficos necessários

% Curvas de relés
close all;

tms=[0.1 0.3 0.5 0.7 0.9 1.1 1.3 1.5 1.7 1.9];

M = logspace(0.001,1.6,100);
% Tms=1
for k=1:length(M)
T_inversa(k,:,1)=0.14/(M(k).^0.02-1);
T_inversa(k,:,2)=13.5/(M(k)-1);
T_inversa(k,:,3)=80/(M(k).^2-1);
T_inversa(k,:,4)=120/(M(k)-1);
T_inversa(k,:,5)=0.05/(M(k).^0.04-1);
T_inversa(k,:,6)=60/(M(k));
T_inversa(k,:,7)=540/(M(k).^2);
end

% G1 = 20 * log10(25);
% G2 = 20 * log10(abs(j*w+1));
% G3 = -40 * log10(abs(j*w));
% G4 = -20 * log10(abs(0.1*j*w+1));
% G = G1 + G2 + G3 + G4;
% semilogx(w,G1, w,G2, w,G3, w,G4, w,G);

loglog(M,T_inversa(:,:,1),'b',M,T_inversa(:,:,2),'r',M,T_inversa(:,:,3),':r',...
       M,T_inversa(:,:,4),'y',M,T_inversa(:,:,5),'k',M,T_inversa(:,:,6),'c',...
       M,T_inversa(:,:,7),'g','LineWidth',1.5)
xlim([0 40]);ylim([10^-1,10^4])
ax = gca;
ax.XTick = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,30,35,40];
% ax.YTickLabel = {'min = -1','-0.5','0','0.5','max = 1'};
grid on
xlabel('Multiplo de corrente');
ylabel('Temporização (s)');
title('Curva de temporização de relés');
legend('Normalmente inversa','Muito inversa','Extremamente inversa','Inversa longa','Inversa curta','I x T','I^2 X T','Location','Northeast');