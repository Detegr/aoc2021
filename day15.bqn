If ← {𝕏⍟𝕎@}´
input←•BQN∘⋈¨˘>•FLines "inputs/input15"

# generate 5x5 input
#input↩{𝕩≥10 ? (10|𝕩)+1 ; 𝕩}¨input↩∾input⊸+¨+⌜˜5⥊↕5

# Neighbors
N←(×∘≠⊢)¨⊸/·{𝕩/˜¬×+´𝕩>1-˜≢input}¨{
  0‿0: ⟨0‿1,1‿0⟩ ;
  x‿0: ⟨(x+1)‿0,(x-1)‿0, x‿1⟩ ;
  0‿y: ⟨0‿(y+1), 0‿(y-1), 1‿y⟩ ;
  x‿y: ⍷⟨
    (x-1)‿y
    (x+1)‿y
    x‿(y-1)
    x‿(y+1)
  ⟩
}

s←≢input

# tentative distances
u←0⌾(0‿0⊸⊑)s⥊∞

# matrix tracking if a node has been accessed
m←s⥊1

cur←0‿0   # current node
tgt←1-˜s  # target node
cs←⟨⟩     # set of candidate nodes

Step ← {𝕤
  neig←N cur              # neighbors
  neig↩(0≠neig⊑m)/neig    # take only unvisited neighbors
  If ((≠neig)>0)‿{𝕤
    cs↩neig∾cs            # update the set of unvisited neighbors
    u↩{𝕤
      i←neig⊑input
      c←cur⊑u
      {𝕊inp‿u: u⌊c+inp}˘⍉i≍𝕩
    }⌾(neig⊸⊑) u          # update u matrix with correct distance values
  }
  m ↩ 0⌾(cur⊸⊑) m         # update visit matrix
  cur ↩ cs⊑˜⊑⍋cs⊑u        # update current node, use the smallest distance value from cs
  cs↩((<cur)≢¨cs)/cs      # remove current node from cs
  tgt⊑u
}
risk ← Step∘@•_while_(=⟜∞) ∞
•Show risk
