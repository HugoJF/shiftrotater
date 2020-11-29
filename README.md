Modelagem
Um circuito barrel-shifter realiza o deslocamento ou a rotação (de até n − 1 bits) em um dado de n bits, usando apenas circuitos combinacionais, e pode ser implementado através de uma rede de log n nı́veis de n multiplexadores de 2 entradas. Para isso, deve-se implementar as arquiteturas das seguintes entidades pré-definidas:

Comportamental de mux1;
Estrutural de shifterrotater;
Entidade mux2
A operação desta entidade deve ser a mesma de um multiplexador de 2 entradas para 1 saída. Sempre que os sinais de entrada mudam de valor, a saída é atualizada.

A entidade mux2 é composta dos sinais de entrada "i0" e "i1" que representam os operandos; o sinal de entrada que representa a seleção da operação a ser aplicada nos operados é nomeado "sel"; o sinal de saída que representa o resultado da operação aplicada é nomeado "s".

A tabela verdade abaixo define o comportamento da entidade mux2:

Comportamento	Valor de "sel"
s = i0	0
s = i1	1
Entidade shifterrotater
Um circuito barrel-shifter realiza o deslocamento ou a rotação (de até n − 1 bits) em um dado de n bits, usando apenas circuitos combinacionais, e pode ser implementado através de uma rede de log n nı́veis de n multiplexadores de 2 entradas. Implemente, de forma estrutural, um barrel-shifter que realiza a rotação ou o deslocamento (de até 3 bits) para a esquerda em um dado de 4 bits, utilizando a entidade mux2 acima. Na operação de delocamento, são inseridos bits ’0’ no lado direito.

Caso o barrel-shifter realizasse somente a rotação, sua construção seria da forma mostrada na figura a seguir.

![construcao](https://i.imgur.com/rRfj6o0.png)

Comportamento da entidade:

Sempre que algum dos sinais de entrada muda de valor, calcula o sinal de saı́da.
Sinal de entrada desloc representa número de posições a rotacionar ou deslocar, de 0 a 3.
Sinal de entrada shift representa operação rotação ou deslocamento. Se shift = ’0’ então operação é rotação. Senão, se shift = ’1’ então operação é deslocamento.
Sinal de saı́da dout corresponde ao sinal de entrada din rotacionado ou deslocado.
A tabela verdade que descreve o comportamento da entidade é a seguinte:

![tabela](https://i.imgur.com/vli23jq.png)