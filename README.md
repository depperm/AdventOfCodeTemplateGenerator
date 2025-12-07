# Advent Of Code Template Generator

This is meant to create advent of code templates for a lot of languages. This was developed on Windows, there may be other changes on other OSes

## Options

```
-l <language> (language of advent challenge or alpha if you want a real challenge, default python)
-d ## (day of advent challenge, default today OR all)
-y #### (year of advent challenge, default current year)
```

## Example Usage

`python generate.py -l go -y 2018 -d 23`

### Description

#### Day
If you want to go day by day it will default to the current day, or you can specify which date. If you only want to do one language for Advent of Code (like a normal person) specify all like `-d all`

#### Language
The available languages are listed below. Those that are checked have a template.

The 'alpha' language option will generate 25 templates of alphabetical language for the year option*. If a language is defined a folder for the day will be generated with empty input files, template script, and a util script. If alpha is used it will ignore any day options specified.

*As I won't get templates for 25+ languages, it will generate repeating sets of alphabetical templates until there are 25

### Templates
- [X] ABS
- [X] Ballerina
- [ ] Crystal
- [ ] D
- [ ] Elixir
- [ ] Fortran
- [ ] FreeBasic
- [X] Go
- [ ] Haskell
- [ ] Icon
- [X] Javascript
- [X] Julia
- [ ] Kotlin
- [x] Lua
- [ ] Mathematica
- [X] Nim
- [ ] Ocaml
- [ ] Odin
- [X] Perl
- [ ] Phix
- [X] Python
- [ ] R
- [ ] Racket
- ~~[ ] Raku~~ (failed to get raku to work, got rakubrew)
- [ ] Ruby
- [ ] Scala
- [ ] Swift
- [X] Tcl
- [ ] Unix
- [X] V
- [X] Wren
- [ ] XBasic
- [ ] YaBasic
- ~~[ ] Zig~~ (failed to get to work on Windows)
- ~~[ ] Zkl~~ (failed to get figure out how to run from src)