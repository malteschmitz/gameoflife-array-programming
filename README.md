Conway's Game of Life
=====================

[Conway's game of life][GoL] written in [APL][APL]. The main line of the code is taken from Dyalogs [video][video] and [interactive demo][demo]:

    life←{⊃1 ⍵ ∨.∧ 3 4 = +/ +/ 1 0 ¯1 ∘.⊖ 1 0 ¯1 ⌽¨ ⊂⍵}

The shell script `gameoflife` starts [GNU APL][GNU APL] with the code. Make sure to use GNU APL ≥ 1.5 which supports the power operator `⍣`.

For comparison the same algorithm was implemented in [Matlab][Matlab] and [Qube][Qube] as well. The script `gameoflife.m` can be run using [GNU Octave][Octave] and `gameoflife.q` using the Qube compiler (not currently available).

[GoL]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[APL]: https://en.wikipedia.org/wiki/APL_(programming_language)
[video]: https://youtu.be/a9xAKttWgP4
[demo]: http://tryapl.org
[GNU APL]: https://www.gnu.org/software/apl/
[Matlab]: https://de.wikipedia.org/wiki/Matlab
[Octave]: http://www.gnu.org/software/octave/
[Qube]: http://www.zhb.uni-luebeck.de/epubs/ediss1099.pdf
