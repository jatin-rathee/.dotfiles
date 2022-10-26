local status, telescope = pcall(require, 'telescope')
if not status then return end

telescope.setup {
    defaults = {
        -- prompt_prefix = " ",
        -- selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {
            'dist',
            'target',
            'node_modules',
            'pack/plugins',
        },
    }
}