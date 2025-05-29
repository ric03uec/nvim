# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on LazyVim, with custom plugin configurations and keybindings. The configuration uses lazy.nvim as the plugin manager and follows a modular structure.

## Architecture

- **Entry Point**: `init.lua` - Sets leader key to comma, loads core config modules
- **Core Configuration**: `lua/config/` directory contains:
  - `options.lua` - Editor settings (tabs=2 spaces, no relative numbers, etc)
  - `keymaps.lua` - Custom key mappings and shortcuts
  - `lazy.lua` - Plugin manager bootstrap and configuration
- **Plugin Configuration**: `lua/plugins/` directory with individual plugin configs
- **Plugin Loading**: `lua/plugins/init.lua` requires and loads all plugin modules

## Key Customizations

- Leader key set to comma (`,`)
- Relative line numbers disabled globally
- Tab width set to 2 spaces with expand tabs enabled
- Custom escape mapping: `jk` in insert mode
- File tree toggle: `<leader>e` (NvimTree)
- File finder: `<Ctrl-p>` (Telescope)
- Buffer management: `<leader>x` closes buffer using Bdelete plugin
- Smart tab closing: `q` closes tab or shows notification if only one tab

## Plugin Structure

Plugins are modularized in separate files under `lua/plugins/`:
- Each plugin config file returns a table with plugin specifications
- Disabled plugins are centralized in `disabled.lua`
- Key plugins include: bufferline, telescope, treesitter, copilot, avante, lualine

## Development Setup

Installation requirements:
- Latest Neovim
- luarocks

The configuration automatically bootstraps lazy.nvim plugin manager on first run.