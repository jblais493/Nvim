return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local luasnip = require("luasnip")
      
      require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
      
      luasnip.filetype_extend("templ", {"html"})
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "templ",
        callback = function()
          local client = vim.lsp.start({
            name = "html-lsp",
            cmd = {"vscode-html-language-server", "--stdio"},
            root_dir = vim.fn.getcwd(),
          })
          if not client then
            vim.notify("Failed to start HTML LSP for templ file", vim.log.levels.WARN)
          end
        end,
      })

      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      luasnip.loaders.from_lua.lazy_load()

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
              and not luasnip.session.jump_active
          then
            luasnip.unlink_current()
          end
        end,
      })
    end,
  }
}
