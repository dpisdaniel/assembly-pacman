# assembly-pacman
A pacman game I made in 16 bit 80x86 assembly

This was my first project ever (yes my first project was in 16 bit assembly and it was just a few years ago).

I'm putting this here just in case anyone is interested in looking at something like this.
The code itself is AWFUL and could probably be 3 times shorter (if not more).
Even though everything about this project is terrible, I'm still proud of the end result.
I look back at this project as one of the most fun projects I've made.

To compile and link, make sure you have the turbo assembler tools, TASM and TLINK.
Go to DOSBOX and navigate to the directory where PROJF.ASM and the rest of the files are at.
To compile:
```bash
tasm projf.asm
```
To then link:
```bash
tlink projf.obj
```

If you want to add debugging options add the /zi flag to tasm and /v to tlink.
Enjoy!