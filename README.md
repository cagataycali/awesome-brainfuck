<h3 align="center">
  <img style="" src="https://res.cloudinary.com/cagatayc/image/upload/c_scale,w_500/v1493914344/bf.png" alt="brainfuck" />
</h3>
<h6 align="center">
  Brainfuck is an <i>esoteric</i> programming language
</h4>

## :books: Historical Background

Brainfuck programming language created in 1993 by Urban Müller. In 1992, Urban Müller, a Swiss physics student, took over a small online archive for Amiga software. The archive grew more popular, and was soon mirrored around the world. Today, it is the world's largest Amiga archive, known as Aminet.

Müller designed Brainfuck with the goal of implementing it with the smallest possible compiler, inspired by the 1024-byte compiler for the FALSE programming language. Müller's original compiler was implemented in machine language and compiled to a binary with a size of 296 bytes. He uploaded the first Brainfuck compiler to Aminet in 1993\. The program came with a "Readme" file, which briefly described the language, and challenged the reader "**Who can program anything useful with it? :)**". Müller also included an interpreter and some quite elaborate examples. A second version of the compiler used only 240 bytes.

As Aminet grew, the compiler became popular among the Amiga community, and in time it was implemented for other platforms. Several brainfuck compilers have been made smaller than 200 bytes, and one is only 100 bytes.

## :books: Design Goals

Brainfuck is created for extreme minimalism. The aim of this programming language is to force and entertain programmers rather than being a general language.

## :books: Usage Areas

The use of brainfuck is the development of algorithmic approaches of programmers.

## :books: Typing Discipline

Typeless :+1: :100:

## :books: Paradigm

- Esoteric
- Imperative
- Structured

## :books: Memory system

tape-based

## :books: Dimensions

one-dimensional

## :books: Computational class

