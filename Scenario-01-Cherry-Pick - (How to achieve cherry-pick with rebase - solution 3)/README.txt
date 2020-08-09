Solution: reset hard and rebase onto temporary branch
=========================================================
1) Create a temporary local branch featureA-old.state on commit C3

2) Make sure your HEAD is at local branch featureA

2) Reset hard local branch featureA to commit C6 (the one we want to pick)

3) Rebase local featureA onto local featureA-old.state picking only commit C6

4) There you go, you will have the C6 in your branch featureA