# .dotfiles
This directory contains the dotfiles 

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

```
brew install git
```

### Stow

```
pacman -S stow
```

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:Contraboi/.dotfiles.git
$ cd .dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

### Bootstrap

To install all programs run follow:

#### MacOS
```
brew bundle
```

#### Linux

TODO
