# star 1
×´2⊸×⊸+˜´∘⌽¨¬⌾(1⊸⊑)⋈˜(≠⊸÷⟜2<+˝)>'1'=•FLines "input3"

# star 2
# not happy with this solution :( yuck.
data ← >'1'=•FLines "input3"
While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´
Solve ← {𝕤
  bitpos ← 0
  data ← 𝕩
  o2 ← 𝕨
  While {𝕤⋄(≠data)>1}‿{𝕤
    takeZero←¬⍟o2 (≠⊸÷⟜2≤+˝) data
    mask←¬⍟(bitpos⊑takeZero) (bitpos⊏⍉data)
    data↩mask/data
    bitpos↩bitpos+1
  }
  data
}
FromBinary ← 2⊸×⊸+˜´∘⌽
×´FromBinary¨⥊∘Solve⟜data¨0‿1
