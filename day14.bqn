input←•FLines "inputs/input14_small"

t←⊑input
rules←∧{(2↑𝕩)‿(¯1↑𝕩)}¨(2↓input)
pairs←⊑¨rules
# rules of insertions as coordinates to a matrix
coords←∧¨∾¨{pairs⊐⋈𝕩}⚇1<˘{(2↑𝕩)‿(1↓𝕩)}˘2⊸⌽∘⌽∘∾∘∾˘rules
Idx←⊑·pairs⊸⊐⋈

# matrix from coordinates representing states
m←>{(≠pairs)↑/⁼𝕩}¨coords

Solve ← {
  init←+˝⍷⟜pairs∘<˘2↕t
  counts←(+˝m⊸×)⍟𝕩 init
  chars←∨+´(⊐⊑¨pairs)⊔counts
  ⊑chars - (¯1⊑chars)
}

# star 1
•Show Solve 10

# star 2
•Show Solve 40