[Turing complete](https://esolangs.org/wiki/Category:Turing_complete)

## :books: File extension(s)

- .b
- .bf

## :books: Self-interpreters

Writing a self-interpreter in brainfuck is not a simple task, yet, several self-interpreters have been written throughout the years.

> You can find in self-interpreters directory.

- [by Frans Faase](http://www.iwriteiam.nl/Ha_bf_inter.html) - Perhaps the first one.
- [by Keymaker](http://www.brain------------------------------------------------------fuck.com/programs/kbfi.b) - Designed in the strictest 8-bit, non-wrapping, EOF = no change (EOF 0 works too) environment. The program emulates unbound cell size for cells (the program +[+] is valid and never ends) -- not really a brainfuck feature but it's there anyway -- and of course all the brainfuck programs written for the 8-bit non-wrapping environment work as supposed to. Supports infinite/unbound number of cells and nested loops.
- [by Daniel B Cristofani](http://www.hevanet.com/cristofd/brainfuck/dbfi.b) - The shortest; see also dbfi
- [by Clive Gifford](http://homepages.xnet.co.nz/~clive/eigenratios/cgbfi2.b) - The fastest
- [by Adam Domurad](https://github.com/ludamad/bf-self-interpreter) - Interprets Brainfuck code from the input until a %, then reads remaining input as input for the interpreted program. Comments are allowed, and up to 256-depth nested loops

  Also you can go deeper with these: Daniel B Cristofani's [implementation of a universal Turing machine in brainfuck](http://www.hevanet.com/cristofd/brainfuck/utm.b) provides a proof by turing simulation.

## :books: Thoughts

- **Great exercice for your brain**

  - If you ever succeed to use it at least once, whatever it does, you will never be afraid to learn any other programming language.

- **Very good introduction in geek communities**

  - Say you made a Brainfuck program once, and count how many geeks/nerds you will attract.

- **Designed to challenge and amuse programmers**

  - Rather than have a practical application, Brainfuck is an esoteric language for the purpose of challenging programmers who want to code in a more unusual language.

- **Esoteric language**

  - Brainfuck is by design extremely difficult to use. This makes it un-learnable to beginners.

- **Impractical language, used only as a toy**

  - It won't get you a job. It is not used in any practical application.

- **R-rated name**

  - It's difficult to talk about in polite company.

## :books: Language Design

The language consists of eight commands, listed below. A brainfuck program is a sequence of these commands, possibly interspersed with other characters (which are ignored). The commands are executed sequentially, with some exceptions: an instruction pointer begins at the first command, and each command it points to is executed, after which it normally moves forward to the next command. The program terminates when the instruction pointer moves past the last command.

The brainfuck language uses a simple machine model consisting of the program and instruction pointer, as well as an array of at least 30,000 byte cells initialized to zero; a movable data pointer (initialized to point to the leftmost byte of the array); and two streams of bytes for input and output (most often connected to a keyboard and a monitor respectively, and using the ASCII character encoding).

| Character 	| Meaning                                                                                                                                                                           	|
|-----------	|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| >         	| increment the data pointer (to point to the next cell to the right).                                                                                                              	|
| <         	| decrement the data pointer (to point to the next cell to the left).                                                                                                               	|
| +         	| increment (increase by one) the byte at the data pointer.                                                                                                                         	|
| -         	| decrement (decrease by one) the byte at the data pointer.                                                                                                                         	|
| .         	| output the byte at the data pointer.                                                                                                                                              	|
| ,         	| accept one byte of input, storing its value in the byte at the data pointer.                                                                                                      	|
| [         	| if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching ] command. 	|
| ]         	| if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching [ command. 	|

Brainfuck is an example of a so-called Turing tarpit: It can be used to write any program, but it is not practical to do so, because Brainfuck provides so little abstraction that the programs get very long or complicated.

> Brainfuck's formal "parent language" is [P''](https://en.wikipedia.org/wiki/P′′), in addition example [P''](https://en.wikipedia.org/wiki/P′′) program, Program for compute the predecessor (x-1) of an integer x > 0:

> ```p
> R ( R ) L ( r' ( L ( L ) ) r' L ) R r
> ```

> which translates directly to the equivalent brainfuck program:

> ```brainfuck
> [ > ] < [ −  [ < [ < ] ] −  < ] > +
> ```

## :books: Example usages

### :link: [Hello world](en.wikipedia.org/wiki/Brainfuck)

The following program prints "Hello World!" and a newline to the screen:

```brainfuck
++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.
```

Yet another cool hello world [example](/examples/hello-world.bf) with brainfuck by Robert de Bath

```brainfuck
[]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[]
[]>+>+>++>++<[>[->++++<<+++>]<<]>----.>->+.+++++++..+++.<+[]
[ This is hellbox, a 104 command Hello World               ]
[   >+>+>++>++<[>[->++++<<+++>]<<]>----.>>+.+++++++..+++   ]
[   .>.<<<+++++++++++++++.>>.+++.------.--------.>+.>++.   ]
[ -- Çağatay Çalı -- 2017                                ]
[]>>.<<<+++++++++++++++.>>.+++.------.--------.>+.+>++.<<<[]
[]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[][]><[]
```

#### :link: [Fibonacci Sequence](https://gist.github.com/SBareS/e557b1ce71fb6c1d6c3d/revisions)

[example](/examples/fibonacci.bf)

```brainfuck
>+[[->+>+<<]>>[-<<+>>]<<<[->>+>+<<<]>>>[-<<<+>>>]<]
```

#### :eyes: [Pseudo Random Number Generator](https://github.com/pablojorge/brainfuck/blob/master/programs/random.bf)

There is no way to generate pseudorandoms without seed

[example](/examples/random.bf)

```brainfuck
>>>++[
    <+++++++++[
        <[<++>-]>>[>>]+>>+[
            -[->>+<<<[<[<<]<+>]>[>[>>]]]
            <[>>[-]]>[>[-<<]>[<+<]]+<<
        ]<[>+<-]>>-
    ]<.[-]>>
]
```

#### :key: [Caesar cipher](https://gist.github.com/shahar96/1215cd1408328d8c5b88)

[example](/examples/caesar.bf)

```brainfuck
>>>,[>>,]<++++++++++++[->++>+++++>+++++++>++++++++>++++++++>++++++++++>++++++++++<<<<<<<]>->+++++>++++>----->+>>+++[<]<[>>[>]+[<]<[->+<]>[<+[>]>+<<[<]>>-]++[>]<<[>>>>+>+<<<<<-]>>>>>[-<<<<<+>>>>>]<<[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<[<]>>-[>]]<[<]>>-[-<[->+<]>[<+[>]>>+<<<[<]>>-]++[>]+<<[>>>>>+>+<<<<<<-]>>>>>>[-<<<<<<+>>>>>>]<<[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<<<<<<<[>>>>>>>+>+<<<<<<<<-]>>>>>>>>[-<<<<<<<<+>>>>>>>>][>]<[[<]>-[>]<-]<[<]>>-[>]]<[<]>>-[-<[->+<]>[<+[>]>>+<<<[<]>>-]++[>]<<<[>>>+>>>+<<<<<<-]>>>[<<<+>>>-]+>>[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<[<]>+++>-[>]]<[<]>>-[-<[->+<]>[<+[>]>>+<<<[<]>>-]++[>]<<<<[>>>>+>>>+<<<<<<<-]>>>>[<<<<+>>>>-]+>>[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<[<]>>-[>]]<[<]>>-[-<[->+<]>[<+[>]>>+<<<[<]>>-]++[>]<<<<<[>>>>>+>>>+<<<<<<<<-]>>>>>[<<<<<+>>>>>-]+>>[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<<<<<<<[>>>>>>>+>+<<<<<<<<-]>>>>>>>>[-<<<<<<<<+>>>>>>>>][>]<[[<]>-[>]<-]<[<]>>-[>]]<[<]>>-[-<[->+<]>[<+[>]>>+<<<[<]>>-]++[>]<<<<<<[>>>>>>+>>>+<<<<<<<<<-]>>>>>>[<<<<<<+>>>>>>-]+>>[->-[>]<<]<[>>[-]<<+>]>>[-]<<<-[-<[<]>+++>-[>]]<[<]>>[-]][-]][-]][-]][-]][-]+<<<]>>[.>-[>[-]<]>]
```

#### :bomb: [Fork Bomb](https://en.wikipedia.org/wiki/Fork_bomb)

* [Explanation](https://codegolf.stackexchange.com/revisions/24568/4)
* [example](/examples/fork-bomb.bf)
* Proper one can be made using BrainFork

```brainfuck
+[>+]
```

#### :beer: [Bubble Sort](/examples/bubble-sort.bf)

This program sorts the bytes of its input by bubble sort.

#### :beer: [Insertion Sort](/examples/insertion-sort.bf)

This program sorts bytes of input using insertion sort.

#### :gem: [Brainfuck web app (HTTP Server)](/examples/brainfuck-web-app)

[Working demo with backend brainfuck :)](https://brainfuck.cagatay.me)

More examples below,

- [Brainfuck.com](http://www.brain------------------------------------------------------fuck.com/programs.html)
- [Brainfuck.org](brainfuck.org)
- [Brainfuck Experiments](https://github.com/pablojorge/brainfuck)

You can try brainfuck online, [Brainfuck-visualizer](http://fatiherikli.github.io/brainfuck-visualizer/)

# Sources

- [Esolangs](https://esolangs.org/wiki/Brainfuck)
- [Wikipedia](https://en.wikipedia.org/wiki/Brainfuck)
- [GitHub](https://github.com)

Learn [brainfuck](http://cydathria.com/bf/bf_ex1.html), be cool.
