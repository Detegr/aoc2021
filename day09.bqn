inp ← >1+-⟜'0'¨•FLines "inputs/input9"

# star 1
# Add filler elements on each side
filler ← 99¨⊏inp
finp ← filler∾inp∾filler
fillerv ← 99¨⊏⍉finp
finp ↩ ⍉fillerv∾(⍉finp)∾fillerv

# Calculate horizontal and vertical minimums using a
# sliding window of size 3
Min ← 1=⊑∘⍋
horiz←¯1↓1↓Min⎉1 3↕˘finp
vert←⍉¯1↓1↓Min⎉1 3↕˘⍉finp
mins ← (horiz ∧ vert)

•Show +´+˝inp×mins

# star 2
# uniquely number local minimums and add them to the input
mins ↩ (mins×(≢mins)⥊+`⥊mins)+10≠inp
# do a fill function 8 times (found by experiment, may not be enough for every input)
# rotating the matrix 90 degrees each turn
•Show ×´3↑∨≠¨inp⊔˜1-˜(⊑⊢◶⌊‿⌈⎊⌈)⌾⊢`∘⍉∘⌽⍟8 mins
