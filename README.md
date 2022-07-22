# My Neovim Config

## Introduction

This repo hosts my Nvim configuration for Linux, macOS, and Windows.

My configurations are heavily documented to make it as clear as possible. Although you can clone the entire repository and use it, it is not recommended. Good configurations are personal. Everyone should have their own unique configuration file. You are encouraged to clone from this repo the part you want and add it to your own config.

To reduce the possibility of corruption, this configuration is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable). No effort is required to maintain backward compatibility.

## Prerequisites

- Make sure you have installed the latest version of [`Neovim v0.7+`](https://github.com/neovim/neovim/wiki/Installing-Neovim).
- Have [`git`](https://git-scm.com/downloads), [`python`](https://www.python.org/downloads/), `pip`, [`node`](https://nodejs.org/en/download/) and `npm` installed on your system.
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using).
- Use a [Nerd Font](https://www.nerdfonts.com/) in your terminal emulator, this config use font [CaskaydiaCove NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip).

## Install

### Linux/macOS (Unix)

```
git clone https://github.com/DuongHieu0712z/nvim.git ~/.config/nvim --depth 1 && nvim
```

### Windows

```
git clone https://github.com/DuongHieu0712z/nvim.git ~\AppData\Local\nvim --depth 1 && nvim
```

## Uninstall

### Linux/macOS (Unix)

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

### Windows

```
rm -r -fo ~\AppData\Local\nvim
rm -f -fo ~\AppData\Local\nvim-data
```

## Treesitter supported languages

See more information about supported languages [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages).

## LSP

See more information about server configurations [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) and available LSPs [here](https://github.com/williamboman/nvim-lsp-installer#available-lsps).

## Null-ls

See more information about null-ls builtin sources [here](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md).\
See [BUILTIN_CONFIG](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md) to learn how to set up and configure these sources.

### Code actions

- eslint_d: `npm install -g eslint_d`
- proselint: `pip install proselint`
<!-- - xo: `npm install -D xo` -->

### Completions

### Diagnostics

- jsonlint: `npm install -g jsonlint`
- luacheck: `luarocks install luacheck`
- markdownlint: `npm install -D markdownlint`
- pylint: `pip install pylint`
- sqlfluff: `pip install sqlfluff`
- stylelint: `npm install -D stylelint stylelint-config-standard`
- textlint: `npm install -g textlint`
<!-- - tidy:
  - macOS: `brew install tidy-html5`
  - Windows: `choco install html-tidy`
  - Linux: `sudo apt install tidy` -->
- vint: `pip install vim-vint`
<!-- - yamllint: `pip install yamllint` -->

### Formattings

- black: `pip install black`
- lua_format: `luarocks install --server=https://luarocks.org/dev luaformatter`
- prettier: `npm install -D prettier`
  - eslint: `npm install -D eslint-config-prettier`
  - stylelint: `npm install -D stylelint-config-prettier`
<!-- - prettierd: `npm install -g @fsouza/prettierd` -->
- sql_formatter: `npm install sql-formatter`
