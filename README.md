# assembly-pacman
A pacman game I made in 16 bit 80x86 assembly

I'm putting this here just in case anyone is interested in looking at something like this.

To compile and link, make sure you have the turbo assembler tools, TASM and TLINK.
Open DOSBOX and navigate to the directory where PROJF.ASM and the rest of the files are at.
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
