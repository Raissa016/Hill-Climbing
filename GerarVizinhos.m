%% VIZINHOS

%   Os vizinhos de determinado estado (x, y) são (x ± 0,01, y ± 0,01).

function [ vizinhos ] = GerarVizinhos( x, y )

%Gera um vetor 1x8 contendo os quatro vizinhos do ponto (x, y)
%Onde os elementos 1,3,5 e 7 são valores de x, e 2,4,6,e 8 de y.
 
%vizinhos = [   x1     y1     x2    y2     x3     y3     x4      y4  ]
 vizinhos = [ x+0.01 y+0.01 x-0.01 y-0.01 x-0.01 y+0.01 x+0.01 y-0.01];

end

