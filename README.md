# .configfiles
This directory contains the config files 

## Requirements

Ensure you have the following installed on your system

### Git

```
yay -S git
```

```
brew install git
```

### Stow

```
yay -S stow
```

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:Contraboi/.configfiles.git
$ cd .configfiles
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
