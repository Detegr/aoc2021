# 1
GetInput ← •BQN¨•FLines∘"input1.txt"
Inc ← +´·<´˘2↕⊢
Sums ← +´˘3↕⊢

# a
Inc GetInput @
# b
Inc Sums∘GetInput @
