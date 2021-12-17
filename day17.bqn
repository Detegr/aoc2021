Step←{vx‿vy𝕊x‿y: ⟨(0⌈vx-1)‿(vy-1) ⋄ (x+vx)‿(y+vy)⟩}

In←{⟨xa‿xb,ya‿yb⟩𝕊x‿y:
  (x≥xa) ∧ (x≤xb) ∧ (y≥ya) ∧ (y≤yb)
}

Past←{⟨xa‿xb,ya‿yb⟩𝕊x‿y:
  (x>xb) ∨ (y<ya)
}

Simulate←{
  tgt ← ⟨269‿292,¯68‿¯44⟩
  coords ← ⟨𝕩,0‿0⟩
  maxy←1⊑1⊑coords
  coords ↩ {𝕤
    next←Step´𝕩
    maxy↩maxy⌈1⊑1⊑next
    next
  }•_while_{𝕤⋄¬(tgt In 1⊑𝕩)∨(tgt Past 1⊑𝕩)} coords
  (maxy∨𝕨)×(tgt In 1⊑coords)
}

# large enough search space
# slow and lazy, but whatever
choices ← ∾<˘∾⌜˜¯300+↕600

# star 1
•Show ⌈´0⊸Simulate¨choices

# star 2
•Show +´0≠1⊸Simulate¨choices
