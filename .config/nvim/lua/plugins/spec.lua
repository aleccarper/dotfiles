return {
  -- the colorscheme should be available when starting Neovim
	{
	"sonph/onehalf",
	lazy = false,
	config = function(plugin)
	    vim.opt.rtp:append(plugin.dir .. "/vim")
	    vim.cmd [[ colorscheme onehalflight ]]
	    -- or vim.cmd [[ colorscheme onehalflight ]] if you prefer light theme
	end
	},

	{ "scrooloose/nerdtree", lazy = false },
	{ "vim-airline/vim-airline", lazy = false },
	{ "vim-airline/vim-airline-themes", lazy = false },
	{ "cloudhead/neovim-fuzzy", lazy = false },
  {
    "Shougo/deoplete.nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.g["deoplete#enable_at_startup"] = 1
    end
  },
  {
    "roxma/nvim-yarp",
    build = ":UpdateRemotePlugins"
  },
  {
    "roxma/vim-hug-neovim-rpc",
    build = ":UpdateRemotePlugins"
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
}
}
