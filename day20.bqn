Bin2Dec←2⊸×⊸+˜´∘⌽
# TODO: world's ugliest padding function
Pad←⌽∘⍉∘⌽{𝕨{p←(1⊑≢𝕩)/⋈𝕨 ⋄ p∾p∾⌽p∾p∾𝕩}⍉(𝕨{p←(≠𝕩)/⋈𝕨 ⋄ p∾p∾⌽p∾p∾𝕩}𝕩)}
input←•FLines "inputs/input20"
e←'#'=⊑input
img←'#'=>2↓input
p←⊑e

Enhance ← {p¬↩ ⋄ ⊑⟜e¨(Bin2Dec⥊)⎉2 3‿3↕p Pad 𝕩}
Pixels←+´·+˝⊢

# star 1
•Show Pixels Enhance⍟2 img

# star 2
•Show Pixels Enhance⍟50 img
