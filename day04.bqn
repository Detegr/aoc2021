# star 1

Split ← (⊢-˜+`×¬)∘=⊔⊢
RemoveTrailing ← (∨`∧∨⟜«)∘≠/⊢

data ← •FLines "inputs/input4"
numbers ← •BQN¨','Split⊑data
# Convert tables from input data to 3xmxn matrix
tables ← >>¨•BQN⚇1' '⊸Split∘(' '⊸RemoveTrailing)⚇1 1↓¨1↓((+`¬∘(0⊸≠(≠⊢)¨))⊔⊢) 1↓data
# All possible rows that are winning
winningrows ← ⥊{(<˘⍉𝕩)∾<˘𝕩}˘tables
# Prefixes of numbers (quite expensive, but whatever)
numberseq ← ↑numbers
i←0 ⋄ w ← 1⊑≢tables
# Iterate over number prefixes until a prefix matches a winning row
win←⊑{i↩i+1 ⋄ 𝕩↩/{w=(+´𝕩∊(i⊑numberseq))}¨winningrows}•_while_(≠=⟜0⊢) ⟨⟩
tableNumberCount ← +´1↓≢tables
# Dig out the table that won the bingo
wintable ← ⥊(⌊win÷tableNumberCount)⊏tables
# Table that won with used numbers removed
rest ← (¬∘∊⟜(i⊑numberseq)/⊢) wintable
# Calculate the final score
¯1⊑i⊑numberseq × +´rest

# star 2
i↩0
# calculate winning rows for every possible prefix of the number input
# again, horribly expensive but whatever
all ← {𝕩↩/{w=(+´𝕩∊(i⊑numberseq))}¨winningrows ⋄ i↩i+1 ⋄ 𝕩}¨numberseq
# The index of the round that had the last win
i ↩ ⊑/{(≠𝕩) = ⊑≢tables}¨⍷¨{⌊𝕩÷tableNumberCount}¨all
# The number that won
win ↩ ¯1⊑i⊑numberseq
# The winning table
wintable ↩ ⥊(⌊i÷tableNumberCount)⊏tables
# Table that won with used numbers removed
rest ↩ (¬∘∊⟜(i⊑numberseq)/⊢) wintable
# Calculate the final score
¯1⊑i⊑numberseq × +´rest
