-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "pyright", "clangd", "zls", "copilot-language-server", "rust_analyzer", "jdtls", "bacon-ls", "bacon" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, nvlsp)
    vim.lsp.enable(lsp)
end

vim.lsp.config("bacon-ls", {
    init_options = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
    },
    root_dir = function(bufnr, on_dir)
        local project_root = vim.fs.root(bufnr, { { "bacon.toml", "Cargo.toml" }, ".git" })
        if project_root then
            return on_dir(project_root)
        end
    end,
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = false,
            diagnostics = {
                enable = false,
            },
        },
    },
})
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
