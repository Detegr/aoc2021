input ← •FLines "input10"
parens ← "([{<)]}>"
Opening ← ⊑∘∊⟜(4↑parens)
Closing ← ¬∘Opening
Opposing ← {⊑(4⌽𝕩⍷parens)/parens}

# star 1
# idea: keep state of opening parenthesis in `o`
#       and put unmatcheng closing parenthesis in `c`.
#       take first of c for first unmatching parenthesis
points ← 3‿57‿1197‿25137
•Show +´∾{𝕊:
  o←⟨⟩
  c←⟨⟩
  {
    (Opening 𝕩) ? o↩o∾𝕩; {
      tgt←Opposing ¯1⊑o
      tgt=𝕩 ? o↩⌽1↓⌽o ; {
        c↩c∾𝕩
      }𝕩
    }𝕩
  }¨𝕩
  ∾/⟜points¨⍷⟜(4↓parens)¨⊑c⍟{≠c≥0} 0
}¨input

# star 2
# idea: the same algorithm modified so that
#       the return value is the opening parenthesis
#       that are not yet popped from `o`, reversed
#       and changed to opposing (closing) parenthesis
points↩1+↕4
completions←{𝕊:
  o←⟨⟩
  c←⟨⟩
  {
    (Opening 𝕩) ? o↩o∾𝕩; {
      tgt←Opposing ¯1⊑o
      tgt=𝕩 ? o↩⌽1↓⌽o ; {
        c↩c∾𝕩
      }𝕩
    }𝕩
  }¨𝕩
  (≠c)=0 ? (Opposing¨⌽o) ; @
}¨input

solutions←∧¯1⊑¨{𝕩+𝕨×5}`¨(1⊸+∘⊑∘/⍷⟜(4↓parens))¨¨(⊢/˜=¨)completions
•Show solutions⊑˜⌊(≠solutions)÷2
