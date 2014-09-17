#!/bin/bash

echo 'switch to deploy-branch'
# delete all locals branches and describe locals changes
git branch -D public 
git checkout --orphan public

echo 'start building'
# all local build files from master will be removed
rm -rf build

# for save history, pull stored public branch
git pull origin public

# build will change all files to last state
middleman build

echo 'commit and push'
# only public folder will be pushed
rm .gitignore
mv .gitignore_deploying .gitignore

git reset HEAD -- source
git reset HEAD -- data
git reset HEAD -- lib
git reset HEAD -- config.rb
git reset HEAD -- .gitignore
git reset HEAD -- .gitignore_dev
git reset HEAD -- .gitignore_deploying
git reset HEAD -- deploy.sh
git reset HEAD -- Gemfile
git reset HEAD -- Gemfile.lock
git reset HEAD -- helpers

git add .

# all commits with same commit-text. :)
git commit -m 'auto deploy'


# push without --force to saving git-history
git push origin public


git checkout master
git branch -D public
rm -rf build

echo 'done'
