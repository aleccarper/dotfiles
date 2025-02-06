-- Set leader key
vim.g.mapleader = " "

-- Alchemist Config
vim.g.alchemist_iex_term_size = 30
vim.g.alchemist_tag_disable = 1

-- Airline Config
vim.g.airline_powerline_fonts = 1
vim.o.hidden = true
vim.g.Powerline_symbols = "fancy"
vim.g.airline_left_alt_sep = ""
vim.g.airline_right_alt_sep = ""
vim.g.airline_theme = "onehalfdark"
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#fnamemod"] = ":t"
vim.g["airline#extensions#tabline#show_tab_nr"] = 1
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1

-- Airline tab mappings
for i = 1, 9 do
  vim.api.nvim_set_keymap("t", "<leader>" .. i, "<C-\\><C-n><Plug>AirlineSelectTab" .. i, { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>" .. i, "<Plug>AirlineSelectTab" .. i, { noremap = true })
end

-- Neovim GUI settings
vim.opt.guifont = "FuraCode Nerd Font Mono 13"
vim.opt.clipboard:append("unnamedplus")

-- Enable true color
if vim.fn.has("nvim") == 1 then
  vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- NerdTree Config
vim.cmd [[
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]]
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
vim.g.NERDTreeMinimalUI = 1

-- General settings
vim.cmd [[
  syntax on
  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  set number relativenumber
  set autoindent
  set smartindent
  set autoread
  set scrolloff=5
  set hlsearch
  set incsearch
  set ignorecase smartcase
  set wrapscan
  set cursorline
  set lazyredraw
  set splitbelow
  set splitright
]]

-- Fuzzy Search and NERDTree mappings
vim.api.nvim_set_keymap("n", "<C-p>", ":FuzzyOpen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":FuzzyGrep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":NERDTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":bd!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ox", ":%bd|e#|bd#<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", ":IEx<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>a", ":Ack<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><CR>", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "fd", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", { noremap = true })

-- Switch between last two files
vim.api.nvim_set_keymap("n", "<leader><leader>", "<c-^>:syntax reset<CR>:syntax on<CR>", { noremap = true })

-- Save with Ctrl-s
vim.api.nvim_set_keymap("n", "<C-s>", ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc> :let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>", { noremap = true })

-- Tab management
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tm", ":tabmove<CR>", { noremap = true })


require("config.lazy")
