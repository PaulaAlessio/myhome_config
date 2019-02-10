# My Home configuration

Repository containing my dot files

## Contents and description
 * `.bashrc`: minimalistic configuration, git *ornaments* added, long history
    and less *ornaments*
 * `.bash_aliases`: some bash aliases
 * `fonts`: contains some nerd fonts (necessary for some vim plugins)
 * `etc`:  contain git ornaments stuff, to land under `~/.local/etc`
 * `.screenrc`: custom screen configuration
 * `.vimrc`: vim config file for a custom configuration with plugins
 * `Spacevim_config`: my custom Spacevim configuration

NOTE: for vim configuration, you can either use .vimrc for a custom plugin
configuration or install Spacevim and use the files in Spacevim_config. You
can further customise them.

## RAW vim configuration

 Steps:

 1. Copy .vimrc to your home directory 
 2. Copy the nerd fonts into `/usr/share/fonts/TTF/` or under `~/.local/fonts`
    if you have no admin rights. 
 3. In order to let plugins to be installed you need to:
    ```
     $ mkdir -p ~/.vim/autoload;
     $ curl -fLo ~/.vim/autoload/plug.vim \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
 4. Download molokai colorscheme from `https://github.com/tomasr/molokai.git`
    and copy it to  ``~/.vim/colors/``
    
 NOTE: you might have to change your terminal font to a nerd one, you might 
       have to set `TERM` to `xterm-256color`, you might have to edit `.vimrc`
       and edit the line `set guifont=...`. Fonts tend to be problematic. 

## Custom Spacevim configuration

 1. Install Spacevim: `curl -sLf https://spacevim.org/install.sh | bash`
 2. Get molokai colorscheme (`molokai.vim`) from
    `https://github.com/tomasr/molokai.git` and copy it to `~/.SpaceVim/colors/`
 3. Copy `Spacevim_config/init.toml` to `~/.SpaceVim.d/` (it will overwrite the file)
 4. Copy `Spacevim_config/myinit.vim` to `~/.SpaceVim/autoload/`
 5. In order for installation to take place, you have to open vim.

 You can custom  `init.toml`, following the documentation in:
 `https://github.com/SpaceVim/SpaceVim/tree/master/doc`

 NOTE: when installing spacevim, a backup of your `~/.vimrc` and `~/.vim` 
 are made: `~/vimrc_back` `~/.vim_back`
