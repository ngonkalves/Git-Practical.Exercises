Solution: double rebase with temporary branch
=========================================================
1) Create a temporary local branch featureA-old.state on commit C3

2) Make sure your HEAD is at local branch featureA

2) Rebase local branch featureA onto local branch featureB skipping all local commits

3) Rebase again local branch featureA onto local branch featureA-old.state picking the commit you want C6

4) There you go, you will have the C6 in your branch featureA