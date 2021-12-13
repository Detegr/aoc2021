GetInput ← •BQN¨•FLines∘"inputs/input1"
Inc ← +´·<´˘2↕⊢
Sums ← +´˘3↕⊢

# star 1
Inc GetInput @
# star 2
Inc Sums∘GetInput @
