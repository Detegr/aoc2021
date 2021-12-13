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
small←¬revisitable ∨ (n↑/⁼start‿end)

Search←{visited‿revisit_allowed𝕊𝕩:
  visited∨↩n↑/⁼⋈𝕩
  𝕩≠end ?
    a ← (Adjacent 𝕩)
    next ← a ∧ (¬visited) ∨ revisitable
    next_revisit ← a ∧ small ∧ visited ∧ revisit_allowed
    +´(visited‿revisit_allowed⊸Search¨/next)∾(visited‿0⊸Search¨/next_revisit)
  ; 1
}

# star 1
•Show (n↑0)‿0 Search start

# star 2
•Show (n↑0)‿1 Search start
