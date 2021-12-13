# Preprocessing
Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input ← •FLines "input13"
⟨points, folds⟩←(+`0⊸=≠¨input)⊔input
points↩⌽¨{•BQN"⟨"∾𝕩∾"⟩"}¨points
folds↩{(¯1⊑⊑𝕩)∾1⊑𝕩}¨'='Split¨1↓folds

grid←0⥊˜1+⌈´points
grid↩1¨⌾(points⊸⊑) grid

Fold←{𝕊:
  axis←⊑𝕨
  v←•BQN 1↓𝕨

  # Rotate matrix 90 degrees if axis is y
  F←(axis="y")◶⍉‿⊢

  # Calculate the two halves
  # I guess this breaks if the latter part
  # of the fold is smaller than the first,
  # but doesn't look like that in my input...
  fst←v↑F𝕩
  snd←(v+1)↓F𝕩
  smax←fst⌈○≢snd

  >⟜0¨F fst+⌽(smax↑snd)
}

# star 1
•Show +´+˝(⊑folds) Fold grid

# star 2
{grid↩𝕩 Fold grid}¨folds
•Show ⊏⟜" █"˘grid
