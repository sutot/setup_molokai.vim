#!/bin/bash

GITURL=https://github.com/tomasr/molokai

# check installed git
which git > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo git not found.
  echo please install git.
  exit 1
fi

mkdir -p ~/.vim/colors
echo created ~/.vim/colors directory

echo download molokai.vim
git clone $GITURL /tmp/$$
if [ $? -ne 0 ]; then
  echo git failed!
  exit 1
fi

cp /tmp/$$/colors/*.vim ~/.vim/colors/.
rm -fr /tmp/$$

# add .vimrc
echo adding synatax in your .vimrc
echo '"' `date` : \(`basename $0`\) >> ~/.vimrc
echo syntax on >> ~/.vimrc
echo colorscheme molokai >> ~/.vimrc
echo set t_Co=256 >> ~/.vimrc

echo done
exit 0
