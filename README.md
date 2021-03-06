Neovim Starter Config
=====================

The purpose of this repo is to provide a good starting point for a [Neovim](https://neovim.io/) config that is all in one file (well two, I guess) and is well commented; I also wanted it to show a lick of most of the key aspects of Vim configuration including:

- Global variable settings
- Core editor options
- Plugins and their configuration
- Writing custom functions
- Autocommands augrops
- Events
- Mappings


## Installation and Scripts

The simplest method would be:

	sudo <package-manager install> nvim
	git clone https://gitlab.com/bodneyc/neovim-starter-config.git
	cd neovim-starter-config
	./scripts/softlink-config.sh
	./scripts/remote-plugins-stuff.sh


`./scripts/softlink-config.sh` soft-links the two core configuration files to `$HOME/.config/nvim/`, these can of course be copied there directly, and I would advise this if one intends to make further changes (which, again, I would advise).

`./scripts/remote-plugins-stuff.sh` initially installs [vim-plug](https://github.com/junegunn/vim-plug) which is used as a plugin manager.

This script then uses [`pacman`](https://wiki.archlinux.org/index.php/Pacman), as it's what I use, so you may need to edit this, and installs [xclip](https://linux.die.net/man/1/xclip) for clipboard functionality and [shellcheck](https://www.shellcheck.net/) to be used with [CoC](https://github.com/neoclide/coc.nvim) to provide language support for shell scripts.

It then installs the [pynvim](https://github.com/neovim/pynvim) package for Python two and three to allow remote Python plugins, as well as [vint](https://pypi.org/project/vint/) for language support in vimscript.

If [npm](https://www.npmjs.com/) is installed, the [neovim](https://www.npmjs.com/package/neovim) package is installed to allow remote NodeJS plugins.

If [go](https://golang.org/) is installed, the [gopls](https://github.com/golang/tools/tree/master/gopls) and [golint](https://github.com/golang/lint) to provide GoLang language support through CoC.

### Neovim from Source

There is a third script: `./scripts/neovim-from-source.sh` which is pretty much what it says on the tin, it installs the latest master of Neovim in `$HOME/gitclones/neovim` which can be used over your package repo's version.

As with anything "bleeding edge", it comes with all sort of bugs, but also the latest features - this decision is left to the user.

## The Config

This is only going to be a brief overview of the config itself as you should explore it yourself figure out any nuances or misunderstandings (or misconfigurations, I suppose).

### Plugins

| Name | Description |
|----:|:----------|
| [Coc.nvim](https://github.com/neoclide/coc.nvim)                    | Wonderful completion and intellisense engine |
| [Polyglot](https://github.com/sheerun/vim-polyglot)                 | A language pack for Vim to provide common language specific settings |
| [Fzf](https://github.com/junegunn/fzf)                              | Command line fuzzer, very useful |
| [Fzf.vim](https://github.com/junegunn/fzf.vim)                      | Integration of the above as a Vim plugin |
| [NERDTree](https://github.com/scrooloose/nerdtree)                  | One of many file explorers available, this one is particularly popular |
| [NERDTree Project](https://github.com/scrooloose/nerdtree-project-plugin)        | Allows one to save the open NERDTree buffer (opened directories etc) to be used again |
| [NERDTree Highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight) | Highlights and icons colors for NERDTree |
| [Startify](https://github.com/mhinz/vim-startify)                   | Starting page showing recently opened files and a configurable message |
| [IndentLine](https://github.com/Yggdroot/indentLine)                | Shows virtual characters indicating indent level |
| [Devicons](https://github.com/ryanoasis/vim-devicons)               | File type icons, supporting font required |
| [Lightline](https://github.com/itchyny/lightline.vim)               | One of many status line plugins, easy to configure (relatively) |
| [VirkSpaces](https://github.com/BodneyC/VirkSpaces)                 | One of many (and my personal) workspace plugins |
| [Syntax-extra](https://github.com/justinmk/vim-syntax-extra)        | Additional language specific syntax definitions |
| [Fugitive](https://github.com/tpope/vim-fugitive)                   | A cracking Git wrapper |
| [Gdiff](https://github.com/oguzbilgic/vim-gdiff)                    | Provide a git diff command |
| [Flog](https://github.com/rbong/vim-flog)                           | Git branch viewer |
| [Gv](https://github.com/junegunn/gv.vim)                            | Alternate git branch viewer |
| [Multiple-cursors](https://github.com/terryma/vim-multiple-cursors) | Allows multiple cursors (though there's normally a better way) |
| [Easy-align](https://github.com/junegunn/vim-easy-align)            | Align blocks of text according to specified delimiters |
| [Pear-tree](https://github.com/tmsvg/pear-tree)                     | My preferred pairs plugins |
| [Auto-pairs](https://github.com/jiangmiao/auto-pairs)               | Alternate pairs plugin |
| [Nerdcommenter](https://github.com/scrooloose/nerdcommenter)        | For quick commenting of blocks/lines |
| [Repeat](https://github.com/tpope/vim-repeat)                       | Improved dot (`.`, i.e. repeat) action |
| [Surround](https://github.com/tpope/vim-surround)                   | Manipulate characters surrounding text objects |
| [Gutentags](https://github.com/ludovicchabant/vim-gutentags)        | Fantastic tag management plugin |
| [Mundo](https://github.com/simnalamburt/vim-mundo)                  | Visualise the undo tree |
| [Vista](https://github.com/liuchengxu/vista.vim)                    | Visualise tags of the buffer |
| [Leader-guide](https://github.com/bodneyc/vim-leader-guide)         | A personal fork of a plugin to help see mappings as they are pressed |
| [Wal](https://github.com/dylanaraps/wal.vim)                        | Colorscheme which takes from [pywal](https://github.com/dylanaraps/wal) |

### Options

There are many options too go through here, in general these are separated into catagories:

- Buffers
- Indent width
- Line breaks
- Movement functionality
- Interface options
- File and disk usage


There are then plugin options including:

- GutenTags improved functionality
- NERDTree options including spacing and ignore
- Fzf options to be personal taste


### Functions

| Name | Description |
|----:|:----------|
| `OpenNerdTreeIfNotAlreadyOpen` | Used when opening Vim to manage NERDTree pane            |
| `Flogdiff`                     | Similar to Gdiff but using Flog                          |
| `CocFormat`                    | Formatting code using CoC                                |
| `WinMovek`                     | Used for mappings of `ctrl+[hjkl]` to move between panes |
| `FZFOpen`                      | Stop FZF opening files in the NERDTree buffer            |
| `NERDTreeResize`               | Resize NERDTree width to appropriate size                |
| `ChangeIndent`                 | Change indent of current file (edits buffer)             |
| `SetIndent`                    | Sets the virtual width of the indent                     |
| `UpdateAll`                    | Update plugins, CoC, remote plugins                      |
| `ChooseTerm`                   | Used in creating quick terminals                         |

### Commands

| Command | Definition | Description |
|----:|:-|:----------|
| `CocFormat`       | `call s:CocFormat(<range>, <line1>, <line2>)` | Command definition of CocFormat above |
| `NERDTreeResize`  | `call NERDTreeResize()`                       | Command definition of NERDTreeResize above |
| `Wqa`             | `wqa`                                         | Permit accidental captials in w/q |
| `WQa`             | `wqa`                                         | See above |
| `WQ`              | `wq`                                          | See above |
| `Wq`              | `wq`                                          | See above |
| `W`               | `w`                                           | See above |
| `Q`               | `q`                                           | See above |
| `RGBPicker`       | `call CocAction('pickColor')<CR>`             | Open an RGB picker for a written color |
| `RGBOptions`      | `call CocAction('colorPresentation')<CR>`     | Change representation of a color ('#RGB' to 'rgb(R, G, B)' etc.|
| `RenameWord`      | `CocCommand document.renameCurrentWord`       | Rename current word, also provides another type of multiple cursors |
| `ConvLineEndings` | `%s/^M//g`                                    | Windows to Unix line endings; note `^M` is the literal character <C-m> (input with `<C-v><C-m>`) |
| `ChangeIndent`    | `call ChangeIndent(<f-args>)`                 | Command definition of ChangeIndent above |
| `SetIndent`       | `call SetIndent(<f-args>)`                    | Command definition of SetIndent above |
| `UpdateAll`       | `call UpdateAll()`                            | Command definition of UpdateAll above |


### Maps

Most of the mappings leader mappings, the leader is also set to `<Space>` i.e. " ".

Some of the essential ones are `e, E, w, W, q, Q` which respectively map to `:e, :e!, :w, :w!, :q, :q!`.

Many of the others are CoC specific, find these out through reading the config file.

There are also a number of buffer related mappings, the most significant of which, in my opinion, are `<Tab>` and `<S-Tab>` (shift-tab) for buffer next and buffer previous). There are also `<leader>bd` for buffer delete, `<leader>bl` for FZF buffer list.

Also of interest are:

- `<S-up>` and `<S-down>` to move lines up and down
- `<leader>'` to open a quick terminal
- `<leader>of` and `<leader>ox` to open the file under the cursor or the URL under the cursor respectively


... and many others.

### AuGroups

Included in the config file are a number of augroups to provide some functionality triggered upon certain Vim events.

Examples include:

- Turning off spell checking, line numbers, the sign column, etc when a terminal is entered
- Opening NERDTree when Vim enters with no argument, or with a single directory argument
- Closing the pmenu when a selection is made
- Closing NERDTree automatically if it is the only remaining buffer


## CoC Settings

The other core config file is `./nvim/coc-settings.json` which is a JSON format configuration controlling CoC.

Settings here include the addition of external language servers and linters, coc-explorer settings, some git gutter highlight settings, and others, read it for more information.

## Continued Work

I'm hoping to test this out with a few new-timers to Vim and update this readme and the configs in relation to their comments.
