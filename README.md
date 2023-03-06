# zsh-nvim-appname

A simple ZSH plugin for maintaining multiple Neovim configurations with `NVIM_APPNAME`

Requirements: Neovim v0.9+

## Usage

This creates a new command `nvapp` which takes an `appname` of a folder `named nvim_<appname>` in your `$XDG_CONFIG_HOME` and passes it into neovim using the `NVIM_APPNAME` environment variable.

```
Usage:
  nvapp <appname> ...

Options:
  <appname>  the name of the app in $XDG_CONFIG_HOME
             (Example. ~/.config/nvim_<appname>)
  ...        any arguments passed to Neovim
```

## Installation

* [Antigen](#antigen)
* [Oh My Zsh](#oh-my-zsh)
* [Manual](#manual-git-clone)

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

