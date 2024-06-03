return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          -- signcolumn = "no",
          -- number = false,
          -- relativenumber = false,
          -- cursorline = false,
          -- cursorcolumn = false,
          -- foldcolumn = "0",
          -- list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = {
          enabled = true,
          font = "+4",
        },
        alacritty = {
          enabled = false,
          font = "14",
        },
        wezterm = {
          enabled = false,
          font = "+4",
        },
      },
      on_open = function(win)
      end,
      on_close = function()
      end,
    }
  },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  {
    "nathangrigg/vim-beancount",
    ft = "beancount",
  },

  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org_agenda_files = '~/Vaults/Personal',
        org_default_notes_file = '~/Vaults/Personal/inbox.md',
      })
    end,
  },

  {'tpope/vim-dadbod',},
  {'kristijanhusak/vim-dadbod-ui',},
  {'kristijanhusak/vim-dadbod-completion',},

  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disable_frontmatter = true,
      workspaces = {
        {
          name = "vault",
          path = "~/Vaults",
        },
      },
      attachments = {
        img_folder = "assets/imgs",
      },
      -- Optional, for templates (see below).
  templates = {
    folder = "~/Vaults/Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  -- Where to put new notes. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
 --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "notes_subdir",
 -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },

  wiki_link_func = "use_alias_only",
  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({"open", url})  -- Mac OS
    vim.fn.jobstart({"xdg-open", url})  -- linux
  end,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua", "gopls", "templ", "sql",
        "html-lsp", "css-lsp", "prettier", "tailwindcss-language-server",
      },
    },
  },

{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
},

{
  "rcarriga/nvim-notify",
  opts = {
    render = "minimal",  -- use the minimal render style
    stages = "slide",  -- use the slide animation for notifications
    timeout = 2000,  -- display notifications for 3 seconds
    maximum_width = 0.5,  -- set the maximum width of the notification window to 50% of the screen
    maximum_height = 0.2,  -- set the maximum height of the notification window to 20% of the screen
  },
},


{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- You can add any additional options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = "60%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "none",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    })
  end,
},
}
