# SimplePascalParser
Parser generation to check the syntax of Pascal code.

## Table of contents:
* [Files description](Files-description)
* [Set up](Set-up)
* [Usage](Usage)
* [Credits](Credits)

## Files description:
- Makefile: self explanatory, the file for the make command;
- Pascal.g4: the file that contains the grammar that the parser will use;
- Syncheck.cpp: the file that use the parser to see if the Pascal code has one or more syntax errors;
- Test: directory that contains some tests.

## Set up:
You need to download ANTLR v4 from the official page (https://www.antlr.org/download.html) and the c++ runtime dev "libantlr4-runtime-dev" (https://packages.debian.org/sid/libantlr4-runtime-dev).

## Usage:
First use the command ```make``` (to reverse it use ```make clean```).
Then when all files are created, you can execute the syncheck output file and use a test file as argument
Example: 
```
./syncheck test/valid.pas
```
### Usage note:
If you try to use tests that you find in the ***test*** directory, it's normal that test from 5 to 8 output "***1 syntax error found***".

## Credits:
This is a little project I made as a test for my university ([Universita' Degli Studi di Padova](https://www.unipd.it/)), so part of the project is the foundation they gave me to build all.
