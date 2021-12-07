input ← •BQN∘{"⟨"∾𝕩∾"⟩"}∘•FChars "input7"
inputRange ← (⌊´↓·↕(1+⌈´∘⊢)) input
# star 1
⌊´+´¨{𝕩⊸(|-)¨input}¨inputRange
# star 2
⌊´+´¨{𝕩⊸((0.5⊸××+⟜1)∘|-)¨input}¨inputRange
