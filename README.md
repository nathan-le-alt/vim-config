# Vim Development Environment

[![Editor](https://img.shields.io/badge/Editor-Vim%20%2F%20Neovim-019733.svg)](https://www.vim.org/)
[![Configuration](https://img.shields.io/badge/Configuration-Vimscript-blue.svg)](https://vimhelp.org/)
[![Language Support](https://img.shields.io/badge/Language%20Support-Multiple-orange.svg)](#language-support)
[![License](https://img.shields.io/badge/License-TBD-lightgrey.svg)](#license)

A modular Vim configuration for software development, featuring language-server integration, intelligent code completion, automated formatting, diagnostics, Git change indicators, and a customized status line.

The configuration combines CoC.nvim, ALE, Vim-Airline, NERDTree, and supporting plugins to provide a consistent editing environment for multiple programming languages.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [Prerequisites and Dependencies](#prerequisites-and-dependencies)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Language Support](#language-support)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository contains Vimscript configuration files for a customizable development environment. It organizes editor functionality into separate modules for completion, language services, formatting, diagnostics, file navigation, indentation guides, documentation generation, and status-line presentation.

The configuration aims to reduce repetitive editing tasks and improve visibility into source code structure, language diagnostics, and Git changes.

The repository contains configuration snippets rather than a standalone application. Each file configures a specific plugin or editor feature and must be integrated into a Vim or Neovim configuration with the corresponding dependencies installed.

## Key Features

### Language Server Protocol and Code Intelligence

- Integrates CoC.nvim for language-server functionality and intelligent completion.
- Supports code navigation to definitions, type definitions, implementations, and references.
- Displays symbol documentation through hover functionality.
- Provides symbol renaming and code-fix commands.
- Integrates language-specific extensions for JavaScript, TypeScript, Python, PHP, C/C++, JSON, and other supported languages.

### Code Completion and Snippets

- Uses CoC.nvim completion menus.
- Supports completion-item confirmation through `Enter`.
- Uses `Tab` to navigate completion results or trigger completion.
- Supports snippet expansion and placeholder navigation through `Ctrl+j` and `Ctrl+k`.

### Automated Formatting

- Integrates ALE fixers for JavaScript, JSON, and Python.
- Removes trailing whitespace and trailing blank lines.
- Configures CoC formatting for supported file types.
- Supports manual formatting through a leader-key mapping.

Formatting behavior depends on the installed plugins, configured providers, and available external formatter executables.

### Diagnostics and Code Fixes

- Provides navigation between diagnostic entries.
- Supports opening and closing the CoC diagnostics list.
- Integrates CoC.nvim with the Vim-Airline status line.
- Provides mappings for applying code fixes and renaming symbols.

### Git Integration

- Configures Vim's update interval to support responsive GitGutter updates.
- Displays Git branch information through Vim-Airline.
- Displays change summaries for added, modified, and deleted lines.
- Supports file modification indicators in the status line.

### File Navigation

- Uses NERDTree for project file browsing.
- Provides keyboard mappings to toggle the file tree and locate the current file.
- Configures automatic exit behavior when NERDTree becomes the only remaining window.

### Editor Interface

- Configures Vim-Airline with the CodeDark theme.
- Enables a tab and buffer line.
- Supports Powerline-compatible separators and symbols.
- Adds filename and modification indicators to the status line.
- Configures indentation guides using a vertical-line character.

### Documentation Generation

- Configures JSDoc generation prompts for parameter descriptions.
- Supports shorthand type notation.
- Defines a path for the `lehre` executable or resource used by the JSDoc configuration.

## Technology Stack

| Technology   | Purpose                                                         |
| ------------ | --------------------------------------------------------------- |
| Vimscript    | Editor configuration and key mappings                           |
| Vim / Neovim | Primary editing environment                                     |
| CoC.nvim     | Language services, completion, diagnostics, and code navigation |
| ALE          | Linting and automated fixing                                    |
| Prettier     | JavaScript, JSON, and related formatting                        |
| Black        | Python formatting                                               |
| NERDTree     | File-system navigation                                          |
| Vim-Airline  | Status line and tab line                                        |
| GitGutter    | Git change indicators                                           |
| indentLine   | Indentation visualization                                       |
| JSDoc        | JavaScript documentation generation                             |

Additional CoC extensions provide language-specific functionality. Refer to the configuration files for the complete extension list.

## Prerequisites and Dependencies

### Required Software

Install the following software before integrating the configuration:

- Vim or Neovim with support for the required Vimscript features.
- Git for cloning the repository and displaying repository changes.
- A plugin manager compatible with your editor configuration.
- Node.js and npm for CoC.nvim and its Node.js-based extensions.
- Language-specific runtimes, language servers, and formatters required by your projects.

The exact minimum versions are not specified by the supplied configuration files. Check the documentation for each plugin before installation.

### Editor Plugins

Install the plugins corresponding to the following configuration modules:

| Plugin             | Configuration file or feature               |
| ------------------ | ------------------------------------------- |
| CoC.nvim           | Completion, language services, diagnostics  |
| coc-snippets       | Snippet expansion                           |
| coc-prettier       | CoC formatting integration                  |
| coc-pairs          | Paired-character support                    |
| coc-json           | JSON language support                       |
| coc-eslint         | ESLint integration                          |
| coc-diagnostic     | Diagnostic integration                      |
| coc-tsserver       | TypeScript and JavaScript language services |
| coc-pyright        | Python language services                    |
| coc-phpls          | PHP language services                       |
| coc-clangd         | C and C++ language services                 |
| @yaegassy/coc-ruff | Ruff integration for Python                 |
| ALE                | Linting and automated fixing                |
| vim-airline        | Status line and tab line                    |
| NERDTree           | File navigation                             |
| GitGutter          | Git change indicators                       |
| indentLine         | Indentation guides                          |
| JSDoc              | JavaScript documentation generation         |
| CodeDark           | Status-line theme                           |

The supplied files reference these plugins but do not include their source code or a complete plugin-manager manifest.

### External Tools

Install and configure the relevant tools for the languages you use.

- **Prettier:** JavaScript and JSON formatting, with additional file types supported by the formatter.
- **Black:** Python formatting.
- **ESLint:** JavaScript and TypeScript linting.
- **Pyright:** Python language analysis.
- **Ruff:** Python linting and related code-quality checks.
- **TypeScript language services:** JavaScript and TypeScript code intelligence.
- **clangd:** C and C++ language services.
- **PHP language services:** PHP code intelligence.

Some tools are optional and only apply to projects using their respective languages.

## Installation

### 1. Clone the Repository

Replace `<repository-url>` with the actual Git repository URL.

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Install the Editor Plugins

Install the required plugins using your preferred Vim or Neovim plugin manager.

For example, with vim-plug, add the following entries to your Vim configuration:

```vim
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'heavenshell/vim-jsdoc'
Plug 'tomasiser/vim-code-dark'

call plug#end()
```

Install the plugins by running:

```vim
:PlugInstall
```

The example covers the primary plugin families. Verify the repository URLs, plugin compatibility, and additional dependencies before use. Install the CoC extensions listed in `coc-extensions(1).vim` separately.

### 3. Install CoC Extensions

Open Vim or Neovim and install the required CoC extensions using the CoC command interface.

For example:

```vim
:CocInstall coc-snippets coc-prettier coc-pairs coc-json coc-eslint coc-diagnostic coc-tsserver coc-pyright coc-phpls coc-clangd @yaegassy/coc-ruff
```

Confirm that the extension names remain compatible with your installed CoC.nvim version.

### 4. Install External Formatters and Language Tools

Install the tools required by your programming languages.

For example, with npm:

```bash
npm install --global prettier eslint
```

For Python:

```bash
python -m pip install black ruff
```

Install Pyright, clangd, PHP language services, and any other required tools according to their official installation instructions.

### 5. Integrate the Configuration Files

Copy or source the supplied Vimscript modules from your Vim configuration.

For Vim, the standard configuration directory is typically `~/.vim/`. For Neovim, the standard configuration directory is typically `~/.config/nvim/`.

A possible directory layout is:

```text
~/.vim/
├── vimrc
└── config/
    ├── coc-config.vim
    ├── coc-diagnostics.vim
    ├── coc-extensions.vim
    ├── coc-prettier.vim
    ├── coc-snippet.vim
    ├── ale-config.vim
    ├── gitgutter.vim
    ├── indentLine-config.vim
    ├── jsdoc.vim
    ├── nerdtree.vim
    └── vim-airline-config.vim
```

The filenames above describe a suggested layout. Rename the supplied files as needed when integrating them into your configuration.

Source the modules from your main Vim configuration:

```vim
source ~/.vim/config/coc-extensions.vim
source ~/.vim/config/coc-config.vim
source ~/.vim/config/coc-diagnostics.vim
source ~/.vim/config/coc-prettier.vim
source ~/.vim/config/coc-snippet.vim
source ~/.vim/config/ale-config.vim
source ~/.vim/config/gitgutter.vim
source ~/.vim/config/indentLine-config.vim
source ~/.vim/config/jsdoc.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/vim-airline-config.vim
```

Adjust the paths to match your repository and configuration structure. Ensure each referenced plugin is installed before loading its associated configuration.

### 6. Restart and Verify

Restart Vim or Neovim and check the plugin status.

```vim
:checkhealth
:CocInfo
:CocList extensions
```

`:checkhealth` is primarily a Neovim command. In Vim, use the diagnostics and plugin-specific commands available for your installed versions.

Verify completion, language navigation, formatting, diagnostics, file navigation, and Git indicators before using the configuration in your daily workflow.

## Usage

### File Navigation

Toggle NERDTree:

```text
Ctrl+\
```

Locate the currently active file in NERDTree:

```text
Ctrl+f
```

These mappings depend on the NERDTree plugin and the supplied configuration.

### Code Navigation

Use the following normal-mode mappings:

| Key          | Action                                     |
| ------------ | ------------------------------------------ |
| `gd`         | Go to definition                           |
| `gy`         | Go to type definition                      |
| `gi`         | Go to implementation                       |
| `gr`         | Find references                            |
| `K`          | Display documentation or hover information |
| `<leader>rn` | Rename the current symbol                  |
| `<leader>qf` | Apply a code fix to the current location   |

The `<leader>` key depends on your Vim configuration. Vim commonly uses backslash as the default leader key.

### Formatting

Format the current buffer:

```text
<leader>f
```

Format a selected range:

```text
<leader>f
```

The first mapping applies to normal mode, while the second applies to visual mode. The active CoC formatting provider determines the available formatting behavior.

The supplied configuration also requests formatting before saving files with these extensions:

- `.js`
- `.jsx`
- `.ts`
- `.tsx`
- `.json`
- `.css`
- `.md`
- `.py`

Formatting only runs when CoC.nvim reports an available formatting provider.

### Completion and Snippets

During insert mode:

| Key      | Action                                                                              |
| -------- | ----------------------------------------------------------------------------------- |
| `Tab`    | Move through completion items, insert a tab when appropriate, or trigger completion |
| `Enter`  | Confirm the selected completion item when the completion menu is visible            |
| `Ctrl+j` | Expand a snippet or advance to the next placeholder                                 |
| `Ctrl+k` | Move to the previous snippet placeholder                                            |

The behavior depends on the active completion menu and snippet state.

### Diagnostics

Navigate diagnostic entries:

| Key  | Action                          |
| ---- | ------------------------------- |
| `[g` | Previous diagnostic             |
| `]g` | Next diagnostic                 |
| `\g` | Toggle the CoC diagnostics list |

The `\g` mapping is defined directly in the supplied configuration. Its behavior does not depend on the `<leader>` setting.

### Git Indicators

GitGutter displays changes relative to the Git index or working tree, depending on its configuration and version.

The supplied configuration sets:

```vim
set updatetime=100
```

This reduces Vim's update interval to 100 milliseconds, allowing supported update-triggered functionality to respond more frequently.

### Documentation Generation

Use the JSDoc plugin commands available in your installed version to generate JavaScript documentation.

The supplied configuration enables parameter-description prompts and shorthand type notation:

```vim
let g:jsdoc_input_description = 1
let g:jsdoc_type_hook = 0
let g:jsdoc_lehre_path = 'lehre'
```

Confirm the required executable and plugin command syntax against the installed JSDoc plugin version.

## Configuration

The configuration is split into independent Vimscript modules. This makes individual features easier to maintain and customize.

### CoC Extensions

File: `coc-extensions(1).vim`

Defines the global CoC extension list:

```vim
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-diagnostic',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-phpls',
  \ 'coc-clangd',
  \ '@yaegassy/coc-ruff'
  \ ]
```

Add or remove entries to match your development requirements.

### CoC Formatting

File: `coc-prettier(1).vim`

Defines manual formatting mappings and formatting on save.

```vim
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)
```

The save hook checks whether a formatting provider exists before invoking formatting.

### ALE Fixers

File: `ale-config(1).vim`

Enables automatic fixing on save and configures language-specific fixers:

```vim
let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'python': ['black'],
      \}
```

The configuration applies trailing-line removal and whitespace trimming globally. It also selects Prettier for JavaScript and JSON, and Black for Python.

Review the ALE and CoC formatting settings together to avoid overlapping formatting operations or inconsistent results.

### Vim-Airline

File: `vim-airline-config(1).vim`

Configures the status line and tab line, including:

- CodeDark theme.
- Powerline separators and symbols.
- Branch and hunk information.
- CoC integration.
- Filename and modification indicators.
- Tab-line formatting.
- Custom handling of file icons when a compatible icon plugin is available.

The custom status-line function supports Neovim's `nvim-web-devicons` and Vim's `WebDevIconsGetFileTypeSymbol()` when available.

### NERDTree

File: `nerdtree(1).vim`

Defines file-tree navigation mappings and an autocmd to exit Vim when NERDTree is the only remaining window under the configured conditions.

### GitGutter

File: `gitgutter(1).vim`

Sets the editor update interval:

```vim
set updatetime=100
```

### Indentation Guides

File: `indentLine-config(1).vim`

Defines the indentation-guide character and terminal color:

```vim
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
```

### JSDoc

File: `jsdoc(1).vim`

Controls parameter-description prompts, type notation, and the configured `lehre` path.

### CoC Diagnostics

File: `coc-diagnostics(1).vim`

Defines previous and next diagnostic mappings and a function to toggle the diagnostic list. The function checks the current location list and requests diagnostic information from CoC.nvim.

## Language Support

The configured CoC extensions target several language ecosystems.

| Language or format | Configured integration                                          |
| ------------------ | --------------------------------------------------------------- |
| JavaScript         | TypeScript language services, ESLint, Prettier, JSDoc           |
| TypeScript         | TypeScript language services, ESLint                            |
| JSON               | JSON language support, Prettier                                 |
| CSS                | CoC formatting provider, subject to installed formatter support |
| Python             | Pyright, Ruff, Black                                            |
| PHP                | PHP language services                                           |
| C and C++          | clangd                                                          |
| Markdown           | CoC formatting provider, subject to installed formatter support |

The actual feature set depends on installed language servers, external executables, project configuration, and plugin compatibility.

## Troubleshooting

### CoC.nvim Does Not Start

- Confirm Node.js and npm are installed.
- Verify that CoC.nvim is installed and compatible with your editor.
- Run `:CocInfo` to inspect the CoC service status.
- Run `:CocList extensions` to inspect installed extensions.
- Review the CoC.nvim documentation for runtime and extension errors.

### Formatting Does Not Run

- Confirm that the relevant formatter is installed.
- Verify that CoC.nvim has a formatting provider for the current file type.
- Check the ALE configuration and formatter executable paths.
- Confirm that the file extension matches the configured autocmd patterns.
- Review the formatter's project-level configuration.

### Completion or Snippets Do Not Work

- Confirm that the relevant CoC extensions are installed.
- Check the completion menu state and key mappings.
- Verify that the current file type has a compatible language server or completion provider.
- Inspect conflicting mappings from other plugins.

### GitGutter Does Not Display Changes

- Confirm that the current directory belongs to a Git repository.
- Check whether the file contains changes relative to the relevant Git reference.
- Verify that Git is installed and accessible from the editor.
- Confirm that GitGutter loads without errors.

### Status-Line Icons Are Missing

- Verify that Vim-Airline is installed.
- Install a compatible icon plugin if file-type icons are required.
- Confirm that your terminal font supports the configured Powerline glyphs.
- Check whether the custom icon function detects your installed icon provider.

## Contributing

Contributions are welcome. Keep changes focused, document configuration behavior, and verify compatibility with the target editor and plugin versions.

### Contribution Workflow

1. Fork the repository.
2. Create a feature branch.
3. Make your changes.
4. Test the affected configuration modules.
5. Submit a pull request with a clear description of the changes.

Example:

```bash
git checkout -b feature/improve-python-support

# Edit the relevant Vimscript files.

git diff
git add .
git commit -m "Improve Python editor support"
git push origin feature/improve-python-support
```

### Contribution Guidelines

- Preserve the modular configuration structure.
- Use descriptive variable and function names.
- Document non-obvious key mappings and autocmd behavior.
- Avoid introducing dependencies without documenting their purpose.
- Test changes against the supported Vim or Neovim environment.
- Document any new external tools or language-server requirements.
- Avoid conflicting key mappings and duplicated formatting behavior.
- Include reproduction steps when reporting a bug.

### Reporting Issues

When reporting a problem, include:

- Vim or Neovim version.
- Operating system.
- Relevant plugin versions.
- Steps to reproduce the issue.
- Relevant error messages or diagnostic output.
- The affected configuration module.

Remove credentials, tokens, and other sensitive information before submitting logs.

## License

**License: Not specified.**

No license declaration was included with the supplied configuration files. Add a `LICENSE` file to the repository and update this section after selecting the appropriate license.

Until a license is declared, do not assume the repository grants permissions associated with MIT, GPL-3.0, or another open-source license.

## Acknowledgments

This configuration depends on the Vim and Neovim ecosystems and the respective maintainers of the integrated plugins and language tools.

Refer to each dependency's official repository for installation instructions, licensing terms, and compatibility information.
