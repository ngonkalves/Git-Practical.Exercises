
Steps:
1) Goto client2 and pull from remote using merge
2) Look at the log to see the created merge commit
3) Run clean.cmd
4) Run init.cmd
5) Goto client2 and pull from remote using rebase
6) Look at the log to see that merge commit was not created


Fetch - will update remote branch


Pull (merge) 
    - will update remote branch (fetch)
        - merge current branch into local branch (merge)
        - update working directory
    - additional merge commit


Pull (rebase) 
    - will update remote branch (fetch)
        - merge current branch into local branch (rebase)
        - update working directory
    - more clean, doesn't create