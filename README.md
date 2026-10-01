# dot-vim
A basic vim 8+ configuration.

---

## Initial Setup

1. **Clone this repository** (including all submodules) directly into your home folder:

```bash
git clone --recursive git@github.com:username/dot-vim ~/.vim

```

2. **Configure`vimrc`:**
If you have an existing `~/.vimrc` file, append this line to source the new configuration:
```vim
source ~/.vim/vimrc

```

*Alternatively*, if you delete or move your `~/.vimrc`, Vim 8+ will automatically load `~/.vim/vimrc` directly.

---

## Plugin Setup & Management

Plugins are managed using **Vim 8's native package manager** (`pack/`) combined with **Git Submodules**.

Run these commands from inside your `~/.vim` directory:

* **Add a new plugin:**
```bash
git submodule add git@github.com:<user>/<plugin-name>.git pack/vendor/start/<plugin-name>

```


* **Update all plugins:**
```bash
git submodule update --remote --merge

```


* **Remove a plugin:**
```bash
git submodule deinit -f pack/vendor/start/<plugin-name>
git rm -f pack/vendor/start/<plugin-name>
rm -rf .git/modules/pack/vendor/start/<plugin-name>
```

### Active Plugins

* [NERDTree](https://github.com/preservim/nerdtree) — Tree explorer plugin for Vim.

---

## Global Key Mapping and Filetype customization
Key mappings for common programming tasks are mapped in the included vimrc file. To add custom settings for a language:

1. Using vim, edit a new .vim file in the ftplugin directory.

2. A template will be autoapplied to the buffer.  You can specify commands for builds, linters, tests, and autoformatting just like you would in a terminal.

