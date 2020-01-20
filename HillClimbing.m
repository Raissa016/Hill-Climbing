%%            TRABALHO DE INTELIGÊNCIA COMPUTACIONAL

%   Instituição:    Universidade Federal do Ceará - UFC, campus Sobral-CE
%   Autor(a):       Raíssa Ellen de Sousa
%   Matrícula:      385135

%% DESCRIÇÃO DO PROBLEMA:

%   Encontrar o máximo da função f(x,y) = |xsen(ypi/4) + ysen(xpi/4)| por meio do
%   algoritmo hill-climbing. As variáveis x e y pertencem ao intervalo entre 0 e 20.
%   Os vizinhos de determinado estado (x, y) são (x ± 0,01, y ± 0,01). Por exemplo, 
%   os vizinhos do estado (1, 1) são (1,01, 1,01), (0,99, 0,99), (0,99, 1,01) e (1,01, 0,99).

%% CONDIÇÕES INICIAIS

clear all;
close all;
clc;

%% CENÁRIO

%Variáveis x e y dentro do intervalo entre 0 e 20, com passo 0.01. 
%Gerar todos os valores de x e y possíveis
    y = 0:0.01:20;
    x = 0:0.01:20;

%Tratamento dos eixos para serem plotados no plano R3
    [Y,X]= meshgrid(y,x);

%Dado os pontos x e y, calcula-se o valor da função objetivo para tais.
    FO = FuncaoObjetivo(X,Y);

%Plotar o gráfico
    figure('Name','Hill-Climbing','NumberTitle','off')
    surf(x,y,FO');
    shading interp;

%Restrições do problema
    limiteSuperior = 20;
    limiteInferior = 0;

%% HILL CLIMBING

% Para gerar valores da distribuição uniforme no intervalo [a, b].
% Temos r = a + (b-a).*rand(100,1);
    Xinicial= 20.*rand(1);
    Yinicial= 20.*rand(1);
    
% O primeiro ponto gerado é alocado como o máximo inicial 
    Xmax = Xinicial;
    Ymax = Yinicial;

    N = 1000;           %número de repetições
    Nvizinhos = 4;      %número de vizinhos considerados

% Armazena todos os valores que foram analisados dado
% um certo ponto(x,y) inicial
    Xgerados= zeros(N,Nvizinhos*2);
    Ygerados= zeros(N,Nvizinhos*2);

%Tempo dado para o algoritmo encontrar o ponto máximo
for n=1:1:N

% Gerar os vizinhos do ponto (x,y)
    vizinhos = GerarVizinhos(Xmax,Ymax);

% Testar caso os vizinhos não se encontrem entre o intervalo de 0 e 20.
    vizinhos = TesteBorda( vizinhos , limiteInferior , limiteSuperior );

% Armazena o ponto que maximiza a função objetivo até então
    Xgerados(n,1)= Xmax;
    Ygerados(n,1)= Ymax;

    for i=1:2:length(vizinhos)

    % Testa os valores da função objetivo de um dado ponto (x,y)
    % com seus vizinhos (x ± 0,01, y ± 0,01).
            if FuncaoObjetivo(Xmax,Ymax)< FuncaoObjetivo(vizinhos(i),vizinhos(i+1))
                % Se a FO em um dado vizinho é maior que do ponto atual
                % o vizinho em questão será o ponto máximo
                Xmax = vizinhos(i);
                Ymax = vizinhos(i+1);
            end
           
    % Armazena os vizinhos gerados
    % A matriz de gerados é N linhas(tempo para executar a busca) e
    % Nvizinhos*2, pois os valores são armazenados da seginte forma:
    % Xgerados (iteraçãoN,:) = [ Xmaximoatual Xvizinho1 0 Xvizinho2 0 Xvizinho3 0 Xvizinho4 ]
    % Ygerados (iteraçãoN,:) = [ Ymaximoatual Yvizinho1 0 Yvizinho2 0 Yvizinho3 0 Yvizinho4 ]
            Xgerados(n,i+1)= vizinhos(i);
            Ygerados(n,i+1)= vizinhos(i+1);
    end
end

% Outra forma de conferir se foi encontrado o valor que maximiza a FO é
% analisar todos os pontos gerados(considerados) a partir do ponto inicial.
    Confere=zeros(1,N);
    
    for i=1:1:N
    Confere(1,i)= FuncaoObjetivo(Xgerados(i,Nvizinhos*2), Ygerados(i,Nvizinhos*2));
    end
    conferemax = max(max(Confere));

%Plota o ponto máximo encontrado
    hold on
    plot3( Xmax , Ymax ,FuncaoObjetivo(Xmax,Ymax),'k*');
    legend('Região','Máximo encontrado');
    title('HILL-CLIMBING (Início aleatório)');
    xlabel('X');
    ylabel('Y');
    zlabel('Função Objetivo');

%% INFORMAÇÕES

formato = '\n\t\t\t\tHILL-CLIMBING\n\nMÁXIMO DA FUNÇÃO OBJETIVO\n\nDescrição: Encontrar o máximo da função f(x,y) = |xsen(ypi/4) + ysen(xpi/4)|\npor meio do algoritmo hill-climbing, com as variáveis x e y pertencentes\nao intervalo entre 0 e 20.\n\nAnalizando os vizinhos (x ± 0,01, y ± 0,01) de um dado ponto (x, y).\n ';
fprintf(formato);

inicio = '\n------------------------------------\nPONTO INICIAL\n------------------------------------\nO primeiro ponto gerado: \n X = %4.2f e Y = %4.2f \n A Função Objetivo para tal ponto:\n FO = %4.3f \n';
fprintf(inicio,Xinicial,Yinicial,FuncaoObjetivo(Xinicial,Yinicial));

Resultado = '\n------------------------------------\nPONTO MÁXIMO\n------------------------------------\nO ponto encontrado que mazimiza a FO: \n X = %4.2f e Y = %4.2f\n A Função Objetivo para tal ponto:\n FO = %4.3f\nValor máximo da FO por outra analise: %4.3f \n';
fprintf(Resultado,Xmax,Ymax,FuncaoObjetivo(Xmax,Ymax),conferemax);

%% LIMPAR DADOS

% Apagar dados irrelevantes para as consultas
clear x; clear i; clear n; clear y; clear X; clear Y; clear formato; clear inicio; clear Resultado; 

    
%% Raíssa Ellen de Sousa - 385135

