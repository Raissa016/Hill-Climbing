%% FUNÇÃO QUE LIMITA

%DESCRIÇÃO: A função TesteBorda() analisa a ocorrência de vizinhos calculados
%           que saem dos limites superiores e inferiores. E portanto, os exclui
%           do vetor de vizinhos de um dado ponto (x,y).

%EXEMPLO:   Dado o ponto (0,0) seus vizinhos são:
%           (0.0100,0.0100),(-0.0100,-0.0100),(-0.0100,0.0100)e(0.0100,-0.0100)
%           Logo, apenas o ponto (0.0100,0.0100) se encontra nos limites de x
%           e y. Assim apenas o mesmo deverá ser analizado.

function [ v ] = TesteBorda( vizinhos , limiteInferior , limiteSuperior )

%Recebe o vetor vizinhos para atualizar
v = vizinhos;

%Variável que controla o tamanho do vetor após deletar pontos
cont=0;

%Confuguração de acesso aos pares xi e yi do vetor de vizinhos.
for i=1:2:8
    
    %Testa se os pontos se encontram no intervalo
    if vizinhos(i-cont) < limiteInferior || vizinhos(i-cont) > limiteSuperior || vizinhos(i-cont+1) < limiteInferior || vizinhos(i-cont+1) > limiteSuperior
        %Apaga o ponto que não se encontra no intervalo
        v(i - cont) = [];       %Ponto referente à x
        v(i - cont) = [];       %Ponto referente à y (como foi deletado anteriormente x 
                                %o indice(i-cont+1) que correspondia à y se torna (i-cont).
                                
        cont = cont + 2;        %Elementos excluídos
    end
    
end

