#!/bin/bash
cd;
rm -rf .vim;
git clone https://github.com/gpakosz/.vim.git;
ln -s .vim/.vimrc;
cd .vim;
git checkout heavenly;
git submodule init && git submodule update;
