return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Your existing servers
        "lua-language-server",
        "stylua",
        "gopls",
        "templ",
        "sql",
        
        -- Svelte and web development
        "svelte-language-server",
        "typescript-language-server",
        "emmet-ls",
        "prettier",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",

        -- Additional recommended servers for your stack
        "eslint-lsp",           -- JavaScript/TypeScript linting
        "json-lsp",             -- JSON support
        "stylelint-lsp",        -- CSS/SCSS linting
        "deno",                 -- Alternative JS/TS runtime
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Svelte
      lspconfig.svelte.setup({
        settings = {
          svelte = {
            plugin = {
              html = { completions = { enable = true, emmet = true } },
              svelte = { completions = { enable = true } },
              css = { completions = { enable = true } },
            },
          },
        },
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({})

      -- Tailwind
      lspconfig.tailwindcss.setup({
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "class=\"([^\"]*)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "class: \"([^\"]*)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              },
            },
          },
        },
      })

      -- HTML
      lspconfig.html.setup({
        filetypes = { "html", "svelte" },
      })

      -- CSS
      lspconfig.cssls.setup({
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      })

      -- Emmet
      lspconfig.emmet_ls.setup({
        filetypes = {
          "html", "css", "scss", "javascript",
          "javascriptreact", "typescript", 
          "typescriptreact", "svelte",
        },
      })
    end,
  }
}
