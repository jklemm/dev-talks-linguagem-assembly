# Dev-Talks - Linguagem Assembly

## Linguagem de montagem

- programar em Assembly é escrever um código que é diretamente entendido pelo hardware.

- Assembly é uma linguagem de montagem

- Assembly é a língua que usamos para falar com os mais diversos tipos de hardwares, como os microprocessadores e microcontroladores.

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

## Instruções Assembly

### Section

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

### MOV

Movimenta Destino, Origem

### ADD



### SUB

