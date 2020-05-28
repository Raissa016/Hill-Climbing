# Hill-Climbing
> O objetivo é encontrar o máximo da função f(x,y) = |xsen(ypi/4) + ysen(xp/4)|
por meio do algoritmo hill-climbing. 

**_Descrição:_**

Com as variáveis x e y pertencentes ao intervalo entre 0 e 20. Os vizinhos de determinado
estado (x, y) são (x+-0.01 ; y+-0.01):

**_Implementação:_**

Na implementação fora criados os valores das variáveis de x e y dentro do intervalo
de 0 e 20 (com passo de 0.01). E com tais fora calculado o valor da equação (1.1) para cada
ponto (x,y). A região englobada pelo problema pode ser vista na Figura:

![](fig1.png)

O algoritmo fora implementado de modo a iniciar com um ponto (x,y) gerado
randomicamente. Logo, poderá ocorrer de o mesmo se deparar apenas com um máximo local.
Como forma de conferir se o algoritmo encontrou o ponto máximo para a FO, fora armazenados
todos os pontos ’considerados’ na execução e calculado o valor máximo que estes agregam a
equação da FO.

Ao concluir todas as instruções, a implementação retorna (na janela de comandos do
MATLAB) qual o ponto inicial, o ponto máximo encontrado, seus respectivos valores quando
aplicados na FO e a representação gráfica. A Figura a seguir ilustra o ponto máximo encontrado pelo
algoritmo.

![](fig2.png)

Inúmeros testes foram realizados a fim de analisar a solução, sendo notório em tal a
’dependência’ do resultado quanto à natureza randômica do ponto inicial. Encontrando portanto,
algumas vezes, apenas máximos locais e não o máximo global de f(x,y) (Máximo de aproximadamente 36.08).



# Identidade Visual
> Simples e intuitiva. 

**_Descrição:_**

A identidade visual do projeto foi pensada e elaborada seguindo os princípios do Material Design e Minimalismo. A expressão conhecida como "_less is more_" (menos é mais), sintetiza bem a essência do conceito empregado no projeto, uma tendência que aplica a maior simplicidade possível para passar a mensagem desejada. Assim o design do **SemioSoft** apresenta mais espaços em branco, uma tipografia simples e menos rebuscada, cores vibrantes e formas intuitivas. A ferramenta utilizada para elaboração do material visual fora o Adobe Illustrator, e sua aprovação foi baseada em elementos UX, englobando principalmente três pontos: a facilidade de uso, a sensação de poder e a satisfação de realizar cada tarefa. Com isso, almejamos que o usuário possa aprender de forma rápida e prática, com imagens, tabelas e interface de fácil interação.
