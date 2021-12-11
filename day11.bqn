inp ← >-⟜'0'¨•FLines "input11"
Flash←{⍉(⊢+»+«)˘⍉(⊢+»+«)˘𝕩}

# star 1

# It feels wrong to have the total flash count variable
# out of the function, but so far it is the only way I can
# get the correct output and still use ⍟ to call Step
total←0

Step←{
  𝕩↩1+𝕩 # first, apply +1 for every item
  # flash map
  # keeps track of b that have happened in this step
  fm←10‿10⥊1
  {DoFlash:
    # flashes that are going to happen now
    # flash map is applied to filter out b that already happened
    f←(𝕩≥10)×fm

    fc←+´+˝f                        # flash count
    fm↩fm×¬f                        # update flash map
    total↩total+fc                  # update total count
    fc>0 ? DoFlash 𝕩+Flash f ; 𝕩×fm # process another round of flashes, if needed
  } 𝕩
}

Step⍟100 inp
•Show total

# star 2
i←0
{i↩i+1 ⋄ Step 𝕩}•_while_{(+´+˝𝕩)≠0} inp
•Show i
