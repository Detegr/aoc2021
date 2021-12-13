input ← •FLines "inputs/input10"
parens ← "([{<)]}>"
opening ← 4↑parens
closing ← 4↓parens
Opposing ← parens⊸(4⊸⌽∘⍷˜⊑∘/⊣)

# star 1
# idea: keep state of opening parenthesis in `o`
#       and put unmatching closing parenthesis in `c`.
#       take first of c for first unmatching parenthesis
points ← 3‿57‿1197‿25137
_Solve ← {
  o←⟨⟩ ⋄ c←⟨⟩
  {
    (⊑𝕩∊opening) ? o↩o∾𝕩;
    (Opposing ¯1⊑o)=𝕩 ? o↩⌽1↓⌽o ; c↩c∾𝕩
  }¨𝕩
  o 𝔽 c
}

•Show +´∾/⟜points¨⍷⟜closing¨1⊸↑¨⊢_Solve¨input

# star 2
# idea: the same algorithm modified so that
#       the return value is the opening parenthesis
#       that are not yet popped from `o`, reversed
#       and changed to opposing (closing) parenthesis

# Both work. The other one is cleaner in a way that there's no @ values
# in the resulting array, but huh it's a lot of symbols to do the same thing
# completions ← {(≠𝕩)=0 ? (Opposing¨⌽𝕨) ; @}_Solve¨input
completions ← Opposing¨∘⌽¨/˜⟜(0⊸≠∘≠¨⊢)·/˜⟜(0⊸=∘≠⊢)_Solve¨input
solutions←∧¯1⊑¨{𝕩+𝕨×5}`¨{1+⊑/⍷⟜(4↓parens)𝕩}¨¨(⊢/˜=¨)completions
•Show solutions⊑˜⌊(≠solutions)÷2
