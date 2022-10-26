local fn = vim.fn

local status, packer = pcall(require, 'packer')
if not status then return end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
}

return packer.startup(function(use)

    -- Have packer manage itself
    use({ "wbthomason/packer.nvim" })

    ----------------------------------------------------------------------
    --                               FILE                               --
    ----------------------------------------------------------------------
    -- File explorer and its icons

    use({
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvim.plugins.nvim-tree')
        end
    })

    -- use({
    --     'nvim-neo-tree/neo-tree.nvim',
    --     requires = {
    --         'nvim-lua/plenary.nvim',
    --         'kyazdani42/nvim-web-devicons',
    --         'MunifTanjim/nui.nvim',
    --     },
    --     branch = 'v2.x',
    --     config = function()
    --         require('nvim.plugins.nvim-neo-tree')
    --     end,
    -- })

    -- fuzzy search
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
        },
        config = function()
            require('nvim.plugins.telescope')
        end,
    })

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    
    -- lsp
    use({
        'williamboman/nvim-lsp-installer',
        requires = {
            'neovim/nvim-lspconfig',
            'onsails/lspkind-nvim',
            'MunifTanjim/nui.nvim',
            'glepnir/lspsaga.nvim',
            'ray-x/lsp_signature.nvim'
        },
        config = function()
            require('nvim.plugins.lsp')
        end,
    })

    -- completion menu
    use({
        'hrsh7th/nvim-cmp',
        config = function()
            require('nvim.plugins.nvim-cmp')
        end,
        requires = {
            -- CMP Sources
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell',
            'L3MON4D3/LuaSnip'
        },
    })

    ----------------------------------------------------------------------
    --                             EDITING                              --
    ----------------------------------------------------------------------
    -- auto pair brackets
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim.plugins.nvim-autopairs')
        end,
    })

    -- handle pairs of text objects
    use({
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    })

    -- syntax highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim.plugins.treesitter')
        end,
    })

    use({
        'winston0410/commented.nvim',
        requires = 'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('nvim.plugins.nvim-commented')
        end,
    })

    use({
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    })

    ----------------------------------------------------------------------
    --                              EDITOR                              --
    ----------------------------------------------------------------------
    -- inline search guide
    -- use({ 'unblevable/quick-scope' })

    -- smooth scrolling
    use({ 'psliwka/vim-smoothie' })

    -- motion
    -- use({
    --     'phaazon/hop.nvim',
    --     as = 'hop',
    --     config = function()
    --         require('nvim.plugins.hop')
    --     end,
    -- })

    -- bufferline
    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim.plugins.bufferline')
        end
    })

    -- full screen mode
    use({
        'folke/zen-mode.nvim',
        keys = ',a',
        config = function()
            require('zen-mode').setup({})
        end,
    })

    -- comment frame
    use({
        's1n7ax/nvim-comment-frame',
        keys = ',C',
        requires = { 'nvim-treesitter' },
        config = function()
            require('nvim-comment-frame').setup({})
        end,
    })

    use({
        'beauwilliams/focus.nvim',
        config = function()
            require('focus').setup({
                excluded_filetypes = { 'neo-tree' },
            })
        end,
    })

    use({
        'sindrets/winshift.nvim',
        config = function()
            require('winshift').setup({})
        end,
    })

    use({
        'romgrk/nvim-treesitter-context',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesitter-context').setup({ 
                enable = true, 
                throttle = true
            })
        end,
    })

    -- status line
    use({
        'hoob3rt/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        config = function()
            require('nvim.plugins.lualine')
        end,
    })

    -- notification popup library
    use({
        'rcarriga/nvim-notify',
        config = function()
            require('nvim.plugins.notify')
        end,
    })

    -- beautiful vim.ui alternatives
    use({
        'stevearc/dressing.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'MunifTanjim/nui.nvim' },
        config = function()
            require('dressing').setup({})
        end,
    })

    -- highlights the colors defined in the buffer with actual color
    use({
        'norcalli/nvim-colorizer.lua',
        opt = true,
        cmd = {
            'ColorizerAttachToBuffer',
            'ColorizerDetachFromBuffer',
            'ColorizerReloadAllBuffers',
            'ColorizerToggle',
        },
    })

    -- popup menu
    use({ 'meznaric/conmenu' })

    -- spell check diagnostic
    use({
        'lewis6991/spellsitter.nvim',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('spellsitter').setup()
        end,
    })

    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('nvim.plugins.indent-blankline')
        end,
    })

    ----------------------------------------------------------------------
    --                               GIT                                --
    ----------------------------------------------------------------------
    -- git file changes
    use({
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('nvim.plugins.gitsigns')
        end,
    })

    ----------------------------------------------------------------------
    --                           COLOR THEMES                           --
    ----------------------------------------------------------------------
    use({
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd [[ colorscheme dracula ]]
        end
    })

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- which key
    use({
        'folke/which-key.nvim',
        config = function()
            require('nvim.plugins.which-key')
        end
    })

    -- Bdelete
    use "moll/vim-bbye"

    -- reduce the start up time
    use({ 'lewis6991/impatient.nvim' })

    -- startup time tracker
    use({ 'dstein64/vim-startuptime' })
end)
