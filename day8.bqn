Split ← (⊢-˜+`×¬)∘=⊔⊢
inp ← >(1⊸↓⌾(1⊸⊑))¨' 'Split⚇1'|' Split¨•FLines "input8"

# star 1
•Show +´2‿3‿4‿7∊˜∾≠⚇1 1⊏˘inp

# star 2
Numbers ← {𝕊:
  inp ← ⊑𝕩
  Digits ← {(𝕩=≠¨inp)/inp}
  SegmentCount ← {+´⚇1∊⟜𝕨¨𝕩}
  In ← ⊢⊑˜⟜/≠∘⊣=SegmentCount
  eight ← ⊑Digits 7
  sixlong ← Digits 6
  four ← ⊑Digits 4
  seven ← ⊑Digits 3
  one ← ⊑Digits 2
  nine ← four In sixlong
  six ← ⊑(/1=one SegmentCount sixlong)⊏sixlong
  zero ← ⊑¬∘(six⊸≡∨≡⟜nine)¨⊸/sixlong
  fivelong ← Digits 5
  three ← one In fivelong
  five ← ⊑fivelong/˜5=six SegmentCount fivelong
  two ← ⊑¬∘(five⊸≡∨≡⟜three)¨⊸/fivelong

  ∧¨zero‿one‿two‿three‿four‿five‿six‿seven‿eight‿nine
}

•Show +´10⊸×⊸+˜´∘⌽˘{(∧¨𝕨)⊸⊐∧¨𝕩}´˘⍉(<∘Numbers˘inp)≍1⊏˘inp
