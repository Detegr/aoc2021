# star 1
Words ← ' '⊸((⊢-˜+`×¬)∘=⊔⊢)
Process ← {
  ⟨"forward",x⟩: ⟨•BQN x,0⟩ ;
  ⟨"down",x⟩   : ⟨0,•BQN x⟩ ;
  ⟨"up",x⟩     : ⟨0,(•BQN x)×¯1⟩
}

×´+´Process¨Words¨•FLines "input2"

# star 2
ProcessWithAim ← {
  ⟨"forward",x⟩: ⟨•BQN x,0,0⟩ ;
  ⟨"down",x⟩   : ⟨0,0,•BQN x⟩ ;
  ⟨"up",x⟩     : ⟨0,0,(•BQN x)×¯1⟩
}
×´2↑{𝕩+𝕨+⟨0,2⊑𝕨×⊑𝕩,0⟩}´ProcessWithAim¨Words¨•FLines "input2"
