-- Check if packer exists, if not clone it and execute it
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Packer initialization
vim.cmd [[ packadd packer.nvim ]]

-- Return if packer is not installed (should never happen though)
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Auto compile packer on plugins save
vim.cmd([[autocmd BufWritePost plugin/init.lua source <afile> | PackerCompile]])

local plugins = {
    -- Let packer maange itself 
    { "wbthomason/packer.nvim", opt = true },

    -- Colorscheme (Gruvbox)
    { "morhetz/gruvbox" },

    { "neovim/nvim-lspconfig" },
    { "nvim-lua/completion-nvim" },

    { "ms-jpq/coq_nvim", branch = "coq", run = ":COQdeps" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- Mapper for telescope
    { "lazytanuki/nvim-mapper",
        config = function()
            require("nvim-mapper").setup{
                no_map = true,
                search_path = vim.fn.stdpath('data'),
            } 
        end,
        before = "telescope.nvim",
    },

    -- Telescope
    -- telescope.nvim is a highly extendable fuzzy finder over lists
    { "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" }
        }
    },
    -- FZF native for telescope, this is a C port of FZF so should be a lot faster.
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

    -- Tree sitter
    { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    { "nvim-treesitter/playground" },
}

packer.startup(function(use)
    for _, v in pairs(plugins) do
        use(v)
    end
end)

vim.g.mapper_search_path = vim.fn.stdpath('data')

vim.schedule(function ()
    local lsp = require "lspconfig"
    require("packer").loader("coq_nvim coq.artifacts")
    lsp.pyright.setup(require("coq")().lsp_ensure_capabilities({
              on_attach = on_attach_callback,
    }))
end)
