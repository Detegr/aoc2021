Bin2Dec←2⊸×⊸+˜´∘⌽
Pad←(⌽∘⍉⊢∾(⋈⊣)/˜1⊑≢∘⊢)⍟4
input←•FLines "inputs/input20"
e←'#'=⊑input
img←'#'=>2↓input
p←⊑e

Enhance ← {p¬↩ ⋄ ⊑⟜e¨(Bin2Dec⥊)⎉2 3‿3↕p Pad⍟2 𝕩}
Pixels←+´·+˝⊢

# star 1
•Show Pixels Enhance⍟2 img

# star 2
•Show Pixels Enhance⍟50 img
