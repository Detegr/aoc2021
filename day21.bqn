⟨p1p, p2p⟩←•BQN∘⋈∘(¯1⊸⊑)¨•FLines "inputs/input21"

Pos←{ 𝕩↩𝕩-1 ⋄ (10|𝕩)+×𝕩÷10 }
Roll←{ d←𝕩+↕3 ⋄ (+´d)‿(¯1⊑d) }
Advance ← {p‿s𝕊a:
  p↩Pos p+a
  p‿(s+p)
}
Step←{
  𝕊p1‿p2‿dice‿0: ⟨a,d⟩←Roll dice ⋄ (p1 Advance a)‿p2‿(d+1)‿1 ;
  𝕊p1‿p2‿dice‿1: ⟨a,d⟩←Roll dice ⋄ p1‿(p2 Advance a)‿(d+1)‿0
}

⟨p1,s1⟩‿⟨p2,s2⟩‿d‿·←Step•_while_{𝕊⟨·,s1⟩‿⟨·,s2⟩‿·‿·: (s1<1000) ∧ s2<1000} ⟨p1p‿0 ⋄ p2p‿0 ⋄ 1 ⋄ 0⟩

# star 1
•Show (d-1)×s1⌊s2
