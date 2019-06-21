# vim
Configuration files for vim

## Update plug-ins

Neovim
```sh
pip3 install --user neovim
nvim --headless +'PlugInstall --sync' +qa

# YCM
# Make sure cmake is available
~/.config/nvim/plugged/YouCompleteMe//install.py --clang-completer --all
```
