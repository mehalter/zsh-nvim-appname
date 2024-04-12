# zsh-nvim-appname

A simple ZSH plugin for maintaining multiple Neovim configurations with `NVIM_APPNAME` with full tab completion of available flags, available neovim applications, and neovim arguments/flags.

Requirements: Neovim v0.9+

## Short Demo

[![Recorded Demo](https://asciinema.org/a/mdy5Cv1q79vOwjdQJauHv1NNn.svg)](https://asciinema.org/a/mdy5Cv1q79vOwjdQJauHv1NNn)

## Usage

This creates a new command `nvapp` which takes an `appname` of a folder `named nvim_<appname>` in your `$XDG_CONFIG_HOME` and passes it into neovim using the `NVIM_APPNAME` environment variable.

```
Usage:
  nvapp [-h|--help] [-c|--clean] [-d|--delete] <nvapp_name> ...

Options:
  -h|--help     Display this help text and exit
  -c|--clean    Clean the installation files
  -d|--delete   Delete the configuration directory
  <appname>     The name of the neovim app in $XDG_CONFIG_HOME
                (Example. ~/.config/nvim_<appname>)
  ...           any arguments passed to neovim
```

## Installation

- [Antigen](#antigen)
- [Oh My Zsh](#oh-my-zsh)
- [Manual](#manual-git-clone)

### Antigen

1. Add the following to your `.zshrc`:

   ```sh
   antigen bundle mehalter/zsh-nvim-appname
   ```

2. Start a new terminal session.

### Oh My Zsh

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

   ```sh
   git clone https://github.com/mehalter/zsh-nvim-appname ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvim-appname
   ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

   ```sh
   plugins=(
       # other plugins...
       zsh-nvim-appname
   )
   ```

3. Start a new terminal session.

### Manual (Git Clone)

1. Clone this repository somewhere on your machine. This guide will assume `~/.zsh/zsh-autosuggestions`.

   ```sh
   git clone https://github.com/mehalter/zsh-nvim-appname ~/.zsh/zsh-nvim-appname
   ```

2. Add the following to your `.zshrc`:

   ```sh
   source ~/.zsh/zsh-nvim-appname/zsh-nvim-appname.plugin.zsh
   fpath+= ~/.zsh/zsh-nvim-appname
   ```

3. Start a new terminal session.
