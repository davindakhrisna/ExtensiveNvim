# ExtensiveNvim

A comprehensive, production-ready Neovim configuration with AI-powered development tools, modern LSP integration, and an extensive plugin ecosystem.

## ✨ Features

### 🤖 AI-Powered Development
- **CodeCompanion.nvim** - AI coding assistant powered by Google Gemini
- **Chat-based code assistance** - Natural language interaction with your code
- **Code explanations and optimizations** - AI-powered code review and suggestions
- **Test generation** - AI-generated unit tests for your code

### 🔧 Language Server Protocol (LSP)
- **Multi-language support** - Lua, JavaScript, TypeScript, Svelte, and more
- **Real-time diagnostics** - Errors and warnings as you type
- **Code actions** - Refactoring and quick fixes
- **Auto-completion** - Intelligent suggestions based on context
- **Go to definition** - Navigate through your codebase seamlessly

### 🧭 Navigation & File Management
- **Neo-tree** - Modern file explorer with Git integration
- **Telescope** - Fuzzy finder for files, buffers, and more
- **Smart filtering** - Exclude temporary and swap files automatically

### ✏️ Enhanced Editing
- **Smart text objects** - Navigate and manipulate code structures
- **Auto-pairing** - Intelligent bracket and quote completion
- **Advanced commenting** - Context-aware commenting system
- **TODO highlighting** - Track and navigate TODO comments
- **Trouble.nvim** - Better error and diagnostic display

### 🔀 Git Integration
- **Gitsigns** - Visual git diff indicators in the gutter
- **Hunk operations** - Stage, unstage, and preview changes inline
- **Git blame** - See commit information for each line
- **LazyGit integration** - Full-featured git client in terminal

### 🎨 Beautiful UI
- **Custom dashboard** - Personalized startup screen
- **Lualine** - Enhanced statusline with plugin status indicators
- **Dressing.nvim** - Better input and select dialogs
- **Consistent theming** - Cohesive visual experience

### 🛠️ Development Tools
- **Mason** - Package manager for LSP servers, linters, and formatters
- **Integrated terminal** - Floating terminal with custom commands
- **Session management** - Restore your workspace automatically
- **Swap file handling** - Intelligent recovery from crashes

## 📋 Requirements

- **Neovim >= 0.9.0**
- **Node.js and npm** (for JavaScript/TypeScript/Svelte support)
- **Git** (for version control integration)
- **A Nerd Font** (for icons and symbols)

### Optional Dependencies
- **ripgrep** - For faster text search
- **fd** - For faster file finding
- **LazyGit** - For enhanced git workflow

## 🚀 Installation

### 1. Backup Existing Configuration
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone This Repository
```bash
git clone https://github.com/davindakhrisna/ExtensiveNvim.git ~/.config/nvim
```

### 3. Install Dependencies (Arch Linux)
```bash
# Core dependencies
sudo pacman -S nodejs npm git ripgrep fd

# Optional but recommended
yay -S lazygit
```

### 4. Set Up Environment Variables
Add to your `~/.bashrc` or `~/.zshrc`:
```bash
export GEMINI_API_KEY='your_gemini_api_key_here'
```

### 5. Start Neovim
```bash
nvim
```

On first launch, lazy.nvim will automatically install all plugins.

## 🔑 Key Bindings

### AI Assistant (CodeCompanion)
- `<leader>cc` - Open AI actions menu
- `<leader>cp` - Start AI chat
- `<leader>ct` - Toggle AI chat window
- `<leader>ce` - Explain selected code (visual mode)
- `<leader>co` - Optimize selected code (visual mode)

### Navigation
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<leader>E` - Focus file explorer
- `<leader>sf` - Find files (Telescope)
- `<leader>sg` - Live grep (Telescope)
- `<leader><leader>` - Find buffers (Telescope)

### LSP & Diagnostics
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>cf` - Format code
- `]d` / `[d` - Next/previous diagnostic
- `<leader>xx` - Open diagnostics (Trouble)

### Git Integration
- `]c` / `[c` - Next/previous git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Git blame line
- `<leader>g` - Open LazyGit

### Terminal & Utilities
- `<C-\>` - Toggle floating terminal
- `<leader>qs` - Restore session
- `<leader>qd` - Don't save session

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── lazy.lua           # Plugin manager setup
│   │   ├── options.lua        # Neovim options
│   │   └── swap-handling.lua  # Swap file management
│   └── plugins/               # Plugin configurations
│       ├── ai-codecompanion.lua         # AI assistant
│       ├── completion-*.lua             # Completion plugins
│       ├── editor-*.lua                 # Editor enhancements
│       ├── git-*.lua                    # Git integration
│       ├── lsp-*.lua                    # Language servers
│       ├── navigation-*.lua             # File/project navigation
│       ├── ui-*.lua                     # UI enhancements
│       ├── mason-config.lua             # Package manager
│       └── README.md                    # Plugin documentation
├── lazyvim.json               # LazyVim extras configuration
└── README.md                  # This file
```

## 🎯 Language Support

### Fully Supported Languages
- **Lua** - Enhanced with lazydev.nvim for Neovim development
- **JavaScript/TypeScript** - ESLint integration, auto-formatting
- **Svelte** - Full component support with TypeScript integration
- **JSON** - Schema validation and formatting
- **Markdown** - Enhanced editing and preview

### Easily Extendable
Add support for any language by:
1. Adding the LSP server to `mason-config.lua`
2. Creating a configuration file in `plugins/lsp-{language}.lua`
3. Restart Neovim

## 🔧 Customization

### Adding New Plugins
1. Create a new file in `lua/plugins/`
2. Follow the naming convention: `category-pluginname.lua`
3. Use lazy.nvim plugin specification format

### Configuring AI Assistant
1. Get a Gemini API key from Google AI Studio
2. Set the `GEMINI_API_KEY` environment variable
3. Customize prompts in `ai-codecompanion.lua`

### Modifying Themes
The configuration uses LazyVim's default theme system. To change themes:
1. Add theme plugin to `lua/plugins/`
2. Configure in LazyVim extras or plugin configuration

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📝 License

This configuration is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - Excellent Neovim starter configuration
- [CodeCompanion.nvim](https://github.com/olimorris/codecompanion.nvim) - AI assistant integration
- [Neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - Modern file explorer
- All the amazing plugin authors in the Neovim ecosystem

## 📞 Support

- 🐛 **Bug Reports**: Open an issue on GitHub
- 💡 **Feature Requests**: Open an issue with enhancement label  
- 📚 **Documentation**: Check the README and plugin documentation
- 💬 **Community**: Join Neovim community discussions

---

**Happy coding with ExtensiveNvim!** 🚀
