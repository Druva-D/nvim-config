return {
    {
        'mitubaEX/git_worktree.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('git_worktree').setup({
                cleanup_buffers = true,  -- Clean up old buffers when switching
                warn_unsaved = true,     -- Warn about unsaved changes
                update_buffers = true,   -- Update buffer paths to new worktree
                copy_envrc = true,       -- Copy .envrc file to new worktrees (direnv)
                worktree_dir = ".worktrees", -- Directory for aggregating worktrees
            })
            require('telescope').load_extension('git_worktree')
        end
    },
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "tpope/vim-fugitive",
        lazy = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "c",
                "python",
                "cpp",
            },
        },
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require "rainbow-delimiters"
            require("rainbow-delimiters.setup").setup {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                    vim = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
        end,
        lazy = false,
    },

    {
        "echasnovski/mini.nvim",
        version = "*",
        lazy = false,
        config = function()
            require "plugins.mini"
        end,
    },

    {
        "rmagatti/auto-session",
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            -- log_level = 'debug',
        },
    },
}
