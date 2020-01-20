%% FUN��O QUE LIMITA

%DESCRI��O: A fun��o TesteBorda() analisa a ocorr�ncia de vizinhos calculados
%           que saem dos limites superiores e inferiores. E portanto, os exclui
%           do vetor de vizinhos de um dado ponto (x,y).

%EXEMPLO:   Dado o ponto (0,0) seus vizinhos s�o:
%           (0.0100,0.0100),(-0.0100,-0.0100),(-0.0100,0.0100)e(0.0100,-0.0100)
%           Logo, apenas o ponto (0.0100,0.0100) se encontra nos limites de x
%           e y. Assim apenas o mesmo dever� ser analizado.

function [ v ] = TesteBorda( vizinhos , limiteInferior , limiteSuperior )

%Recebe o vetor vizinhos para atualizar
v = vizinhos;

%Vari�vel que controla o tamanho do vetor ap�s deletar pontos
cont=0;

%Confugura��o de acesso aos pares xi e yi do vetor de vizinhos.
for i=1:2:8
    
    %Testa se os pontos se encontram no intervalo
    if vizinhos(i-cont) < limiteInferior || vizinhos(i-cont) > limiteSuperior || vizinhos(i-cont+1) < limiteInferior || vizinhos(i-cont+1) > limiteSuperior
        %Apaga o ponto que n�o se encontra no intervalo
        v(i - cont) = [];       %Ponto referente � x
        v(i - cont) = [];       %Ponto referente � y (como foi deletado anteriormente x 
                                %o indice(i-cont+1) que correspondia � y se torna (i-cont).
                                
        cont = cont + 2;        %Elementos exclu�dos
    end
    
end

