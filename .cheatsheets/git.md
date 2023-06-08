`git clean -fd`: Cleans the repo of all untracked files and directories
  -i - interactive
  -d - directories too
  -x - ignored files

`git remote set-url origin new.git.url/here`: Sets new git repo remote
`git revert COMMIT-HASH`: Reverts a commit. Pretty sure you can use a hash range here too
`git reset --mixed head~1`: reset single commit while keeping changes unstaged
`git credential-osxkeychain erase`: erase personal access token on macos
`git fetch -p`: Prunes all remote branches that don't exist anymore
`git rm --cached -r .`: removes tracking of all items in repository

# vimdiff navigation
`]c`: Jump to the next diff
`[c`: Jump to the previous diff
`:cq`: Quit all buffers
`:qa`: Next diff
`git d <commit hash/branch> <file>`: Show diff for a certain commit/branch and certain file
`git diff --name-status <firstbranch>..<yourBranchName>`: Show files changed between branches
`git diff --name-status <branch>`: Show files changed currently checked out branch and named branch
