```
                             _                    _ _
                            | |                  | | |
             _   _  __ _  __| |_ __   ____   __ _| | |__
            | | | |/ _` |/ _` | '__| |____| / _` | | ___|
            | |_| | (_| | (_| | |          | (_| | | |__
             \__, |\__,_|\__,_|_|           \__,_|_|\___|
              __/ |
             |___/

    # YADR-alt
    # A YADR fork with a focus on terminal VIM and user customization.

    $ sh -c "`curl -fsSL https://raw.github.com/ianks/yadr-alt/master/install.sh`"
```

![scrot1](http://i.imgur.com/uuCdF4z.png)
![scrot2](http://i.imgur.com/5cjiVUI.png)

# Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://raw.github.com/ianks/yadr-alt/master/install.sh`"
```

**Note:** YADR will automatically install all of its subcomponents. If you want
to be asked about each one, use:

```bash
sh -c "`curl -fsSL https://raw.github.com/ianks/yadr-alt/master/install.sh`" -s ask
```

# Upgrading

Upgrading is easy.

```bash
cd ~/.yadr
git pull --rebase
rake update
```

**Always be sure to run `rake update` after pulling to ensure plugins are updated**

# What's included, and how to customize

Read on to learn what YADR provides!

## ZSH

Think of Zsh as a more awesome bash without having to learn anything new.
Automatic spell correction for your commands, syntax highlighting, and more.
We've also provided lots of enhancements:

* Vim mode and bash style `Ctrl-R` for reverse history finder
* `Ctrl-x,Ctrl-l` to insert output of last command
* Fuzzy matching - if you mistype a directory name, tab completion will fix it
* [fasd](https://github.com/clvv/fasd) integration - hit `z` and partial match
  for recently used directory. Tab completion enabled.
* [Prezto - the power behind YADR's zsh](http://github.com/sorin-ionescu/prezto)
* [How to add your own ZSH theme](doc/zsh/themes.md)

## Aliases

Lots of things we do every day are done with two or three character
mnemonic aliases. Please feel free to edit them:

    ae # alias edit
    ar # alias reload

## Git Customizations

YADR will take over your `~/.gitconfig`, so if you want to store your
usernames, please put them into `~/.gitconfig.user`

It is recommended to use this file to set your user info. Alternately, you can
set the appropriate environment variables in your `~/.secrets`.

* `git l` or `gl`- a much more usable git log
* `git b` or `gb`- a list of branches with summary of last commit
* `git r` - a list of remotes with info
* `git t` or `gt`- a list of tags with info
* `git nb` or `gnb`- a (n)ew (b)ranch - like checkout -b
* `git cp` or `gcp`- cherry-pick -x (showing what was cherrypicked)
* `git simple` - a clean format for creating changelogs
* `git recent-branches` - if you forgot what you've been working on
* `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc`
* (revert to the time prior to the last commit - dangerous if already pushed)
  aliases
* Some sensible default configs, such as improving merge messages, push only
  pushes the current branch, removing status hints, and using mnemonic prefixes
  in diff: (i)ndex, (w)ork tree, (c)ommit and (o)bject
* Slightly improved colors for diff

### RubyGems

A .gemrc is included. Never again type `gem install whatever --no-ri
--no-rdoc`. `--no-ri --no-rdoc` is done by default.

### Tmux configuration

`tmux.conf` provides some sane defaults for tmux on Mac OS like a powerful
status bar and vim keybindings. You can customize the configuration in
`~/.tmux.conf.user`.

### Vimization of everything

The provided inputrc and editrc will turn your various command line tools like
mysql and irb into vim prompts. There's

## Vim - What's included

YADR-alt aims for having mnemonic leader keybindings. There is always a top
level concept, followed by action to activate some functionality.

For example, `<SPC>fe` runs a 'File Explore' while `<SPC>fg` greps for a
pattern in your files.

For a list of any of the commands, simply run `<SPC>(letter)h`. i.e. `<SPC>gh`
will list the leader commands for git.

## Extending and overriding YADR settings

* [Debugging vim keymappings](doc/vim/keymaps.md)
* [Overriding vim settings with ~/.vimrc.after and friends](doc/vim/override.md)
* [Adding your own vim plugins](doc/vim/manage_plugins.md)

## Misc

* [Credits & Thanks](doc/credits.md)
* [Other recommended OSX productivity tools](doc/osx_tools.md)
* [Yan's Blog](http://yanpritzker.com)

### Vim troubles with Lua

```
brew install vim --with-lua --with-luajit
```

### [Pry](http://pry.github.com/)

Pry offers a much better out of the box IRB experience with colors, tab
completion, and lots of other tricks. You can also use it as an actual debugger
by installing [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug).

[Learn more about YADR's pry customizations and how to install](doc/pry.md)

### [Hammerspoon](http://www.hammerspoon.org/)

*note*: Requires Hammerspoon to be installed.

Automate OSX tasks using Hammerspoon. For example, `CMD ALT CTRL f` will open a
Firefox window from anywhere in the OS. `CMD ALT CTRL h` will snap a window to
the left side of the screen and you guessed it, `CMD ALT CTRL l` will snap it to
the right.
