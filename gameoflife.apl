⍝ Game of Life
r ← (3 3 ⍴ ⍳ 9) ∊ 2 6 7 8 9
R ← ¯1 ⊖ ¯1 ⌽ 6 6 ↑ r
life←{⊃1 ⍵ ∨.∧ 3 4 = +/ +/ 1 0 ¯1 ∘.⊖ 1 0 ¯1 ⌽¨ ⊂⍵}
gen←{(life⍣⍵)⍺}
gens ← {((⍵+1) ⍴ ⊂⍺) gen¨ (⍳ ⍵+1)-1}
print ← {{'.⌹'[⍵+1]}¨⍵}
print¨ R gens 4
)OFF