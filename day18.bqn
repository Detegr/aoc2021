D←{
  𝕨𝕊⟨⟨l1,r1⟩,⟨l2,r2⟩⟩: (𝕨+1 D ⟨l1, r1⟩)∾𝕨+1 D ⟨l2,r2⟩ ;
  𝕨𝕊⟨⟨l1,r1⟩,r⟩: ((𝕨+1) D ⟨l1,r1⟩)∾𝕨 ;
  𝕨𝕊⟨l,⟨l2,r2⟩⟩: 𝕨∾(𝕨+1) D ⟨l2,r2⟩ ;
  𝕨𝕊⟨l,r⟩: ⟨𝕨,𝕨⟩
}

Preprocess←{
  𝕩↩•BQN "[]"{(𝕘⊏˜𝕗⊸⊐)⌾((𝕩∊𝕗)/○⥊⊢)𝕩}"⟨⟩" 𝕩
  depths←0 D 𝕩
  maxd←⌈´depths
  ⟨depths,∾⍟maxd 𝕩⟩
}

Explode ← {𝕊depths‿values:
  depths {3∾𝕩∾3}↩
  values {∞∾𝕩∾∞}↩
  i←⊑/≡⟜4‿4˘2↕depths
  m←(1-˜≠values)↑/⁼⋈i
  m2←m+(¯1⌽m)∨(1⌽m)
  sums←+´˘2↕values
  values (¬m∾0)⊸/↩
  depths (¬m∾0)⊸/↩
  depths -⟜1⌾(m⊸/)↩
  depths ↩ 1↓¯1↓depths
  r←1‿0‿1×m2/sums
  values↩(r⌾(m2⊸/) values)
  values↩1↓¯1↓values
  depths‿values
}

Split ← {𝕊depths‿values:
  i←⊑/¬(values≥10)⊒˜⋈1
  v←2÷˜i⊑values
  v↩⟨⌊v,⌈v⟩
  d←i⊑depths+1
  values↩∾v⌾(i⊸⊑) values
  depths↩∾⟨d,d⟩⌾(i⊸⊑) depths
  ⟨depths, values⟩
}

ReduceStep ← {𝕊depths‿values:
  e←0<+´≡⟜4‿4˘2↕depths
  s←2×+´¬(values≥10)⊒˜⋈1

  (e∨s)◶⊢‿Explode‿Split depths‿values
}

Reduce ← ReduceStep {𝕊∘⊢⍟≢⟜𝔽𝕩}

Add ← {⟨ad,av⟩𝕊⟨bd,bv⟩: Reduce ⟨(1+ad∾bd),av∾bv⟩ }

MagStep ← {𝕊⟨depths,values⟩:
  maxd←⌈´depths
  m←(maxd=depths)
  m2←(≠depths)↑/⁼(¬2|↕∘≠)⊸/∘/m
  vals←∘‿2⥊m/values
  vals↩{(3×(⊑𝕩))+2×(1⊑𝕩)}˘vals
  values↩vals⌾(m2⊸/) values
  m3←¬¯1⌽m2
  ⟨(m3/depths)-m3/m,m3/values⟩
}

Mag ← {𝕊: ⊑1⊑MagStep⍟(1+⌈´⊑𝕩) 𝕩 }

input ← Preprocess¨•FLines "inputs/input18"

# star 1
•Show Mag ¯1⊑Add`input

# star 2
•Show ⌈´⌈˝Mag¨˘Add´¨˘⋈⌜˜input
