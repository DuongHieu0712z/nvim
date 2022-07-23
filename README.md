# My Neovim Config

## Introduction

This repo hosts my Nvim configuration for Linux, macOS, and Windows.

My configurations are heavily documented to make it as clear as possible. Although you can clone the entire repository and use it, it is not recommended. Good configurations are personal. Everyone should have their own unique configuration file. You are encouraged to clone from this repo the part you want and add it to your own config.

To reduce the possibility of corruption, this configuration is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable). No effort is required to maintain backward compatibility.

## Prerequisites

- Make sure you have installed the latest version of [**`Neovim v0.7+`**](https://github.com/neovim/neovim/wiki/Installing-Neovim).
- Have the following programs installed on your system:
  - [`git`](https://git-scm.com/downloads)
  - `make`
  - [`nodejs`](https://nodejs.org/en/download/) and `npm`
  - [`python3`](https://www.python.org/downloads/) and `pip3`
  - [`lua`](https://www.lua.org/download.html) and [`luarocks`](https://github.com/luarocks/luarocks/wiki/Download) (required only if using `lua`)
  - [`ruby`](https://www.ruby-lang.org/en/downloads/) and `gem` (optional)
  - [`rust`](https://www.rust-lang.org/tools/install) and `cargo` (optional)
- Terminal with true color support.
- Use a [Nerd Font](https://www.nerdfonts.com/) in your terminal emulator, this config uses font [*CaskaydiaCove NF*](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip).

## Install

### Linux/macOS

```
git clone https://github.com/DuongHieu0712z/nvim.git ~/.config/nvim --depth 1
```

### Windows (Powershell)

```
git clone https://github.com/DuongHieu0712z/nvim.git ~\AppData\Local\nvim --depth 1
```

## Uninstall

### Linux/macOS

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

### Windows (Powershell)

```
rm -r -fo ~\AppData\Local\nvim
rm -r -fo ~\AppData\Local\nvim-data
```

## Treesitter

<details><summary><b>This config uses supported languages</b></summary>

- [x] [`c`](https://github.com/tree-sitter/tree-sitter-c)
- [x] [`cpp`](https://github.com/tree-sitter/tree-sitter-cpp)
- [x] [`c_sharp`](https://github.com/tree-sitter/tree-sitter-c-sharp)
- [x] [`java`](https://github.com/tree-sitter/tree-sitter-java)
- [x] [`python`](https://github.com/tree-sitter/tree-sitter-python)
- [x] [`html`](https://github.com/tree-sitter/tree-sitter-html)
- [x] [`css`](https://github.com/tree-sitter/tree-sitter-css)
- [x] [`scss`](https://github.com/serenadeai/tree-sitter-scss)
- [x] [`javascript`](https://github.com/tree-sitter/tree-sitter-javascript)
- [x] [`jsdoc`](https://github.com/tree-sitter/tree-sitter-jsdoc)
- [x] [`typescript`](https://github.com/tree-sitter/tree-sitter-typescript)
- [x] [`tsx`](https://github.com/tree-sitter/tree-sitter-typescript)
- [x] [`embedded_template`](https://github.com/tree-sitter/tree-sitter-embedded-template)
- [ ] [`vue`](https://github.com/ikatyang/tree-sitter-vue)
- [x] [`go`](https://github.com/tree-sitter/tree-sitter-go)
- [x] [`gomod`](https://github.com/camdencheek/tree-sitter-go-mod)
- [x] [`gowork`](https://github.com/omertuc/tree-sitter-go-work)
- [x] [`lua`](https://github.com/MunifTanjim/tree-sitter-lua)
- [x] [`vim`](https://github.com/vigoux/tree-sitter-viml)
- [x] [`markdown`](https://github.com/MDeiml/tree-sitter-markdown)
- [x] [`markdown_inline`](https://github.com/MDeiml/tree-sitter-markdown)
- [x] [`json`](https://github.com/tree-sitter/tree-sitter-json)
- [x] [`json5`](https://github.com/Joakker/tree-sitter-json5)
- [x] [`jsonc`](https://gitlab.com/WhyNotHugo/tree-sitter-jsonc)
- [ ] [`yaml`](https://github.com/ikatyang/tree-sitter-yaml)
- [ ] [`toml`](https://github.com/ikatyang/tree-sitter-toml)
- [x] [`sql`](https://github.com/derekstride/tree-sitter-sql)
- [x] [`cmake`](https://github.com/uyha/tree-sitter-cmake)
- [x] [`dockerfile`](https://github.com/camdencheek/tree-sitter-dockerfile)
- [x] [`comment`](https://github.com/stsewd/tree-sitter-comment)
- [x] [`regex`](https://github.com/tree-sitter/tree-sitter-regex)
- [ ] [`rst`](https://github.com/stsewd/tree-sitter-rst)

</details>

See more information about supported languages [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages).

## LSP

See more information about server configurations [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) and available LSPs [here](https://github.com/williamboman/nvim-lsp-installer#available-lsps).

## Null-ls

See more information about null-ls builtin sources [here](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md).
