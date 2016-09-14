# Dev-Talks - Linguagem Assembly

## Linguagem de montagem

- programar em Assembly é escrever um código que é diretamente entendido pelo hardware.

- Assembly é uma linguagem de montagem

- Assembly é a língua que usamos para falar com os mais diversos tipos de hardwares, como os microprocessadores e microcontroladores.

- Por ser pouco legível para humanos, e rodar muito próxima à Machine Language, Assembly é uma linguagem de baixo nível.

![low level programming](http://image.slidesharecdn.com/chapter3instructionsetandassemblylanguageprogramming-140818225422-phpapp01/95/chapter-3-instruction-set-and-assembly-language-programming-6-638.jpg?cb=1408402702)

## Começando

- Em níveis mais baixos, a máquina só entende os bits: valores lógicos 1 ou 0 (chamado código de máquina)

- Programar escrevendo em binário ou no sistema hexadecimal -> complicado e confuso, com chances de erro.

- Utilizando Assembly: é conjunto de notação (ou símbolos, conhecidos por mnemônicos) que os humanos entendem. É a linguagem de máquina.

- Assim, em vez de 1's e 0's, escrevemos comandos (**ADD** de adicionar, **MOV** de mover, por exemplo)

## Desvantagens

- Complexidade dos programas em Assembly

- Configurações específicas para programar em Assembly

- Baixa produtividade do programador Assembly

- Assembly é uma linguagem crua e com poucos ‘recursos’

- Difícil manutenção de código Assembly

## Vantagens

- Assembly é eficiente

- muito usada em situações críticas, como em alguns trechos da construção de sistemas operacionais, como o Linux (em sua grande parte é feito em C, mas em algumas partes é necessário usar Assembly).

- Assembly é rápido

- exige menos memória

- dá acesso direto ao hardware

- Os programas em Assembly são menores

- Segurança no Assembly: uma faca de dois gumes

- serve para aprender como as coisas funcionam

## Arquiteturas

- Existem hardwares diferentes, com arquiteturas diferentes

- Como Assembly fala com a máquina, para estruturas de hardware diferente, Assembly diferente.

- é preciso entender como seu computador funciona, como sua memória está organizada, os registros que possui, as instruções disponíveis, dentre outros detalhes.

- [Lista dos Microprocessadores da Intel](https://en.wikipedia.org/wiki/List_of_Intel_microprocessors)

## IA-32 (Intel Architecture 32-bit)
- Embora os primeiros microprocessadores da Intel de 32 bits, tenham quase 30 anos, seu ‘jeitão’ continua o mesmo, e amplamente usado.

- Esses conjuntos de instruções de diversos processadores diferentes obedecem a um conjunto de instruções da mesma arquitetura, que são conhecidos como x86-32, i386 ou simplesmente x86.

## Opcode (operation code) e mnemônicos

### Opcode

- As instruções são definidas em hexadecimal, a soma por exemplo é **83060F000A**

- Para não precisar decorar isso, usamos os mnemônicos

### Mnemônicos

- Assembly possui palavras reservadas chamadas `mnemônicos`, que servem para o humano programar com maior facilidade, sem ter que usar números o tempo inteiro.

- Para tratar operações de adição, utilizamos o **ADD** que é um link para a instrução de soma **83060F000A**

## Assembler

- Assembler é o "compilador" da linguagem Assembly, na verdade é o Montador.

- Substitui todos os comandos utilizados para um bloco de binário (objeto).

- Depois disso, utilizamos o **Linker** para gerar um executável deste objeto (.EXE)

- Grande maioria das linguagens utiliza esta forma de compilação.

### Programação em microcontroladores

![imagem1](http://cdn.mikroe.com/ebooks/sites/3/2016/01/25103659/pic-microcontrollers-programming-in-c-chapter-02-image-4.gif)

### Código C compilado para Assembly

![compilacao2](http://www.barrgroup.com/images/glossary/C_compiler.gif)

### Linker utilizado para gerar executável

![compilacao1](https://www.dartmouth.edu/~rc/classes/softdev_linux/Images/simple_compile.gif)

## Compilando Assembly no Mac

No Mac utilizamos o formato **Mach-O** 

Montando o arquivo `hello.asm` para um arquivo objeto

```
$ nasm -f macho hello.asm
```

Link do arquivo objeto para produzir o executável hello.  Este passo é estranho porque geralmente o link server para linkar vários arquivos e bibliotecas, e aqui só temos um.

```
$ ld -o hello -e mystart hello.o
```

Rodar o executável gerado

```
$ ./hello
hello, world
```

Ainda é possível checar o exit status no Bash

```
$ echo $?
0
```

## Programando em Assembly

### Label

- Nomeia uma porção de linhas de código, e permite a reutilização

- Para executar as linhas contidas em uma label, basta escrever o nome da label

```
label:
    ;aqui vem o código
    ;que vai ser nomeado
    ;de 'label'
```

### Section ou Segment

Serve para particionar seu código em várias seções

`section .nomeDaSecao`

Geralmente no Assembly utilizamos 3 seções:

```
section .dat
  ;declaração e inicialização de dados
 
section .bss
  ;declaração sem inicialização das informações que serão usadas
 
section .text
  ;o programa começa a rodar aqui, a partir da _start
```

### Section start

Para quem já usou C, C++ ou Java, a `_start` seria o `main()`

```
global _start
 
_start:
  ;o programa começa a rodar aqui, a partir daqui
```

### DEFINE

Utilizamos a instrução DEFINE para alocar memória e inicializar com um valor

| Tipo | Descrição         |  Tamanho alocado | Exemplo |
|------|-------------------|------------------|---------|
| DB   | Define Byte       | 1 byte           | `01010010`        |
| DW   | Define Word       | 2 bytes          | `01010010 01010010`        |
| DD   | Define Doubleword | 4 bytes          | `01010010 01110101 01010010 01110101` |
| DQ   | Define Quadword   | 8 bytes          | `01010010 01010010 01110101 01010010 01010010 01010010 01110101 01010010` |
| DT   | Define Ten        | 10 bytes         | `01010010 01110101 11011010 11011010 11011010 01110101 11111001 01010010 01010010 01010010` |

Exemplos:

Aloca a letra A na variável letra1

```
letra1  DB 'A'
```

Na tabela ASCII o valor de 'A', em hexadecimal é **41**

```
letra1  DB 41H
```

Em binário é **01000001**

```
letra1  DB 01000001B
```

### RESERVE

Similar ao DEFINE, mas apenas alocamos memória, não inicializamos com valor

| Tipo   | Descrição          | Tamanho alocado  |
|--------|--------------------|------------------|
| RESB   | Reserve Byte       | 1 byte           |
| RESW   | Reserve Word       | 2 bytes          |
| RESD   | Reserve Doubleword | 4 bytes          |
| RESQ   | Reserve Quadword   | 8 bytes          |
| REST   | Reserve Ten        | 10 bytes         |

Exemplos:

```
variavel1  RESB  1     ; nesse caso, reservamos apenas 1 byte
variavel2  RESB  2     ; aqui, reservamos 2 bytes
variavel3  RESW  3     ; 3 palavras são reservadas, o que nos dá 3*2 = 6 bytes
variavel4  REST  10    ; reservamos 10 unidades, de 10 bytes cada
```

### TIMES

Multiplica quantas vezes deseja alocar o tipo escolhido

Sintaxe:

```
nomeDoBloco       TIMES    numeroDeVezes    diretivaDEFINE    valorInicial
```

Variável vetor com 10 elementos do tipo Byte com o valor inicial de 0:

```
vetor       TIMES    10    DB    0
```

Variável array com 20 elementos do tipo Word com o valor inicial de FFH:

```
array       TIMES    20    DW    FFH
```

### Espaços contíguos de memória

Os blocos na memória são alocados lado a lado, contíguos, como vizinhos.

## Instruções básicas do Assembly

As instruções básicas matemáticas e de movimentação de memória

```
INC COUNT        ; Increment the memory variable COUNT

MOV TOTAL, 48    ; Transfer the value 48 in the 
                 ; memory variable TOTAL
					  
ADD AH, BH       ; Add the content of the 
                 ; BH register into the AH register
					  
AND MASK1, 128   ; Perform AND operation on the 
                 ; variable MASK1 and 128
					  
ADD MARKS, 10    ; Add 10 to the variable MARKS
MOV AL, 10       ; Transfer the value 10 to the AL register
```

[Registradores](https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm)

