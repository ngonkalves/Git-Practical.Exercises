Solution: double rebase
=========================================================
1) Make sure your HEAD is at local branch featureA

2) Rebase local branch featureA onto local branch featureB picking all local commits (C3)

3) Rebase again local branch featureA onto remote branch origin/featureA picking
    - previous commits from your local branch featureA (C3)
    - commit you want from branch featureB (C6)

4) There you go, you will have the C6 in your branch featureA