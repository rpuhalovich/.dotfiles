# Prunes all remote branches that don't exist anymore
`git fetch -p`

# removes tracking of all items in repository
`git rm --cached -r .`

# Cleans the repo of all untracked files and directories
Other helpful flags
-i - interactive
-d - directories too
-x - ignored files
`git clean -fd`

# Sets new git repo remote
`git remote set-url origin new.git.url/here`

# Reverts a commit. Pretty sure you can use a hash range here too
`git revert COMMIT-HASH`

# reset single commit while keeping changes unstaged
`git reset --mixed head~1`
