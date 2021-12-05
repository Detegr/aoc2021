Split ← (⊢-˜+`×¬)∘=⊔⊢
data ← >•BQN⚇1','⊸Split⚇1 1‿0‿1⊸/¨' ' Split¨•Flines "input5"
Laminate ← {
  ⟨⟨x⟩, y⟩: <(x≍⌜y);
  ⟨y, ⟨x⟩⟩: <(y≍⌜x);
  ⟨x, y⟩: <0¨∘≢⊸⍉≍⌜´⟨x,y⟩
}
Nums ← (⊣+↕∘¬˜)

# star 1
Horiz ← (=´⊑¨)˘/⊢
Vert ← (=´1⊸⊑¨)˘/⊢
Valid ← Horiz ∾ Vert
Ranges ← >◶Nums‿(⌽∘Nums˜)´¨0‿0‿1‿1⊸⊔∘⥊∘⍉∘>˘
≠(1=⊒)⊸/∾Laminate˘Ranges∘Valid data

# star 2
≠(1=⊒)⊸/∾Laminate˘Ranges data
