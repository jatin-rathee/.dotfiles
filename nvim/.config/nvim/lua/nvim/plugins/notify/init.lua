local status, notify = pcall(require, 'notify')
if not status then return end

notify.setup({
    timeout = 2000,
    on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 2000 })
    end,
})

vim.notify = notify
