b←{𝕩+48+@}¨⟨0‿0‿0‿0,0‿0‿0‿1,0‿0‿1‿0,0‿0‿1‿1,0‿1‿0‿0,0‿1‿0‿1,0‿1‿1‿0,0‿1‿1‿1,1‿0‿0‿0,1‿0‿0‿1,1‿0‿1‿0,1‿0‿1‿1,1‿1‿0‿0,1‿1‿0‿1,1‿1‿1‿0,1‿1‿1‿1⟩
c←"0123456789ABCDEF"
BS←{∾⊑⟜b¨∾⥊¨c⊸⊐¨𝕩}
Bin2Dec←2⊸×⊸+˜´∘⌽∘-⟜'0'⊢
Data←<˘·↑‿5⊸⥊⊢
Type←Bin2Dec·3⊸↑∘(3⊸↓)⊢
While←{𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

input ← ¯1↓•FChars "inputs/input16"

Z←↑⋈↓

# ugly :(
versioncount←0

Header ← {𝕊𝕩:
  v←t←p←𝕩
  ⟨v,p⟩↩(3 Z p)
  ⟨t,p⟩↩(3 Z p)
  versioncount+↩Bin2Dec v # hurts
  ⟨Bin2Dec v,Bin2Dec t,p⟩
}

Lit ← {𝕊𝕩:
  ⟨v,t,p⟩←Header 𝕩
  d←Data p
  vals←(1⊸↓)¨(1+⊑/'0'=⊑¨d)↑d
  rest←((≠vals)×5)↓p
  rest↩⟨⟩⍟{𝕤 ⋄ (≠𝕩)<11}rest
  ⟨⟨v,t,⋈Bin2Dec∾vals⟩,rest⟩
}

Op ← {𝕊𝕩:
  l←len←0
  ⟨v,t,p⟩←Header 𝕩
  ⟨l,p⟩↩1 Z p
  r←⟨⟩
  {l≡"0" ? {
    ⟨len,p⟩↩15 Z p
    len Bin2Dec↩
    c←(≠p)-len
    While { 𝕤 ⋄ (≠p)>c }‿{𝕤
      sub←@
      ⟨sub,p⟩↩(Type Parse ⊢) p
      r∾↩⋈sub
    }
  }; {
    ⟨len,p⟩↩11 Z p
    len Bin2Dec↩
    {𝕤
      sub←@
      ⟨sub,p⟩↩(Type Parse ⊢) p
      r∾↩⋈sub
    }⍟len @
  }}
  ⟨⟨v,t,r⟩,p⟩
}

Parse←{(𝕨=4)◶Op‿Lit 𝕩}
ParseAll←{𝕊:
  t←Bin2Dec 3↑3↓𝕩
  ⊑t Parse 𝕩
}

parsed←ParseAll∘BS input

# star 1
•Show versioncount

# star 2
•Show ⊑{⟨v,t,sub⟩: (t≠4)◶⊢‿((t⊑+‿×‿⌊‿⌈‿@‿>‿<‿=)´𝕊¨) sub} parsed
