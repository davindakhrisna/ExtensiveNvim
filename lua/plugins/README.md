# Neovim Plugin Configuration

This directory contains all Neovim plugins organized by category prefixes for better maintainability and readability while maintaining lazy.nvim compatibility.

## 📁 Directory Structure

```
plugins/
├── 🤖 ai-codecompanion.lua                    # AI coding assistant
├── 📝 completion-emoji.lua                    # Emoji completion
├── 📝 completion-supertab.lua                 # Enhanced Tab behavior
├── ✏️ editor-mini-pairs.lua                   # Auto-pair brackets
├── ✏️ editor-mini-ai.lua                      # Smart text objects
├── ✏️ editor-treesitter-textobjects.lua       # Advanced text objects
├── ✏️ editor-ts-comment.lua                   # Smart commenting
├── ✏️ editor-web-tags.lua                     # HTML tag completion
├── ✏️ editor-todo.lua                         # TODO highlighting
├── ✏️ editor-trouble.lua                      # Error display
├── ✏️ editor-persistance.lua                  # Session management
├── ✏️ editor-toggleterm.lua                   # Terminal integration
├── 🔀 git-gitsigns.lua                        # Git integration
├── 🔧 lsp-config.lua                          # LSP configuration
├── 🔧 lsp-lazydev.lua                         # Lua development
├── 🔧 lsp-eslint.lua                          # JavaScript linting
├── 🧭 navigation-telescope.lua                # Fuzzy finder
├── 🧭 navigation-neo-tree.lua                 # File explorer
├── 🎨 ui-dressing.lua                         # Better inputs
├── 🎨 ui-dashboard.lua                        # Startup screen
├── 🎨 ui-lualine.lua                          # Status line
├── 🎨 ui-snacks-scrolling-off.lua             # Disable animations
├── 📦 plenary.lua                             # Core dependency
├── 🔗 theme.lua -> ...                        # Theme symlink
└── 📚 README.md                               # This file
```

## 🔍 Plugin Categories

### 🤖 AI (`ai/`)
- **codecompanion.lua** - AI coding assistant powered by Gemini
  - Chat-based code help and explanations
  - Code generation and optimization
  - Keybindings: `<leader>cc`, `<leader>cp`, `<leader>ct`

### 📝 Completion (`completion/`)
- **supertab.lua** - Enhanced Tab completion behavior
- **cmp-emoji.lua** - Emoji completion support

### ✏️ Editor (`editor/`)
- **mini-pairs.lua** - Auto-pair brackets and quotes
- **mini-ai.lua** - Smart text objects (functions, classes, etc.)
- **treesitter-textobjects.lua** - Advanced syntax-aware text objects
- **ts-comment.lua** - Smart commenting based on syntax
- **web-tags.lua** - HTML/XML tag auto-completion
- **todo.lua** - TODO comment highlighting and navigation
- **trouble.lua** - Better error and diagnostic display
- **persistance.lua** - Session management
- **toggleterm.lua** - Integrated terminal with LazyGit support

### 🔀 Git (`git/`)
- **gitsigns.lua** - Git change indicators and hunk operations
  - Visual git diff in gutter
  - Stage/unstage hunks: `<leader>hs`, `<leader>hr`
  - Navigate changes: `]c`, `[c`

### 🔧 LSP (`lsp/`)
- **nvim-lspconf.lua** - Language Server Protocol configuration
- **lazydev.lua** - Enhanced Lua development for Neovim
- **eslint.lua** - JavaScript/TypeScript linting integration

### 🧭 Navigation (`navigation/`)
- **telescope.lua** - Fuzzy finder for files, buffers, and more
  - Find files: `<leader>sf`
  - Live grep: `<leader>sg`
  - Find buffers: `<leader><leader>`
- **neo-tree.lua** - File explorer sidebar
  - Toggle: `<leader>e`
  - Focus: `<leader>E`

### 🎨 UI (`ui/`)
- **dressing.lua** - Better input and select dialogs
- **dashboard.lua** - Custom startup screen
- **snacks-animated-scrolling-off.lua** - Disable scroll animations
- **lualine.lua** - Enhanced statusline with plugin status

### 📦 Core Dependencies
- **plenary.lua** - Essential utility library used by many plugins

## 🎯 Key Features

### AI-Powered Development
- **Gemini Integration**: Powered by Google's Gemini AI model
- **Code Assistance**: Explanations, optimization, and test generation
- **Chat Interface**: Natural language interaction with your code

### Enhanced Editing
- **Smart Text Objects**: Navigate and manipulate code structures
- **Auto-completion**: Intelligent suggestions and auto-pairing
- **Syntax Highlighting**: Advanced Treesitter-based highlighting

### Git Workflow
- **Visual Indicators**: See changes directly in the editor
- **Hunk Operations**: Stage, unstage, and preview changes
- **LazyGit Integration**: Full-featured git client in terminal

### LSP Integration
- **Multi-language Support**: Lua, JavaScript, TypeScript, and more
- **Real-time Diagnostics**: Errors and warnings as you type
- **Code Actions**: Refactoring and quick fixes

## 🚀 Quick Start

1. **AI Assistant**: Press `<leader>cc` to open AI actions
2. **File Explorer**: Press `<leader>e` to toggle file tree  
3. **Find Files**: Press `<leader>sf` to fuzzy search files
4. **Terminal**: Press `<C-\>` to open floating terminal
5. **Git Client**: Press `<leader>g` to open LazyGit

## 🔧 Configuration Notes

- All plugins are configured with sensible defaults
- Keybindings follow common Neovim conventions
- UI elements use consistent theming
- Dependencies are automatically managed by lazy.nvim

## 📚 Further Reading

Each plugin file contains detailed configuration and keybinding information. 
Refer to individual plugin documentation for advanced customization options.
