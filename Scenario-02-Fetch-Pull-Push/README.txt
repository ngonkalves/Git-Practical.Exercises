Pull - Merge
======================================================================
# pull is configured for merge in .git/config file
[pull]
	rebase = false

1) goto repository client2-pull-merge
2) do a pull
3) view log to see the automatically created merge commit


Pull - Rebase
======================================================================
# pull is configured for rebase in .git/config file
[pull]
	rebase = true

1) goto repository client2-pull-rebase
2) do a pull
3) view log to see there's no merge commit which end up being much more clean