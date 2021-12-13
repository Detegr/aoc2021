# kudos to @dancek for the idea of how to solve this one
input ← •BQN∘{"⟨"∾𝕩∾"⟩"}∘•FChars "inputs/input6"
state ← 9↑≠¨⊔input
Step ← ⊑{+⟜𝕨⌾(6⊸⊑)𝕨«𝕩}⊢
# star 1
+´Step⍟80 state
# star 2
+´Step⍟256 state
