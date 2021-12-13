Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input←'-'Split¨•FLines "input12"
Big←⊑∊⟜('A'+↕26)
names←⍷∾input
revisitable←Big¨names
nodes←⊐names
n←≠nodes
adj←names⊸⊐¨input
start ← ⊑/"start"⊸≡⚇1 names
end ← ⊑/"end"⊸≡⚇1 names
Adjacent ← n⊸↑·/⁼∘∧⍷∘(⊢(≠/⊢)·∾adj/˜{⊑¨𝕩∊¨adj})

Search←{𝕊:
  𝕨∨↩(n↑/⁼⋈𝕩)
  𝕩≠end ?
    next ← /(Adjacent 𝕩) ∧ (¬𝕨) ∨ revisitable
    +´𝕨⊸Search¨next
  ; 1
}

# star 1
•Show (n↑0) Search start
# star 2
# TODO
